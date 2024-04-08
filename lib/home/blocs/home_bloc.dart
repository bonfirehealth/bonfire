// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeCurrentNavigationIndexSet>(_onHomeCurrentNavigationIndexSet);
  }

  void _onHomeCurrentNavigationIndexSet(
    HomeCurrentNavigationIndexSet event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }
}
