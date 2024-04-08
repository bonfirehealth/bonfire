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

part 'answers_event.dart';
part 'answers_state.dart';

class AnswersBloc extends Bloc<AnswersEvent, AnswersState> {
  AnswersBloc() : super(const AnswersState()) {
    on<AnswersInitSet>(_onAnswersInitSet);
    on<AnswersIsLoadingSet>(_onAnswersIsLoadingSet);
    on<AnswersIsVoteLoadingSet>(_onAnswersIsVoteLoadingSet);
    on<AnswersQuestionGet>(_onAnswersQuestionGet);
    on<AnswersQuestionSet>(_onAnswersQuestionSet);
    on<AnswersNewFilesPick>(_onAnswersNewFilesPick);
    on<AnswersFileDelete>(_onAnswersFileDelete);
    on<AnswersAnswerUpvote>(_onAnswersAnswerUpvote);
    on<AnswersAnswerDownvote>(_onAnswersAnswerDownvote);
    on<AnswersAnswerCreate>(_onAnswersAnswerCreate);
    on<AnswersNewAnswerFilesCreate>(_onAnswersNewAnswerFilesCreate);
    on<AnswersAnswerDelete>(_onAnswersAnswerDelete);
    on<AnswersSelectedAnswerSet>(_onAnswersSelectedAnswerSet);
    on<AnswersAllAnswersGet>(_onAnswersAllAnswersGet);
    on<AnswersSearchTextSet>(_onAnswersSearchTextSet);
    on<AnswersShowHeaderSearchBarSet>(_onAnswersShowHeaderSearchBarSet);
    on<AnswersAnswersSearch>(_onAnswersAnswersSearch);
    on<AnswersCreateAnswerStreamSubscribe>(
      _onAnswersCreateAnswerStreamSubscribe,
    );
    on<AnswersCreateAnswerStreamUnsubscribe>(
      _onAnswersCreateAnswerStreamUnsubscribe,
    );
    on<AnswersUpdateAnswerStreamSubscribe>(
      _onAnswersUpdateAnswerStreamSubscribe,
    );
    on<AnswersUpdateAnswerStreamUnsubscribe>(
      _onAnswersUpdateAnswerStreamUnsubscribe,
    );
    on<AnswersUserReport>(_onAnswersUserReport);
  }

  Answer? get selectedAnswer => state.selectedAnswer;

  Future<void> _onAnswersInitSet(
    AnswersInitSet event,
    Emitter<AnswersState> emit,
  ) async {}

  void _onAnswersIsLoadingSet(
    AnswersIsLoadingSet event,
    Emitter<AnswersState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void _onAnswersIsVoteLoadingSet(
    AnswersIsVoteLoadingSet event,
    Emitter<AnswersState> emit,
  ) {
    emit(state.copyWith(isVoteLoading: event.isVoteLoading));
  }

  Future<void> _onAnswersQuestionGet(
    AnswersQuestionGet event,
    Emitter<AnswersState> emit,
  ) async {
    if (state.questionId != null) {
      final question = await QuestionRepo.getQuestion(
        state.questionId!,
      );
      emit(state.copyWith(question: question?.item1));
    }
  }

  Future<void> _onAnswersQuestionSet(
    AnswersQuestionSet event,
    Emitter<AnswersState> emit,
  ) async {
    emit(
      state.copyWith(questionId: event.questionId, question: event.question),
    );
  }

  Future<void> _onAnswersNewFilesPick(
    AnswersNewFilesPick event,
    Emitter<AnswersState> emit,
  ) async {
    emit(
      state.copyWith(
        newAnswerFiles: await AWSS3StorageHelper.pickAndUploadAnswerFiles(),
      ),
    );
  }

  Future<void> _onAnswersFileDelete(
    AnswersFileDelete event,
    Emitter<AnswersState> emit,
  ) async {
    emit(
      state.copyWith(
        newAnswerFiles: await AWSS3StorageHelper.removeAnswerFile(
          event.index,
          event.key,
          state.newAnswerFiles,
        ),
      ),
    );
  }

  Future<void> _onAnswersAnswerUpvote(
    AnswersAnswerUpvote event,
    Emitter<AnswersState> emit,
  ) async {
    add(const AnswersIsVoteLoadingSet());
    final answerVote = await AnswerVoteRepo.createAnswerVote(
      answerId: event.answerId,
    );

    if (answerVote?.item1?.id != null) {
      var answer = await AnswerRepo.getAnswer(event.answerId);
      var numberOfVotes = answer?.item1?.numberOfVotes ?? 0;
      numberOfVotes++;
      await AnswerRepo.updateAnswer(
        answerId: event.answerId,
        numberOfVotes: numberOfVotes,
        version: answer?.item2 ?? 1,
      );

      final answers = state.answers ?? [];
      answer = await AnswerRepo.getAnswer(event.answerId);
      answers[event.index] = answer!.item1!;
      emit(state.copyWith(answers: answers));

      add(const AnswersIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onAnswersAnswerDownvote(
    AnswersAnswerDownvote event,
    Emitter<AnswersState> emit,
  ) async {
    add(const AnswersIsVoteLoadingSet());
    var answerVote = await AnswerVoteRepo.updateAnswerVote(
      answerVoteId: event.answerVoteId,
      isHidden: true,
    );
    answerVote = await AnswerVoteRepo.deleteAnswerVote(
      answerVoteId: event.answerVoteId,
      version: answerVote?.item2 ?? 1,
    );

    if (answerVote?.item1?.id != null) {
      var answer = await AnswerRepo.getAnswer(event.answerId);
      var numberOfVotes = answer?.item1?.numberOfVotes ?? 0;
      numberOfVotes--;
      if (numberOfVotes < 0) numberOfVotes = 0;
      await AnswerRepo.updateAnswer(
        answerId: event.answerId,
        numberOfVotes: numberOfVotes,
        version: answer?.item2 ?? 1,
      );

      final answers = state.answers ?? [];
      answer = await AnswerRepo.getAnswer(event.answerId);
      answers[event.index] = answer!.item1!;
      emit(state.copyWith(answers: answers));

      add(const AnswersIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onAnswersAnswerCreate(
    AnswersAnswerCreate event,
    Emitter<AnswersState> emit,
  ) async {
    final answer = await AnswerRepo.createAnswer(
      name: event.answerName,
      description: event.answerName,
      identifier: ReCase(event.answerName).pathCase,
      index: 0,
      questionId: event.questionId,
    );

    final answerId = answer?.item1?.id;

    if (answerId != null) {
      final question = await QuestionRepo.getQuestion(event.questionId);
      var numberOfAnswers = question?.item1?.numberOfAnswers ?? 0;
      final numberOfVotes = question?.item1?.numberOfVotes ?? 0;
      numberOfAnswers++;
      await QuestionRepo.updateQuestion(
        questionId: event.questionId,
        numberOfAnswers: numberOfAnswers,
        numberOfVotes: numberOfVotes,
        version: question?.item2 ?? 1,
      );
      final newAnswerFiles = state.newAnswerFiles ?? [];
      for (final newAnswerFile in newAnswerFiles) {
        await AnswerFileRepo.createAnswerFile(
          key: newAnswerFile.key,
          name: newAnswerFile.name,
          url: newAnswerFile.url,
          answerId: answerId,
        );
      }
      emit(
        state.copyWith(
          answers: state.answers,
          newAnswerFiles: [],
        ),
      );
    }
  }

  Future<void> _onAnswersNewAnswerFilesCreate(
    AnswersNewAnswerFilesCreate event,
    Emitter<AnswersState> emit,
  ) async {
    final newAnswerFiles = state.newAnswerFiles ?? [];

    for (final newAnswerFile in newAnswerFiles) {
      await AnswerFileRepo.createAnswerFile(
        key: newAnswerFile.key,
        name: newAnswerFile.name,
        url: newAnswerFile.url,
        answerId: event.answerId,
      );
    }
    emit(state.copyWith(newAnswerFiles: []));
  }

  Future<void> _onAnswersAnswerDelete(
    AnswersAnswerDelete event,
    Emitter<AnswersState> emit,
  ) async {
    final answers = state.answers;
    final index =
        answers?.indexWhere((element) => element.id == event.answerId) ?? -1;
    if (index != -1) {
      if (answers != null) {
        answers.removeAt(index);
        emit(state.copyWith(answers: answers));
      }
    }
  }

  Future<void> _onAnswersSelectedAnswerSet(
    AnswersSelectedAnswerSet event,
    Emitter<AnswersState> emit,
  ) async {
    final answerIndex =
        state.answers?.indexWhere((element) => element.id == event.answerId) ??
            -1;

    if (answerIndex != -1) {
      emit(state.copyWith(selectedAnswer: state.answers?[answerIndex]));
    }
  }

  Future<void> _onAnswersAllAnswersGet(
    AnswersAllAnswersGet event,
    Emitter<AnswersState> emit,
  ) async {
    final answers = await AnswerRepo.getAllAnswers(
      questionId: state.questionId,
    );
    emit(state.copyWith(answers: answers));
  }

  Future<void> _onAnswersSearchTextSet(
    AnswersSearchTextSet event,
    Emitter<AnswersState> emit,
  ) async {
    emit(state.copyWith(searchText: event.searchText));
  }

  Future<void> _onAnswersShowHeaderSearchBarSet(
    AnswersShowHeaderSearchBarSet event,
    Emitter<AnswersState> emit,
  ) async {
    emit(state.copyWith(showHeaderSearchBar: event.showHeaderSearchBar));
  }

  Future<void> _onAnswersAnswersSearch(
    AnswersAnswersSearch event,
    Emitter<AnswersState> emit,
  ) async {
    final filteredAnswers = <Answer>[];
    final answers = await AnswerRepo.searchAnswers(
          name: event.searchTerm,
          questionId: event.questionId,
        ) ??
        [];
    for (final answer in answers) {
      if (answer.name != null) {
        if (answer.name!
            .toLowerCase()
            .contains(event.searchTerm.toLowerCase())) {
          filteredAnswers.add(answer);
        }
      }
    }

    emit(state.copyWith(filteredAnswers: filteredAnswers));
  }

  Future<void> _onAnswersCreateAnswerStreamSubscribe(
    AnswersCreateAnswerStreamSubscribe event,
    Emitter<AnswersState> emit,
  ) async {
    final questionId = state.questionId ?? '';
    final stream = await AnswerRepo.subscribeCreateAnswer(questionId);

    emit(
      state.copyWith(
        createAnswerStreamSubscription: stream.listen(
          (event) {
            if (event.data != null) {
              final data = jsonDecode(event.data!) as Map<String, dynamic>;
              final answer = Answer.fromJson(
                data['onCreateAnswer'] as Map<String, dynamic>,
              );
              final answers = state.answers ?? [];
              final isHidden = answer.isHidden ?? true;

              if (!isHidden) {
                answers
                  ..add(answer)
                  ..sort(
                    (Answer a, Answer b) {
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
              emit(state.copyWith(answers: answers));
            }
          },
          onError: (Object error) => logInfo(
            'subscribeCreateAnswerStream(): Error in GraphQL subscription: $error',
          ),
        ),
      ),
    );
  }

  Future<void> _onAnswersUpdateAnswerStreamSubscribe(
    AnswersUpdateAnswerStreamSubscribe event,
    Emitter<AnswersState> emit,
  ) async {
    final questionId = state.questionId ?? '';
    final stream = await AnswerRepo.subscribeUpdateAnswer(questionId);

    emit(
      state.copyWith(
        updateAnswerStreamSubscription: stream.listen(
          (event) {
            if (event.data != null) {
              final data = jsonDecode(event.data!) as Map<String, dynamic>;
              final answer = Answer.fromJson(
                data['onUpdateAnswer'] as Map<String, dynamic>,
              );
              final answers = state.answers ?? [];

              final isHidden = answer.isHidden ?? true;

              if (!isHidden) {
                final indexFound =
                    answers.indexWhere((element) => element.id == answer.id);
                if (indexFound != -1) {
                  answers[indexFound] = answer;
                } else {
                  answers
                    ..add(answer)
                    ..sort(
                      (Answer a, Answer b) {
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
              emit(state.copyWith(answers: answers));
            }
          },
          onError: (Object error) => logInfo(
            'subscribeUpdateAnswerStream(): Error in GraphQL subscription: $error',
          ),
        ),
      ),
    );
  }

  Future<void> _onAnswersCreateAnswerStreamUnsubscribe(
    AnswersCreateAnswerStreamUnsubscribe event,
    Emitter<AnswersState> emit,
  ) async {
    await state.createAnswerStreamSubscription?.cancel();
  }

  Future<void> _onAnswersUpdateAnswerStreamUnsubscribe(
    AnswersUpdateAnswerStreamUnsubscribe event,
    Emitter<AnswersState> emit,
  ) async {
    await state.updateAnswerStreamSubscription?.cancel();
  }

  Future<void> _onAnswersUserReport(
    AnswersUserReport event,
    Emitter<AnswersState> emit,
  ) async {
    await ReportedUserRepo.createReportedUser(
      userId: event.userId,
      description: event.description,
      name: event.name,
    );
  }
}
