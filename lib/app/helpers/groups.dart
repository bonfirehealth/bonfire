// Project imports:

// Project imports:
import 'package:bonfirehealth/app/app.dart';

List<String> generateJoinedGroupIds(List<UserGroup> userGroups) {
  final joinedGroups = <String>[];

  for (final userGroup in userGroups) {
    joinedGroups.add(userGroup.group.id);
  }

  return joinedGroups;
}

List<String> generateJoinedGroupNames(List<UserGroup> userGroups) {
  final joinedGroups = <String>[];

  for (final userGroup in userGroups) {
    if (userGroup.group.name != null) {
      joinedGroups.add(userGroup.group.name!);
    }
  }

  return joinedGroups;
}

List<String> generateGroupTypeIds(List<GroupType> groupTypes) {
  final newGroupTypes = <String>[];

  for (final groupType in groupTypes) {
    newGroupTypes.add(groupType.id);
  }

  return newGroupTypes;
}

List<String> generateGroupTypeNames(List<GroupType> groupTypes) {
  final newGroupTypes = <String>[];

  for (final groupType in groupTypes) {
    newGroupTypes.add(groupType.name!);
  }

  return newGroupTypes;
}

GroupType? generateGroupType(List<GroupType> groupTypes, String groupTypeId) {
  for (final groupType in groupTypes) {
    if (groupType.id == groupTypeId) {
      return groupType;
    }
  }

  return null;
}
