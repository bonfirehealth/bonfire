part of '../answers_page.dart';

class AnswersListView extends StatelessWidget {
  const AnswersListView({
    super.key,
    required this.groupId,
    required this.questionId,
    required this.answers,
    this.isVoteLoading = false,
  });

  final String groupId;
  final String questionId;
  final List<Answer> answers;

  final bool isVoteLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final bloc = context.read<AnswersBloc>();
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: answers.length,
      itemBuilder: (BuildContext context, int index) {
        final answer = answers[index];
        final answerVotes = answer.votes ?? [];
        final isAnswerVotedTuple =
            AnswersHelper.checkAnswerVoted(answerVotes, answer.id);
        final answerVote = isAnswerVotedTuple?.item1;
        final isAnswerVoted = isAnswerVotedTuple?.item2 ?? false;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnswerListItem(
              onSelected: (Answer? answer) {
                appBloc.add(
                  AppNextRoute(
                    context,
                    CommentsRoute(
                      groupId: groupId,
                      questionId: questionId,
                      answerId: answer!.id,
                    ),
                  ),
                );
              },
              onVotePressed: () {
                if (isAnswerVoted) {
                  bloc.add(
                    AnswersAnswerDownvote(
                      index,
                      answer.id,
                      answerVote?.id ?? '',
                    ),
                  );
                } else {
                  bloc.add(
                    AnswersAnswerUpvote(index, answer.id),
                  );
                }
              },
              onDeleted: () {
                bloc.add(
                  AnswersAnswerDelete(answer.id, questionId),
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
                          AnswersUserReport(
                            answer.user!.id,
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
              answer: answer,
              isVoteLoading: isVoteLoading,
              isVoted: isAnswerVoted,
              canDelete: AnswersHelper.canDeleteAnswer(answer),
              canReport: AnswersHelper.canReportUser(answer),
            ),
            if (answers.length - 1 == index) ...[
              const SpacerVertical(72),
            ],
          ],
        );
      },
    );
  }
}
