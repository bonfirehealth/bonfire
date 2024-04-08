// Flutter imports:
// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'organisation_sign_in_event.dart';
part 'organisation_sign_in_state.dart';

class OrganisationSignInBloc
    extends Bloc<OrganisationSignInEvent, OrganisationSignInState> {
  OrganisationSignInBloc() : super(const OrganisationSignInState()) {
    on<OrganisationSignInInitSet>(_onOrganisationSignInInitSet);
    on<OrganisationSignInIsLoadingSet>(_onOrganisationSignInIsLoadingSet);
    on<OrganisationSignInEmailAddressSet>(_onOrganisationSignInEmailAddressSet);
    on<OrganisationSignInPasswordSet>(_onOrganisationSignInPasswordSet);
    on<OrganisationSignInFormSubmit>(_onOrganisationSignInFormSubmit);
  }

  Future<void> _onOrganisationSignInInitSet(
    OrganisationSignInInitSet event,
    Emitter<OrganisationSignInState> emit,
  ) async {}

  void _onOrganisationSignInIsLoadingSet(
    OrganisationSignInIsLoadingSet event,
    Emitter<OrganisationSignInState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  Future<void> _onOrganisationSignInEmailAddressSet(
    OrganisationSignInEmailAddressSet event,
    Emitter<OrganisationSignInState> emit,
  ) async {
    emit(state.copyWith(emailAddress: event.emailAddress));
  }

  Future<void> _onOrganisationSignInPasswordSet(
    OrganisationSignInPasswordSet event,
    Emitter<OrganisationSignInState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  void _onOrganisationSignInFormSubmit(
    OrganisationSignInFormSubmit event,
    Emitter<OrganisationSignInState> emit,
  ) {

    final context = event.context;
    final appBloc = context.read<AppBloc>();
    final emailAddress = state.emailAddress;
    final password = state.password;
    if (emailAddress != null && password != null) {
      appBloc.add(const AppIsLoadingSet());
      Future<void>.delayed(const Duration(milliseconds: 500), () async {
        final result = await AmplifyRepo.signIn(emailAddress, password);
        final session = result.item1;
        logInfo(session?.getIdToken().jwtToken);
        if (session != null) {
          var jwtRefreshToken = session.refreshToken?.getToken() ?? '';
          var jwtIdToken = session.getIdToken().jwtToken ?? '';
          final jwtIdTokenMap = Jwt.parseJwt(jwtIdToken);
          final userId = jwtIdTokenMap['custom:user_id'] as String?;
          final organisationId =
              jwtIdTokenMap['custom:organisation_id'] as String?;
          final userSubId = jwtIdTokenMap['sub'] as String?;
          final sharedPrefs = await SharedPreferences.getInstance();
          await sharedPrefs.clear();
          await sharedPrefs.setBool('is_signed_in', true);
          await sharedPrefs.setString('user_id', userId ?? '');
          await sharedPrefs.setBool('is_organisation_account', true);
          await sharedPrefs.setString(
            'organisation_id',
            organisationId ?? '',
          );
          await sharedPrefs.setString('user_sub_id', userSubId ?? '');
          final jwtIdTokenExpiration = session.accessToken.getExpiration();
          final profileId = sharedPrefs.getString('profile_id') ?? '';
          EncryptHelper.init(
            organisationId!,
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
          print("Signing in as admin");
          appBloc
            ..add(const AppInitSet())
            ..add(const AppIsLoadingSet(isLoading: false))
            ..add(
              AppNextRoute(
                context,
                const OrganisationHomeRoute(),
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
