part of 'answers_bloc.dart';

class AnswersState {
  const AnswersState({
    this.isLoading = false,
    this.showHeaderSearchBar = false,
    this.isVoteLoading = false,
    this.newAnswerName,
    this.newAnswerQuestionId,
    this.newAnswerFiles,
    this.questionId,
    this.question,
    this.selectedAnswer,
    this.filteredAnswers,
    this.answers,
    this.searchList,
    this.searchText,
    this.createAnswerStreamSubscription,
    this.updateAnswerStreamSubscription,
  });

  final bool isLoading;
  final bool showHeaderSearchBar;
  final bool isVoteLoading;
  final String? newAnswerName;
  final String? newAnswerQuestionId;
  final List<AnswerFile>? newAnswerFiles;
  final String? questionId;
  final Question? question;
  final Answer? selectedAnswer;
  final List<Answer>? filteredAnswers;
  final List<Answer>? answers;
  final List<String>? searchList;
  final String? searchText;
  final StreamSubscription<GraphQLResponse<String>>?
      createAnswerStreamSubscription;
  final StreamSubscription<GraphQLResponse<String>>?
      updateAnswerStreamSubscription;

  AnswersState copyWith({
    bool? isLoading,
    bool? showHeaderSearchBar,
    bool? isVoteLoading,
    String? newAnswerName,
    String? newAnswerQuestionId,
    List<AnswerFile>? newAnswerFiles,
    String? questionId,
    Question? question,
    Answer? selectedAnswer,
    List<Answer>? filteredAnswers,
    List<Answer>? answers,
    List<String>? searchList,
    String? searchText,
    StreamSubscription<GraphQLResponse<String>>? createAnswerStreamSubscription,
    StreamSubscription<GraphQLResponse<String>>? updateAnswerStreamSubscription,
  }) {
    return AnswersState(
      isLoading: isLoading ?? this.isLoading,
      showHeaderSearchBar: showHeaderSearchBar ?? this.showHeaderSearchBar,
      isVoteLoading: isVoteLoading ?? this.isVoteLoading,
      newAnswerName: newAnswerName ?? this.newAnswerName,
      newAnswerQuestionId: newAnswerQuestionId ?? this.newAnswerQuestionId,
      newAnswerFiles: newAnswerFiles ?? this.newAnswerFiles,
      questionId: questionId ?? this.questionId,
      question: question ?? this.question,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      filteredAnswers: filteredAnswers ?? this.filteredAnswers,
      answers: answers ?? this.answers,
      searchList: searchList ?? this.searchList,
      searchText: searchText ?? this.searchText,
      createAnswerStreamSubscription:
          createAnswerStreamSubscription ?? this.createAnswerStreamSubscription,
      updateAnswerStreamSubscription:
          updateAnswerStreamSubscription ?? this.updateAnswerStreamSubscription,
    );
  }
}
