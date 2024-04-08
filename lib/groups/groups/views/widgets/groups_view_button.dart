part of '../groups_page.dart';

class GroupsViewButton extends StatelessWidget {
  const GroupsViewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    return BlocSelector<GroupsBloc, GroupsState, String>(
      selector: (state) => state.selectedGroupId ?? '',
      builder: (context, selectedGroupId) {
        return BlocBuilder<QuestionsBloc, QuestionsState>(
          builder: (context, state) {
            final questions = state.questions ?? [];
            if (questions.isEmpty) {
              return const SizedBox.shrink();
            }

            return TextButton(
              onPressed: () => appBloc.add(
                AppNextRoute(
                  context,
                  QuestionsRoute(
                    groupId: selectedGroupId,
                  ),
                ),
              ),
              child: Text(
                l10n.viewThisWeekQuestions,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            );
          },
        );
      },
    );
  }
}
