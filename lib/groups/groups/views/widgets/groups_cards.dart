part of '../groups_page.dart';

class GroupsPageCards extends StatelessWidget {
  const GroupsPageCards({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final questionsBloc = context.read<QuestionsBloc>();
    return BlocSelector<GroupsBloc, GroupsState, String>(
      selector: (state) => state.selectedGroupId ?? '',
      builder: (context, selectedGroupId) {
        return BlocBuilder<QuestionsBloc, QuestionsState>(
          builder: (context, state) {
            var questions = state.questions;
            final filteredQuestions = state.filteredQuestions;

            if (filteredQuestions != null) {
              questions = filteredQuestions;
            }
            if (state.isLoading || questions == null) {
              return SizedBox(
                height: 308,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.85),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return const ListCardLoader();
                  },
                ),
              );
            }

            if (questions.isEmpty) {
              return Container(
                padding: const EdgeInsets.all(8),
                child: NoDataCard(
                  image: ImageConstant.alissaAvatar,
                  text: l10n.noQuestions,
                ),
              );
            }

            return SizedBox(
              height: 308,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) {
                  final question = questions![index];
                  final questionSaves = question.saves ?? [];
                  final questionVotes = question.votes ?? [];
                  final isQuestionSavedTuple =
                      QuestionsHelper.checkQuestionSaved(
                    questionSaves,
                    question.id,
                  );
                  final isQuestionVotedTuple =
                      QuestionsHelper.checkQuestionVoted(
                    questionVotes,
                    question.id,
                  );
                  final questionSave = isQuestionSavedTuple?.item1;
                  final isQuestionSaved = isQuestionSavedTuple?.item2 ?? false;
                  final questionVote = isQuestionVotedTuple?.item1;
                  final isQuestionVoted = isQuestionVotedTuple?.item2 ?? false;

                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: QuestionCard(
                      onSelected: (Question? answer) {
                        appBloc.add(
                          AppNextRoute(
                            context,
                            AnswersRoute(
                              groupId: selectedGroupId,
                              questionId: question.id,
                            ),
                          ),
                        );
                      },
                      onSavePressed: () {
                        if (isQuestionSaved) {
                          questionsBloc.add(
                            QuestionsQuestionUnsave(
                              index,
                              question.id,
                              questionSave?.id ?? '',
                            ),
                          );
                        } else {
                          questionsBloc.add(
                            QuestionsQuestionSave(index, question.id),
                          );
                        }
                      },
                      onVotePressed: () {
                        if (isQuestionVoted) {
                          questionsBloc.add(
                            QuestionsQuestionDownvote(
                              index,
                              question.id,
                              questionVote?.id ?? '',
                            ),
                          );
                        } else {
                          questionsBloc.add(
                            QuestionsQuestionUpvote(index, question.id),
                          );
                        }
                      },
                      onDeleted: () {
                        questionsBloc.add(
                          QuestionsQuestionDelete(
                            question.id,
                            selectedGroupId,
                          ),
                        );
                      },
                      onReported: () {
                        GroupsHelper.generateQuestionOnReportedPopupDialog(
                          context,
                          questionsBloc,
                          question,
                        );
                      },
                      question: question,
                      isSaveLoading: state.isSaveLoading,
                      isSaved: isQuestionSaved,
                      isVoteLoading: state.isVoteLoading,
                      isVoted: isQuestionVoted,
                      canDelete: QuestionsHelper.canDeleteQuestion(question),
                      canReport: QuestionsHelper.canReportUser(question),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
