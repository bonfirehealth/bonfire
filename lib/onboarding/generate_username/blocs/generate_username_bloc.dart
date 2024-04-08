// Flutter imports:
// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:clipboard/clipboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:username_gen/username_gen.dart';
import 'package:validators/validators.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'generate_username_event.dart';
part 'generate_username_state.dart';

class GenerateUsernameBloc
    extends Bloc<GenerateUsernameEvent, GenerateUsernameState> {
  GenerateUsernameBloc() : super(const GenerateUsernameState()) {
    on<GenerateUsernameInitSet>(_onGenerateUsernameInitSet);
    on<GenerateUsernameIsLoadingSet>(_onGenerateUsernameIsLoadingSet);
    on<GenerateUsernameUsernameSet>(_onGenerateUsernameUsernameSet);
    on<GenerateUsernameUsernameGenerate>(_onGenerateUsernameUsernameGenerate);
    on<GenerateUsernameFormSubmit>(_onGenerateUsernameFormSubmit);
    on<GenerateUsernamePersonalEmailAddressSet>(
      _onGenerateUsernamePersonalEmailAddressSet,
    );
    on<GenerateUsernameGeneratedCredentialsSend>(
      _onGenerateUsernameGeneratedCredentialsSend,
    );
    on<GenerateUsernameAutoSignIn>(_onGenerateUsernameAutoSignIn);
    on<GenerateUsernameCredentialsClipboardCopy>(
      _onGenerateUsernameCredentialsClipboardCopy,
    );
  }

  Future<void> _onGenerateUsernameInitSet(
    GenerateUsernameInitSet event,
    Emitter<GenerateUsernameState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>();
    final sharedPrefs = await SharedPreferences.getInstance();
    final organisationId = sharedPrefs.getString('organisation_id');
    final organisationName = sharedPrefs.getString('organisation_name');
    emit(
      state.copyWith(
        organisationId: organisationId,
        organisationName: organisationName,
      ),
    );

    if (organisationId == null) {
      final sharedPrefs = await SharedPreferences.getInstance();
      final organisationCode = sharedPrefs.getString('organisation_code');
      final organisationToken = sharedPrefs.getString('organisation_token');
      final organisationUserId = sharedPrefs.getString('organisation_user_id');
      if (organisationCode != null && organisationToken != null) {
        appBloc.add(
          AppNextRoute(
            context,
            JoinOrganisationRoute(
              organisationCode: organisationCode,
              organisationToken: organisationToken,
              organisationUserId: organisationUserId,
            ),
          ),
        );
      } else {
        appBloc.add(AppNextRoute(context, EnterOrganisationCodeRoute()));
      }
    }
  }

  void _onGenerateUsernameIsLoadingSet(
    GenerateUsernameIsLoadingSet event,
    Emitter<GenerateUsernameState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  Future<void> _onGenerateUsernameUsernameSet(
    GenerateUsernameUsernameSet event,
    Emitter<GenerateUsernameState> emit,
  ) async {
    emit(state.copyWith(username: event.username));
  }

  Future<void> _onGenerateUsernameUsernameGenerate(
    GenerateUsernameUsernameGenerate event,
    Emitter<GenerateUsernameState> emit,
  ) async {
    final usernameGen = UsernameGen()..setSeperator('_');
    final username = usernameGen.generate().replaceAll('-', '_').toLowerCase();
    emit(
      state.copyWith(username: username),
    );
    event.controller
      ..text = username
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: event.controller.text.length),
      );
  }

  Future<void> _onGenerateUsernameFormSubmit(
    GenerateUsernameFormSubmit event,
    Emitter<GenerateUsernameState> emit,
  ) async {
    final context = event.context;
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final username = state.username!;
    final domainName = AppConstant.emailDomainUrl;
    final emailAddress = '$username@$domainName';
    final password = AuthHelper.generatePassword(numberCharPassword: 8);
    final isEmailAddressValid = isEmail(emailAddress);
    logInfo('emailAddress $emailAddress');
    logInfo('_password $password');
    appBloc.add(
      AppIsLoadingSet(
        loadingText: l10n.setupCredentialsMessage,
      ),
    );
    final isEmailAddressAvailable =
        await AmplifyRepo.callCheckEmailAddressAvailability(
      emailAddress,
    );

    if (isEmailAddressAvailable && isEmailAddressValid) {
      final userMap = await AmplifyRepo.confirmSignUpAsGroup(
        username,
        emailAddress,
        password,
        organisationId: state.organisationId ?? '',
      );

      final userId = userMap['user_id'] as String;
      final userSubId = userMap['user_sub_id'] as String;
      final organisationId = userMap['organisation_id'] as String;

      //also sign in to create session
      final result = await AmplifyRepo.signIn(emailAddress, password);
      await AmplifyRepo.saveUserSessionLocal(
        result.item1!,
        userId,
        organisationId,
      );

      // set department id value
      final sharedPrefs = await SharedPreferences.getInstance();
      try {
        final departmentId = sharedPrefs.getString('department_id');
        if (departmentId != null) {
          await AmplifyRepo.setDepartment(userId, departmentId);
        }
      } catch (e) {
        logInfo(e);
        //safely ignore
      }

      logInfo('userId $userId');
      logInfo('userSubId $userSubId');
      var recoveryCodes = <String>[];
      if (userId.isNotEmpty && userSubId.isNotEmpty) {
        recoveryCodes =
            await AmplifyRepo.callGenerateRecoveryCodes(userId, userSubId);
        logInfo('_recoveryCodes $recoveryCodes');
      }

      emit(
        state.copyWith(
          userId: userId,
          userSubId: userSubId,
          recoveryCodes: recoveryCodes,
          password: password,
        ),
      );

      appBloc.add(
        AppNextRoute(
          context,
          CompleteProfileRoute(),
        ),
      );
    } else {
      final l10n = context.l10n;
      appBloc
        ..add(
          const AppIsLoadingSet(
            isLoading: false,
            loadingText: '',
          ),
        )
        ..add(
          AppErrorMessageSet(
            context,
            l10n.emailAddressNotAvailableTitle,
            l10n.emailAddressNotAvailableMessage,
          ),
        );
    }
  }

  void _onGenerateUsernamePersonalEmailAddressSet(
    GenerateUsernamePersonalEmailAddressSet event,
    Emitter<GenerateUsernameState> emit,
  ) {
    emit(state.copyWith(personalEmailAddress: event.personalEmailAddress));
  }

  Future<void> _onGenerateUsernameGeneratedCredentialsSend(
    GenerateUsernameGeneratedCredentialsSend event,
    Emitter<GenerateUsernameState> emit,
  ) async {
    final context = event.context;
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final personalEmailAddress = state.personalEmailAddress ?? '';
    final username = state.username;
    final domainName = AppConstant.emailDomainUrl;
    final emailAddress = '$username@$domainName';
    final password = state.password ?? '';
    final recoveryCodes = state.recoveryCodes ?? [];
    final userId = state.userId ?? '';

    if (isEmail(personalEmailAddress)) {
      final response = await AmplifyRepo.sendSecretCredentialsEmail(
        personalEmailAddress,
        emailAddress,
        password,
        recoveryCodes,
        userId,
      );
      final isSent = response?['is_sent'] as bool? ?? false;
      appBloc.add(const AppIsLoadingSet());
      if (isSent) {
        emit(state.copyWith(isSecretCredentialsSent: true));
        // context.read<AppBloc>().add(
        //       AppInfoMessageSet(
        //         context,
        //         l10n.secretCredentialsSentTitle,
        //         l10n.secretCredentialsSentMessage,
        //       ),
        //     );
        Future<void>.delayed(const Duration(milliseconds: 1000), () async {
          final appBloc = context.read<AppBloc>();
          final userId = state.userId;
          final username = state.username;
          final domainName = AppConstant.emailDomainUrl;
          final emailAddress = '$username@$domainName';
          final password = state.password;

          if (userId != null && username != null && password != null) {
            appBloc.add(const AppIsLoadingSet(loadingText: ''));
            Future<void>.delayed(const Duration(milliseconds: 500), () async {
              try {
                final result = await AmplifyRepo.signIn(emailAddress, password);
                var session = result.item1;
                var jwtRefreshToken = session?.refreshToken?.getToken() ?? '';
                var jwtIdToken = session?.getIdToken().jwtToken ?? '';
                session = await AmplifyRepo.refreshJWTIdToken(
                  jwtIdToken,
                  jwtRefreshToken,
                );
                jwtRefreshToken = session?.refreshToken?.getToken() ?? '';
                jwtIdToken = session?.getIdToken().jwtToken ?? '';
                final jwtIdTokenMap = Jwt.parseJwt(jwtIdToken);
                final userSubId = jwtIdTokenMap['sub'] as String;
                final organisationId =
                    jwtIdTokenMap['custom:organisation_id'] as String?;
                final jwtIdTokenExpiration =
                    session?.accessToken.getExpiration();
                final sharedPrefs = await SharedPreferences.getInstance();
                await sharedPrefs.remove('organisation_code');
                await sharedPrefs.remove('organisation_token');
                await sharedPrefs.remove('organisation_user_id');
                await sharedPrefs.setBool('is_signed_in', true);
                if (organisationId != null) {
                  await sharedPrefs.setString(
                    'organisation_id',
                    organisationId,
                  );
                }
                await sharedPrefs.setString('user_id', userId);
                await sharedPrefs.setString('user_sub_id', userSubId);
                final profileId = sharedPrefs.getString('profile_id') ?? '';
                EncryptHelper.init(
                  organisationId!,
                  userId,
                  userSubId,
                  profileId,
                );
                jwtIdToken = EncryptHelper.encrypt(jwtIdToken);
                await sharedPrefs.setString('jwt_id_token', jwtIdToken);
                await sharedPrefs.setInt(
                  'jwt_id_token_expiration',
                  jwtIdTokenExpiration!,
                );
                jwtRefreshToken = EncryptHelper.encrypt(jwtRefreshToken);
                await sharedPrefs.setString(
                  'jwt_refresh_token',
                  jwtRefreshToken,
                );
                final organisationUserId =
                    sharedPrefs.getString('organisation_user_id');
                await UserRepo.updateUser(
                  externalUserId: organisationUserId,
                );
                await MixpanelHelper.init(FlavorConfig.instance!.flavor);
                await sharedPrefs.setBool('is_onboarding_completed', true);
                appBloc
                  ..add(AppInfoMessageSet(context, '', ''))
                  ..add(
                    const AppIsLoadingSet(isLoading: false, loadingText: ''),
                  )
                  ..add(AppNextRoute(context, const HomeRoute()));
              } catch (e) {
                logInfo('autoSignIn(): $e');
              }
            });
          }
        });
      }
      appBloc.add(const AppIsLoadingSet(isLoading: false));
    } else {
      appBloc
        ..add(const AppIsLoadingSet(isLoading: false))
        ..add(
          AppErrorMessageSet(
            context,
            l10n.invalidEmailAddressTitle,
            l10n.invalidEmailAddressMessage,
          ),
        );
    }

    emit(
      state.copyWith(
        isLoading: false,
      ),
    );
  }

  void _onGenerateUsernameAutoSignIn(
    GenerateUsernameAutoSignIn event,
    Emitter<GenerateUsernameState> emit,
  ) {
    final context = event.context;
    final appBloc = context.read<AppBloc>();
    final userId = state.userId;
    final username = state.username;
    final domainName = AppConstant.emailDomainUrl;
    final emailAddress = '$username@$domainName';
    final password = state.password;

    if (userId != null && username != null && password != null) {
      appBloc.add(const AppIsLoadingSet(loadingText: ''));
      Future<void>.delayed(const Duration(milliseconds: 3000), () async {
        try {
          final result = await AmplifyRepo.signIn(emailAddress, password);
          var session = result.item1;
          var jwtRefreshToken = session?.refreshToken?.getToken() ?? '';
          var jwtIdToken = session?.getIdToken().jwtToken ?? '';
          session = await AmplifyRepo.refreshJWTIdToken(
            jwtIdToken,
            jwtRefreshToken,
          );
          jwtRefreshToken = session?.refreshToken?.getToken() ?? '';
          jwtIdToken = session?.getIdToken().jwtToken ?? '';
          final jwtIdTokenMap = Jwt.parseJwt(jwtIdToken);
          final userSubId = jwtIdTokenMap['sub'] as String;
          final organisationId =
              jwtIdTokenMap['custom:organisation_id'] as String?;
          final jwtIdTokenExpiration = session?.accessToken.getExpiration();
          final sharedPrefs = await SharedPreferences.getInstance();
          await sharedPrefs.remove('organisation_code');
          await sharedPrefs.remove('organisation_token');
          await sharedPrefs.remove('organisation_user_id');
          await sharedPrefs.setBool('is_signed_in', true);
          if (organisationId != null) {
            await sharedPrefs.setString(
              'organisation_id',
              organisationId,
            );
          }
          await sharedPrefs.setString('user_id', userId);
          await sharedPrefs.setString('user_sub_id', userSubId);
          final profileId = sharedPrefs.getString('profile_id') ?? '';
          EncryptHelper.init(
            organisationId!,
            userId,
            userSubId,
            profileId,
          );
          jwtIdToken = EncryptHelper.encrypt(jwtIdToken);
          await sharedPrefs.setString('jwt_id_token', jwtIdToken);
          await sharedPrefs.setInt(
            'jwt_id_token_expiration',
            jwtIdTokenExpiration!,
          );
          jwtRefreshToken = EncryptHelper.encrypt(jwtRefreshToken);
          await sharedPrefs.setString(
            'jwt_refresh_token',
            jwtRefreshToken,
          );
          final organisationUserId =
              sharedPrefs.getString('organisation_user_id');
          await UserRepo.updateUser(
            externalUserId: organisationUserId,
          );
          await MixpanelHelper.init(FlavorConfig.instance!.flavor);
          await sharedPrefs.setBool('is_onboarding_completed', true);
          appBloc
            ..add(AppInfoMessageSet(context, '', ''))
            ..add(
              const AppIsLoadingSet(isLoading: false, loadingText: ''),
            )
            ..add(AppNextRoute(context, const HomeRoute()));
        } catch (e) {
          logInfo('autoSignIn(): $e');
        }
      });
    }
  }

  Future<void> _onGenerateUsernameCredentialsClipboardCopy(
    GenerateUsernameCredentialsClipboardCopy event,
    Emitter<GenerateUsernameState> emit,
  ) async {
    final context = event.context;
    if (state.recoveryCodes != null) {
      final l10n = context.l10n;
      final domainName = AppConstant.emailDomainUrl;
      final text = '''
${l10n.emailAddress}: ${state.username}@$domainName
${l10n.password}: ${state.password}
${l10n.recoveryCodes}:
${state.recoveryCodes?.join('\n')}
    ''';
      await FlutterClipboard.copy(text);
      context.read<AppBloc>().add(
            AppInfoMessageSet(
              context,
              l10n.credentialsCopiedTitle,
              l10n.credentialsCopiedMessage,
            ),
          );
    }
  }
}
