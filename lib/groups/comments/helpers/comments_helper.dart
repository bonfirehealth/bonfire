// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class CommentsHelper {
  CommentsHelper._();

  static Tuple2<CommentVote?, bool>? checkCommentVoted(
    List<CommentVote> commentVotes,
    String commentId,
  ) {
    for (final commentVote in commentVotes) {
      if (commentVote.comment?.id == commentId) {
        return Tuple2(commentVote, true);
      }
    }
    return const Tuple2(null, false);
  }

  static bool canDeleteComment(Comment comment) {
    return comment.user?.id == CoreRepo.userId;
  }

  static bool canReportUser(Comment comment) {
    return comment.user?.id != CoreRepo.userId;
  }

  static Answer? getSelectedAnswer(String answerId, List<Answer>? answers) {
    final answerIndex =
        answers?.indexWhere((element) => element.id == answerId) ?? -1;

    if (answerIndex != -1) {
      return answers?[answerIndex];
    }

    return null;
  }
}
