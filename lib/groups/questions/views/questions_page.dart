// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

part 'widgets/questions_app_bar.dart';
part 'widgets/questions_floating_action_button.dart';
part 'widgets/questions_list_view.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({
    super.key,
    @pathParam required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: QuestionsAppBar(groupId: groupId),
      ),
      body: QuestionsBody(groupId: groupId),
      // floatingActionButton: const QuestionsFloatingActionButton(),
    );
  }
}

class QuestionsBody extends StatefulWidget {
  const QuestionsBody({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  State<QuestionsBody> createState() => QuestionsBodyState();
}

class QuestionsBodyState extends State<QuestionsBody>
    with AfterLayoutMixin<QuestionsBody> {
  @override
  void afterFirstLayout(BuildContext context) {
    final group = context.read<GroupsBloc>().selectedGroup;
    context.read<QuestionsBloc>()
      ..add(const QuestionsIsLoadingSet())
      ..add(QuestionsGroupSet(widget.groupId, group))
      ..add(const QuestionsCreateQuestionStreamUnsubscribe())
      ..add(const QuestionsUpdateQuestionStreamUnsubscribe())
      ..add(const QuestionsCreateQuestionStreamSubscribe())
      ..add(const QuestionsUpdateQuestionStreamSubscribe())
      ..add(const QuestionsAllQuestionsGet());

    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      context
          .read<QuestionsBloc>()
          .add(const QuestionsIsLoadingSet(isLoading: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ColoredBox(
      color: Theme.of(context).primaryColor,
      child: PageViewX(
        child: Expanded(
          child: BlocBuilder<QuestionsBloc, QuestionsState>(
            builder: (context, state) {
              var questions = state.questions ?? [];
              final filteredQuestions = state.filteredQuestions;

              if (filteredQuestions != null) {
                questions = filteredQuestions;
              }

              if (state.isLoading) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children:
                        List.generate(5, (index) => const ListItemLoader()),
                  ),
                );
              }

              if (questions.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      NoDataCard(
                        image: ImageConstant.alissaAvatar,
                        text: l10n.noQuestions,
                      ),
                      const Expanded(
                        child: SizedBox.shrink(),
                      ),
                    ],
                  ),
                );
              }

              return QuestionsListView(
                groupId: widget.groupId,
                questions: questions,
                isSaveLoading: state.isSaveLoading,
                isVoteLoading: state.isVoteLoading,
              );
            },
          ),
        ),
      ),
    );
  }
}
