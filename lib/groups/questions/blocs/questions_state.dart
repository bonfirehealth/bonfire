part of 'questions_bloc.dart';

class QuestionsState {
  const QuestionsState({
    this.isLoading = false,
    this.showHeaderSearchBar = false,
    this.isSaveLoading = false,
    this.isVoteLoading = false,
    this.newQuestionName,
    this.newQuestionGroupId,
    this.newQuestionFiles,
    this.groupId,
    this.group,
    this.selectedQuestion,
    this.filteredQuestions,
    this.questions,
    this.searchList,
    this.searchText,
    this.createQuestionStreamSubscription,
    this.updateQuestionStreamSubscription,
  });

  final bool isLoading;
  final bool showHeaderSearchBar;
  final bool isSaveLoading;
  final bool isVoteLoading;
  final String? newQuestionName;
  final String? newQuestionGroupId;
  final List<QuestionFile>? newQuestionFiles;
  final String? groupId;
  final Group? group;
  final Question? selectedQuestion;
  final List<Question>? filteredQuestions;
  final List<Question>? questions;
  final List<String>? searchList;
  final String? searchText;
  final StreamSubscription<GraphQLResponse<String>>?
      createQuestionStreamSubscription;
  final StreamSubscription<GraphQLResponse<String>>?
      updateQuestionStreamSubscription;

  QuestionsState copyWith({
    bool? isLoading,
    bool? showHeaderSearchBar,
    bool? isSaveLoading,
    bool? isVoteLoading,
    String? newQuestionName,
    String? newQuestionGroupId,
    List<QuestionFile>? newQuestionFiles,
    String? groupId,
    Group? group,
    Question? selectedQuestion,
    List<Question>? filteredQuestions,
    List<Question>? questions,
    List<String>? searchList,
    String? searchText,
    StreamSubscription<GraphQLResponse<String>>?
        createQuestionStreamSubscription,
    StreamSubscription<GraphQLResponse<String>>?
        updateQuestionStreamSubscription,
  }) {
    return QuestionsState(
      isLoading: isLoading ?? this.isLoading,
      showHeaderSearchBar: showHeaderSearchBar ?? this.showHeaderSearchBar,
      isSaveLoading: isSaveLoading ?? this.isSaveLoading,
      isVoteLoading: isVoteLoading ?? this.isVoteLoading,
      newQuestionName: newQuestionName ?? this.newQuestionName,
      newQuestionGroupId: newQuestionGroupId ?? this.newQuestionGroupId,
      newQuestionFiles: newQuestionFiles ?? this.newQuestionFiles,
      groupId: groupId ?? this.groupId,
      group: group ?? this.group,
      selectedQuestion: selectedQuestion ?? this.selectedQuestion,
      filteredQuestions: filteredQuestions ?? this.filteredQuestions,
      questions: questions ?? this.questions,
      searchList: searchList ?? this.searchList,
      searchText: searchText ?? this.searchText,
      createQuestionStreamSubscription: createQuestionStreamSubscription ??
          this.createQuestionStreamSubscription,
      updateQuestionStreamSubscription: updateQuestionStreamSubscription ??
          this.updateQuestionStreamSubscription,
    );
  }
}
