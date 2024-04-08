part of 'auth_recover_account_bloc.dart';

class AuthRecoverAccountState {
  const AuthRecoverAccountState({
    this.isLoading = false,
    this.isPasswordReset = false,
    this.emailAddress,
    this.recoveryCode,
    this.recoveryCodeId,
    this.password,
    this.confirmPassword,
  });

  final bool isLoading;
  final bool isPasswordReset;
  final String? emailAddress;
  final String? recoveryCode;
  final String? recoveryCodeId;
  final String? password;
  final String? confirmPassword;

  AuthRecoverAccountState copyWith({
    bool? isLoading,
    bool? isPasswordReset,
    String? emailAddress,
    String? recoveryCode,
    String? recoveryCodeId,
    String? password,
    String? confirmPassword,
  }) {
    return AuthRecoverAccountState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordReset: isPasswordReset ?? this.isPasswordReset,
      emailAddress: emailAddress ?? this.emailAddress,
      recoveryCode: recoveryCode ?? this.recoveryCode,
      recoveryCodeId: recoveryCodeId ?? this.recoveryCodeId,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
