// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class VoteButton extends StatelessWidget {
  const VoteButton({
    super.key,
    this.isLoading = false,
    this.isVoted = false,
    required this.numberOfVotes,
    this.onPressed,
  });

  final bool isLoading;
  final bool isVoted;
  final int numberOfVotes;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Row(
        children: [
          if (isLoading) ...[
            if (!isVoted) ...[
              const Icon(
                Icons.star_border,
                color: AppColourConstant.green3AE2D6,
              ),
            ] else ...[
              const Icon(
                Icons.star,
                color: AppColourConstant.green3AE2D6,
              ),
            ],
          ] else ...[
            if (!isVoted) ...[
              const Icon(
                Icons.star_border,
                color: AppColourConstant.green3AE2D6,
              ),
            ] else ...[
              const Icon(
                Icons.star,
                color: AppColourConstant.green3AE2D6,
              ),
            ],
          ],
          const SpacerHorizontal(4),
          Text(
            numberOfVotes <= 1
                ? l10n.setVote(numberOfVotes)
                : l10n.setVotes(numberOfVotes),
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColourConstant.grey9A9A9A),
          ),
        ],
      ),
    );
  }
}
