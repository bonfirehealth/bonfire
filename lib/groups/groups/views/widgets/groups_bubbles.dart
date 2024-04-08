part of '../groups_page.dart';

class GroupsBubbles extends StatelessWidget {
  const GroupsBubbles({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<GroupsBloc>();
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 120,
            child: BlocBuilder<GroupsBloc, GroupsState>(
              builder: (context, state) {
                var groups = state.groups ?? [];
                final filteredGroups = state.filteredGroups;

                if (filteredGroups != null) {
                  groups = filteredGroups;
                }

                if (state.isLoading) {
                  return Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: const [
                              ListBubbleLoader(),
                              SpacerHorizontal(8),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }

                if (!state.isLoading && groups.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: NoDataCard(
                      image: ImageConstant.alissaAvatar,
                      text: l10n.noGroups,
                    ),
                  );
                }

                return Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: groups.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final group = groups[index];
                      final groupVotes = group.votes ?? [];
                      final isGroupVotedTuple = GroupsHelper.checkGroupVoted(
                        groupVotes,
                        group.id,
                      );
                      final groupVote = isGroupVotedTuple?.item1;
                      final isGroupVoted = isGroupVotedTuple?.item2 ?? false;

                      return FutureBuilder<bool>(
                        future: GroupsHelper.checkGroupJoined(
                          group.id,
                          state.userGroups,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final isJoined = snapshot.data!;

                            return GroupListBubble(
                              onSelected: (Group? group) {
                                bloc.add(
                                  GroupsSelectedGroupSet(
                                    index,
                                    group,
                                  ),
                                );

                                context.read<QuestionsBloc>()
                                  ..add(QuestionsGroupSet(group!.id, group))
                                  ..add(
                                    const QuestionsCreateQuestionStreamUnsubscribe(),
                                  )
                                  ..add(
                                    const QuestionsUpdateQuestionStreamUnsubscribe(),
                                  )
                                  ..add(
                                    const QuestionsCreateQuestionStreamSubscribe(),
                                  )
                                  ..add(
                                    const QuestionsUpdateQuestionStreamSubscribe(),
                                  )
                                  ..add(const QuestionsGroupGet())
                                  ..add(const QuestionsAllQuestionsGet());
                              },
                              onGroupJoined: (Group? group) =>
                                  isJoined ? null : bloc
                                    ?..add(GroupsGroupJoin(group!.id))
                                    ..add(const GroupsAllUserGroupsGet()),
                              onVotePressed: () {
                                if (isGroupVoted) {
                                  bloc.add(
                                    GroupsGroupDownvote(
                                      index,
                                      group.id,
                                      groupVote?.id ?? '',
                                    ),
                                  );
                                } else {
                                  bloc.add(
                                    GroupsGroupUpvote(
                                      index,
                                      group.id,
                                    ),
                                  );
                                }
                              },
                              onDeleted: () {
                                bloc.add(GroupsGroupDelete(group.id));
                              },
                              onReported: () {
                                GroupsHelper.generateGroupOnReportedPopupDialog(
                                  context,
                                  bloc,
                                  group,
                                );
                              },
                              group: group,
                              isJoined: isJoined,
                              isSelected: state.selectedGroupId != null &&
                                  state.selectedIndex == index,
                              isVoteLoading: state.isVoteLoading ?? false,
                              isVoted: isGroupVoted,
                              canDelete: GroupsHelper.canDeleteGroup(group),
                              canReport: GroupsHelper.canReportUser(group),
                              remainingVotes: GroupsHelper
                                  .checkGroupVoteCountRemainingToApprove(
                                group,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
