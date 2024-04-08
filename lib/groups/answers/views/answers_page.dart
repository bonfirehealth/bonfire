// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

part 'widgets/answers_app_bar.dart';
part 'widgets/answers_floating_action_button.dart';
part 'widgets/answers_list_view.dart';
part 'widgets/answers_chat_box.dart';

class AnswersPage extends StatelessWidget {
  const AnswersPage({
    super.key,
    @pathParam required this.groupId,
    @pathParam required this.questionId,
  });

  final String groupId;
  final String questionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AnswersAppBar(questionId: questionId),
      ),
      body: SafeArea(
        child: AnswersBody(
          groupId: groupId,
          questionId: questionId,
        ),
      ),
      floatingActionButton: AnswersFloatingActionButton(
        groupId: groupId,
        questionId: questionId,
      ),
    );
  }
}

class AnswersBody extends StatefulWidget {
  const AnswersBody({
    super.key,
    @pathParam required this.groupId,
    @pathParam required this.questionId,
  });

  final String groupId;
  final String questionId;

  @override
  State<AnswersBody> createState() => AnswersBodyState();
}

class AnswersBodyState extends State<AnswersBody>
    with AfterLayoutMixin<AnswersBody> {
  @override
  void afterFirstLayout(BuildContext context) {
    context.read<QuestionsBloc>().add(
          QuestionsSelectedQuestionSet(widget.questionId),
        );
    final question = context.read<QuestionsBloc>().selectedQuestion;
    context.read<AnswersBloc>()
      ..add(const AnswersIsLoadingSet())
      ..add(AnswersQuestionSet(widget.questionId, question))
      ..add(const AnswersQuestionGet())
      ..add(const AnswersCreateAnswerStreamUnsubscribe())
      ..add(const AnswersUpdateAnswerStreamUnsubscribe())
      ..add(const AnswersCreateAnswerStreamSubscribe())
      ..add(const AnswersUpdateAnswerStreamSubscribe())
      ..add(const AnswersAllAnswersGet());

    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      context
          .read<AnswersBloc>()
          .add(const AnswersIsLoadingSet(isLoading: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<AnswersBloc, AnswersState>(
      builder: (context, state) {
        var answers = state.answers ?? [];

        final filteredAnswers = state.filteredAnswers;

        if (filteredAnswers != null) {
          answers = filteredAnswers;
        }
        if (state.isLoading) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: List.generate(
                5,
                (index) {
                  return const ListItemLoader();
                },
              ),
            ),
          );
        }

        if (answers.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                NoDataCard(
                  image: ImageConstant.alissaAvatar,
                  text: l10n.noAnswers,
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
              ],
            ),
          );
        }

        return Stack(
          children: [
            AnswersListView(
              groupId: widget.groupId,
              questionId: widget.questionId,
              answers: answers,
              isVoteLoading: state.isVoteLoading,
            ),
            const AnswersChatBox(),
          ],
        );
      },
    );
  }
}
