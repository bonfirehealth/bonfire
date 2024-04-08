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

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(const CommentsState()) {
    on<CommentsInitSet>(_onCommentsInitSet);
    on<CommentsIsLoadingSet>(_onCommentsIsLoadingSet);
    on<CommentsIsVoteLoadingSet>(_onCommentsIsVoteLoadingSet);
    on<CommentsAnswerSet>(_onCommentsAnswerSet);
    on<CommentsNewFilesPick>(_onCommentsNewFilesPick);
    on<CommentsFileDelete>(_onCommentsFileDelete);
    on<CommentsCommentUpvote>(_onCommentsCommentUpvote);
    on<CommentsCommentDownvote>(_onCommentsCommentDownvote);
    on<CommentsCommentCreate>(_onCommentsCommentCreate);
    on<CommentsNewCommentFilesCreate>(_onCommentsNewCommentFilesCreate);
    on<CommentsCommentDelete>(_onCommentsCommentDelete);
    on<CommentsAnswerGet>(_onCommentsAnswerGet);
    on<CommentsAllCommentsGet>(_onCommentsAllCommentsGet);
    on<CommentsSearchTextSet>(_onCommentsSearchTextSet);
    on<CommentsShowHeaderSearchBarSet>(_onCommentsShowHeaderSearchBarSet);
    on<CommentsCommentsSearch>(_onCommentsCommentsSearch);
    on<CommentsCreateCommentStreamSubscribe>(
      _onCommentsCreateCommentStreamSubscribe,
    );
    on<CommentsCreateCommentStreamUnsubscribe>(
      _onCommentsCreateCommentStreamUnsubscribe,
    );
    on<CommentsUpdateCommentStreamSubscribe>(
      _onCommentsUpdateCommentStreamSubscribe,
    );
    on<CommentsUpdateCommentStreamUnsubscribe>(
      _onCommentsUpdateCommentStreamUnsubscribe,
    );
    on<CommentsUserReport>(_onCommentsUserReport);
  }

  Future<void> _onCommentsInitSet(
    CommentsInitSet event,
    Emitter<CommentsState> emit,
  ) async {}

  void _onCommentsIsLoadingSet(
    CommentsIsLoadingSet event,
    Emitter<CommentsState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void _onCommentsIsVoteLoadingSet(
    CommentsIsVoteLoadingSet event,
    Emitter<CommentsState> emit,
  ) {
    emit(state.copyWith(isVoteLoading: event.isVoteLoading));
  }

  void _onCommentsAnswerSet(
    CommentsAnswerSet event,
    Emitter<CommentsState> emit,
  ) {
    emit(
      state.copyWith(answerId: event.answerId, answer: event.answer),
    );
  }

  Future<void> _onCommentsNewFilesPick(
    CommentsNewFilesPick event,
    Emitter<CommentsState> emit,
  ) async {
    emit(
      state.copyWith(
        newCommentFiles: await AWSS3StorageHelper.pickAndUploadCommentFiles(),
      ),
    );
  }

  Future<void> _onCommentsFileDelete(
    CommentsFileDelete event,
    Emitter<CommentsState> emit,
  ) async {
    emit(
      state.copyWith(
        newCommentFiles: await AWSS3StorageHelper.removeCommentFile(
          event.index,
          event.key,
          state.newCommentFiles,
        ),
      ),
    );
  }

  Future<void> _onCommentsCommentUpvote(
    CommentsCommentUpvote event,
    Emitter<CommentsState> emit,
  ) async {
    add(const CommentsIsVoteLoadingSet());
    final commentVote = await CommentVoteRepo.createCommentVote(
      commentId: event.commentId,
    );

    if (commentVote?.item1?.id != null) {
      var comment = await CommentRepo.getComment(event.commentId);
      var numberOfVotes = comment?.item1?.numberOfVotes ?? 0;
      numberOfVotes++;
      await CommentRepo.updateComment(
        commentId: event.commentId,
        numberOfVotes: numberOfVotes,
        version: comment?.item2 ?? 1,
      );

      final comments = state.comments ?? [];
      comment = await CommentRepo.getComment(event.commentId);
      comments[event.index] = comment!.item1!;
      emit(state.copyWith(comments: comments));

      add(const CommentsIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onCommentsCommentDownvote(
    CommentsCommentDownvote event,
    Emitter<CommentsState> emit,
  ) async {
    add(const CommentsIsVoteLoadingSet());
    var commentVote = await CommentVoteRepo.updateCommentVote(
      commentVoteId: event.commentVoteId,
      isHidden: true,
    );
    commentVote = await CommentVoteRepo.deleteCommentVote(
      commentVoteId: event.commentVoteId,
      version: commentVote?.item2 ?? 1,
    );

    if (commentVote?.item1?.id != null) {
      var comment = await CommentRepo.getComment(event.commentId);
      var numberOfVotes = comment?.item1?.numberOfVotes ?? 0;
      numberOfVotes--;
      if (numberOfVotes < 0) numberOfVotes = 0;
      await CommentRepo.updateComment(
        commentId: event.commentId,
        numberOfVotes: numberOfVotes,
        version: comment?.item2 ?? 1,
      );

      final comments = state.comments ?? [];
      comment = await CommentRepo.getComment(event.commentId);
      comments[event.index] = comment!.item1!;
      emit(state.copyWith(comments: comments));

      add(const CommentsIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onCommentsCommentCreate(
    CommentsCommentCreate event,
    Emitter<CommentsState> emit,
  ) async {
    final comment = await CommentRepo.createComment(
      name: event.commentName,
      description: event.commentName,
      identifier: ReCase(event.commentName).pathCase,
      index: 0,
      answerId: event.answerId,
    );

    final commentId = comment?.item1?.id;
    if (commentId != null) {
      final answer = await AnswerRepo.getAnswer(event.answerId);
      var numberOfComments = answer?.item1?.numberOfComments ?? 0;
      final numberOfVotes = answer?.item1?.numberOfVotes ?? 0;
      numberOfComments++;
      await AnswerRepo.updateAnswer(
        answerId: event.answerId,
        numberOfComments: numberOfComments,
        numberOfVotes: numberOfVotes,
        version: answer?.item2 ?? 1,
      );
      final newCommentFiles = state.newCommentFiles ?? [];

      for (final newCommentFile in newCommentFiles) {
        await CommentFileRepo.createCommentFile(
          key: newCommentFile.key,
          name: newCommentFile.name,
          url: newCommentFile.url,
          commentId: commentId,
        );
      }
      emit(
        state.copyWith(
          comments: state.comments,
          newCommentFiles: [],
        ),
      );
    }
  }

  Future<void> _onCommentsNewCommentFilesCreate(
    CommentsNewCommentFilesCreate event,
    Emitter<CommentsState> emit,
  ) async {
    final newCommentFiles = state.newCommentFiles ?? [];

    for (final newCommentFile in newCommentFiles) {
      await CommentFileRepo.createCommentFile(
        key: newCommentFile.key,
        name: newCommentFile.name,
        url: newCommentFile.url,
        commentId: event.commentId,
      );
    }
    emit(state.copyWith(newCommentFiles: []));
  }

  Future<void> _onCommentsCommentDelete(
    CommentsCommentDelete event,
    Emitter<CommentsState> emit,
  ) async {
    final comments = state.comments;
    final index =
        comments?.indexWhere((element) => element.id == event.answerId) ?? -1;
    if (index != -1) {
      if (comments != null) {
        comments.removeAt(index);
        emit(state.copyWith(comments: comments));
      }
    }
  }

  Future<void> _onCommentsAnswerGet(
    CommentsAnswerGet event,
    Emitter<CommentsState> emit,
  ) async {
    if (state.answerId != null) {
      final answer = await AnswerRepo.getAnswer(
        state.answerId!,
      );
      emit(state.copyWith(answer: answer?.item1));
    }
  }

  Future<void> _onCommentsAllCommentsGet(
    CommentsAllCommentsGet event,
    Emitter<CommentsState> emit,
  ) async {
    final comments = await CommentRepo.getAllComments(
      answerId: state.answerId,
    );
    emit(state.copyWith(comments: comments));
  }

  Future<void> _onCommentsSearchTextSet(
    CommentsSearchTextSet event,
    Emitter<CommentsState> emit,
  ) async {
    emit(state.copyWith(searchText: event.searchText));
  }

  Future<void> _onCommentsShowHeaderSearchBarSet(
    CommentsShowHeaderSearchBarSet event,
    Emitter<CommentsState> emit,
  ) async {
    emit(state.copyWith(showHeaderSearchBar: event.showHeaderSearchBar));
  }

  Future<void> _onCommentsCommentsSearch(
    CommentsCommentsSearch event,
    Emitter<CommentsState> emit,
  ) async {
    final filteredComments = <Comment>[];
    final comments = await CommentRepo.searchComments(
          name: event.searchTerm,
          answerId: event.answerId,
        ) ??
        [];
    for (final answer in comments) {
      if (answer.name != null) {
        if (answer.name!
            .toLowerCase()
            .contains(event.searchTerm.toLowerCase())) {
          filteredComments.add(answer);
        }
      }
    }

    emit(state.copyWith(filteredComments: filteredComments));
  }

  Future<void> _onCommentsCreateCommentStreamSubscribe(
    CommentsCreateCommentStreamSubscribe event,
    Emitter<CommentsState> emit,
  ) async {
    final answerId = state.answerId ?? '';
    final stream = await CommentRepo.subscribeCreateComment(answerId);

    emit(
      state.copyWith(
        createCommentStreamSubscription: stream.listen(
          (event) {
            if (event.data != null) {
              final data = jsonDecode(event.data!) as Map<String, dynamic>;
              final comment = Comment.fromJson(
                data['onCreateComment'] as Map<String, dynamic>,
              );
              final comments = state.comments ?? [];
              final isHidden = comment.isHidden ?? true;

              if (!isHidden) {
                comments
                  ..add(comment)
                  ..sort(
                    (Comment a, Comment b) {
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
              emit(state.copyWith(comments: comments));
            }
          },
          onError: (Object error) => logInfo(
            'subscribeCreateCommentStream(): Error in GraphQL subscription: $error',
          ),
        ),
      ),
    );
  }

  Future<void> _onCommentsUpdateCommentStreamSubscribe(
    CommentsUpdateCommentStreamSubscribe event,
    Emitter<CommentsState> emit,
  ) async {
    final answerId = state.answerId ?? '';
    final stream = await CommentRepo.subscribeUpdateComment(answerId);

    emit(
      state.copyWith(
        updateCommentStreamSubscription: stream.listen(
          (event) {
            if (event.data != null) {
              final data = jsonDecode(event.data!) as Map<String, dynamic>;
              final comment = Comment.fromJson(
                data['onUpdateComment'] as Map<String, dynamic>,
              );
              final comments = state.comments ?? [];

              final isHidden = comment.isHidden ?? true;

              if (!isHidden) {
                final indexFound =
                    comments.indexWhere((element) => element.id == comment.id);
                if (indexFound != -1) {
                  comments[indexFound] = comment;
                } else {
                  comments
                    ..add(comment)
                    ..sort(
                      (Comment a, Comment b) {
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
              emit(state.copyWith(comments: comments));
            }
          },
          onError: (Object error) => logInfo(
            'subscribeUpdateCommentStream(): Error in GraphQL subscription: $error',
          ),
        ),
      ),
    );
  }

  Future<void> _onCommentsCreateCommentStreamUnsubscribe(
    CommentsCreateCommentStreamUnsubscribe event,
    Emitter<CommentsState> emit,
  ) async {
    await state.createCommentStreamSubscription?.cancel();
  }

  Future<void> _onCommentsUpdateCommentStreamUnsubscribe(
    CommentsUpdateCommentStreamUnsubscribe event,
    Emitter<CommentsState> emit,
  ) async {
    await state.updateCommentStreamSubscription?.cancel();
  }

  Future<void> _onCommentsUserReport(
    CommentsUserReport event,
    Emitter<CommentsState> emit,
  ) async {
    await ReportedUserRepo.createReportedUser(
      userId: event.userId,
      description: event.description,
      name: event.name,
    );
  }
}
