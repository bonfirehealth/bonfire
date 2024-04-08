// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class QuestionsHelper {
  QuestionsHelper._();

  static Tuple2<QuestionSave?, bool>? checkQuestionSaved(
    List<QuestionSave> questionSaves,
    String questionId,
  ) {
    for (final questionSave in questionSaves) {
      if (questionSave.question?.id == questionId) {
        return Tuple2(questionSave, true);
      }
    }
    return const Tuple2(null, false);
  }

  static Tuple2<QuestionVote?, bool>? checkQuestionVoted(
    List<QuestionVote> questionVotes,
    String questionId,
  ) {
    for (final questionVote in questionVotes) {
      if (questionVote.question?.id == questionId) {
        return Tuple2(questionVote, true);
      }
    }
    return const Tuple2(null, false);
  }

  static bool canDeleteQuestion(Question question) {
    final numberOfAnswers = question.numberOfAnswers ?? 0;
    var canDelete = question.user?.id == CoreRepo.userId;
    if (numberOfAnswers > 0) {
      canDelete = false;
    }
    return canDelete;
  }

  static bool canReportUser(Question question) {
    return question.user?.id != CoreRepo.userId;
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
