part of 'organisation_sign_in_bloc.dart';

@immutable
abstract class OrganisationSignInEvent {
  const OrganisationSignInEvent();
}

class OrganisationSignInInitSet extends OrganisationSignInEvent {
  const OrganisationSignInInitSet();

  @override
  String toString() => 'OrganisationSignInInitSet {}';
}

class OrganisationSignInIsLoadingSet extends OrganisationSignInEvent {
  const OrganisationSignInIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'OrganisationSignInIsLoadingSet {}';
}

class OrganisationSignInEmailAddressSet extends OrganisationSignInEvent {
  const OrganisationSignInEmailAddressSet(this.emailAddress);

  final String emailAddress;

  @override
  String toString() => 'OrganisationSignInEmailAddressSet {}';
}

class OrganisationSignInPasswordSet extends OrganisationSignInEvent {
  const OrganisationSignInPasswordSet(this.password);

  final String password;

  @override
  String toString() => 'OrganisationSignInPasswordSet {}';
}

class OrganisationSignInFormSubmit extends OrganisationSignInEvent {
  const OrganisationSignInFormSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'OrganisationSignInFormSubmit {}';
}
