part of '../answers_page.dart';

class AnswersFloatingActionButton extends StatelessWidget {
  const AnswersFloatingActionButton({
    super.key,
    required this.groupId,
    required this.questionId,
  });

  final String groupId;
  final String questionId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<AnswersBloc>();
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: ChatBox(
        hintText: l10n.addAnAnswer,
        onImagePressed: () => bloc.add(const AnswersNewFilesPick()),
        onSubmit: (value) => bloc
          ..add(AnswersAnswerCreate(groupId, questionId, value))
          ..add(const AnswersAllAnswersGet()),
      ),
    );
  }
}
