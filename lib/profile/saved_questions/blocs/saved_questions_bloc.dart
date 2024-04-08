// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'saved_questions_event.dart';
part 'saved_questions_state.dart';

class SavedQuestionsBloc
    extends Bloc<SavedQuestionsEvent, SavedQuestionsState> {
  SavedQuestionsBloc() : super(const SavedQuestionsState()) {
    on<SavedQuestionsIsLoadingSet>(_onSavedQuestionsIsLoadingSet);
    on<SavedQuestionsQuestionSavesAllGet>(_onSavedQuestionsQuestionSavesAllGet);
  }

  void _onSavedQuestionsIsLoadingSet(
    SavedQuestionsIsLoadingSet event,
    Emitter<SavedQuestionsState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  Future<void> _onSavedQuestionsQuestionSavesAllGet(
    SavedQuestionsQuestionSavesAllGet event,
    Emitter<SavedQuestionsState> emit,
  ) async {
    final questionSaves = await QuestionSaveRepo.getAllQuestionSaves();

    emit(state.copyWith(questionSaves: questionSaves));
  }
}
