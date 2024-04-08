part of 'home_bloc.dart';

class HomeState {
  const HomeState({
    this.currentIndex = 0,
  });

  final int currentIndex;

  HomeState copyWith({
    int? currentIndex,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
