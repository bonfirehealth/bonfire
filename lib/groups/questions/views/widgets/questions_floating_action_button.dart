part of '../questions_page.dart';

class QuestionsFloatingActionButton extends StatelessWidget {
  const QuestionsFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<QuestionsBloc>();
    return FloatingActionButton(
      onPressed: () => showDialog<void>(
        useSafeArea: false,
        context: context,
        builder: (BuildContext context) {
          final group = bloc.group;
          if (group == null) {
            return const SizedBox.shrink();
          }
          return PopupQuestionForm(
            onTextChanged: (value) =>
                bloc.add(QuestionsNewQuestionNameSet(value)),
            onSubmit: (id, value, name, description) {
              bloc.add(QuestionsQuestionCreate(id, name, description));
              FocusScope.of(context).unfocus();
              Navigator.of(context).pop();
            },
            group: group,
            submitText: l10n.send,
          );
        },
      ),
      heroTag: 'groupquestion',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(
        Icons.add,
        size: 35,
      ),
    );
  }
}
