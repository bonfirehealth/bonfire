// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart' hide Emitter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(const QuestionsState()) {
    on<QuestionsInitSet>(_onQuestionsInitSet);
    on<QuestionsIsLoadingSet>(_onQuestionsIsLoadingSet);
    on<QuestionsIsSaveLoadingSet>(_onQuestionsIsSaveLoadingSet);
    on<QuestionsIsVoteLoadingSet>(_onQuestionsIsVoteLoadingSet);
    on<QuestionsNewQuestionNameSet>(_onQuestionsNewQuestionNameSet);
    on<QuestionsNewQuestionGroupIdSet>(_onQuestionsNewQuestionGroupIdSet);
    on<QuestionsGroupGet>(_onQuestionsGroupGet);
    on<QuestionsGroupSet>(_onQuestionsGroupSet);
    on<QuestionsSelectedQuestionSet>(_onQuestionsSelectedQuestionSet);
    on<QuestionsNewFilesPick>(_onQuestionsNewFilesPick);
    on<QuestionsFileDelete>(_onQuestionsFileDelete);
    on<QuestionsQuestionSave>(_onQuestionsQuestionSave);
    on<QuestionsQuestionUnsave>(_onQuestionsQuestionUnsave);
    on<QuestionsQuestionUpvote>(_onQuestionsQuestionUpvote);
    on<QuestionsQuestionDownvote>(_onQuestionsQuestionDownvote);
    on<QuestionsQuestionCreate>(_onQuestionsQuestionCreate);
    on<QuestionsNewQuestionFilesCreate>(_onQuestionsNewQuestionFilesCreate);
    on<QuestionsQuestionDelete>(_onQuestionsQuestionDelete);
    on<QuestionsAllQuestionsGet>(_onQuestionsAllQuestionsGet);
    on<QuestionsSearchTextSet>(_onQuestionsSearchTextSet);
    on<QuestionsShowHeaderSearchBarSet>(_onQuestionsShowHeaderSearchBarSet);
    on<QuestionsQuestionsSearch>(_onQuestionsQuestionsSearch);
    on<QuestionsCreateQuestionStreamSubscribe>(
      _onQuestionsCreateQuestionStreamSubscribe,
    );
    on<QuestionsCreateQuestionStreamUnsubscribe>(
      _onQuestionsCreateQuestionStreamUnsubscribe,
    );
    on<QuestionsUpdateQuestionStreamSubscribe>(
      _onQuestionsUpdateQuestionStreamSubscribe,
    );
    on<QuestionsUpdateQuestionStreamUnsubscribe>(
      _onQuestionsUpdateQuestionStreamUnsubscribe,
    );
    on<QuestionsUserReport>(_onQuestionsUserReport);
  }

  Group? get group => state.group;
  Question? get selectedQuestion => state.selectedQuestion;

  Future<void> _onQuestionsInitSet(
    QuestionsInitSet event,
    Emitter<QuestionsState> emit,
  ) async {}

  void _onQuestionsIsLoadingSet(
    QuestionsIsLoadingSet event,
    Emitter<QuestionsState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void _onQuestionsIsSaveLoadingSet(
    QuestionsIsSaveLoadingSet event,
    Emitter<QuestionsState> emit,
  ) {
    emit(state.copyWith(isSaveLoading: event.isSaveLoading));
  }

  void _onQuestionsIsVoteLoadingSet(
    QuestionsIsVoteLoadingSet event,
    Emitter<QuestionsState> emit,
  ) {
    emit(state.copyWith(isVoteLoading: event.isVoteLoading));
  }

  void _onQuestionsNewQuestionNameSet(
    QuestionsNewQuestionNameSet event,
    Emitter<QuestionsState> emit,
  ) {
    emit(state.copyWith(newQuestionName: event.newQuestionName));
  }

  void _onQuestionsNewQuestionGroupIdSet(
    QuestionsNewQuestionGroupIdSet event,
    Emitter<QuestionsState> emit,
  ) {
    emit(state.copyWith(newQuestionGroupId: event.newQuestionGroupId));
  }

  Future<void> _onQuestionsGroupGet(
    QuestionsGroupGet event,
    Emitter<QuestionsState> emit,
  ) async {
    if (state.groupId != null) {
      final group = await GroupRepo.getGroup(
        state.groupId!,
      );
      emit(state.copyWith(group: group?.item1));
    }
  }

  Future<void> _onQuestionsGroupSet(
    QuestionsGroupSet event,
    Emitter<QuestionsState> emit,
  ) async {
    emit(state.copyWith(groupId: event.groupId, group: event.group));
  }

  Future<void> _onQuestionsNewFilesPick(
    QuestionsNewFilesPick event,
    Emitter<QuestionsState> emit,
  ) async {
    emit(
      state.copyWith(
        newQuestionFiles: await AWSS3StorageHelper.pickAndUploadQuestionFiles(),
      ),
    );
  }

  Future<void> _onQuestionsFileDelete(
    QuestionsFileDelete event,
    Emitter<QuestionsState> emit,
  ) async {
    emit(
      state.copyWith(
        newQuestionFiles: await AWSS3StorageHelper.removeQuestionFile(
          event.index,
          event.key,
          state.newQuestionFiles,
        ),
      ),
    );
  }

  Future<void> _onQuestionsQuestionSave(
    QuestionsQuestionSave event,
    Emitter<QuestionsState> emit,
  ) async {
    add(const QuestionsIsVoteLoadingSet());

    final questionSave = await QuestionSaveRepo.createQuestionSave(
      questionId: event.questionId,
    );

    if (questionSave?.item1?.id != null) {
      var question = await QuestionRepo.getQuestion(event.questionId);
      var numberOfSaves = question?.item1?.numberOfSaves ?? 0;
      final numberOfVotes = question?.item1?.numberOfVotes ?? 0;
      numberOfSaves++;
      await QuestionRepo.updateQuestion(
        questionId: event.questionId,
        numberOfSaves: numberOfSaves,
        numberOfVotes: numberOfVotes,
        version: question?.item2 ?? 1,
      );

      final questions = state.questions ?? [];
      question = await QuestionRepo.getQuestion(event.questionId);
      if (event.index != -1) {
        questions[event.index] = question!.item1!;
      }
      emit(state.copyWith(questions: questions));

      add(const QuestionsIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onQuestionsQuestionUnsave(
    QuestionsQuestionUnsave event,
    Emitter<QuestionsState> emit,
  ) async {
    add(const QuestionsIsVoteLoadingSet());

    var questionSave = await QuestionSaveRepo.updateQuestionSave(
      questionSaveId: event.questionSaveId,
      isHidden: true,
    );

    questionSave = await QuestionSaveRepo.deleteQuestionSave(
      questionSaveId: event.questionSaveId,
      version: questionSave?.item2 ?? 1,
    );

    if (questionSave?.item1?.id != null) {
      var question = await QuestionRepo.getQuestion(event.questionId);
      var numberOfSaves = question?.item1?.numberOfSaves ?? 0;
      final numberOfVotes = question?.item1?.numberOfVotes ?? 0;
      numberOfSaves--;
      if (numberOfSaves < 0) numberOfSaves = 0;
      await QuestionRepo.updateQuestion(
        questionId: event.questionId,
        numberOfSaves: numberOfSaves,
        numberOfVotes: numberOfVotes,
        version: question?.item2 ?? 1,
      );

      final questions = state.questions ?? [];
      question = await QuestionRepo.getQuestion(event.questionId);
      if (event.index != -1) {
        questions[event.index] = question!.item1!;
      }
      emit(state.copyWith(questions: questions));

      add(const QuestionsIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onQuestionsQuestionUpvote(
    QuestionsQuestionUpvote event,
    Emitter<QuestionsState> emit,
  ) async {
    add(const QuestionsIsVoteLoadingSet());
    final questionVote = await QuestionVoteRepo.createQuestionVote(
      questionId: event.questionId,
    );

    if (questionVote?.item1?.id != null) {
      var question = await QuestionRepo.getQuestion(event.questionId);
      var numberOfVotes = question?.item1?.numberOfVotes ?? 0;
      numberOfVotes++;
      await QuestionRepo.updateQuestion(
        questionId: event.questionId,
        numberOfVotes: numberOfVotes,
        version: question?.item2 ?? 1,
      );

      final questions = state.questions ?? [];
      question = await QuestionRepo.getQuestion(event.questionId);
      if (event.index != -1) {
        questions[event.index] = question!.item1!;
      }

      emit(state.copyWith(questions: questions));

      add(const QuestionsIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onQuestionsQuestionDownvote(
    QuestionsQuestionDownvote event,
    Emitter<QuestionsState> emit,
  ) async {
    add(const QuestionsIsVoteLoadingSet());
    var questionVote = await QuestionVoteRepo.updateQuestionVote(
      questionVoteId: event.questionVoteId,
      isHidden: true,
    );
    questionVote = await QuestionVoteRepo.deleteQuestionVote(
      questionVoteId: event.questionVoteId,
      version: questionVote?.item2 ?? 1,
    );

    if (questionVote?.item1?.id != null) {
      var question = await QuestionRepo.getQuestion(event.questionId);
      var numberOfVotes = question?.item1?.numberOfVotes ?? 0;
      numberOfVotes--;
      if (numberOfVotes < 0) numberOfVotes = 0;
      await QuestionRepo.updateQuestion(
        questionId: event.questionId,
        numberOfVotes: numberOfVotes,
        version: question?.item2 ?? 1,
      );

      final questions = state.questions ?? [];
      question = await QuestionRepo.getQuestion(event.questionId);
      if (event.index != -1) {
        questions[event.index] = question!.item1!;
      }

      emit(state.copyWith(questions: questions));

      add(const QuestionsIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onQuestionsQuestionCreate(
    QuestionsQuestionCreate event,
    Emitter<QuestionsState> emit,
  ) async {
    final question = await QuestionRepo.createQuestion(
      name: event.questionName,
      description: event.questionDescription,
      identifier: ReCase(event.questionName).pathCase,
      index: 0,
      groupId: event.groupId,
    );

    final questionId = question?.item1?.id;
    if (questionId != null) {
      final group = await GroupRepo.getGroup(event.groupId);
      var numberOfQuestions = group?.item1?.numberOfQuestions ?? 0;
      final numberOfVotes = group?.item1?.numberOfVotes ?? 0;
      numberOfQuestions++;
      final updatedGroup = await GroupRepo.updateGroup(
        groupId: event.groupId,
        numberOfQuestions: numberOfQuestions,
        numberOfVotes: numberOfVotes,
        version: group?.item2 ?? 1,
      );
      final newQuestionFiles = state.newQuestionFiles ?? [];

      for (final newQuestionFile in newQuestionFiles) {
        await QuestionFileRepo.createQuestionFile(
          key: newQuestionFile.key,
          name: newQuestionFile.name,
          url: newQuestionFile.url,
          questionId: questionId,
        );
      }
      emit(state.copyWith(group: updatedGroup?.item1, newQuestionFiles: []));
    }
  }

  Future<void> _onQuestionsNewQuestionFilesCreate(
    QuestionsNewQuestionFilesCreate event,
    Emitter<QuestionsState> emit,
  ) async {
    final newQuestionFiles = state.newQuestionFiles ?? [];

    for (final newQuestionFile in newQuestionFiles) {
      await QuestionFileRepo.createQuestionFile(
        key: newQuestionFile.key,
        name: newQuestionFile.name,
        url: newQuestionFile.url,
        questionId: event.questionId,
      );
    }
    emit(state.copyWith(newQuestionFiles: []));
  }

  Future<void> _onQuestionsQuestionDelete(
    QuestionsQuestionDelete event,
    Emitter<QuestionsState> emit,
  ) async {
    var question = await QuestionRepo.getQuestion(event.questionId);
    question = await QuestionRepo.deleteQuestion(
      questionId: event.questionId,
      version: question?.item2 ?? 0,
    );

    if (question?.item1?.id != null) {
      final group = await GroupRepo.getGroup(event.groupId);
      var numberOfQuestions = group?.item1?.numberOfQuestions ?? 0;
      final numberOfVotes = group?.item1?.numberOfVotes ?? 0;
      numberOfQuestions--;
      final updatedGroup = await GroupRepo.updateGroup(
        groupId: event.groupId,
        numberOfQuestions: numberOfQuestions,
        numberOfVotes: numberOfVotes,
        version: group?.item2 ?? 1,
      );
      final questions = state.questions;
      final index =
          questions?.indexWhere((element) => element.id == event.questionId) ??
              -1;
      if (index != -1) {
        if (questions != null) {
          questions.removeAt(index);
          emit(state.copyWith(questions: questions));
        }
      }
      emit(state.copyWith(group: updatedGroup?.item1));
    }
  }

  Future<void> _onQuestionsSelectedQuestionSet(
    QuestionsSelectedQuestionSet event,
    Emitter<QuestionsState> emit,
  ) async {
    final questionIndex = state.questions
            ?.indexWhere((element) => element.id == event.questionId) ??
        -1;

    if (questionIndex != -1) {
      emit(state.copyWith(selectedQuestion: state.questions?[questionIndex]));
    }
  }

  Future<void> _onQuestionsAllQuestionsGet(
    QuestionsAllQuestionsGet event,
    Emitter<QuestionsState> emit,
  ) async {
    final questions = await QuestionRepo.getAllQuestions(
      groupId: state.group?.getId(),
    );
    emit(state.copyWith(questions: questions));
  }

  Future<void> _onQuestionsSearchTextSet(
    QuestionsSearchTextSet event,
    Emitter<QuestionsState> emit,
  ) async {
    emit(state.copyWith(searchText: event.searchText));
  }

  Future<void> _onQuestionsShowHeaderSearchBarSet(
    QuestionsShowHeaderSearchBarSet event,
    Emitter<QuestionsState> emit,
  ) async {
    emit(state.copyWith(showHeaderSearchBar: event.showHeaderSearchBar));
  }

  Future<void> _onQuestionsQuestionsSearch(
    QuestionsQuestionsSearch event,
    Emitter<QuestionsState> emit,
  ) async {
    final filteredQuestions = <Question>[];
    final questions = await QuestionRepo.searchQuestions(
          name: event.searchTerm,
          groupId: event.groupId,
        ) ??
        [];
    for (final question in questions) {
      if (question.name != null) {
        if (question.name!
            .toLowerCase()
            .contains(event.searchTerm.toLowerCase())) {
          filteredQuestions.add(question);
        }
      }
    }

    emit(state.copyWith(filteredQuestions: filteredQuestions));
  }

  Future<void> _onQuestionsCreateQuestionStreamSubscribe(
    QuestionsCreateQuestionStreamSubscribe event,
    Emitter<QuestionsState> emit,
  ) async {
    final groupId = state.groupId ?? '';
    final stream = await QuestionRepo.subscribeCreateQuestion(groupId);

    emit(
      state.copyWith(
        createQuestionStreamSubscription: stream.listen(
          (event) {
            if (event.data != null) {
              final data = jsonDecode(event.data!) as Map<String, dynamic>;
              final question = Question.fromJson(
                data['onCreateQuestion'] as Map<String, dynamic>,
              );
              final questions = state.questions ?? [];
              final isHidden = question.isHidden ?? true;

              if (!isHidden) {
                questions
                  ..add(question)
                  ..sort(
                    (Question a, Question b) {
                      final aTimestamp = a.createdAt!
                          .getDateTimeInUtc()
                          .millisecondsSinceEpoch;

                      final bTimestamp = b.createdAt!
                          .getDateTimeInUtc()
                          .millisecondsSinceEpoch;

                      return bTimestamp.compareTo(aTimestamp);
                    },
                  );
              }
              emit(state.copyWith(questions: questions));
            }
          },
          onError: (Object error) => logInfo(
            'subscribeCreateQuestionStream(): Error in GraphQL subscription: $error',
          ),
        ),
      ),
    );
  }

  Future<void> _onQuestionsUpdateQuestionStreamSubscribe(
    QuestionsUpdateQuestionStreamSubscribe event,
    Emitter<QuestionsState> emit,
  ) async {
    final groupId = state.groupId ?? '';
    final stream = await QuestionRepo.subscribeUpdateQuestion(groupId);

    emit(
      state.copyWith(
        updateQuestionStreamSubscription: stream.listen(
          (event) {
            if (event.data != null) {
              final data = jsonDecode(event.data!) as Map<String, dynamic>;
              final question = Question.fromJson(
                data['onUpdateQuestion'] as Map<String, dynamic>,
              );
              final questions = state.questions ?? [];

              final isHidden = question.isHidden ?? true;

              if (!isHidden) {
                final indexFound = questions
                    .indexWhere((element) => element.id == question.id);
                if (indexFound != -1) {
                  questions[indexFound] = question;
                } else {
                  questions
                    ..add(question)
                    ..sort(
                      (Question a, Question b) {
                        final aTimestamp = a.createdAt!
                            .getDateTimeInUtc()
                            .millisecondsSinceEpoch;

                        final bTimestamp = b.createdAt!
                            .getDateTimeInUtc()
                            .millisecondsSinceEpoch;

                        return bTimestamp.compareTo(aTimestamp);
                      },
                    );
                }
              }
              emit(state.copyWith(questions: questions));
            }
          },
          onError: (Object error) => logInfo(
            'subscribeUpdateQuestionStream(): Error in GraphQL subscription: $error',
          ),
        ),
      ),
    );
  }

  Future<void> _onQuestionsCreateQuestionStreamUnsubscribe(
    QuestionsCreateQuestionStreamUnsubscribe event,
    Emitter<QuestionsState> emit,
  ) async {
    await state.createQuestionStreamSubscription?.cancel();
  }

  Future<void> _onQuestionsUpdateQuestionStreamUnsubscribe(
    QuestionsUpdateQuestionStreamUnsubscribe event,
    Emitter<QuestionsState> emit,
  ) async {
    await state.updateQuestionStreamSubscription?.cancel();
  }

  Future<void> _onQuestionsUserReport(
    QuestionsUserReport event,
    Emitter<QuestionsState> emit,
  ) async {
    await ReportedUserRepo.createReportedUser(
      userId: event.userId,
      description: event.description,
      name: event.name,
    );
  }
}
