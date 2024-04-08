// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';
import 'package:bonfirehealth/profile/profile.dart';

part 'widgets/groups_bubbles.dart';
part 'widgets/groups_cards.dart';
part 'widgets/groups_floating_action_button.dart';
part 'widgets/groups_view_button.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GroupsBody(),
      floatingActionButton: GroupsFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class GroupsBody extends StatefulWidget {
  const GroupsBody({super.key});

  @override
  State<GroupsBody> createState() => _GroupsBodyState();
}

class _GroupsBodyState extends State<GroupsBody>
    with AfterLayoutMixin<GroupsBody>, WidgetsBindingObserver {
  @override
  void afterFirstLayout(BuildContext context) {
    context.read<ProfileHomeBloc>().add(const ProfileHomeInitSet());
    context.read<GroupsBloc>()
      ..add(const GroupsAllGroupsGet())
      ..add(const GroupsAllGroupTypesGet())
      ..add(const GroupsAllUserGroupsGet())
      ..add(const GroupsCreateGroupStreamUnsubscribe())
      ..add(const GroupsUpdateGroupStreamUnsubscribe())
      ..add(const GroupsCreateGroupStreamSubscribe())
      ..add(const GroupsUpdateGroupStreamSubscribe());

    Future<void>.delayed(const Duration(milliseconds: 2500), () {
      context.read<GroupsBloc>()
        ..add(GroupsFirstGroupSelect(context))
        ..add(const GroupsIsLoadingSet(isLoading: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageViewX(
      child: Column(
        children: const [
          GroupsBubbles(),
          SpacerVertical(32),
          GroupsPageCards(),
          SpacerVertical(16),
          GroupsViewButton(),
        ],
      ),
    );
  }
}
