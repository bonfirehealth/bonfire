// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fade_shimmer/fade_shimmer.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class ListCardLoader extends StatelessWidget {
  const ListCardLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: AppColourConstant.greyE6EFFF,
        borderRadius: BorderRadius.circular(32),
      ),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(32),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 4,
                        child: FadeShimmer(
                          height: 40,
                          width: double.infinity,
                          radius: 16,
                          highlightColor: AppColourConstant.grey9A9A9A,
                          baseColor: AppColourConstant.greyE6EFFF,
                          millisecondsDelay: 300,
                        ),
                      ),
                    ],
                  ),
                  const SpacerVertical(16),
                  Row(
                    children: const [
                      FadeShimmer(
                        height: 34,
                        width: 100,
                        radius: 8,
                        highlightColor: AppColourConstant.grey9A9A9A,
                        baseColor: AppColourConstant.greyE6EFFF,
                        millisecondsDelay: 600,
                      ),
                    ],
                  ),
                  const SpacerVertical(16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 4,
                        child: FadeShimmer(
                          height: 40,
                          width: double.infinity,
                          radius: 16,
                          highlightColor: AppColourConstant.grey9A9A9A,
                          baseColor: AppColourConstant.greyE6EFFF,
                          millisecondsDelay: 300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
