part of 'screening_home_bloc.dart';

class ScreeningHomeState {
  const ScreeningHomeState({
    this.isLoading = false,
    this.activeSelfCare,
  });

  final bool isLoading;
  final SelfCare? activeSelfCare;

  ScreeningHomeState copyWith({
    bool? isLoading,
    SelfCare? activeSelfCare,
  }) {
    return ScreeningHomeState(
      isLoading: isLoading ?? this.isLoading,
      activeSelfCare: activeSelfCare ?? this.activeSelfCare,
    );
  }
}
