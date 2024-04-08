part of 'landing_bloc.dart';

@immutable
abstract class LandingEvent {
  const LandingEvent();
}

class LandingInitSet extends LandingEvent {
  const LandingInitSet();

  @override
  String toString() => 'LandingInitSet {}';
}
