// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'organisation_profile_event.dart';
part 'organisation_profile_state.dart';

class OrganisationProfileBloc
    extends Bloc<OrganisationProfileEvent, OrganisationProfileState> {
  OrganisationProfileBloc() : super(const OrganisationProfileState()) {
    on<OrganisationProfileInitSet>(_onOrganisationProfileInitSet);
    on<OrganisationProfileIsLoadingSet>(_onOrganisationProfileIsLoadingSet);
    on<OrganisationProfileSignOut>(_onOrganisationProfileSignOut);
  }

  String? get organisationId => state.organisationId;

  Future<void> _onOrganisationProfileInitSet(
    OrganisationProfileInitSet event,
    Emitter<OrganisationProfileState> emit,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final response = await UserRepo.getUser();
    final user = response?.item1;
    final userId = user?.getId();
    String? organisationId;
    if (userId != null) {
      await sharedPrefs.setString('user_id', userId);
      if (FlavorConfig.instance != null) {
        await MixpanelHelper.init(FlavorConfig.instance!.flavor);
        MixpanelHelper.mixpanel?.identify(userId);
      }
    }

    if (user != null) {
      if (user.organisations != null) {
        final userOrganisation = user.organisations?[0];
        organisationId = userOrganisation?.organisation.id;
        final themeColor =
            userOrganisation?.organisation.themeColor ?? AppConstant.themeColor;
        await sharedPrefs.setString('organisation_theme_color', themeColor);
      }

      if (user.profile?.getId() != null) {
        await sharedPrefs.setString(
          'profile_id',
          user.profile?.getId() ?? '',
        );
      }

      if (user.profile != null) {
        logInfo(user.profile);
      }
    }

    emit(
      state.copyWith(
        organisationId: organisationId,
        profile: user?.profile,
        user: user,
      ),
    );
  }

  void _onOrganisationProfileIsLoadingSet(
    OrganisationProfileIsLoadingSet event,
    Emitter<OrganisationProfileState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  Future<void> _onOrganisationProfileSignOut(
    OrganisationProfileSignOut event,
    Emitter<OrganisationProfileState> emit,
  ) async {
    final context = event.context;
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    await MixpanelHelper.init(FlavorConfig.instance!.flavor);
    MixpanelHelper.mixpanel?.reset();
    context.read<AppBloc>()
      ..add(const AppInitSet())
      ..add(const AppIsLoadingSet(isLoading: false))
      ..add(
        AppReplaceRoute(
          context,
          const OrganisationSignInRoute(),
        ),
      );
  }
}
