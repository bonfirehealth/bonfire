// Flutter imports:
// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart' hide Emitter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app_config.dart';
import 'package:bonfirehealth/onboarding/generate_username/blocs/generate_username_bloc.dart';
import 'package:username_gen/username_gen.dart';

part 'enter_organisation_code_event.dart';
part 'enter_organisation_code_state.dart';

class EnterOrganisationCodeBloc
    extends Bloc<EnterOrganisationCodeEvent, EnterOrganisationCodeState> {
  EnterOrganisationCodeBloc() : super(const EnterOrganisationCodeState()) {
    on<EnterOrganisationCodeInitSet>(_onEnterOrganisationCodeInitSet);
    on<EnterOrganisationCodeIsLoadingSet>(_onEnterOrganisationCodeIsLoadingSet);
    on<EnterOrganisationCodeOrganisationCodeSet>(
      _onEnterOrganisationCodeOrganisationCodeSet,
    );
    on<EnterOrganisationCodeFinNumberSet>(_onEnterOrganisationCodeFinNumberSet);
    on<EnterOrganisationCodeFormSubmit>(_onEnterOrganisationCodeFormSubmit);
    on<EnterOrganisationCodeFinNumberSubmit>(
      _onEnterOrganisationCodeFinNumberSubmit,
    );
    on<EnterOrganisationCodeDepartmentTap>(
      _onEnterOrganisationCodeDepartmentTap,
    );
    on<EnterOrganisationCodeDepartmentSet>(
      _onEnterOrganisationCodeDepartmentSet,
    );
    on<EnterOrganisationCodeDepartmentSubmit>(
      _onEnterOrganisationCodeDepartmentSubmit,
    );
  }

  Future<void> _onEnterOrganisationCodeInitSet(
    EnterOrganisationCodeInitSet event,
    Emitter<EnterOrganisationCodeState> emit,
  ) async {}

  void _onEnterOrganisationCodeIsLoadingSet(
    EnterOrganisationCodeIsLoadingSet event,
    Emitter<EnterOrganisationCodeState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  Future<void> _onEnterOrganisationCodeOrganisationCodeSet(
    EnterOrganisationCodeOrganisationCodeSet event,
    Emitter<EnterOrganisationCodeState> emit,
  ) async {
    emit(state.copyWith(organisationCode: event.organisationCode));
  }

  Future<void> _onEnterOrganisationCodeFinNumberSet(
    EnterOrganisationCodeFinNumberSet event,
    Emitter<EnterOrganisationCodeState> emit,
  ) async {
    emit(state.copyWith(finNumber: event.finNumber));
  }

  Future<void> _onEnterOrganisationCodeFormSubmit(
    EnterOrganisationCodeFormSubmit event,
    Emitter<EnterOrganisationCodeState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>();
    if (state.organisationCode == null || state.organisationCode!.isEmpty) {
      appBloc.add(AppErrorMessageSet(context, 'Error', 'Error'));
    } else {
      var isValid = false;
      if (state.organisationCode == null) {
        appBloc.add(AppNextRoute(context, EnterOrganisationCodeRoute()));
      } else {
        if (state.organisationCode != null) {
          appBloc.add(const AppIsLoadingSet());
          final organisation =
              await AmplifyRepo.callCheckOrganisationBySecretCode(
            state.organisationCode!,
          );
          if (organisation == null) {
            appBloc.add(const AppIsLoadingSet(isLoading: false));
          } else {
            isValid = true;
            final sharedPrefs = await SharedPreferences.getInstance();
            final themeColour =
                organisation.themeColor ?? AppConstant.themeColor;
            await sharedPrefs.setString(
              'organisation_theme_color',
              themeColour,
            );
            await sharedPrefs.setString(
              'organisation_id',
              organisation.getId(),
            );
            await sharedPrefs.setString(
              'organisation_name',
              organisation.name!,
            );
            appBloc
              ..add(const AppIsLoadingSet(isLoading: false))
              ..add(AppThemeColourSet(themeColour));
          }
        }
      }

      if (isValid) {
        // register user with generated email and password
        final usernameGen = UsernameGen()..setSeperator('_');
        final username =
            usernameGen.generate().replaceAll('-', '_').toLowerCase();
        context.read<GenerateUsernameBloc>()
          ..add(GenerateUsernameInitSet(context))
          ..add(GenerateUsernameUsernameSet(username))
          ..add(GenerateUsernameFormSubmit(context));
      } else {
        appBloc.add(AppErrorMessageSet(context, '', ''));
      }
    }
  }

  Future<void> _onEnterOrganisationCodeFinNumberSubmit(
    EnterOrganisationCodeFinNumberSubmit event,
    Emitter<EnterOrganisationCodeState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>();

    final emailAddress =
        "${state.finNumber ?? ''}@${AppConstant.emailDomainUrl}";
    final password = AppConfig.defaultEmployeePassword;

    context.read<AppBloc>().add(const AppIsLoadingSet());
    Future<void>.delayed(const Duration(milliseconds: 500), () async {
      final result = await AmplifyRepo.signIn(emailAddress, password);
      final session = result.item1;

      logInfo(session?.getIdToken().jwtToken);
      if (session != null) {
        var jwtRefreshToken = session.refreshToken?.getToken() ?? '';
        var jwtIdToken = session.getIdToken().jwtToken ?? '';
        final jwtIdTokenMap = Jwt.parseJwt(jwtIdToken);
        final userId = jwtIdTokenMap['custom:user_id'] as String?;
        final userSubId = jwtIdTokenMap['sub'] as String?;
        final sharedPrefs = await SharedPreferences.getInstance();
        await sharedPrefs.setBool('is_signed_in', true);
        await sharedPrefs.setString('user_id', userId ?? '');
        await sharedPrefs.setString('user_sub_id', userSubId ?? '');
        final jwtIdTokenExpiration = session.accessToken.getExpiration();
        final profileResult = await AmplifyRepo.callCheckProfileExists(userId!);
        String profileId;
        if (profileResult.profile != null) {
          profileId = profileResult.profile!.id;
          await sharedPrefs.setString('profile_id', profileId);
        } else {
          profileId = sharedPrefs.getString('profile_id') ?? '';
        }

        final organisationId =
            jwtIdTokenMap['custom:organisation_id'] as String? ?? '';
        await sharedPrefs.setString('organisation_id', organisationId);
        EncryptHelper.init(
          organisationId,
          userId,
          userSubId!,
          profileId,
        );
        jwtIdToken = EncryptHelper.encrypt(jwtIdToken);
        await sharedPrefs.setString('jwt_id_token', jwtIdToken);
        await sharedPrefs.setInt(
          'jwt_id_token_expiration',
          jwtIdTokenExpiration,
        );
        jwtRefreshToken = EncryptHelper.encrypt(jwtRefreshToken);
        await sharedPrefs.setString('jwt_refresh_token', jwtRefreshToken);
        appBloc
          ..add(const AppIsLoadingSet(isLoading: false))
          ..add(
            !profileResult.created
                ? AppNextRoute(context, const HomeRoute())
                : AppNextRoute(context, CompleteProfileRoute()),
          );
      } else {
        appBloc
          ..add(const AppIsLoadingSet(isLoading: false))
          ..add(
            AppErrorMessageSet(
              context,
              context.l10n.error,
              result.item2 ?? '',
            ),
          );
      }
    });
  }

  Future<void> _onEnterOrganisationCodeDepartmentTap(
    EnterOrganisationCodeDepartmentTap event,
    Emitter<EnterOrganisationCodeState> emit,
  ) async {
    //List all department data from db
    final departmentsList = await AmplifyRepo.callGetOrganisationDepartment(
      event.organisationCode,
    );
    emit(state.copyWith(departmentList: departmentsList));
  }

  Future<void> _onEnterOrganisationCodeDepartmentSet(
    EnterOrganisationCodeDepartmentSet event,
    Emitter<EnterOrganisationCodeState> emit,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(
      'department_id',
      event.selectedDepartment.id,
    );
    emit(state.copyWith(selectedDepartment: event.selectedDepartment));
  }

  Future<void> _onEnterOrganisationCodeDepartmentSubmit(
    EnterOrganisationCodeDepartmentSubmit event,
    Emitter<EnterOrganisationCodeState> emit,
  ) async {}
}
