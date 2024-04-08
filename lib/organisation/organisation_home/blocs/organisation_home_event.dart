part of 'organisation_home_bloc.dart';

@immutable
abstract class OrganisationHomeEvent {
  const OrganisationHomeEvent();
}

class OrganisationHomeInitSet extends OrganisationHomeEvent {
  const OrganisationHomeInitSet();

  @override
  String toString() => 'OrganisationHomeInitSet {}';
}

class OrganisationHomeIsLoadingSet extends OrganisationHomeEvent {
  const OrganisationHomeIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'OrganisationHomeIsLoadingSet {}';
}

class OrganisationHomeCurrentNavigationIndexSet extends OrganisationHomeEvent {
  const OrganisationHomeCurrentNavigationIndexSet(this.currentNavigationIndex);

  final int currentNavigationIndex;

  @override
  String toString() => 'OrganisationHomeCurrentNavigationIndexSet {}';
}

class OrganisationHomeCurrentDashboardTypeSet extends OrganisationHomeEvent {
  const OrganisationHomeCurrentDashboardTypeSet({required this.isFamilyMembersTab});

  final bool isFamilyMembersTab;

  @override
  String toString() => 'OrganisationHomeCurrentDashboardTypeSet {}';
}
