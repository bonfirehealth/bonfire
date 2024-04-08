part of 'web_screening_bloc.dart';

@immutable
abstract class WebScreeningEvent {
  const WebScreeningEvent();
}

class WebScreeningInitSet extends WebScreeningEvent {
  const WebScreeningInitSet(this.context);

  final BuildContext context;
  @override
  String toString() => 'WebScreeningInitSet {}';
}

class WebScreeningIsLoadingSet extends WebScreeningEvent {
  const WebScreeningIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'WebScreeningIsLoadingSet {}';
}

class WebScreeningStart extends WebScreeningEvent {
  const WebScreeningStart(this.context);

  final BuildContext context;

  @override
  String toString() => 'WebScreeningStart {}';
}

class WebScreeningStop extends WebScreeningEvent {
  const WebScreeningStop();

  @override
  String toString() => 'WebScreeningStop {}';
}

class WebScreeningScreenCountdownUpdated extends WebScreeningEvent {
  const WebScreeningScreenCountdownUpdated(this.context, this.remainingTime);

  final BuildContext context;
  final int remainingTime;

  @override
  String toString() => 'WebScreeningScreenCountdownUpdated {}';
}

class WebScreeningScreenCountdownFinished extends WebScreeningEvent {
  const WebScreeningScreenCountdownFinished(this.context);

  final BuildContext context;

  @override
  String toString() => 'WebScreeningScreenCountdownFinished {}';
}

class WebScreeningCompleted extends WebScreeningEvent {
  const WebScreeningCompleted();

  @override
  String toString() => 'WebScreeningCompleted {}';
}

class WebScreeningTerminated extends WebScreeningEvent {
  const WebScreeningTerminated();

  @override
  String toString() => 'WebScreeningTerminated {}';
}

class WebScreeningResultScreenDetailsSet extends WebScreeningEvent {
  const WebScreeningResultScreenDetailsSet({
    required this.symbol,
    required this.title,
    required this.normalRange,
    required this.description,
  });

  final String symbol;
  final String title;
  final String normalRange;
  final String description;

  @override
  String toString() => 'WebScreeningResultScreenDetailsSet {}';
}

class WebScreeningWarmUpStart extends WebScreeningEvent {
  const WebScreeningWarmUpStart(this.context);

  final BuildContext context;

  @override
  String toString() => 'WebScreeningWarmUpStart {}';
}

class WebScreeningWarmUpCountdownUpdated extends WebScreeningEvent {
  const WebScreeningWarmUpCountdownUpdated(this.context, this.remainingTime);

  final BuildContext context;
  final int remainingTime;

  @override
  String toString() => 'WebScreeningWarmUpCountdownUpdated {}';
}

class WebScreeningWarmUpCountdownFinished extends WebScreeningEvent {
  const WebScreeningWarmUpCountdownFinished(this.context);

  final BuildContext context;

  @override
  String toString() => 'WebScreeningWarmUpCountdownFinished {}';
}

class WebScreeningFirstResultSet extends WebScreeningEvent {
  const WebScreeningFirstResultSet();

  @override
  String toString() => 'WebScreeningFirstResultSet {}';
}

class WebScreeningPredictStatusSet extends WebScreeningEvent {
  const WebScreeningPredictStatusSet(this.context);

  final BuildContext context;

  @override
  String toString() => 'WebScreeningPredictStatusSet {}';
}

class WebScreeningRecordStatusSet extends WebScreeningEvent {
  const WebScreeningRecordStatusSet(this.context);

  final BuildContext context;

  @override
  String toString() => 'WebScreeningRecordStatusSet {}';
}

class WebScreeningWarmUpStatusSet extends WebScreeningEvent {
  const WebScreeningWarmUpStatusSet(this.context);

  final BuildContext context;

  @override
  String toString() => 'WebScreeningWarmUpStatusSet {}';
}

class WebScreeningAssessmentSet extends WebScreeningEvent {
  const WebScreeningAssessmentSet(this.assessment);

  final Assessment? assessment;

  @override
  String toString() => 'WebScreeningAssessmentSet {}';
}

class WebScreeningResultAssessmentSet extends WebScreeningEvent {
  const WebScreeningResultAssessmentSet(this.resultAssessment);

  final ScreeningResultAssessment? resultAssessment;

  @override
  String toString() => 'WebScreeningResultAssessmentSet {}';
}

class WebScreeningStressLevelSet extends WebScreeningEvent {
  const WebScreeningStressLevelSet(this.stressLevel);

  final StressLevel? stressLevel;

  @override
  String toString() => 'WebScreeningStressLevelSet {}';
}

class WebScreeningBodyTemperatureSet extends WebScreeningEvent {
  const WebScreeningBodyTemperatureSet(this.bodyTemperature);

  final double? bodyTemperature;

  @override
  String toString() => 'WebScreeningBodyTemperatureSet {}';
}

class WebScreeningDispose extends WebScreeningEvent {
  const WebScreeningDispose();

  @override
  String toString() => 'WebScreeningDispose {}';
}
