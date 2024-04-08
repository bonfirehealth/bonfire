// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fade_shimmer/fade_shimmer.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class ListBubbleLoader extends StatelessWidget {
  const ListBubbleLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: FadeShimmer.round(
            size: 80,
            highlightColor: AppColourConstant.greyE6EFFF,
            baseColor: AppColourConstant.grey9A9A9A,
            millisecondsDelay: 600,
          ),
        ),
        const SpacerVertical(8),
        const FadeShimmer(
          height: 15,
          width: 50,
          radius: 16,
          highlightColor: AppColourConstant.greyE6EFFF,
          baseColor: AppColourConstant.grey9A9A9A,
          millisecondsDelay: 300,
        ),
      ],
    );
  }
}
