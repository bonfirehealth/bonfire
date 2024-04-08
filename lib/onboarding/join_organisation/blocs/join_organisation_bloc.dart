// Flutter imports:
// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'join_organisation_event.dart';
part 'join_organisation_state.dart';

class JoinOrganisationBloc
    extends Bloc<JoinOrganisationEvent, JoinOrganisationState> {
  JoinOrganisationBloc() : super(const JoinOrganisationState()) {
    on<JoinOrganisationInitSet>(_onJoinOrganisationInitSet);
    on<JoinOrganisationIsLoadingSet>(_onJoinOrganisationIsLoadingSet);
    on<JoinOrganisationOrganisationCodeSet>(
      _onJoinOrganisationOrganisationCodeSet,
    );
    on<JoinOrganisationOrganisationUserIdSet>(
      _onJoinOrganisationOrganisationUserIdSet,
    );
    on<JoinOrganisationOrganisationTokenSet>(
      _onJoinOrganisationOrganisationTokenSet,
    );
    on<JoinOrganisationOrganisationByCodeAndTokenGet>(
      _onJoinOrganisationOrganisationByCodeAndTokenGet,
    );
    on<JoinOrganisationFormSubmit>(_onJoinOrganisationFormSubmit);
  }

  Future<void> _onJoinOrganisationInitSet(
    JoinOrganisationInitSet event,
    Emitter<JoinOrganisationState> emit,
  ) async {}

  void _onJoinOrganisationIsLoadingSet(
    JoinOrganisationIsLoadingSet event,
    Emitter<JoinOrganisationState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  Future<void> _onJoinOrganisationOrganisationCodeSet(
    JoinOrganisationOrganisationCodeSet event,
    Emitter<JoinOrganisationState> emit,
  ) async {
    emit(state.copyWith(organisationCode: event.organisationCode));
  }

  Future<void> _onJoinOrganisationOrganisationUserIdSet(
    JoinOrganisationOrganisationUserIdSet event,
    Emitter<JoinOrganisationState> emit,
  ) async {
    emit(state.copyWith(organisationUserId: event.organisationUserId));
  }

  Future<void> _onJoinOrganisationOrganisationTokenSet(
    JoinOrganisationOrganisationTokenSet event,
    Emitter<JoinOrganisationState> emit,
  ) async {
    emit(state.copyWith(organisationToken: event.organisationToken));
  }

  Future<void> _onJoinOrganisationOrganisationByCodeAndTokenGet(
    JoinOrganisationOrganisationByCodeAndTokenGet event,
    Emitter<JoinOrganisationState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>();
    if (state.organisationCode == null || state.organisationToken == null) {
      appBloc.add(AppNextRoute(context, EnterOrganisationCodeRoute()));
    } else {
      if (state.organisationCode != null && state.organisationToken != null) {
        appBloc.add(const AppIsLoadingSet());
        final organisation =
            await AmplifyRepo.callCheckOrganisationByCodeAndToken(
          state.organisationCode!,
          state.organisationToken!,
        );
        if (organisation == null) {
          appBloc.add(AppNextRoute(context, EnterOrganisationCodeRoute()));
        } else {
          emit(
            state.copyWith(
              organisation: organisation,
            ),
          );
          final sharedPrefs = await SharedPreferences.getInstance();
          final themeColour = organisation.themeColor ?? AppConstant.themeColor;
          await sharedPrefs.setString(
            'organisation_theme_color',
            themeColour,
          );
          await sharedPrefs.setString(
            'organisation_code',
            state.organisationCode!,
          );
          await sharedPrefs.setString(
            'organisation_token',
            state.organisationToken!,
          );
          if (state.organisationUserId != null) {
            await sharedPrefs.setString(
              'organisation_user_id',
              state.organisationUserId!,
            );
          }
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
      appBloc.add(const AppIsLoadingSet(isLoading: false));
    }
  }

  Future<void> _onJoinOrganisationFormSubmit(
    JoinOrganisationFormSubmit event,
    Emitter<JoinOrganisationState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>();
    if (state.organisationCode == null || state.organisationCode!.isEmpty) {
      appBloc.add(AppErrorMessageSet(context, 'Error', 'Error'));
    } else {
      appBloc.add(AppNextRoute(context, const GenerateUsernameRoute()));
    }
  }
}
