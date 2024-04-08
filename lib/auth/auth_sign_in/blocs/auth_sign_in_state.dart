part of 'auth_sign_in_bloc.dart';

class AuthSignInState {
  const AuthSignInState({
    this.isLoading = false,
    this.emailAddress,
    this.password,
  });

  final bool isLoading;
  final String? emailAddress;
  final String? password;

  AuthSignInState copyWith({
    bool? isLoading,
    String? emailAddress,
    String? password,
  }) {
    return AuthSignInState(
      isLoading: isLoading ?? this.isLoading,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
    );
  }
}
