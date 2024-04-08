// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class QuestionVoteRepo {
  QuestionVoteRepo._();

  static Future<List<QuestionVote>?> getAllQuestionVotes() async {
    logInfo('getAllQuestionVotes()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/question_votes',
      'listQuestionVotes',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
      },
      fromJson: QuestionVote.fromJson,
    );
  }

  static Future<List<QuestionVote>?> getAllQuestionVotesByQuestionAndUser(
    String questionId,
  ) async {
    logInfo('getAllQuestionVotesByQuestionAndUser()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/question_votes_by_question_and_user',
      'listQuestionVotes',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'questionID': questionId,
      },
      fromJson: QuestionVote.fromJson,
    );
  }

  static Future<Tuple2<QuestionVote?, int?>?> getQuestionVote(
    String questionVoteId,
  ) async {
    logInfo('getQuestionVote(): $questionVoteId');
    await CoreRepo.init();
    return CoreRepo.getItem<QuestionVote>(
      'groups/question_vote',
      'getQuestionVote',
      variables: <String, dynamic>{
        'questionVoteID': questionVoteId,
      },
      fromJson: QuestionVote.fromJson,
    );
  }

  static Future<Tuple2<QuestionVote?, int?>?> createQuestionVote({
    bool isHidden = false,
    String? questionId,
  }) async {
    logInfo('createQuestionVote()');
    await CoreRepo.init();
    return CoreRepo.createItem<QuestionVote>(
      'groups/question_vote_create',
      'createQuestionVote',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'questionID': questionId,
        },
      },
      fromJson: QuestionVote.fromJson,
    );
  }

  static Future<Tuple2<QuestionVote?, int?>?> updateQuestionVote({
    String? questionVoteId,
    bool? isHidden,
    String? questionId,
    int? version = 1,
  }) async {
    logInfo('updateQuestionVote()');
    await CoreRepo.init();
    final variables = <String, dynamic>{
      'input': {
        'id': questionVoteId,
        '_version': version,
      },
    };

    final input = variables['input'] as Map<String, dynamic>;

    if (isHidden != null) {
      input['isHidden'] = isHidden;
    }

    if (questionId != null) {
      input['questionId'] = questionId;
    }

    return CoreRepo.updateItem<QuestionVote>(
      'groups/question_vote_update',
      'updateQuestionVote',
      variables: variables,
      fromJson: QuestionVote.fromJson,
    );
  }

  static Future<Tuple2<QuestionVote?, int?>?> deleteQuestionVote({
    String? questionVoteId,
    int? version = 1,
  }) async {
    logInfo('deleteQuestionVote()');
    await CoreRepo.init();
    return CoreRepo.updateItem<QuestionVote>(
      'groups/question_vote_delete',
      'deleteQuestionVote',
      variables: <String, dynamic>{
        'input': {
          'id': questionVoteId,
          '_version': version,
        },
      },
      fromJson: QuestionVote.fromJson,
    );
  }
}
