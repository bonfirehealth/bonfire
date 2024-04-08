// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class CommentFileRepo {
  CommentFileRepo._();

  static Future<List<CommentFile>?> getAllCommentFiles() async {
    logInfo('getAllCommentFiles()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/comment_files',
      'listCommentFiles',
      fromJson: CommentFile.fromJson,
    );
  }

  static Future<Tuple2<CommentFile?, int?>?> getCommentFile(
    String commentFileId,
  ) async {
    logInfo('getCommentFile(): $commentFileId');
    await CoreRepo.init();
    return CoreRepo.getItem<CommentFile>(
      'groups/comment_file',
      'getCommentFile',
      variables: <String, dynamic>{
        'commentFileID': commentFileId,
      },
      fromJson: CommentFile.fromJson,
    );
  }

  static Future<Tuple2<CommentFile?, int?>?> createCommentFile({
    bool isHidden = false,
    String? key,
    String? name,
    String? url,
    String? commentId,
  }) async {
    logInfo('createCommentFile()');
    await CoreRepo.init();
    return CoreRepo.createItem<CommentFile>(
      'groups/comment_file_create',
      'createCommentFile',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'key': key,
          'name': name,
          'url': url,
          'commentID': commentId,
        },
      },
      fromJson: CommentFile.fromJson,
    );
  }

  static Future<Tuple2<CommentFile?, int?>?> updateCommentFile({
    String? commentFileId,
    bool isHidden = false,
    String? key,
    String? name,
    String? url,
    String? commentId,
    int? version = 1,
  }) async {
    logInfo('updateCommentFile()');
    await CoreRepo.init();
    return CoreRepo.updateItem<CommentFile>(
      'groups/comment_file_update',
      'updateCommentFile',
      variables: <String, dynamic>{
        'input': {
          'id': commentFileId,
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'key': key,
          'name': name,
          'url': url,
          'commentID': commentId,
          '_version': version,
        },
      },
      fromJson: CommentFile.fromJson,
    );
  }

  static Future<Tuple2<CommentFile?, int?>?> deleteCommentFile({
    String? commentFileId,
    int? version = 1,
  }) async {
    logInfo('deleteCommentFile()');
    await CoreRepo.init();
    return CoreRepo.updateItem<CommentFile>(
      'groups/comment_file_delete',
      'deleteCommentFile',
      variables: <String, dynamic>{
        'input': {
          'id': commentFileId,
          '_version': version,
        },
      },
      fromJson: CommentFile.fromJson,
    );
  }
}
