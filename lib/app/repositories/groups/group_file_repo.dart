// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class GroupFileRepo {
  GroupFileRepo._();

  static Future<List<GroupFile>?> getAllGroupFiles() async {
    logInfo('getAllGroupFiles()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/group_files',
      'listGroupFiles',
      fromJson: GroupFile.fromJson,
    );
  }

  static Future<Tuple2<GroupFile?, int?>?> getGroupFile(
    String groupFileId,
  ) async {
    logInfo('getGroupFile(): $groupFileId');
    await CoreRepo.init();
    return CoreRepo.getItem<GroupFile>(
      'groups/group_file',
      'getGroupFile',
      variables: <String, dynamic>{
        'groupFileID': groupFileId,
      },
      fromJson: GroupFile.fromJson,
    );
  }

  static Future<Tuple2<GroupFile?, int?>?> createGroupFile({
    bool isHidden = false,
    String? key,
    String? name,
    String? url,
    String? groupId,
  }) async {
    logInfo('createGroupFile()');
    await CoreRepo.init();
    return CoreRepo.createItem<GroupFile>(
      'groups/group_file_create',
      'createGroupFile',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'key': key,
          'name': name,
          'url': url,
          'groupID': groupId,
        },
      },
      fromJson: GroupFile.fromJson,
    );
  }

  static Future<Tuple2<GroupFile?, int?>?> updateGroupFile({
    String? groupFileId,
    bool isHidden = false,
    String? key,
    String? name,
    String? url,
    String? groupId,
    int? version = 1,
  }) async {
    logInfo('updateGroupFile()');
    await CoreRepo.init();
    return CoreRepo.updateItem<GroupFile>(
      'groups/group_file_update',
      'updateGroupFile',
      variables: <String, dynamic>{
        'input': {
          'id': groupFileId,
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'key': key,
          'name': name,
          'url': url,
          'groupID': groupId,
          '_version': version,
        },
      },
      fromJson: GroupFile.fromJson,
    );
  }

  static Future<Tuple2<GroupFile?, int?>?> deleteGroupFile({
    String? groupFileId,
    int? version = 1,
  }) async {
    logInfo('deleteGroupFile()');
    await CoreRepo.init();
    return CoreRepo.updateItem<GroupFile>(
      'groups/group_file_delete',
      'deleteGroupFile',
      variables: <String, dynamic>{
        'input': {
          'id': groupFileId,
          '_version': version,
        },
      },
      fromJson: GroupFile.fromJson,
    );
  }
}
