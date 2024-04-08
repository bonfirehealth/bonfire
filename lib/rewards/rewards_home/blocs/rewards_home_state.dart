part of 'rewards_home_bloc.dart';

class RewardsHomeState {
  const RewardsHomeState({
    this.isLoading = false,
  });

  final bool isLoading;

  RewardsHomeState copyWith({
    bool? isLoading,
  }) {
    return RewardsHomeState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
