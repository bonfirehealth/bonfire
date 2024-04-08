part of 'groups_bloc.dart';

class GroupsState {
  const GroupsState({
    this.isLoading = true,
    this.showHeaderSearchBar = false,
    this.selectedIndex = 0,
    this.selectedGroupId,
    this.selectedGroup,
    this.newQuestionName,
    this.newQuestionGroupId,
    this.newQuestionFiles,
    this.newGroupName,
    this.newGroupTypeId,
    this.newGroupFiles,
    this.searchText = '',
    this.searchList,
    this.groupTypes,
    this.groups,
    this.userGroups,
    this.filteredGroups,
    this.isVoteLoading,
    this.createGroupStreamSubscription,
    this.updateGroupStreamSubscription,
  });

  final bool isLoading;
  final bool showHeaderSearchBar;
  final int selectedIndex;
  final Group? selectedGroup;
  final String? selectedGroupId;
  final String? newQuestionName;
  final String? newQuestionGroupId;
  final List<QuestionFile>? newQuestionFiles;
  final String? newGroupName;
  final String? newGroupTypeId;
  final List<GroupFile>? newGroupFiles;
  final String searchText;
  final List<String>? searchList;
  final List<GroupType>? groupTypes;
  final List<Group>? groups;
  final List<UserGroup>? userGroups;
  final List<Group>? filteredGroups;
  final bool? isVoteLoading;
  final StreamSubscription<GraphQLResponse<String>>?
      createGroupStreamSubscription;
  final StreamSubscription<GraphQLResponse<String>>?
      updateGroupStreamSubscription;

  GroupsState copyWith({
    bool? isLoading,
    bool? showHeaderSearchBar,
    int? selectedIndex,
    String? selectedGroupId,
    Group? selectedGroup,
    String? newQuestionName,
    String? newQuestionGroupId,
    List<QuestionFile>? newQuestionFiles,
    String? newGroupName,
    String? newGroupTypeId,
    List<GroupFile>? newGroupFiles,
    Question? selectedQuestion,
    Answer? selectedAnswer,
    Comment? selectedComment,
    String? searchText,
    List<String>? searchList,
    List<GroupType>? groupTypes,
    List<Group>? groups,
    List<UserGroup>? userGroups,
    List<Group>? filteredGroups,
    bool? isVoteLoading,
    StreamSubscription<GraphQLResponse<String>>? createGroupStreamSubscription,
    StreamSubscription<GraphQLResponse<String>>? updateGroupStreamSubscription,
  }) {
    return GroupsState(
      isLoading: isLoading ?? this.isLoading,
      showHeaderSearchBar: showHeaderSearchBar ?? this.showHeaderSearchBar,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedGroupId: selectedGroupId ?? this.selectedGroupId,
      selectedGroup: selectedGroup ?? this.selectedGroup,
      newQuestionName: newQuestionName ?? this.newQuestionName,
      newQuestionGroupId: newQuestionGroupId ?? this.newQuestionGroupId,
      newQuestionFiles: newQuestionFiles ?? this.newQuestionFiles,
      newGroupName: newGroupName ?? this.newGroupName,
      newGroupTypeId: newGroupTypeId ?? this.newGroupTypeId,
      newGroupFiles: newGroupFiles ?? this.newGroupFiles,
      searchText: searchText ?? this.searchText,
      searchList: searchList ?? this.searchList,
      groupTypes: groupTypes ?? this.groupTypes,
      groups: groups ?? this.groups,
      userGroups: userGroups ?? this.userGroups,
      filteredGroups: filteredGroups ?? this.filteredGroups,
      isVoteLoading: isVoteLoading ?? this.isVoteLoading,
      createGroupStreamSubscription:
          createGroupStreamSubscription ?? this.createGroupStreamSubscription,
      updateGroupStreamSubscription:
          updateGroupStreamSubscription ?? this.updateGroupStreamSubscription,
    );
  }
}
