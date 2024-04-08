part of '../groups_page.dart';

class GroupsFloatingActionButton extends StatelessWidget {
  const GroupsFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<GroupsBloc>();
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      height: 60,
      child: RoundedButton(
        onPressed: () => showDialog<void>(
          useSafeArea: false,
          context: context,
          builder: (BuildContext context) {
            return BlocBuilder<GroupsBloc, GroupsState>(
              builder: (context, state) {
                final groups = state.groups;
                if (groups == null) {
                  return const SizedBox.shrink();
                }
                return PopupQuestionForm(
                  onTextChanged: (value) =>
                      bloc.add(GroupsNewQuestionNameSet(value)),
                  onSubmit: (id, value, name, description) {
                    bloc.add(
                      GroupsQuestionCreate(
                        context,
                        id,
                        name,
                        description,
                      ),
                    );
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  },
                  group: groups[0],
                  submitText: l10n.getHelpNow,
                );
              },
            );
          },
        ),
        title: l10n.askPeerForSupport,
      ),
    );
  }
}
