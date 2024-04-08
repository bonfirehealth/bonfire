part of 'join_organisation_bloc.dart';

@immutable
abstract class JoinOrganisationEvent {
  const JoinOrganisationEvent();
}

class JoinOrganisationInitSet extends JoinOrganisationEvent {
  const JoinOrganisationInitSet();

  @override
  String toString() => 'JoinOrganisationInitSet {}';
}

class JoinOrganisationIsLoadingSet extends JoinOrganisationEvent {
  const JoinOrganisationIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'JoinOrganisationIsLoadingSet {}';
}

class JoinOrganisationOrganisationCodeSet extends JoinOrganisationEvent {
  const JoinOrganisationOrganisationCodeSet(this.organisationCode);

  final String organisationCode;

  @override
  String toString() => 'JoinOrganisationOrganisationCodeSet {}';
}

class JoinOrganisationOrganisationUserIdSet extends JoinOrganisationEvent {
  const JoinOrganisationOrganisationUserIdSet(this.organisationUserId);

  final String organisationUserId;

  @override
  String toString() => 'JoinOrganisationOrganisationUserIdSet {}';
}

class JoinOrganisationOrganisationTokenSet extends JoinOrganisationEvent {
  const JoinOrganisationOrganisationTokenSet(this.organisationToken);

  final String organisationToken;

  @override
  String toString() => 'JoinOrganisationOrganisationTokenSet {}';
}

class JoinOrganisationOrganisationByCodeAndTokenGet
    extends JoinOrganisationEvent {
  const JoinOrganisationOrganisationByCodeAndTokenGet(this.context);

  final BuildContext context;

  @override
  String toString() => 'JoinOrganisationOrganisationByCodeAndTokenGet {}';
}

class JoinOrganisationFormSubmit extends JoinOrganisationEvent {
  const JoinOrganisationFormSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'JoinOrganisationFormSubmit {}';
}
