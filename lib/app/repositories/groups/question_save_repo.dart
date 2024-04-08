// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class QuestionSaveRepo {
  QuestionSaveRepo._();

  static Future<List<QuestionSave>?> getAllQuestionSaves({
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('getAllQuestionSaves()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/question_saves',
      'latestQuestionSaves',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: QuestionSave.fromJson,
    );
  }

  static Future<Tuple2<QuestionSave?, int?>?> getQuestionSave(
    String questionSaveId,
  ) async {
    logInfo('getQuestionSave(): $questionSaveId');
    await CoreRepo.init();
    return CoreRepo.getItem<QuestionSave>(
      'groups/question_save',
      'getQuestionSave',
      variables: <String, dynamic>{
        'questionSaveID': questionSaveId,
      },
      fromJson: QuestionSave.fromJson,
    );
  }

  static Future<Tuple2<QuestionSave?, int?>?> createQuestionSave({
    bool isHidden = false,
    String? questionId,
  }) async {
    logInfo('createQuestionSave()');
    await CoreRepo.init();
    return CoreRepo.createItem<QuestionSave>(
      'groups/question_save_create',
      'createQuestionSave',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'questionID': questionId,
        },
      },
      fromJson: QuestionSave.fromJson,
    );
  }

  static Future<Tuple2<QuestionSave?, int?>?> updateQuestionSave({
    String? questionSaveId,
    bool? isHidden,
    String? questionId,
    int? version = 1,
  }) async {
    logInfo('updateQuestionSave()');
    await CoreRepo.init();
    final variables = <String, dynamic>{
      'input': {
        'id': questionSaveId,
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

    return CoreRepo.updateItem<QuestionSave>(
      'groups/question_save_update',
      'updateQuestionSave',
      variables: variables,
      fromJson: QuestionSave.fromJson,
    );
  }

  static Future<Tuple2<QuestionSave?, int?>?> deleteQuestionSave({
    String? questionSaveId,
    int? version = 1,
  }) async {
    logInfo('deleteQuestionSave()');
    await CoreRepo.init();
    return CoreRepo.updateItem<QuestionSave>(
      'groups/question_save_delete',
      'deleteQuestionSave',
      variables: <String, dynamic>{
        'input': {
          'id': questionSaveId,
          '_version': version,
        },
      },
      fromJson: QuestionSave.fromJson,
    );
  }
}
