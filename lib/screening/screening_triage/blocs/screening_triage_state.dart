part of 'screening_triage_bloc.dart';

class ScreeningTriageState {
  const ScreeningTriageState({
    this.stressLevel,
    this.suggestions,
  });

  final StressLevel? stressLevel;
  final List<Suggestion>? suggestions;

  ScreeningTriageState copyWith({
    StressLevel? stressLevel,
    List<Suggestion>? suggestions,
  }) {
    return ScreeningTriageState(
      stressLevel: stressLevel ?? this.stressLevel,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}
