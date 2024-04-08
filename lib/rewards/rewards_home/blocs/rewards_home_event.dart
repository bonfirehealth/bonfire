part of 'rewards_home_bloc.dart';

@immutable
abstract class RewardsHomeEvent {
  const RewardsHomeEvent();
}

class RewardsHomeInitSet extends RewardsHomeEvent {
  const RewardsHomeInitSet();

  @override
  String toString() => 'RewardsHomeInitSet {}';
}

class RewardsHomeIsLoadingSet extends RewardsHomeEvent {
  const RewardsHomeIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'RewardsHomeIsLoadingSet {}';
}
