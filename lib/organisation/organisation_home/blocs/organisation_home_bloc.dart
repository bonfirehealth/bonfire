// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

part 'organisation_home_event.dart';
part 'organisation_home_state.dart';

class OrganisationHomeBloc
    extends Bloc<OrganisationHomeEvent, OrganisationHomeState> {
  OrganisationHomeBloc() : super(const OrganisationHomeState()) {
    on<OrganisationHomeInitSet>(_onOrganisationHomeInitSet);
    on<OrganisationHomeIsLoadingSet>(_onOrganisationHomeIsLoadingSet);
    on<OrganisationHomeCurrentNavigationIndexSet>(
      _onOrganisationHomeCurrentNavigationIndexSet,
    );
    on<OrganisationHomeCurrentDashboardTypeSet>(_onOrganisationHomeCurrentDashboardTypeSet);
  }

  Future<void> _onOrganisationHomeInitSet(
    OrganisationHomeInitSet event,
    Emitter<OrganisationHomeState> emit,
  ) async {}

  void _onOrganisationHomeIsLoadingSet(
    OrganisationHomeIsLoadingSet event,
    Emitter<OrganisationHomeState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  Future<void> _onOrganisationHomeCurrentNavigationIndexSet(
    OrganisationHomeCurrentNavigationIndexSet event,
    Emitter<OrganisationHomeState> emit,
  ) async {
    emit(state.copyWith(currentNavigationIndex: event.currentNavigationIndex));
  }

  Future<void> _onOrganisationHomeCurrentDashboardTypeSet(
      OrganisationHomeCurrentDashboardTypeSet event,
      Emitter<OrganisationHomeState> emit,
      ) async {
    emit(state.copyWith(isFamilyMembersTab: event.isFamilyMembersTab));
  }
}
