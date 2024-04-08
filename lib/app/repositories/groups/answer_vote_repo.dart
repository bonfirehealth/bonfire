// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AnswerVoteRepo {
  AnswerVoteRepo._();

  static Future<List<AnswerVote>?> getAllAnswerVotes() async {
    logInfo('getAllAnswerVotes()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/answer_votes',
      'listAnswerVotes',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
      },
      fromJson: AnswerVote.fromJson,
    );
  }

  static Future<List<AnswerVote>?> getAllAnswerVotesByAnswerAndUser(
    String answerId,
  ) async {
    logInfo('getAllAnswerVotesByAnswerAndUser()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/answer_votes_by_answer_and_user',
      'listAnswerVotes',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'answerID': answerId,
      },
      fromJson: AnswerVote.fromJson,
    );
  }

  static Future<Tuple2<AnswerVote?, int?>?> getAnswerVote(
    String answerVoteId,
  ) async {
    logInfo('getAnswerVote(): $answerVoteId');
    await CoreRepo.init();
    return CoreRepo.getItem<AnswerVote>(
      'groups/answer_vote',
      'getAnswerVote',
      variables: <String, dynamic>{
        'answerVoteID': answerVoteId,
      },
      fromJson: AnswerVote.fromJson,
    );
  }

  static Future<Tuple2<AnswerVote?, int?>?> createAnswerVote({
    bool isHidden = false,
    String? answerId,
  }) async {
    logInfo('createAnswerVote()');
    await CoreRepo.init();
    return CoreRepo.createItem<AnswerVote>(
      'groups/answer_vote_create',
      'createAnswerVote',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'answerID': answerId,
        },
      },
      fromJson: AnswerVote.fromJson,
    );
  }

  static Future<Tuple2<AnswerVote?, int?>?> updateAnswerVote({
    String? answerVoteId,
    bool? isHidden,
    String? answerId,
    int? version = 1,
  }) async {
    logInfo('updateAnswerVote()');
    await CoreRepo.init();
    final variables = <String, dynamic>{
      'input': {
        'id': answerVoteId,
        '_version': version,
      },
    };

    final input = variables['input'] as Map<String, dynamic>;

    if (isHidden != null) {
      input['isHidden'] = isHidden;
    }

    if (answerId != null) {
      input['answerId'] = answerId;
    }

    return CoreRepo.updateItem<AnswerVote>(
      'groups/answer_vote_update',
      'updateAnswerVote',
      variables: variables,
      fromJson: AnswerVote.fromJson,
    );
  }

  static Future<Tuple2<AnswerVote?, int?>?> deleteAnswerVote({
    String? answerVoteId,
    int? version = 1,
  }) async {
    logInfo('deleteAnswerVote()');
    await CoreRepo.init();
    return CoreRepo.updateItem<AnswerVote>(
      'groups/answer_vote_delete',
      'deleteAnswerVote',
      variables: <String, dynamic>{
        'input': {
          'id': answerVoteId,
          '_version': version,
        },
      },
      fromJson: AnswerVote.fromJson,
    );
  }
}
