part of 'join_organisation_bloc.dart';

class JoinOrganisationState {
  const JoinOrganisationState({
    this.isLoading = false,
    this.organisation,
    this.organisationCode,
    this.organisationToken,
    this.organisationUserId,
  });

  final bool isLoading;
  final Organisation? organisation;
  final String? organisationCode;
  final String? organisationToken;
  final String? organisationUserId;

  JoinOrganisationState copyWith({
    bool? isLoading,
    Organisation? organisation,
    String? organisationCode,
    String? organisationToken,
    String? organisationUserId,
  }) {
    return JoinOrganisationState(
      isLoading: isLoading ?? this.isLoading,
      organisation: organisation ?? this.organisation,
      organisationCode: organisationCode ?? this.organisationCode,
      organisationToken: organisationToken ?? this.organisationToken,
      organisationUserId: organisationUserId ?? this.organisationUserId,
    );
  }
}
