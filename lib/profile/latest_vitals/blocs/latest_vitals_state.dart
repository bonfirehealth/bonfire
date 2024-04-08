part of 'latest_vitals_bloc.dart';

class LatestVitalsState {
  const LatestVitalsState({
    this.isLoading,
    this.assessment,
  });

  final bool? isLoading;
  final Assessment? assessment;

  LatestVitalsState copyWith({
    bool? isLoading,
    Assessment? assessment,
  }) {
    return LatestVitalsState(
      isLoading: isLoading ?? this.isLoading,
      assessment: assessment ?? this.assessment,
    );
  }
}
