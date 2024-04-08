part of 'organisation_sign_in_bloc.dart';

class OrganisationSignInState {
  const OrganisationSignInState({
    this.isLoading = false,
    this.emailAddress,
    this.password,
  });

  final bool isLoading;
  final String? emailAddress;
  final String? password;

  OrganisationSignInState copyWith({
    bool? isLoading,
    String? emailAddress,
    String? password,
  }) {
    return OrganisationSignInState(
      isLoading: isLoading ?? this.isLoading,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
    );
  }
}
