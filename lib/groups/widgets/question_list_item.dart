// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

class QuestionListItem extends StatelessWidget {
  const QuestionListItem({
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
    final l10n = context.l10n;
    final username = question.user?.username ?? '';
    final numberOfAnswers = question.numberOfAnswers ?? 0;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColourConstant.whiteFFFFFF,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextButton(
        onPressed: () => onSelected!(question),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  alignment: Alignment.topCenter,
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(38.0 / 2)),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(38.0 / 2)),
                    child: AppImage.asset(
                      question.user!.photoBase64 ?? ImageConstant.profileAvatar,
                      width: 38,
                      height: 38,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.setByUsername(username),
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColourConstant.grey9A9A9A,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          timeago
                              .format(question.createdAt!.getDateTimeInUtc()),
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColourConstant.blue8DA2CD),
                        ),
                        if (canDelete || canReport) ...[
                          const SpacerHorizontal(8),
                          InkWell(
                            onTap: () => showDialog<void>(
                              useSafeArea: false,
                              context: context,
                              builder: (BuildContext context) {
                                return PopupDoubleMenuDialog(
                                  onButtonPressed1: () {
                                    onDeleted();
                                    FocusScope.of(context).unfocus();
                                    Navigator.of(context).pop();
                                  },
                                  onButtonPressed2: () {
                                    onReported();
                                    FocusScope.of(context).unfocus();
                                    Navigator.of(context).pop();
                                  },
                                  buttonText1: l10n.delete,
                                  buttonText2: l10n.reportUser,
                                  buttonBackground1:
                                      AppColourConstant.pinkFF6188,
                                  showButton1: canDelete,
                                  showButton2: canReport,
                                );
                              },
                            ),
                            child: const Icon(
                              FontAwesomeIcons.chevronDown,
                              size: 15,
                            ),
                          ),
                        ],
                      ],
                    ),
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
                                      .bodyLarge
                                      ?.copyWith(
                                        color: AppColourConstant.grey50535A,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              // if (question.description != null) ...[
                              //   Text(
                              //     question.description ?? '',
                              //     textAlign: TextAlign.left,
                              //     style: Theme.of(context).textTheme.bodyMedium,
                              //   ),
                              // ],
                              const SpacerVertical(8),
                              if (question.answers != null) ...[
                                if (question.answers!.isNotEmpty) ...[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${l10n.topAnswer}: ',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      TopCard(
                                        avatar: question.answers![0].user
                                                ?.photoBase64 ??
                                            ImageConstant.profileAvatar,
                                        name: question.answers![0].name!,
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              numberOfAnswers <= 1
                                  ? l10n.setAnswer(numberOfAnswers)
                                  : l10n.setAnswers(numberOfAnswers),
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: numberOfAnswers <= 1
                                        ? AppColourConstant.grey9A9A9A
                                        : AppColourConstant.purple821F8B,
                                    fontWeight: numberOfAnswers <= 1
                                        ? FontWeight.normal
                                        : FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SaveButton(
                              onPressed: onSavePressed,
                              isLoading: isSaveLoading,
                              isSaved: isSaved,
                              numberOfSaves: question.numberOfSaves ?? 0,
                            ),
                            VoteButton(
                              onPressed: onVotePressed,
                              isLoading: isVoteLoading,
                              isVoted: isVoted,
                              numberOfVotes: question.numberOfVotes ?? 0,
                            ),
                          ],
                        ),
                      ],
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
