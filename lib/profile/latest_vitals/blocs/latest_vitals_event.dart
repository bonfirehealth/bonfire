part of 'latest_vitals_bloc.dart';

@immutable
abstract class LatestVitalsEvent {
  const LatestVitalsEvent();
}

class LatestVitalsInitSet extends LatestVitalsEvent {
  const LatestVitalsInitSet(this.context);

  final BuildContext context;

  @override
  String toString() => 'LatestVitalsInitSet {}';
}
