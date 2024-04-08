// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/widgets/widgets.dart';

class AnswerListItem extends StatelessWidget {
  const AnswerListItem({
    super.key,
    required this.answer,
    this.isVoteLoading = false,
    this.isVoted = false,
    this.canDelete = false,
    this.canReport = false,
    this.onSelected,
    this.onVotePressed,
    required this.onDeleted,
    required this.onReported,
  });

  final Answer answer;
  final bool isVoteLoading;
  final bool isVoted;
  final bool canDelete;
  final bool canReport;
  final void Function(Answer)? onSelected;
  final void Function()? onVotePressed;
  final void Function() onDeleted;
  final void Function() onReported;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final username = answer.user?.username ?? '';
    final files = answer.files ?? [];
    final numberOfComments = answer.numberOfComments ?? 0;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColourConstant.whiteFFFFFF,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextButton(
        onPressed: () => onSelected!(answer),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
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
                      answer.user!.photoBase64 ?? ImageConstant.profileAvatar,
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
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              l10n.setByUsername(username),
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColourConstant.grey9A9A9A,
                                  ),
                            ),
                          ),
                        ),
                        Text(
                          timeago.format(answer.createdAt!.getDateTimeInUtc()),
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
                    const SpacerVertical(8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            answer.name ?? '',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    if (answer.comments != null) ...[
                      if (answer.comments!.isNotEmpty) ...[
                        const SpacerVertical(8),
                        Row(
                          children: [
                            Text(
                              '${l10n.topComment}: ',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            TopCard(
                              avatar: answer.comments![0].user?.photoBase64 ??
                                  ImageConstant.profileAvatar,
                              name: answer.comments![0].name!,
                            ),
                          ],
                        ),
                      ],
                    ],
                    if (files.isNotEmpty) ...[
                      const SpacerVertical(8),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemCount: files.length,
                          itemBuilder: (BuildContext context, int index) {
                            final file = files[index];
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
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              numberOfComments <= 1
                                  ? l10n.setComment(numberOfComments)
                                  : l10n.setComments(numberOfComments),
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: numberOfComments <= 1
                                        ? AppColourConstant.grey9A9A9A
                                        : AppColourConstant.purple821F8B,
                                    fontWeight: numberOfComments <= 1
                                        ? FontWeight.normal
                                        : FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              VoteButton(
                                onPressed: onVotePressed,
                                isLoading: isVoteLoading,
                                isVoted: isVoted,
                                numberOfVotes: answer.numberOfVotes ?? 0,
                              ),
                            ],
                          ),
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
