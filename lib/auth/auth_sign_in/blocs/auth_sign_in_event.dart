part of 'auth_sign_in_bloc.dart';

@immutable
abstract class AuthSignInEvent {
  const AuthSignInEvent();
}

class AuthSignInInitSet extends AuthSignInEvent {
  const AuthSignInInitSet();

  @override
  String toString() => 'AuthSignInInitSet {}';
}

class AuthSignInIsLoadingSet extends AuthSignInEvent {
  const AuthSignInIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'AuthSignInIsLoadingSet {}';
}

class AuthSignInEmailAddressSet extends AuthSignInEvent {
  const AuthSignInEmailAddressSet(this.emailAddress);

  final String emailAddress;

  @override
  String toString() => 'AuthSignInEmailAddressSet {}';
}

class AuthSignInPasswordSet extends AuthSignInEvent {
  const AuthSignInPasswordSet(this.password);

  final String password;

  @override
  String toString() => 'AuthSignInPasswordSet {}';
}

class AuthSignInFormSubmit extends AuthSignInEvent {
  const AuthSignInFormSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'AuthSignInFormSubmit {}';
}
