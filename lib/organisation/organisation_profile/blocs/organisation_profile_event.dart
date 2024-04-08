part of 'organisation_profile_bloc.dart';

@immutable
abstract class OrganisationProfileEvent {
  const OrganisationProfileEvent();
}

class OrganisationProfileInitSet extends OrganisationProfileEvent {
  const OrganisationProfileInitSet();

  @override
  String toString() => 'OrganisationProfileInitSet {}';
}

class OrganisationProfileIsLoadingSet extends OrganisationProfileEvent {
  const OrganisationProfileIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'OrganisationProfileIsLoadingSet {}';
}

class OrganisationProfileSignOut extends OrganisationProfileEvent {
  const OrganisationProfileSignOut(this.context);

  final BuildContext context;

  @override
  String toString() => 'OrganisationProfileSignOut {}';
}
