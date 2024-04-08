// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

class GroupBubbleSelector extends StatelessWidget {
  const GroupBubbleSelector({
    super.key,
    this.selectedGroup,
    this.onSelected,
  });

  final Group? selectedGroup;
  final void Function(Group)? onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 120,
            child: BlocBuilder<GroupsBloc, GroupsState>(
              builder: (context, state) {
                var groups = state.groups;
                final filteredGroups = state.filteredGroups;

                if (filteredGroups != null) {
                  groups = filteredGroups;
                }

                if (groups == null) {
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

                if (groups.isEmpty) {
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
                      final group = groups![index];

                      return FutureBuilder<bool>(
                        future: GroupsHelper.checkGroupJoined(
                          group.id,
                          state.userGroups,
                        ),
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            final isJoined = snapshot.data!;
                            final isSelected = selectedGroup == group;

                            return GroupListBubble(
                              onSelected: onSelected,
                              onGroupJoined: (Group? group) {},
                              onVotePressed: () {},
                              onDeleted: () {},
                              onReported: () {},
                              group: group,
                              isJoined: isJoined,
                              isSelected: isSelected,
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
