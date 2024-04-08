// Dart imports:
import 'dart:async';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart' hide Emitter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  GroupsBloc() : super(const GroupsState()) {
    on<GroupsInitSet>(_onGroupsInitSet);
    on<GroupsIsLoadingSet>(_onGroupsIsLoadingSet);
    on<GroupsIsVoteLoadingSet>(_onGroupsIsVoteLoadingSet);
    on<GroupsNewGroupNameSet>(_onGroupsNewGroupNameSet);
    on<GroupsNewGroupTypeIdSet>(_onGroupsNewGroupTypeIdSet);
    on<GroupsNewQuestionNameSet>(_onGroupsNewQuestionNameSet);
    on<GroupsNewQuestionGroupIdSet>(_onGroupsNewQuestionGroupIdSet);
    on<GroupsSelectedGroupSet>(_onGroupsSelectedGroupSet);
    on<GroupsFirstGroupSelect>(_onGroupsFirstGroupSelect);
    on<GroupsGroupJoin>(_onGroupsGroupJoin);
    on<GroupsNewFilesPick>(_onGroupsNewFilesPick);
    on<GroupsFileDelete>(_onGroupsFileDelete);
    on<GroupsGroupUpvote>(_onGroupsGroupUpvote);
    on<GroupsGroupDownvote>(_onGroupsGroupDownvote);
    on<GroupsGroupCreate>(_onGroupsGroupCreate);
    on<GroupsGroupFilesCreate>(_onGroupsGroupFilesCreate);
    on<GroupsGroupDelete>(_onGroupsGroupDelete);
    on<GroupsQuestionCreate>(_onGroupsQuestionCreate);
    on<GroupsQuestionFilesCreate>(_onGroupsQuestionFilesCreate);
    on<GroupsAllGroupsGet>(_onGroupsAllGroupsGet);
    on<GroupsAllGroupTypesGet>(_onGroupsAllGroupTypesGet);
    on<GroupsAllUserGroupsGet>(_onGroupsAllUserGroupsGet);
    on<GroupsSearchTextSet>(_onGroupsSearchTextSet);
    on<GroupsShowHeaderSearchBarSet>(_onGroupsShowHeaderSearchBarSet);
    on<GroupsGroupsSearch>(_onGroupsGroupsGroupsSearch);
    on<GroupsCreateGroupStreamSubscribe>(
      _onGroupsCreateGroupStreamSubscribe,
    );
    on<GroupsUpdateGroupStreamSubscribe>(
      _onGroupsUpdateGroupStreamSubscribe,
    );
    on<GroupsCreateGroupStreamUnsubscribe>(
      _onGroupsCreateGroupStreamUnsubscribe,
    );
    on<GroupsUpdateGroupStreamUnsubscribe>(
      _onGroupsUpdateGroupStreamUnsubscribe,
    );
    on<GroupsUserReport>(_onGroupsUserReport);
  }

  Group? get selectedGroup => state.selectedGroup;

  Future<void> _onGroupsInitSet(
    GroupsInitSet event,
    Emitter<GroupsState> emit,
  ) async {}

  void _onGroupsIsLoadingSet(
    GroupsIsLoadingSet event,
    Emitter<GroupsState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void _onGroupsIsVoteLoadingSet(
    GroupsIsVoteLoadingSet event,
    Emitter<GroupsState> emit,
  ) {
    emit(state.copyWith(isVoteLoading: event.isVoteLoading));
  }

  void _onGroupsNewGroupNameSet(
    GroupsNewGroupNameSet event,
    Emitter<GroupsState> emit,
  ) {
    emit(state.copyWith(newGroupName: event.newGroupName));
  }

  void _onGroupsNewGroupTypeIdSet(
    GroupsNewGroupTypeIdSet event,
    Emitter<GroupsState> emit,
  ) {
    emit(state.copyWith(newGroupTypeId: event.newGroupTypeId));
  }

  void _onGroupsNewQuestionNameSet(
    GroupsNewQuestionNameSet event,
    Emitter<GroupsState> emit,
  ) {
    emit(state.copyWith(newQuestionName: event.newQuestionName));
  }

  void _onGroupsNewQuestionGroupIdSet(
    GroupsNewQuestionGroupIdSet event,
    Emitter<GroupsState> emit,
  ) {
    emit(state.copyWith(newQuestionGroupId: event.newQuestionGroupId));
  }

  void _onGroupsSelectedGroupSet(
    GroupsSelectedGroupSet event,
    Emitter<GroupsState> emit,
  ) {
    emit(
      state.copyWith(
        selectedIndex: event.index,
        selectedGroupId: event.group?.id,
        selectedGroup: event.group,
      ),
    );
  }

  Future<void> _onGroupsFirstGroupSelect(
    GroupsFirstGroupSelect event,
    Emitter<GroupsState> emit,
  ) async {
    final groups = state.groups ?? [];
    if (groups.isNotEmpty) {
      final group = groups[0];
      emit(
        state.copyWith(
          selectedGroup: group,
          selectedIndex: 0,
          selectedGroupId: group.id,
        ),
      );

      add(GroupsGroupJoin(state.selectedGroupId!));

      event.context.read<QuestionsBloc>()
        ..add(QuestionsGroupSet(group.id, group))
        ..add(const QuestionsCreateQuestionStreamUnsubscribe())
        ..add(const QuestionsUpdateQuestionStreamUnsubscribe())
        ..add(const QuestionsCreateQuestionStreamSubscribe())
        ..add(const QuestionsUpdateQuestionStreamSubscribe())
        ..add(const QuestionsGroupGet())
        ..add(const QuestionsAllQuestionsGet());
    }
  }

  Future<void> _onGroupsGroupJoin(
    GroupsGroupJoin event,
    Emitter<GroupsState> emit,
  ) async {
    emit(state.copyWith(selectedGroupId: event.groupId));
    var isFound = false;
    final userGroups = state.userGroups ?? [];

    if (userGroups.isNotEmpty) {
      for (final userGroup in userGroups) {
        if (userGroup.group.id == state.selectedGroupId) {
          isFound = true;
        }
      }
    }

    if (!isFound) {
      final userGroup =
          await UserGroupRepo.createUserGroup(groupId: event.groupId);

      if (userGroup?.item1?.id != null) {
        final group = await GroupRepo.getGroup(event.groupId);
        var numberOfUsers = group?.item1?.numberOfUsers ?? 0;
        final numberOfVotes = group?.item1?.numberOfVotes ?? 0;
        numberOfUsers++;
        await GroupRepo.updateGroup(
          groupId: event.groupId,
          numberOfUsers: numberOfUsers,
          numberOfVotes: numberOfVotes,
          version: group?.item2 ?? 1,
        );
        emit(state.copyWith(groups: state.groups));
      }
    }
  }

  Future<void> _onGroupsNewFilesPick(
    GroupsNewFilesPick event,
    Emitter<GroupsState> emit,
  ) async {
    emit(
      state.copyWith(
        newGroupFiles: await AWSS3StorageHelper.pickAndUploadGroupFiles(),
      ),
    );
  }

  Future<void> _onGroupsFileDelete(
    GroupsFileDelete event,
    Emitter<GroupsState> emit,
  ) async {
    emit(
      state.copyWith(
        newGroupFiles: await AWSS3StorageHelper.removeGroupFile(
          event.index,
          event.key,
          state.newGroupFiles,
        ),
      ),
    );
  }

  Future<void> _onGroupsGroupUpvote(
    GroupsGroupUpvote event,
    Emitter<GroupsState> emit,
  ) async {
    add(const GroupsIsVoteLoadingSet());

    final groupVote = await GroupVoteRepo.createGroupVote(
      groupId: event.groupId,
    );

    if (groupVote?.item1?.id != null) {
      var group = await GroupRepo.getGroup(event.groupId);
      var numberOfVotes = group?.item1?.numberOfVotes ?? 0;
      numberOfVotes++;
      await GroupRepo.updateGroup(
        groupId: event.groupId,
        numberOfVotes: numberOfVotes,
        isApproved: numberOfVotes >= 10,
        version: group?.item2 ?? 1,
      );

      final groups = state.groups ?? [];
      group = await GroupRepo.getGroup(event.groupId);
      groups[event.index] = group!.item1!;
      emit(state.copyWith(groups: groups));

      add(const GroupsIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onGroupsGroupDownvote(
    GroupsGroupDownvote event,
    Emitter<GroupsState> emit,
  ) async {
    add(const GroupsIsVoteLoadingSet());

    var groupVote = await GroupVoteRepo.updateGroupVote(
      groupVoteId: event.groupVoteId,
      isHidden: true,
    );
    groupVote = await GroupVoteRepo.deleteGroupVote(
      groupVoteId: event.groupVoteId,
      version: groupVote?.item2 ?? 1,
    );

    if (groupVote?.item1?.id != null) {
      var group = await GroupRepo.getGroup(event.groupId);
      var numberOfVotes = group?.item1?.numberOfVotes ?? 0;
      numberOfVotes--;
      if (numberOfVotes < 0) numberOfVotes = 0;
      await GroupRepo.updateGroup(
        groupId: event.groupId,
        numberOfVotes: numberOfVotes,
        isApproved: numberOfVotes < 10,
        version: group?.item2 ?? 1,
      );

      final groups = state.groups ?? [];
      group = await GroupRepo.getGroup(event.groupId);
      groups[event.index] = group!.item1!;
      emit(state.copyWith(groups: groups));

      add(const GroupsIsVoteLoadingSet(isVoteLoading: false));
    }
  }

  Future<void> _onGroupsGroupCreate(
    GroupsGroupCreate event,
    Emitter<GroupsState> emit,
  ) async {
    final group = await GroupRepo.createGroup(
      description: event.groupType?.description,
      name: event.groupType?.name,
      icon: event.groupType?.icon,
      identifier: event.groupType?.identifier,
      index: 0,
      groupGroupTypeId: event.groupType?.id,
    );

    final groupId = group?.item1?.id;

    if (groupId != null) {
      final newGroupFiles = state.newGroupFiles ?? [];

      for (final newGroupFile in newGroupFiles) {
        await GroupFileRepo.createGroupFile(
          key: newGroupFile.key,
          name: newGroupFile.name,
          url: newGroupFile.url,
          groupId: groupId,
        );
      }
      emit(state.copyWith(newGroupFiles: []));
    }
  }

  Future<void> _onGroupsGroupFilesCreate(
    GroupsGroupFilesCreate event,
    Emitter<GroupsState> emit,
  ) async {
    final newGroupFiles = state.newGroupFiles ?? [];

    for (final newGroupFiles in newGroupFiles) {
      await GroupFileRepo.createGroupFile(
        key: newGroupFiles.key,
        name: newGroupFiles.name,
        url: newGroupFiles.url,
        groupId: event.groupId,
      );
    }
    emit(state.copyWith(newGroupFiles: []));
  }

  Future<void> _onGroupsGroupDelete(
    GroupsGroupDelete event,
    Emitter<GroupsState> emit,
  ) async {
    final group = await GroupRepo.getGroup(event.groupId);

    if (group?.item1 != null) {
      await GroupRepo.deleteGroup(
        groupId: event.groupId,
        version: group?.item2 ?? 0,
      );
      final groups = state.groups;
      final index =
          groups?.indexWhere((element) => element.id == event.groupId) ?? -1;
      if (index != -1) {
        if (groups != null) {
          groups.removeAt(index);
          emit(state.copyWith(groups: groups));
        }
      }
    }
  }

  Future<void> _onGroupsQuestionCreate(
    GroupsQuestionCreate event,
    Emitter<GroupsState> emit,
  ) async {
    final question = await QuestionRepo.createQuestion(
      name: event.questionName,
      description: event.questionDescription,
      identifier: ReCase(event.questionName).pathCase,
      index: 0,
      groupId: event.groupId,
    );

    final questionId = question?.item1?.id;
    if (questionId != null) {
      final group = await GroupRepo.getGroup(event.groupId);
      var numberOfQuestions = group?.item1?.numberOfQuestions ?? 0;
      final numberOfVotes = group?.item1?.numberOfVotes ?? 0;
      numberOfQuestions++;
      await GroupRepo.updateGroup(
        groupId: event.groupId,
        numberOfQuestions: numberOfQuestions,
        numberOfVotes: numberOfVotes,
        version: group?.item2 ?? 1,
      );

      final newQuestionFiles = state.newQuestionFiles ?? [];

      for (final newQuestionFile in newQuestionFiles) {
        await QuestionFileRepo.createQuestionFile(
          key: newQuestionFile.key,
          name: newQuestionFile.name,
          url: newQuestionFile.url,
          questionId: questionId,
        );
      }
      emit(state.copyWith(groups: state.groups, newQuestionFiles: []));
    }
  }

  Future<void> _onGroupsQuestionFilesCreate(
    GroupsQuestionFilesCreate event,
    Emitter<GroupsState> emit,
  ) async {
    final newQuestionFiles = state.newQuestionFiles ?? [];

    for (final newQuestionFile in newQuestionFiles) {
      await QuestionFileRepo.createQuestionFile(
        key: newQuestionFile.key,
        name: newQuestionFile.name,
        url: newQuestionFile.url,
        questionId: event.questionId,
      );
    }
    emit(state.copyWith(newQuestionFiles: []));
  }

  Future<void> _onGroupsAllGroupsGet(
    GroupsAllGroupsGet event,
    Emitter<GroupsState> emit,
  ) async {
    final groups = await GroupRepo.getAllGroups();
    emit(state.copyWith(groups: groups));
  }

  Future<void> _onGroupsAllGroupTypesGet(
    GroupsAllGroupTypesGet event,
    Emitter<GroupsState> emit,
  ) async {
    final groupTypes = await GroupTypeRepo.getAllGroupTypes();
    emit(state.copyWith(groupTypes: groupTypes));
  }

  Future<void> _onGroupsAllUserGroupsGet(
    GroupsAllUserGroupsGet event,
    Emitter<GroupsState> emit,
  ) async {
    final userGroups = await UserGroupRepo.getAllUserGroups();
    emit(state.copyWith(userGroups: userGroups));
  }

  Future<void> _onGroupsSearchTextSet(
    GroupsSearchTextSet event,
    Emitter<GroupsState> emit,
  ) async {
    emit(state.copyWith(searchText: event.searchText));
  }

  Future<void> _onGroupsShowHeaderSearchBarSet(
    GroupsShowHeaderSearchBarSet event,
    Emitter<GroupsState> emit,
  ) async {
    emit(state.copyWith(showHeaderSearchBar: event.showHeaderSearchBar));
  }

  Future<void> _onGroupsGroupsGroupsSearch(
    GroupsGroupsSearch event,
    Emitter<GroupsState> emit,
  ) async {
    final filteredGroups = <Group>[];
    final groups = await GroupRepo.searchGroups(name: event.searchTerm) ?? [];
    for (final group in groups) {
      if (group.name != null) {
        if (group.name!
            .toLowerCase()
            .contains(event.searchTerm.toLowerCase())) {
          filteredGroups.add(group);
        }
      }
    }

    emit(state.copyWith(filteredGroups: filteredGroups));
  }

  Future<void> _onGroupsCreateGroupStreamSubscribe(
    GroupsCreateGroupStreamSubscribe event,
    Emitter<GroupsState> emit,
  ) async {
    final stream = await GroupRepo.subscribeCreateGroup();

    emit(
      state.copyWith(
        createGroupStreamSubscription: stream.listen(
          (event) {
            if (event.data != null) {
              final data = jsonDecode(event.data!) as Map<String, dynamic>;
              final group = Group.fromJson(
                data['onCreateGroup'] as Map<String, dynamic>,
              );
              final groups = state.groups ?? [];
              final isApproved = group.isApproved ?? false;
              final isHidden = group.isHidden ?? true;
              // ignore: cascadeinvocations
              if (!isApproved && !isHidden) {
                groups.add(group);
              }
              emit(state.copyWith(groups: groups));
            }
          },
          onError: (Object error) => logInfo(
            'subscribeCreateGroupStream(): Error in GraphQL subscription: $error',
          ),
        ),
      ),
    );
  }

  Future<void> _onGroupsUpdateGroupStreamSubscribe(
    GroupsUpdateGroupStreamSubscribe event,
    Emitter<GroupsState> emit,
  ) async {
    final stream = await GroupRepo.subscribeUpdateGroup();

    emit(
      state.copyWith(
        updateGroupStreamSubscription: stream.listen(
          (event) {
            if (event.data != null) {
              final data = jsonDecode(event.data!) as Map<String, dynamic>;
              final group = Group.fromJson(
                data['onUpdateGroup'] as Map<String, dynamic>,
              );
              final groups = state.groups ?? [];
              final isApproved = group.isApproved ?? false;
              final isHidden = group.isHidden ?? true;
              // ignore: cascadeinvocations
              if (!isApproved && !isHidden) {
                final indexFound =
                    groups.indexWhere((element) => element.id == group.id);
                if (indexFound != -1) {
                  groups[indexFound] = group;
                } else {
                  groups.add(group);
                }
              }
              emit(state.copyWith(groups: groups));
            }
          },
          onError: (Object error) => logInfo(
            'subscribeUpdateGroupStream(): Error in GraphQL subscription: $error',
          ),
        ),
      ),
    );
  }

  Future<void> _onGroupsCreateGroupStreamUnsubscribe(
    GroupsCreateGroupStreamUnsubscribe event,
    Emitter<GroupsState> emit,
  ) async {
    await state.createGroupStreamSubscription?.cancel();
  }

  Future<void> _onGroupsUpdateGroupStreamUnsubscribe(
    GroupsUpdateGroupStreamUnsubscribe event,
    Emitter<GroupsState> emit,
  ) async {
    await state.updateGroupStreamSubscription?.cancel();
  }

  Future<void> _onGroupsUserReport(
    GroupsUserReport event,
    Emitter<GroupsState> emit,
  ) async {
    await ReportedUserRepo.createReportedUser(
      userId: event.userId,
      description: event.description,
      name: event.name,
    );
  }
}
