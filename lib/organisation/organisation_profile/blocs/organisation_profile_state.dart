part of 'organisation_profile_bloc.dart';

class OrganisationProfileState {
  const OrganisationProfileState({
    this.isLoading = false,
    this.organisationId,
    this.profile,
    this.user,
  });

  final bool isLoading;
  final String? organisationId;
  final Profile? profile;
  final User? user;

  OrganisationProfileState copyWith({
    bool? isLoading,
    String? organisationId,
    Profile? profile,
    User? user,
  }) {
    return OrganisationProfileState(
      isLoading: isLoading ?? this.isLoading,
      organisationId: organisationId ?? this.organisationId,
      profile: profile ?? this.profile,
      user: user ?? this.user,
    );
  }
}
