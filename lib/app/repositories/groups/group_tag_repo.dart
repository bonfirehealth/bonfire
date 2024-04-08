// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class GroupTagRepo {
  GroupTagRepo._();

  static Future<List<GroupTag>?> getAllGroupTags() async {
    logInfo('getAllGroupTags()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/group_tags',
      'listGroupTags',
      variables: <String, dynamic>{
        'organisationID': CoreRepo.organisationId,
      },
      fromJson: GroupTag.fromJson,
    );
  }

  static Future<Tuple2<GroupTag?, int?>?> getGroupTag(
    String groupTagId,
  ) async {
    logInfo('getGroupTag(): $groupTagId');
    await CoreRepo.init();
    return CoreRepo.getItem<GroupTag>(
      'groups/group_tag',
      'getGroupTag',
      variables: <String, dynamic>{
        'groupTagID': groupTagId,
      },
      fromJson: GroupTag.fromJson,
    );
  }

  static Future<Tuple2<GroupTag?, int?>?> createGroupTag({
    String? description,
    String? identifier,
    String? name,
  }) async {
    logInfo('createGroupTag()');
    await CoreRepo.init();
    return CoreRepo.createItem<GroupTag>(
      'groups/group_tag_create',
      'createGroupTag',
      variables: <String, dynamic>{
        'input': {
          'organisationID': CoreRepo.organisationId,
          'description': description,
          'identifier': identifier,
          'name': name,
        },
      },
      fromJson: GroupTag.fromJson,
    );
  }

  static Future<Tuple2<GroupTag?, int?>?> updateGroupTag({
    String? groupTagId,
    String? description,
    String? identifier,
    String? name,
    int? version = 1,
  }) async {
    logInfo('updateGroupTag()');
    await CoreRepo.init();
    return CoreRepo.updateItem<GroupTag>(
      'groups/group_tag_update',
      'updateGroupTag',
      variables: <String, dynamic>{
        'input': {
          'id': groupTagId,
          'organisationID': CoreRepo.organisationId,
          'description': description,
          'identifier': identifier,
          'name': name,
          '_version': version,
        },
      },
      fromJson: GroupTag.fromJson,
    );
  }

  static Future<Tuple2<GroupTag?, int?>?> deleteGroupTag({
    String? groupTagId,
    int? version = 1,
  }) async {
    logInfo('deleteGroupTag()');
    await CoreRepo.init();
    return CoreRepo.updateItem<GroupTag>(
      'groups/group_tag_delete',
      'deleteGroupTag',
      variables: <String, dynamic>{
        'input': {
          'id': groupTagId,
          '_version': version,
        },
      },
      fromJson: GroupTag.fromJson,
    );
  }
}
