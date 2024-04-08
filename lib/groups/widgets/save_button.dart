// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    this.isLoading = false,
    this.isSaved = false,
    this.numberOfSaves = 0,
    this.onPressed,
  });

  final bool isLoading;
  final bool isSaved;
  final int numberOfSaves;
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
            if (!isSaved) ...[
              const Icon(
                Icons.bookmark_outline,
                color: AppColourConstant.green3AE2D6,
              ),
            ] else ...[
              const Icon(
                Icons.bookmark,
                color: AppColourConstant.green3AE2D6,
              ),
            ],
          ] else ...[
            if (!isSaved) ...[
              const Icon(
                Icons.bookmark_outline,
                color: AppColourConstant.green3AE2D6,
              ),
            ] else ...[
              const Icon(
                Icons.bookmark,
                color: AppColourConstant.green3AE2D6,
              ),
            ],
          ],
          const SpacerHorizontal(4),
          Text(
            numberOfSaves <= 1
                ? l10n.setSave(numberOfSaves)
                : l10n.setSaves(numberOfSaves),
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
