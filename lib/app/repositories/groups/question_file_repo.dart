// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class QuestionFileRepo {
  QuestionFileRepo._();

  static Future<List<QuestionFile>?> getAllQuestionFiles() async {
    logInfo('getAllQuestionFiles()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/question_files',
      'listQuestionFiles',
      fromJson: QuestionFile.fromJson,
    );
  }

  static Future<Tuple2<QuestionFile?, int?>?> getQuestionFile(
    String questionFileId,
  ) async {
    logInfo('getQuestionFile(): $questionFileId');
    await CoreRepo.init();
    return CoreRepo.getItem<QuestionFile>(
      'groups/question_file',
      'getQuestionFile',
      variables: <String, dynamic>{
        'questionFileID': questionFileId,
      },
      fromJson: QuestionFile.fromJson,
    );
  }

  static Future<Tuple2<QuestionFile?, int?>?> createQuestionFile({
    bool isHidden = false,
    String? key,
    String? name,
    String? url,
    String? questionId,
  }) async {
    logInfo('createQuestionFile()');
    await CoreRepo.init();
    return CoreRepo.createItem<QuestionFile>(
      'groups/question_file_create',
      'createQuestionFile',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'key': key,
          'name': name,
          'url': url,
          'questionID': questionId,
        },
      },
      fromJson: QuestionFile.fromJson,
    );
  }

  static Future<Tuple2<QuestionFile?, int?>?> updateQuestionFile({
    String? questionFileId,
    bool isHidden = false,
    String? key,
    String? name,
    String? url,
    String? questionId,
    int? version = 1,
  }) async {
    logInfo('updateQuestionFile()');
    await CoreRepo.init();
    return CoreRepo.updateItem<QuestionFile>(
      'groups/question_file_update',
      'updateQuestionFile',
      variables: <String, dynamic>{
        'input': {
          'id': questionFileId,
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'key': key,
          'name': name,
          'url': url,
          'questionID': questionId,
          '_version': version,
        },
      },
      fromJson: QuestionFile.fromJson,
    );
  }

  static Future<Tuple2<QuestionFile?, int?>?> deleteQuestionFile({
    String? questionFileId,
    int? version = 1,
  }) async {
    logInfo('deleteQuestionFile()');
    await CoreRepo.init();
    return CoreRepo.updateItem<QuestionFile>(
      'questions/question_file_delete',
      'deleteQuestionFile',
      variables: <String, dynamic>{
        'input': {
          'id': questionFileId,
          '_version': version,
        },
      },
      fromJson: QuestionFile.fromJson,
    );
  }
}
