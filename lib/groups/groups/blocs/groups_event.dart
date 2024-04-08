part of 'groups_bloc.dart';

@immutable
abstract class GroupsEvent {
  const GroupsEvent();
}

class GroupsInitSet extends GroupsEvent {
  const GroupsInitSet(this.questionId, this.question);

  final String questionId;
  final String question;

  @override
  String toString() => 'GroupsInitSet {}';
}

class GroupsIsLoadingSet extends GroupsEvent {
  const GroupsIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'GroupsIsLoadingSet {}';
}

class GroupsIsVoteLoadingSet extends GroupsEvent {
  const GroupsIsVoteLoadingSet({
    this.isVoteLoading = true,
  });

  final bool isVoteLoading;

  @override
  String toString() => 'GroupsIsVoteLoadingSet {}';
}

class GroupsNewGroupNameSet extends GroupsEvent {
  const GroupsNewGroupNameSet(this.newGroupName);

  final String newGroupName;

  @override
  String toString() => 'GroupsNewGroupNameSet {}';
}

class GroupsNewGroupTypeIdSet extends GroupsEvent {
  const GroupsNewGroupTypeIdSet(this.newGroupTypeId);

  final String newGroupTypeId;

  @override
  String toString() => 'GroupsNewGroupTypeIdSet {}';
}

class GroupsNewQuestionNameSet extends GroupsEvent {
  const GroupsNewQuestionNameSet(this.newQuestionName);

  final String newQuestionName;

  @override
  String toString() => 'GroupsNewQuestionNameSet {}';
}

class GroupsNewQuestionGroupIdSet extends GroupsEvent {
  const GroupsNewQuestionGroupIdSet(this.newQuestionGroupId);

  final String newQuestionGroupId;

  @override
  String toString() => 'GroupsNewQuestionGroupIdSet {}';
}

class GroupsSelectedGroupSet extends GroupsEvent {
  const GroupsSelectedGroupSet(this.index, this.group);

  final int index;
  final Group? group;

  @override
  String toString() => 'GroupsSelectedGroupSet {}';
}

class GroupsFirstGroupSelect extends GroupsEvent {
  const GroupsFirstGroupSelect(this.context);

  final BuildContext context;

  @override
  String toString() => 'GroupsFirstGroupSelect {}';
}

class GroupsGroupJoin extends GroupsEvent {
  const GroupsGroupJoin(this.groupId);

  final String groupId;

  @override
  String toString() => 'GroupsGroupJoin {}';
}

class GroupsNewFilesPick extends GroupsEvent {
  const GroupsNewFilesPick();

  @override
  String toString() => 'GroupsNewFilesPick {}';
}

class GroupsFileDelete extends GroupsEvent {
  const GroupsFileDelete(this.index, this.key);

  final int index;
  final String key;

  @override
  String toString() => 'GroupsFileDelete {}';
}

class GroupsGroupUpvote extends GroupsEvent {
  const GroupsGroupUpvote(this.index, this.groupId);

  final int index;
  final String groupId;

  @override
  String toString() => 'GroupsGroupUpvote {}';
}

class GroupsGroupDownvote extends GroupsEvent {
  const GroupsGroupDownvote(this.index, this.groupId, this.groupVoteId);

  final int index;
  final String groupId;
  final String groupVoteId;

  @override
  String toString() => 'GroupsGroupDownvote {}';
}

class GroupsGroupCreate extends GroupsEvent {
  const GroupsGroupCreate(this.groupName, this.groupType);

  final String groupName;
  final GroupType? groupType;

  @override
  String toString() => 'GroupsGroupCreate {}';
}

class GroupsGroupFilesCreate extends GroupsEvent {
  const GroupsGroupFilesCreate(this.groupId);

  final String groupId;

  @override
  String toString() => 'GroupsGroupFilesCreate {}';
}

class GroupsGroupDelete extends GroupsEvent {
  const GroupsGroupDelete(this.groupId);

  final String groupId;

  @override
  String toString() => 'GroupsGroupDelete {}';
}

class GroupsQuestionCreate extends GroupsEvent {
  const GroupsQuestionCreate(
    this.context,
    this.groupId,
    this.questionName,
    this.questionDescription,
  );

  final BuildContext context;
  final String groupId;
  final String questionName;
  final String questionDescription;

  @override
  String toString() => 'GroupsQuestionCreate {}';
}

class GroupsQuestionFilesCreate extends GroupsEvent {
  const GroupsQuestionFilesCreate(this.questionId);

  final String questionId;

  @override
  String toString() => 'GroupsQuestionFilesCreate {}';
}

class GroupsAllGroupsGet extends GroupsEvent {
  const GroupsAllGroupsGet();

  @override
  String toString() => 'GroupsAllGroupsGet {}';
}

class GroupsAllGroupTypesGet extends GroupsEvent {
  const GroupsAllGroupTypesGet();

  @override
  String toString() => 'GroupsAllGroupTypesGet {}';
}

class GroupsAllUserGroupsGet extends GroupsEvent {
  const GroupsAllUserGroupsGet();

  @override
  String toString() => 'GroupsAllUserGroupsGet {}';
}

class GroupsSearchTextSet extends GroupsEvent {
  const GroupsSearchTextSet(this.searchText);

  final String searchText;

  @override
  String toString() => 'GroupsSearchTextSet {}';
}

class GroupsShowHeaderSearchBarSet extends GroupsEvent {
  const GroupsShowHeaderSearchBarSet({this.showHeaderSearchBar = false});

  final bool showHeaderSearchBar;

  @override
  String toString() => 'GroupsShowHeaderSearchBarSet {}';
}

class GroupsGroupsSearch extends GroupsEvent {
  const GroupsGroupsSearch(this.searchTerm);

  final String searchTerm;

  @override
  String toString() => 'GroupsGroupsSearch {}';
}

class GroupsCreateGroupStreamSubscribe extends GroupsEvent {
  const GroupsCreateGroupStreamSubscribe();

  @override
  String toString() => 'GroupsCreateGroupStreamSubscribe {}';
}

class GroupsUpdateGroupStreamSubscribe extends GroupsEvent {
  const GroupsUpdateGroupStreamSubscribe();

  @override
  String toString() => 'GroupsUpdateGroupStreamSubscribe {}';
}

class GroupsCreateGroupStreamUnsubscribe extends GroupsEvent {
  const GroupsCreateGroupStreamUnsubscribe();

  @override
  String toString() => 'GroupsCreateGroupStreamUnsubscribe {}';
}

class GroupsUpdateGroupStreamUnsubscribe extends GroupsEvent {
  const GroupsUpdateGroupStreamUnsubscribe();

  @override
  String toString() => 'GroupsUpdateGroupStreamUnsubscribe {}';
}

class GroupsUserReport extends GroupsEvent {
  const GroupsUserReport(this.userId, this.name, this.description);

  final String userId;
  final String name;
  final String description;

  @override
  String toString() => 'GroupsUserReport {}';
}
