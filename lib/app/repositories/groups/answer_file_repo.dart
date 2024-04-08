// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AnswerFileRepo {
  AnswerFileRepo._();

  static Future<List<AnswerFile>?> getAllAnswerFiles() async {
    logInfo('getAllAnswerFiles()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/answer_files',
      'listAnswerFiles',
      fromJson: AnswerFile.fromJson,
    );
  }

  static Future<Tuple2<AnswerFile?, int?>?> getAnswerFile(
    String answerFileId,
  ) async {
    logInfo('getAnswerFile(): $answerFileId');
    await CoreRepo.init();
    return CoreRepo.getItem<AnswerFile>(
      'groups/answer_file',
      'getAnswerFile',
      variables: <String, dynamic>{
        'answerFileID': answerFileId,
      },
      fromJson: AnswerFile.fromJson,
    );
  }

  static Future<Tuple2<AnswerFile?, int?>?> createAnswerFile({
    bool isHidden = false,
    String? key,
    String? name,
    String? url,
    String? answerId,
  }) async {
    logInfo('createAnswerFile()');
    await CoreRepo.init();
    return CoreRepo.createItem<AnswerFile>(
      'groups/answer_file_create',
      'createAnswerFile',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'key': key,
          'name': name,
          'url': url,
          'answerID': answerId,
        },
      },
      fromJson: AnswerFile.fromJson,
    );
  }

  static Future<Tuple2<AnswerFile?, int?>?> updateAnswerFile({
    String? answerFileId,
    bool isHidden = false,
    String? key,
    String? name,
    String? url,
    String? answerId,
    int? version = 1,
  }) async {
    logInfo('updateAnswerFile()');
    await CoreRepo.init();
    return CoreRepo.updateItem<AnswerFile>(
      'groups/answer_file_update',
      'updateAnswerFile',
      variables: <String, dynamic>{
        'input': {
          'id': answerFileId,
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'key': key,
          'name': name,
          'url': url,
          'answerID': answerId,
          '_version': version,
        },
      },
      fromJson: AnswerFile.fromJson,
    );
  }

  static Future<Tuple2<AnswerFile?, int?>?> deleteAnswerFile({
    String? answerFileId,
    int? version = 1,
  }) async {
    logInfo('deleteAnswerFile()');
    await CoreRepo.init();
    return CoreRepo.updateItem<AnswerFile>(
      'groups/answer_file_delete',
      'deleteAnswerFile',
      variables: <String, dynamic>{
        'input': {
          'id': answerFileId,
          '_version': version,
        },
      },
      fromJson: AnswerFile.fromJson,
    );
  }
}
