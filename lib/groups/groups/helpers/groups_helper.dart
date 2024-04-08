// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

part 'utils/groups.dart';
part 'utils/questions.dart';

class GroupsHelper {
  GroupsHelper._();

  static Tuple2<GroupVote?, bool>? checkGroupVoted(
    List<GroupVote> groupVotes,
    String groupId,
  ) {
    for (final groupVote in groupVotes) {
      if (groupVote.group?.id == groupId) {
        return Tuple2(groupVote, true);
      }
    }
    return const Tuple2(null, false);
  }

  static Future<bool> checkGroupJoined(
    String groupId,
    List<UserGroup>? userGroups,
  ) async {
    var isJoined = false;

    if (userGroups != null) {
      if (userGroups.isNotEmpty) {
        final indexFound =
            userGroups.indexWhere((element) => element.group.id == groupId);
        isJoined = indexFound != -1;
      }
    }

    return isJoined;
  }

  static bool canDeleteGroup(Group group) {
    final numberOfQuestions = group.numberOfQuestions ?? 0;
    var canDelete = group.suggester?.id == CoreRepo.userId;
    if (numberOfQuestions > 0) {
      canDelete = false;
    }
    return canDelete;
  }

  static bool canReportUser(Group group) {
    return group.suggester?.id != CoreRepo.userId;
  }

  static Group? getSelectedGroup(String groupId, List<Group>? groups) {
    final index = groups?.indexWhere((element) => element.id == groupId) ?? -1;
    if (index != -1) {
      if (groups != null) {
        final group = groups[index];

        return group;
      }
    }

    return null;
  }

  static int checkGroupVoteCountRemainingToApprove(Group? group) {
    final numberOfVotes = group?.numberOfVotes ?? 0;
    if (numberOfVotes < 10) {
      return 10 - numberOfVotes;
    } else {
      return 0;
    }
  }

  static void generateGroupOnReportedPopupDialog(
    BuildContext context,
    GroupsBloc bloc,
    Group group,
  ) =>
      _generateGroupOnReportedPopupDialog(context, bloc, group);

  static void generateQuestionOnReportedPopupDialog(
    BuildContext context,
    QuestionsBloc bloc,
    Question question,
  ) =>
      _generateQuestionOnReportedPopupDialog(context, bloc, question);
}
