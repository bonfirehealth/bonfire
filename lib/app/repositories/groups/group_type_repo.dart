// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class GroupTypeRepo {
  GroupTypeRepo._();

  static Future<List<GroupType>?> getAllGroupTypes() async {
    logInfo('getAllGroupTypes()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/group_types',
      'listGroupTypes',
      variables: <String, dynamic>{
        'organisationID': CoreRepo.organisationId,
      },
      fromJson: GroupType.fromJson,
    );
  }

  static Future<Tuple2<GroupType?, int?>?> getGroupType(
    String groupTypeId,
  ) async {
    logInfo('getGroupType(): $groupTypeId');
    await CoreRepo.init();
    return CoreRepo.getItem<GroupType>(
      'groups/group_type',
      'getGroupType',
      variables: <String, dynamic>{
        'groupTypeID': groupTypeId,
      },
      fromJson: GroupType.fromJson,
    );
  }

  static Future<Tuple2<GroupType?, int?>?> createGroupType({
    String? description,
    String? identifier,
    String? name,
  }) async {
    logInfo('createGroupType()');
    await CoreRepo.init();
    return CoreRepo.createItem<GroupType>(
      'groups/group_type_create',
      'createGroupType',
      variables: <String, dynamic>{
        'input': {
          'organisationID': CoreRepo.organisationId,
          'description': description,
          'identifier': identifier,
          'name': name,
        },
      },
      fromJson: GroupType.fromJson,
    );
  }

  static Future<Tuple2<GroupType?, int?>?> updateGroupType({
    String? groupTypeId,
    String? description,
    String? identifier,
    String? name,
    int? version = 1,
  }) async {
    logInfo('updateGroupType()');
    await CoreRepo.init();
    return CoreRepo.updateItem<GroupType>(
      'groups/group_type_update',
      'updateGroupType',
      variables: <String, dynamic>{
        'input': {
          'id': groupTypeId,
          'organisationID': CoreRepo.organisationId,
          'description': description,
          'identifier': identifier,
          'name': name,
          '_version': version,
        },
      },
      fromJson: GroupType.fromJson,
    );
  }

  static Future<Tuple2<GroupType?, int?>?> deleteGroupType({
    String? groupTypeId,
    int? version = 1,
  }) async {
    logInfo('deleteGroupType()');
    await CoreRepo.init();
    return CoreRepo.updateItem<GroupType>(
      'groups/group_type_delete',
      'deleteGroupType',
      variables: <String, dynamic>{
        'input': {
          'id': groupTypeId,
          '_version': version,
        },
      },
      fromJson: GroupType.fromJson,
    );
  }
}
