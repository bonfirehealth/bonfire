// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class CommentVoteRepo {
  CommentVoteRepo._();

  static Future<List<CommentVote>?> getAllCommentVotes() async {
    logInfo('getAllCommentVotes()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/comment_votes',
      'listCommentVotes',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
      },
      fromJson: CommentVote.fromJson,
    );
  }

  static Future<List<CommentVote>?> getAllCommentVotesByCommentAndUser(
    String commentId,
  ) async {
    logInfo('getAllCommentVotesByCommentAndUser()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/comment_votes_by_comment_and_user',
      'listCommentVotes',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'commentID': commentId,
      },
      fromJson: CommentVote.fromJson,
    );
  }

  static Future<Tuple2<CommentVote?, int?>?> getCommentVote(
    String commentVoteId,
  ) async {
    logInfo('getCommentVote(): $commentVoteId');
    await CoreRepo.init();
    return CoreRepo.getItem<CommentVote>(
      'groups/comment_vote',
      'getCommentVote',
      variables: <String, dynamic>{
        'commentVoteID': commentVoteId,
      },
      fromJson: CommentVote.fromJson,
    );
  }

  static Future<Tuple2<CommentVote?, int?>?> createCommentVote({
    bool isHidden = false,
    String? commentId,
  }) async {
    logInfo('createCommentVote()');
    await CoreRepo.init();
    return CoreRepo.createItem<CommentVote>(
      'groups/comment_vote_create',
      'createCommentVote',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'commentID': commentId,
        },
      },
      fromJson: CommentVote.fromJson,
    );
  }

  static Future<Tuple2<CommentVote?, int?>?> updateCommentVote({
    String? commentVoteId,
    bool? isHidden,
    String? commentId,
    int? version = 1,
  }) async {
    logInfo('updateCommentVote()');
    await CoreRepo.init();
    final variables = <String, dynamic>{
      'input': {
        'id': commentVoteId,
        '_version': version,
      },
    };

    final input = variables['input'] as Map<String, dynamic>;

    if (isHidden != null) {
      input['isHidden'] = isHidden;
    }

    if (commentId != null) {
      input['commentId'] = commentId;
    }

    return CoreRepo.updateItem<CommentVote>(
      'groups/comment_vote_update',
      'updateCommentVote',
      variables: variables,
      fromJson: CommentVote.fromJson,
    );
  }

  static Future<Tuple2<CommentVote?, int?>?> deleteCommentVote({
    String? commentVoteId,
    int? version = 1,
  }) async {
    logInfo('deleteCommentVote()');
    await CoreRepo.init();
    return CoreRepo.updateItem<CommentVote>(
      'groups/comment_vote_delete',
      'deleteCommentVote',
      variables: <String, dynamic>{
        'input': {
          'id': commentVoteId,
          '_version': version,
        },
      },
      fromJson: CommentVote.fromJson,
    );
  }
}
