// Dart imports:
import 'dart:async';

// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class UserGroupRepo {
  UserGroupRepo._();

  static Future<List<UserGroup>?> getAllUserGroups() async {
    logInfo('getAllUserGroups()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/user_groups_by_user',
      'listUserGroups',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
      },
      fromJson: UserGroup.fromJson,
    );
  }

  static Future<Tuple2<UserGroup?, int?>?> createUserGroup({
    String? groupId,
  }) async {
    logInfo('createUserGroup()');
    await CoreRepo.init();
    return CoreRepo.createItem<UserGroup>(
      'groups/user_group_create',
      'createUserGroup',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'groupID': groupId,
        },
      },
      fromJson: UserGroup.fromJson,
    );
  }

  static Future<Tuple2<UserGroup?, int?>?> updateUserGroup({
    String? userGroupId,
    String? groupId,
    int? version = 1,
  }) async {
    logInfo('updateUserGroup()');
    await CoreRepo.init();
    return CoreRepo.updateItem<UserGroup>(
      'groups/user_group_update',
      'updateUserGroup',
      variables: <String, dynamic>{
        'input': {
          'id': userGroupId,
          'userID': CoreRepo.userId,
          'groupID': groupId,
          '_version': version,
        },
      },
      fromJson: UserGroup.fromJson,
    );
  }

  static Future<Tuple2<UserGroup?, int?>?> deleteUserGroup({
    String? userGroupId,
    int? version = 1,
  }) async {
    logInfo('deleteUserGroup()');
    await CoreRepo.init();
    return CoreRepo.updateItem<UserGroup>(
      'groups/user_group_delete',
      'deleteUserGroup',
      variables: <String, dynamic>{
        'input': {
          'id': userGroupId,
          '_version': version,
        },
      },
      fromJson: UserGroup.fromJson,
    );
  }
}
