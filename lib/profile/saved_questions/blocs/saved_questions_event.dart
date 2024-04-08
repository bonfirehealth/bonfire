part of 'saved_questions_bloc.dart';

@immutable
abstract class SavedQuestionsEvent {
  const SavedQuestionsEvent();
}

class SavedQuestionsIsLoadingSet extends SavedQuestionsEvent {
  const SavedQuestionsIsLoadingSet({this.isLoading = true});

  final bool isLoading;

  @override
  String toString() => 'SavedQuestionsIsLoadingSet {}';
}

class SavedQuestionsQuestionSavesAllGet extends SavedQuestionsEvent {
  const SavedQuestionsQuestionSavesAllGet();

  @override
  String toString() => 'SavedQuestionsQuestionSavesAllGet {}';
}
