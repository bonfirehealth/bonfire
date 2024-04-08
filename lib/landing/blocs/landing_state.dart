part of 'landing_bloc.dart';

class LandingState {
  const LandingState({
    this.deviceInfo,
  });

  final String? deviceInfo;

  LandingState copyWith({
    String? deviceInfo,
  }) {
    return LandingState(
      deviceInfo: deviceInfo ?? this.deviceInfo,
    );
  }
}
