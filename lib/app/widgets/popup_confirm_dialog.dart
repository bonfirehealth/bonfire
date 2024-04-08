// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class PopupConfirmDialog extends StatelessWidget {
  const PopupConfirmDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onNoPressed,
    required this.onYesPressed,
  });

  final String title;
  final String description;
  final void Function() onNoPressed;
  final void Function() onYesPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(26, 22, 26, 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SpacerVertical(4),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SpacerVertical(8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: onNoPressed,
                  child: Text(context.l10n.no),
                ),
                const SpacerHorizontal(8),
                OutlinedButton(
                  onPressed: onYesPressed,
                  child: Text(context.l10n.yes),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
