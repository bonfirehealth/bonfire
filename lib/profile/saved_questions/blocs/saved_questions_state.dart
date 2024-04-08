part of 'saved_questions_bloc.dart';

class SavedQuestionsState {
  const SavedQuestionsState({
    this.isLoading = false,
    this.questionSaves,
  });

  final bool isLoading;
  final List<QuestionSave>? questionSaves;

  SavedQuestionsState copyWith({
    bool? isLoading,
    List<QuestionSave>? questionSaves,
  }) {
    return SavedQuestionsState(
      isLoading: isLoading ?? this.isLoading,
      questionSaves: questionSaves ?? this.questionSaves,
    );
  }
}
