part of 'organisation_home_bloc.dart';

class OrganisationHomeState {
  const OrganisationHomeState({
    this.isLoading = false,
    this.currentNavigationIndex = 0,
    this.isFamilyMembersTab = false
  });

  final bool isLoading;
  final int currentNavigationIndex;
  final bool isFamilyMembersTab;

  OrganisationHomeState copyWith({
    bool? isLoading,
    int? currentNavigationIndex, bool? isFamilyMembersTab,
  }) {
    return OrganisationHomeState(
      isLoading: isLoading ?? this.isLoading,
      currentNavigationIndex:
          currentNavigationIndex ?? this.currentNavigationIndex,
      isFamilyMembersTab: isFamilyMembersTab ?? this.isFamilyMembersTab
    );
  }
}
