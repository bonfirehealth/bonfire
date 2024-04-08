part of 'organisation_journeys_bloc.dart';

class OrganisationJourneysState {
  const OrganisationJourneysState({
    this.isLoading = false,
  });

  final bool isLoading;

  OrganisationJourneysState copyWith({
    bool? isLoading,
  }) {
    return OrganisationJourneysState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
