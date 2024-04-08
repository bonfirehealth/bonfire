part of 'organisation_journeys_bloc.dart';

@immutable
abstract class OrganisationJourneysEvent {
  const OrganisationJourneysEvent();
}

class OrganisationJourneysInitSet extends OrganisationJourneysEvent {
  const OrganisationJourneysInitSet();

  @override
  String toString() => 'OrganisationJourneysInitSet {}';
}

class OrganisationJourneysIsLoadingSet extends OrganisationJourneysEvent {
  const OrganisationJourneysIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'OrganisationJourneysIsLoadingSet {}';
}
