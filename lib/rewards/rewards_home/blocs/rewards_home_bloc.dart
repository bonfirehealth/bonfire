// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rewards_home_event.dart';
part 'rewards_home_state.dart';

class RewardsHomeBloc extends Bloc<RewardsHomeEvent, RewardsHomeState> {
  RewardsHomeBloc() : super(const RewardsHomeState()) {
    on<RewardsHomeInitSet>(_onRewardsHomeInitSet);
    on<RewardsHomeIsLoadingSet>(_onRewardsHomeIsLoadingSet);
  }

  Future<void> _onRewardsHomeInitSet(
    RewardsHomeInitSet event,
    Emitter<RewardsHomeState> emit,
  ) async {}

  void _onRewardsHomeIsLoadingSet(
    RewardsHomeIsLoadingSet event,
    Emitter<RewardsHomeState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }
}
