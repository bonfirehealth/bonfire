part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class HomeCurrentNavigationIndexSet extends HomeEvent {
  const HomeCurrentNavigationIndexSet(this.currentIndex);

  final int currentIndex;

  @override
  String toString() =>
      'HomeCurrentNavigationIndexSet { currentIndex: $currentIndex }';
}
