part of '../comments_page.dart';

class CommentsFloatingActionButton extends StatelessWidget {
  const CommentsFloatingActionButton({
    super.key,
    required this.groupId,
    required this.questionId,
    required this.answerId,
  });

  final String groupId;
  final String questionId;
  final String answerId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<CommentsBloc>();
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: ChatBox(
        hintText: l10n.addAComment,
        onImagePressed: () => bloc.add(const CommentsNewFilesPick()),
        onSubmit: (value) => bloc
          ..add(
            CommentsCommentCreate(
              groupId,
              questionId,
              answerId,
              value,
            ),
          )
          ..add(const CommentsAllCommentsGet()),
      ),
    );
  }
}
