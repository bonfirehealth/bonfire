part of 'screening_home_bloc.dart';

@immutable
abstract class ScreeningHomeEvent {
  const ScreeningHomeEvent();
}

class ScreeningHomeInitSet extends ScreeningHomeEvent {
  const ScreeningHomeInitSet();

  @override
  String toString() => 'ScreeningHomeInitSet {}';
}

class ScreeningHomeIsLoadingSet extends ScreeningHomeEvent {
  const ScreeningHomeIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'ScreeningHomeIsLoadingSet {}';
}
