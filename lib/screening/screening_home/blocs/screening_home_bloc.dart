// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'screening_home_event.dart';
part 'screening_home_state.dart';

class ScreeningHomeBloc extends Bloc<ScreeningHomeEvent, ScreeningHomeState> {
  ScreeningHomeBloc() : super(const ScreeningHomeState()) {
    on<ScreeningHomeInitSet>(_onScreeningHomeInitSet);
    on<ScreeningHomeIsLoadingSet>(_onScreeningHomeIsLoadingSet);
  }

  Future<void> _onScreeningHomeInitSet(
    ScreeningHomeInitSet event,
    Emitter<ScreeningHomeState> emit,
  ) async {
    final selfCares = await SelfCareRepo.getAllSelfCares();
    final powerBreakSelfCare =
        selfCares?.firstWhere((element) => element.name == 'Slow Down');
    emit(state.copyWith(activeSelfCare: powerBreakSelfCare));
  }

  void _onScreeningHomeIsLoadingSet(
    ScreeningHomeIsLoadingSet event,
    Emitter<ScreeningHomeState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }
}
