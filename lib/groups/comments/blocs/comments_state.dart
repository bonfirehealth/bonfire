part of 'comments_bloc.dart';

class CommentsState {
  const CommentsState({
    this.isLoading = false,
    this.showHeaderSearchBar = false,
    this.isVoteLoading = false,
    this.newCommentName,
    this.newCommentAnswerId,
    this.newCommentFiles,
    this.answerId,
    this.answer,
    this.filteredComments,
    this.comments,
    this.searchList,
    this.searchText,
    this.createCommentStreamSubscription,
    this.updateCommentStreamSubscription,
  });

  final bool isLoading;
  final bool showHeaderSearchBar;
  final bool isVoteLoading;
  final String? newCommentName;
  final String? newCommentAnswerId;
  final List<CommentFile>? newCommentFiles;
  final String? answerId;
  final Answer? answer;
  final List<Comment>? filteredComments;
  final List<Comment>? comments;
  final List<String>? searchList;
  final String? searchText;
  final StreamSubscription<GraphQLResponse<String>>?
      createCommentStreamSubscription;
  final StreamSubscription<GraphQLResponse<String>>?
      updateCommentStreamSubscription;

  CommentsState copyWith({
    bool? isLoading,
    bool? showHeaderSearchBar,
    bool? isVoteLoading,
    String? newCommentName,
    String? newCommentAnswerId,
    List<CommentFile>? newCommentFiles,
    String? answerId,
    Answer? answer,
    List<Comment>? filteredComments,
    List<Comment>? comments,
    List<String>? searchList,
    String? searchText,
    StreamSubscription<GraphQLResponse<String>>?
        createCommentStreamSubscription,
    StreamSubscription<GraphQLResponse<String>>?
        updateCommentStreamSubscription,
  }) {
    return CommentsState(
      isLoading: isLoading ?? this.isLoading,
      showHeaderSearchBar: showHeaderSearchBar ?? this.showHeaderSearchBar,
      isVoteLoading: isVoteLoading ?? this.isVoteLoading,
      newCommentName: newCommentName ?? this.newCommentName,
      newCommentAnswerId: newCommentAnswerId ?? this.newCommentAnswerId,
      newCommentFiles: newCommentFiles ?? this.newCommentFiles,
      answerId: answerId ?? this.answerId,
      answer: answer ?? this.answer,
      filteredComments: filteredComments ?? this.filteredComments,
      comments: comments ?? this.comments,
      searchList: searchList ?? this.searchList,
      searchText: searchText ?? this.searchText,
      createCommentStreamSubscription: createCommentStreamSubscription ??
          this.createCommentStreamSubscription,
      updateCommentStreamSubscription: updateCommentStreamSubscription ??
          this.updateCommentStreamSubscription,
    );
  }
}
