part of 'generate_username_bloc.dart';

class GenerateUsernameState {
  const GenerateUsernameState({
    this.isLoading = false,
    this.isSecretCredentialsSent = false,
    this.organisationId,
    this.organisationName,
    this.username,
    this.password,
    this.userId,
    this.userSubId,
    this.personalEmailAddress,
    this.recoveryCodes,
  });

  final bool isLoading;
  final bool isSecretCredentialsSent;
  final String? organisationId;
  final String? organisationName;
  final String? username;
  final String? password;
  final String? userId;
  final String? userSubId;
  final String? personalEmailAddress;
  final List<String>? recoveryCodes;

  GenerateUsernameState copyWith({
    bool? isLoading,
    bool? isSecretCredentialsSent,
    String? organisationId,
    String? organisationName,
    String? username,
    String? password,
    String? userId,
    String? userSubId,
    String? personalEmailAddress,
    List<String>? recoveryCodes,
  }) {
    return GenerateUsernameState(
      isLoading: isLoading ?? this.isLoading,
      isSecretCredentialsSent:
          isSecretCredentialsSent ?? this.isSecretCredentialsSent,
      organisationId: organisationId ?? this.organisationId,
      organisationName: organisationName ?? this.organisationName,
      username: username ?? this.username,
      password: password ?? this.password,
      userId: userId ?? this.userId,
      userSubId: userSubId ?? this.userSubId,
      personalEmailAddress: personalEmailAddress ?? this.personalEmailAddress,
      recoveryCodes: recoveryCodes ?? this.recoveryCodes,
    );
  }
}
