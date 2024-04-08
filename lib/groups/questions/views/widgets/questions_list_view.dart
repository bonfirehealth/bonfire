part of '../questions_page.dart';

class QuestionsListView extends StatelessWidget {
  const QuestionsListView({
    super.key,
    required this.groupId,
    required this.questions,
    this.isSaveLoading = false,
    this.isVoteLoading = false,
  });

  final String groupId;
  final List<Question> questions;
  final bool isSaveLoading;
  final bool isVoteLoading;

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    final bloc = context.read<QuestionsBloc>();
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions[index];
        final questionSaves = question.saves ?? [];
        final questionVotes = question.votes ?? [];
        final isQuestionSavedTuple =
            QuestionsHelper.checkQuestionSaved(questionSaves, question.id);
        final isQuestionVotedTuple =
            QuestionsHelper.checkQuestionVoted(questionVotes, question.id);
        final questionSave = isQuestionSavedTuple?.item1;
        final isQuestionSaved = isQuestionSavedTuple?.item2 ?? false;
        final questionVote = isQuestionVotedTuple?.item1;
        final isQuestionVoted = isQuestionVotedTuple?.item2 ?? false;

        return Column(
          children: [
            QuestionListItem(
              onSelected: (Question? answer) {
                appBloc.add(
                  AppNextRoute(
                    context,
                    AnswersRoute(
                      groupId: groupId,
                      questionId: question.id,
                    ),
                  ),
                );
              },
              onSavePressed: () {
                if (isQuestionSaved) {
                  bloc.add(
                    QuestionsQuestionUnsave(
                      index,
                      question.id,
                      questionSave?.id ?? '',
                    ),
                  );
                } else {
                  bloc.add(
                    QuestionsQuestionSave(index, question.id),
                  );
                }
              },
              onVotePressed: () {
                if (isQuestionVoted) {
                  bloc.add(
                    QuestionsQuestionDownvote(
                      index,
                      question.id,
                      questionVote?.id ?? '',
                    ),
                  );
                } else {
                  bloc.add(
                    QuestionsQuestionUpvote(index, question.id),
                  );
                }
              },
              onDeleted: () {
                bloc.add(QuestionsQuestionDelete(question.id, groupId));
              },
              onReported: () {
                GroupsHelper.generateQuestionOnReportedPopupDialog(
                  context,
                  bloc,
                  question,
                );
              },
              question: question,
              isSaveLoading: isSaveLoading,
              isSaved: isQuestionSaved,
              isVoteLoading: isVoteLoading,
              isVoted: isQuestionVoted,
              canDelete: QuestionsHelper.canDeleteQuestion(question),
              canReport: QuestionsHelper.canReportUser(question),
            ),
            if (questions.length - 1 == index) ...[
              const SpacerVertical(72),
            ],
          ],
        );
      },
    );
  }
}
