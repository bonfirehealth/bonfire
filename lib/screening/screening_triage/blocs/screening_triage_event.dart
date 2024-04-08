part of 'screening_triage_bloc.dart';

@immutable
abstract class ScreeningTriageEvent {
  const ScreeningTriageEvent();
}

class ScreeningTriageStressLevelSet extends ScreeningTriageEvent {
  const ScreeningTriageStressLevelSet(this.stressLevel);

  final StressLevel? stressLevel;
  @override
  String toString() => 'ScreeningTriageStressLevelSet {}';
}

class ScreeningTriageClickCountSet extends ScreeningTriageEvent {
  const ScreeningTriageClickCountSet(this.suggestionId);

  final String suggestionId;
  @override
  String toString() => 'ScreeningTriageClickCountSet {}';
}

class ScreeningTriageViewCountSet extends ScreeningTriageEvent {
  const ScreeningTriageViewCountSet(this.suggestionId);

  final String suggestionId;
  @override
  String toString() => 'ScreeningTriageViewCountSet {}';
}
