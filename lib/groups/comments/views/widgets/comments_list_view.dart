part of '../comments_page.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    super.key,
    required this.groupId,
    required this.questionId,
    required this.answerId,
    required this.comments,
    this.isVoteLoading = false,
  });

  final String groupId;
  final String questionId;
  final String answerId;
  final List<Comment> comments;

  final bool isVoteLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<CommentsBloc>();
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: comments.length,
      itemBuilder: (BuildContext context, int index) {
        final comment = comments[index];
        final commentVotes = comment.votes ?? [];
        final isCommentVotedTuple =
            CommentsHelper.checkCommentVoted(commentVotes, comment.id);
        final commentVote = isCommentVotedTuple?.item1;
        final isCommentVoted = isCommentVotedTuple?.item2 ?? false;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommentListItem(
              onSelected: (Comment? comment) {},
              onVotePressed: () {
                if (isCommentVoted) {
                  bloc.add(
                    CommentsCommentDownvote(
                      index,
                      comment.id,
                      commentVote?.id ?? '',
                    ),
                  );
                } else {
                  bloc.add(CommentsCommentUpvote(index, comment.id));
                }
              },
              onDeleted: () {
                bloc.add(
                  CommentsCommentDelete(
                    comment.id,
                    answerId,
                  ),
                );
              },
              onReported: () {
                showDialog<void>(
                  useSafeArea: false,
                  context: context,
                  builder: (BuildContext context) {
                    return PopupForm(
                      onTitleTextChanged: (String value) {},
                      onDescriptionTextChanged: (String value) {},
                      onSubmit: (String title, String description) {
                        bloc.add(
                          CommentsUserReport(
                            comment.user!.id,
                            title,
                            description,
                          ),
                        );
                        Navigator.of(context).pop();
                        showDialog<void>(
                          useSafeArea: false,
                          context: context,
                          builder: (BuildContext context) {
                            return PopupTextDialog(
                              onButtonPressed: () {
                                FocusScope.of(context).unfocus();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              buttonText: l10n.ok,
                              title: l10n.confirmReportUserTitle,
                              subtitle1: l10n.confirmReportUserSubtitle,
                              subtitle2: '',
                              subtitle3: '',
                            );
                          },
                        );
                      },
                      header: l10n.reportUser,
                      submitText: l10n.send,
                    );
                  },
                );
                showDialog<void>(
                  useSafeArea: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const SizedBox.shrink();
                  },
                );
              },
              comment: comment,
              isVoteLoading: isVoteLoading,
              isVoted: isCommentVoted,
              canDelete: CommentsHelper.canDeleteComment(comment),
              canReport: CommentsHelper.canReportUser(comment),
            ),
            if (comments.length - 1 == index) ...[
              const SpacerVertical(72),
            ],
          ],
        );
      },
    );
  }
}
