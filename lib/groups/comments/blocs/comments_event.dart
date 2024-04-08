part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent {
  const CommentsEvent();
}

class CommentsInitSet extends CommentsEvent {
  const CommentsInitSet(this.questionId, this.question);

  final String questionId;
  final String question;

  @override
  String toString() => 'CommentsInitSet {}';
}

class CommentsIsLoadingSet extends CommentsEvent {
  const CommentsIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'CommentsIsLoadingSet {}';
}

class CommentsIsVoteLoadingSet extends CommentsEvent {
  const CommentsIsVoteLoadingSet({
    this.isVoteLoading = true,
  });

  final bool isVoteLoading;

  @override
  String toString() => 'CommentsIsVoteLoadingSet {}';
}

class CommentsAnswerSet extends CommentsEvent {
  const CommentsAnswerSet(this.answerId, this.answer);

  final String answerId;
  final Answer? answer;

  @override
  String toString() => 'CommentsAnswerSet {}';
}

class CommentsSelectedCommentSet extends CommentsEvent {
  const CommentsSelectedCommentSet(this.answerId);

  final String answerId;

  @override
  String toString() => 'CommentsSelectedCommentSet {}';
}

class CommentsNewFilesPick extends CommentsEvent {
  const CommentsNewFilesPick();

  @override
  String toString() => 'CommentsNewFilesPick {}';
}

class CommentsFileDelete extends CommentsEvent {
  const CommentsFileDelete(this.index, this.key);

  final int index;
  final String key;

  @override
  String toString() => 'CommentsFileDelete {}';
}

class CommentsCommentUpvote extends CommentsEvent {
  const CommentsCommentUpvote(this.index, this.commentId);

  final int index;
  final String commentId;

  @override
  String toString() => 'CommentsCommentUpvote {}';
}

class CommentsCommentDownvote extends CommentsEvent {
  const CommentsCommentDownvote(this.index, this.commentId, this.commentVoteId);

  final int index;
  final String commentId;
  final String commentVoteId;

  @override
  String toString() => 'CommentsCommentDownvote {}';
}

class CommentsCommentCreate extends CommentsEvent {
  const CommentsCommentCreate(
    this.groupId,
    this.questionId,
    this.answerId,
    this.commentName,
  );

  final String groupId;
  final String questionId;
  final String answerId;
  final String commentName;

  @override
  String toString() => 'CommentsCommentCreate {}';
}

class CommentsNewCommentFilesCreate extends CommentsEvent {
  const CommentsNewCommentFilesCreate(this.commentId);

  final String commentId;

  @override
  String toString() => 'CommentsNewCommentFilesCreate {}';
}

class CommentsCommentDelete extends CommentsEvent {
  const CommentsCommentDelete(this.commentId, this.answerId);

  final String commentId;
  final String answerId;

  @override
  String toString() => 'CommentsCommentDelete {}';
}

class CommentsAnswerGet extends CommentsEvent {
  const CommentsAnswerGet();

  @override
  String toString() => 'CommentsAnswerGet {}';
}

class CommentsAllCommentsGet extends CommentsEvent {
  const CommentsAllCommentsGet();

  @override
  String toString() => 'CommentsAllCommentsGet {}';
}

class CommentsSearchTextSet extends CommentsEvent {
  const CommentsSearchTextSet(this.searchText);

  final String searchText;

  @override
  String toString() => 'CommentsSearchTextSet {}';
}

class CommentsShowHeaderSearchBarSet extends CommentsEvent {
  const CommentsShowHeaderSearchBarSet({this.showHeaderSearchBar = false});

  final bool showHeaderSearchBar;

  @override
  String toString() => 'CommentsShowHeaderSearchBarSet {}';
}

class CommentsCommentsSearch extends CommentsEvent {
  const CommentsCommentsSearch(this.answerId, this.searchTerm);

  final String answerId;
  final String searchTerm;

  @override
  String toString() => 'CommentsCommentsSearch {}';
}

class CommentsCreateCommentStreamSubscribe extends CommentsEvent {
  const CommentsCreateCommentStreamSubscribe();

  @override
  String toString() => 'CommentsCreateCommentStreamSubscribe {}';
}

class CommentsUpdateCommentStreamSubscribe extends CommentsEvent {
  const CommentsUpdateCommentStreamSubscribe();

  @override
  String toString() => 'CommentsUpdateCommentStreamSubscribe {}';
}

class CommentsCreateCommentStreamUnsubscribe extends CommentsEvent {
  const CommentsCreateCommentStreamUnsubscribe();

  @override
  String toString() => 'CommentsCreateCommentStreamUnsubscribe {}';
}

class CommentsUpdateCommentStreamUnsubscribe extends CommentsEvent {
  const CommentsUpdateCommentStreamUnsubscribe();

  @override
  String toString() => 'CommentsUpdateCommentStreamUnsubscribe {}';
}

class CommentsUserReport extends CommentsEvent {
  const CommentsUserReport(this.userId, this.name, this.description);

  final String userId;
  final String name;
  final String description;

  @override
  String toString() => 'CommentsUserReport {}';
}
