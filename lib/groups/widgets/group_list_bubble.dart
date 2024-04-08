// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class GroupListBubble extends StatelessWidget {
  const GroupListBubble({
    super.key,
    required this.group,
    this.remainingVotes = 0,
    this.isJoined = false,
    this.isSelected = false,
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
  final bool isSelected;
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
    final isApproved = group.isApproved ?? false;
    final numberOfVotes = group.numberOfVotes ?? 0;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              if (isApproved || numberOfVotes >= 10) {
                onGroupJoined!(group);
                onSelected!(group);
              }
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(80, 80)),
              maximumSize: MaterialStateProperty.all(const Size(80, 80)),
              elevation: MaterialStateProperty.all(2),
              shape: MaterialStateProperty.all(const CircleBorder()),
              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
              backgroundColor:
                  MaterialStateProperty.all(AppColourConstant.whiteFFFFFF),
              side: isSelected
                  ? MaterialStateProperty.all(
                      const BorderSide(
                        width: 3,
                        color: AppColourConstant.blue1A56CF,
                      ),
                    )
                  : null,
              overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Theme.of(context).primaryColor;
                }
                return null;
              }),
            ),
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: AmplifyConstant.generateFullS3FilePath(
                  FlavorConfig.instance!.flavor,
                  group.icon ?? group.groupType!.icon!,
                ),
                width: 80,
                height: 80,
              ),
            ),
          ),
          const SpacerVertical(8),
          SizedBox(
            width: 80,
            height: 30,
            child: Text(
              group.name!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColourConstant.black1E1F2B,
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
