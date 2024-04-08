part of 'auth_recover_account_bloc.dart';

@immutable
abstract class AuthRecoverAccountEvent {
  const AuthRecoverAccountEvent();
}

class AuthRecoverAccountInitSet extends AuthRecoverAccountEvent {
  const AuthRecoverAccountInitSet();

  @override
  String toString() => 'AuthRecoverAccountInitSet {}';
}

class AuthRecoverAccountIsLoadingSet extends AuthRecoverAccountEvent {
  const AuthRecoverAccountIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'AuthRecoverAccountIsLoadingSet {}';
}

class AuthRecoverAccountEmailAddressSet extends AuthRecoverAccountEvent {
  const AuthRecoverAccountEmailAddressSet(this.emailAddress);

  final String emailAddress;

  @override
  String toString() => 'AuthRecoverAccountEmailAddressSet {}';
}

class AuthRecoverAccountRecoveryCodeSet extends AuthRecoverAccountEvent {
  const AuthRecoverAccountRecoveryCodeSet(this.recoveryCode);

  final String recoveryCode;

  @override
  String toString() => 'AuthRecoverAccountRecoveryCodeSet {}';
}

class AuthRecoverAccountFormSubmit extends AuthRecoverAccountEvent {
  const AuthRecoverAccountFormSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'AuthRecoverAccountFormSubmit {}';
}

class AuthRecoverAccountPasswordSet extends AuthRecoverAccountEvent {
  const AuthRecoverAccountPasswordSet(this.password);

  final String password;

  @override
  String toString() => 'AuthRecoverAccountPasswordSet {}';
}

class AuthRecoverAccountConfirmPasswordSet extends AuthRecoverAccountEvent {
  const AuthRecoverAccountConfirmPasswordSet(this.confirmPassword);

  final String confirmPassword;

  @override
  String toString() => 'AuthRecoverAccountConfirmPasswordSet {}';
}

class AuthRecoverAccountResetFormSubmit extends AuthRecoverAccountEvent {
  const AuthRecoverAccountResetFormSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'AuthRecoverAccountResetFormSubmit {}';
}
