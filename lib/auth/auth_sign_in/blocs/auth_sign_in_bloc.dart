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

part 'auth_sign_in_event.dart';
part 'auth_sign_in_state.dart';

class AuthSignInBloc extends Bloc<AuthSignInEvent, AuthSignInState> {
  AuthSignInBloc() : super(const AuthSignInState()) {
    on<AuthSignInInitSet>(_onAuthSignInInitSet);
    on<AuthSignInIsLoadingSet>(_onAuthSignInIsLoadingSet);
    on<AuthSignInEmailAddressSet>(_onAuthSignInEmailAddressSet);
    on<AuthSignInPasswordSet>(_onAuthSignInPasswordSet);
    on<AuthSignInFormSubmit>(_onAuthSignInFormSubmit);
  }

  Future<void> _onAuthSignInInitSet(
    AuthSignInInitSet event,
    Emitter<AuthSignInState> emit,
  ) async {}

  void _onAuthSignInIsLoadingSet(
    AuthSignInIsLoadingSet event,
    Emitter<AuthSignInState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  Future<void> _onAuthSignInEmailAddressSet(
    AuthSignInEmailAddressSet event,
    Emitter<AuthSignInState> emit,
  ) async {
    emit(state.copyWith(emailAddress: event.emailAddress));
  }

  Future<void> _onAuthSignInPasswordSet(
    AuthSignInPasswordSet event,
    Emitter<AuthSignInState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onAuthSignInFormSubmit(
    AuthSignInFormSubmit event,
    Emitter<AuthSignInState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>();
    final emailAddress = state.emailAddress;
    final password = state.password;
    if (emailAddress != null && password != null) {
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
          final profileId = sharedPrefs.getString('profile_id') ?? '';
          final organisationId =
              jwtIdTokenMap['custom:organisation_id'] as String? ?? '';
          await sharedPrefs.setString('organisation_id', organisationId);
          EncryptHelper.init(
            organisationId,
            userId!,
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
              AppNextRoute(
                context,
                const HomeRoute(),
              ),
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
  }
}
