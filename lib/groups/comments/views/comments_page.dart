// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

part 'widgets/comments_app_bar.dart';
part 'widgets/comments_chat_box.dart';
part 'widgets/comments_floating_action_button.dart';
part 'widgets/comments_list_view.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CommentsAppBar(answerId: answerId),
      ),
      body: SafeArea(
        child: CommentsBody(
          groupId: groupId,
          questionId: questionId,
          answerId: answerId,
        ),
      ),
      floatingActionButton: CommentsFloatingActionButton(
        groupId: groupId,
        questionId: questionId,
        answerId: answerId,
      ),
    );
  }
}

class CommentsBody extends StatefulWidget {
  const CommentsBody({
    super.key,
    required this.groupId,
    required this.questionId,
    required this.answerId,
  });

  final String groupId;
  final String questionId;
  final String answerId;

  @override
  State<CommentsBody> createState() => CommentsBodyState();
}

class CommentsBodyState extends State<CommentsBody>
    with AfterLayoutMixin<CommentsBody> {
  @override
  void afterFirstLayout(BuildContext context) {
    context.read<AnswersBloc>().add(AnswersSelectedAnswerSet(widget.answerId));
    final selectedAnswer = context.read<AnswersBloc>().selectedAnswer;
    context.read<CommentsBloc>()
      ..add(const CommentsIsLoadingSet())
      ..add(CommentsAnswerSet(widget.answerId, selectedAnswer))
      ..add(const CommentsAnswerGet())
      ..add(const CommentsCreateCommentStreamUnsubscribe())
      ..add(const CommentsUpdateCommentStreamUnsubscribe())
      ..add(const CommentsCreateCommentStreamSubscribe())
      ..add(const CommentsUpdateCommentStreamSubscribe())
      ..add(const CommentsAllCommentsGet());

    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      context
          .read<CommentsBloc>()
          .add(const CommentsIsLoadingSet(isLoading: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<CommentsBloc>();

    return ColoredBox(
      color: Theme.of(context).primaryColor,
      child: PageViewX(
        child: Expanded(
          child: BlocBuilder<CommentsBloc, CommentsState>(
            builder: (context, state) {
              var comments = state.comments ?? [];

              final filteredComments = state.filteredComments;

              if (filteredComments != null) {
                comments = filteredComments;
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

              if (comments.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      NoDataCard(
                        image: ImageConstant.alissaAvatar,
                        text: l10n.noComments,
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
                  CommentsListView(
                    groupId: widget.groupId,
                    questionId: widget.questionId,
                    answerId: widget.answerId,
                    comments: comments,
                    isVoteLoading: state.isVoteLoading,
                  ),
                  Positioned(
                    bottom: 85,
                    child: BlocSelector<CommentsBloc, CommentsState,
                        List<CommentFile>?>(
                      selector: (state) => state.newCommentFiles,
                      builder: (context, newCommentFiles) {
                        if (newCommentFiles == null) {
                          return const SizedBox.shrink();
                        }
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: newCommentFiles.length,
                            itemBuilder: (BuildContext context, int index) {
                              final file = newCommentFiles[index];
                              const isLocal = false;

                              return Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.6,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: isLocal
                                          // ignore: dead_code
                                          ? AppImage.asset(
                                              file.url!,
                                              fit: BoxFit.cover,
                                              width: 120,
                                              height: 120,
                                            )
                                          : CachedNetworkImage(
                                              imageUrl: file.url!,
                                              placeholder: (context, url) =>
                                                  SpinKitCircle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              fit: BoxFit.cover,
                                              width: 120,
                                              height: 120,
                                            ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -10,
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () => bloc.add(
                                        CommentsFileDelete(index, file.key!),
                                      ),
                                      icon: AppImage.asset(
                                        ImageConstant.closeCross,
                                        color: Theme.of(context).primaryColor,
                                        width: 15,
                                        height: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
