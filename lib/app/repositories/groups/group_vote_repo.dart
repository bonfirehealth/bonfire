// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class GroupVoteRepo {
  GroupVoteRepo._();

  static Future<List<GroupVote>?> getAllGroupVotes() async {
    logInfo('getAllGroupVotes()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/group_votes',
      'listGroupVotes',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
      },
      fromJson: GroupVote.fromJson,
    );
  }

  static Future<List<GroupVote>?> getAllGroupVotesByGroupAndUser(
    String groupId,
  ) async {
    logInfo('getAllGroupVotesByGroupAndUser()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/group_votes_by_group_and_user',
      'listGroupVotes',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'groupID': groupId,
      },
      fromJson: GroupVote.fromJson,
    );
  }

  static Future<Tuple2<GroupVote?, int?>?> getGroupVote(
    String groupVoteId,
  ) async {
    logInfo('getGroupVote(): $groupVoteId');
    await CoreRepo.init();
    return CoreRepo.getItem<GroupVote>(
      'groups/group_vote',
      'getGroupVote',
      variables: <String, dynamic>{
        'groupVoteID': groupVoteId,
      },
      fromJson: GroupVote.fromJson,
    );
  }

  static Future<Tuple2<GroupVote?, int?>?> createGroupVote({
    bool isHidden = false,
    String? groupId,
  }) async {
    logInfo('createGroupVote()');
    await CoreRepo.init();
    return CoreRepo.createItem<GroupVote>(
      'groups/group_vote_create',
      'createGroupVote',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'isHidden': isHidden,
          'groupID': groupId,
        },
      },
      fromJson: GroupVote.fromJson,
    );
  }

  static Future<Tuple2<GroupVote?, int?>?> updateGroupVote({
    String? groupVoteId,
    bool? isHidden,
    String? groupId,
    int? version = 1,
  }) async {
    logInfo('updateGroupVote()');
    await CoreRepo.init();
    final variables = <String, dynamic>{
      'input': {
        'id': groupVoteId,
        '_version': version,
      },
    };

    final input = variables['input'] as Map<String, dynamic>;

    if (isHidden != null) {
      input['isHidden'] = isHidden;
    }

    if (groupId != null) {
      input['groupId'] = groupId;
    }

    return CoreRepo.updateItem<GroupVote>(
      'groups/group_vote_update',
      'updateGroupVote',
      variables: variables,
      fromJson: GroupVote.fromJson,
    );
  }

  static Future<Tuple2<GroupVote?, int?>?> deleteGroupVote({
    String? groupVoteId,
    int? version = 1,
  }) async {
    logInfo('deleteGroupVote()');
    await CoreRepo.init();
    return CoreRepo.updateItem<GroupVote>(
      'groups/group_vote_delete',
      'deleteGroupVote',
      variables: <String, dynamic>{
        'input': {
          'id': groupVoteId,
          '_version': version,
        },
      },
      fromJson: GroupVote.fromJson,
    );
  }
}
