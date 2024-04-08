// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    super.key,
    this.avatar,
    required this.name,
  });

  final String? avatar;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColourConstant.green3AE2D6,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: Row(
        children: [
          if (avatar != null) ...[
            Container(
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(38.0 / 2)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(38.0 / 2)),
                child: AppImage.asset(avatar!, width: 40, height: 40),
              ),
            ),
            const SpacerHorizontal(8),
          ],
          Expanded(
            child: AutoSizeText(
              name,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.labelSmall,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
