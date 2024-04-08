// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AnswersHelper {
  AnswersHelper._();

  static Tuple2<AnswerVote?, bool>? checkAnswerVoted(
    List<AnswerVote> answerVotes,
    String answerId,
  ) {
    for (final answerVote in answerVotes) {
      if (answerVote.answer?.id == answerId) {
        return Tuple2(answerVote, true);
      }
    }
    return const Tuple2(null, false);
  }

  static bool canDeleteAnswer(Answer answer) {
    final numberOfComments = answer.numberOfComments ?? 0;
    var canDelete = answer.user?.id == CoreRepo.userId;
    if (numberOfComments > 0) {
      canDelete = false;
    }
    return canDelete;
  }

  static bool canReportUser(Answer answer) {
    return answer.user?.id != CoreRepo.userId;
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
