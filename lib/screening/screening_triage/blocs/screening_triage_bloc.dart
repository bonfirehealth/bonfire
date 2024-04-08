// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'screening_triage_event.dart';
part 'screening_triage_state.dart';

class ScreeningTriageBloc
    extends Bloc<ScreeningTriageEvent, ScreeningTriageState> {
  ScreeningTriageBloc() : super(const ScreeningTriageState()) {
    on<ScreeningTriageStressLevelSet>(_onScreeningTriageStressLevelSet);
    on<ScreeningTriageClickCountSet>(_onScreeningTriageClickCountSet);
    on<ScreeningTriageViewCountSet>(_onScreeningTriageViewCountSet);
  }

  Future<void> _onScreeningTriageStressLevelSet(
    ScreeningTriageStressLevelSet event,
    Emitter<ScreeningTriageState> emit,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final organisationId = sharedPrefs.getString('organisation_id');
    final stressLevel = event.stressLevel;

    if (organisationId != null) {
      emit(
        state.copyWith(
          stressLevel: stressLevel,
          suggestions: await SuggestionRepo
              .getAllSuggestionsByOrganisationAndStressLevel(
            organisationId: organisationId,
            stressLevel: stressLevel,
          ),
        ),
      );
    }
  }

  Future<void> _onScreeningTriageClickCountSet(
    ScreeningTriageClickCountSet event,
    Emitter<ScreeningTriageState> emit,
  ) async {
    final suggestion = await SuggestionRepo.getSuggestion(event.suggestionId);
    final numberOfClicks = suggestion?.item1?.numberOfClicks ?? 0;

    await SuggestionRepo.updateSuggestion(
      suggestionId: event.suggestionId,
      numberOfClicks: numberOfClicks + 1,
      version: suggestion?.item2 ?? 0,
    );
  }

  Future<void> _onScreeningTriageViewCountSet(
    ScreeningTriageViewCountSet event,
    Emitter<ScreeningTriageState> emit,
  ) async {
    final suggestion = await SuggestionRepo.getSuggestion(event.suggestionId);
    final numberOfViews = suggestion?.item1?.numberOfViews ?? 0;

    await SuggestionRepo.updateSuggestion(
      suggestionId: event.suggestionId,
      numberOfViews: numberOfViews + 1,
      version: suggestion?.item2 ?? 0,
    );
  }
}
