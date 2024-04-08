// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

class GroupListItem extends StatelessWidget {
  const GroupListItem({
    super.key,
    required this.group,
    this.remainingVotes = 0,
    this.isJoined = false,
    this.isVoteLoading = false,
    this.isVoted = false,
    this.canDelete = false,
    this.canReport = false,
    this.onSelected,
    this.onGroupJoined,
    this.onVotePressed,
    required this.onDeleted,
    required this.onReported,
  });

  final Group group;
  final int remainingVotes;
  final bool isJoined;
  final bool isVoteLoading;
  final bool isVoted;
  final bool canDelete;
  final bool canReport;
  final void Function(Group)? onSelected;
  final void Function(Group)? onGroupJoined;
  final void Function()? onVotePressed;
  final void Function() onDeleted;
  final void Function() onReported;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isApproved = group.isApproved ?? false;
    final numberOfUsers = group.numberOfUsers ?? 0;
    final numberOfQuestions = group.numberOfQuestions ?? 0;
    final numberOfVotes = group.numberOfVotes ?? 0;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColourConstant.whiteF8F8F8,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextButton(
        onPressed: () => onSelected!(group),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(38.0 / 2)),
                  ),
                  child: ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: AmplifyConstant.generateFullS3FilePath(
                        FlavorConfig.instance!.flavor,
                        group.icon ?? group.groupType!.icon!,
                      ),
                      width: 55,
                      height: 55,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SpacerVertical(8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  group.name!,
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
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  label: Text(
                                    group.groupType!.name!,
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          timeago.format(group.createdAt!.getDateTimeInUtc()),
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
                    const SpacerVertical(4),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              if (!isApproved && numberOfVotes < 10) ...[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    l10n.setVotesRemaining(remainingVotes),
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: AppColourConstant.pinkFF6188,
                                        ),
                                  ),
                                ),
                              ] else ...[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    numberOfUsers <= 1
                                        ? l10n.setMember(numberOfUsers)
                                        : l10n.setMembers(numberOfUsers),
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: AppColourConstant.grey9A9A9A,
                                        ),
                                  ),
                                ),
                                const SpacerHorizontal(8),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    numberOfQuestions <= 1
                                        ? l10n.setQuestion(numberOfQuestions)
                                        : l10n.setQuestions(numberOfQuestions),
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: AppColourConstant.grey9A9A9A,
                                        ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                        if (!isApproved && numberOfVotes < 10) ...[
                          VoteButton(
                            onPressed: onVotePressed,
                            isLoading: isVoteLoading,
                            isVoted: isVoted,
                            numberOfVotes: numberOfVotes,
                          ),
                        ] else ...[
                          JoinButton(
                            onPressed:
                                isJoined ? null : () => onGroupJoined!(group),
                          ),
                        ],
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
