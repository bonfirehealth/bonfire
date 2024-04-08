// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
    this.isSaveLoading = false,
    this.isSaved = false,
    this.isVoteLoading = false,
    this.isVoted = false,
    this.canDelete = false,
    this.canReport = false,
    this.onSelected,
    this.onSavePressed,
    this.onVotePressed,
    required this.onDeleted,
    required this.onReported,
  });

  final Question question;
  final bool isVoteLoading;
  final bool isVoted;
  final bool isSaveLoading;
  final bool isSaved;
  final bool canDelete;
  final bool canReport;
  final void Function(Question)? onSelected;
  final void Function()? onSavePressed;
  final void Function()? onVotePressed;
  final void Function() onDeleted;
  final void Function() onReported;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final l10n = context.l10n;

    return InkWell(
      onTap: () => onSelected!(question),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColourConstant.whiteEFF3FB),
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColourConstant.black1E1F2B.withOpacity(0.4),
              blurRadius: 2,
            ),
          ],
        ),
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(16),
        width: width,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      question.name!,
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: AppColourConstant.grey50535A,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  const SpacerVertical(16),
                                  if (question.answers != null) ...[
                                    if (question.answers!.isNotEmpty) ...[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              TopButton(
                                                onPressed: () =>
                                                    onSelected!(question),
                                                text: l10n.topAnswer,
                                              ),
                                            ],
                                          ),
                                          const SpacerVertical(8),
                                          Text(
                                            question.answers![0].name!,
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ] else ...[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              TopButton(
                                                onPressed: () =>
                                                    onSelected!(question),
                                                text: l10n.shareYourAnswer,
                                              ),
                                            ],
                                          ),
                                          const SpacerVertical(8),
                                        ],
                                      ),
                                    ],
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SpacerVertical(8),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SaveIconButton(
                      onPressed: onSavePressed,
                      isLoading: isSaveLoading,
                      isSaved: isSaved,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
