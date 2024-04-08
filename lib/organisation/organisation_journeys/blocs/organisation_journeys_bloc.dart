// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

part 'organisation_journeys_event.dart';
part 'organisation_journeys_state.dart';

class OrganisationJourneysBloc
    extends Bloc<OrganisationJourneysEvent, OrganisationJourneysState> {
  OrganisationJourneysBloc() : super(const OrganisationJourneysState()) {
    on<OrganisationJourneysInitSet>(_onOrganisationJourneysInitSet);
    on<OrganisationJourneysIsLoadingSet>(_onOrganisationJourneysIsLoadingSet);
  }

  Future<void> _onOrganisationJourneysInitSet(
    OrganisationJourneysInitSet event,
    Emitter<OrganisationJourneysState> emit,
  ) async {}

  void _onOrganisationJourneysIsLoadingSet(
    OrganisationJourneysIsLoadingSet event,
    Emitter<OrganisationJourneysState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}
