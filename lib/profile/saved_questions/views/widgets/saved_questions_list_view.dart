part of '../saved_questions_page.dart';

class SavedQuestionsListView extends StatelessWidget {
  const SavedQuestionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final questionsBloc = context.read<QuestionsBloc>();
    final bloc = context.read<SavedQuestionsBloc>();
    return BlocBuilder<SavedQuestionsBloc, SavedQuestionsState>(
      builder: (context, state) {
        final questionSaves = state.questionSaves;
        if (questionSaves == null) {
          // return const SizedBox.shrink();
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );

          return const Center(
            child: SpinKitCircle(
              color: AppColourConstant.whiteFFFFFF,
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: questionSaves.length,
          itemBuilder: (BuildContext context, int index) {
            final questionSave = questionSaves[index];
            final question = questionSave.question;
            final questionVotes = question?.votes ?? [];
            final isQuestionSavedTuple = QuestionsHelper.checkQuestionSaved(
              questionSaves,
              question!.id,
            );
            final isQuestionVotedTuple = QuestionsHelper.checkQuestionVoted(
              questionVotes,
              question.id,
            );
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
                          groupId: question.group!.id,
                          questionId: question.id,
                        ),
                      ),
                    );
                  },
                  onSavePressed: () async {
                    if (isQuestionSaved) {
                      questionsBloc.add(
                        QuestionsQuestionUnsave(
                          -1,
                          question.id,
                          questionSave.id,
                        ),
                      );
                    } else {
                      questionsBloc.add(
                        QuestionsQuestionSave(-1, question.id),
                      );
                    }
                    bloc.add(const SavedQuestionsQuestionSavesAllGet());
                  },
                  onVotePressed: () async {
                    if (isQuestionVoted) {
                      questionsBloc.add(
                        QuestionsQuestionDownvote(
                          -1,
                          question.id,
                          questionVote?.id ?? '',
                        ),
                      );
                    } else {
                      questionsBloc
                          .add(QuestionsQuestionUpvote(-1, question.id));
                    }
                    bloc.add(const SavedQuestionsQuestionSavesAllGet());
                  },
                  onDeleted: () async {
                    questionsBloc.add(
                      QuestionsQuestionDelete(
                        question.id,
                        question.group!.id,
                      ),
                    );
                    bloc.add(const SavedQuestionsQuestionSavesAllGet());
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
                            questionsBloc.add(
                              QuestionsUserReport(
                                question.user!.id,
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
                  question: question,
                  isSaved: isQuestionSaved,
                  isVoted: isQuestionVoted,
                  canDelete: QuestionsHelper.canDeleteQuestion(question),
                ),
                if (questionSaves.length - 1 == index) ...[
                  const SpacerVertical(72),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
