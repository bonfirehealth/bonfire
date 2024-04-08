// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fade_shimmer/fade_shimmer.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class ListItemLoader extends StatelessWidget {
  const ListItemLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: AppColourConstant.greyE6EFFF,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: FadeShimmer.round(
              size: 50,
              highlightColor: AppColourConstant.grey9A9A9A,
              baseColor: AppColourConstant.greyE6EFFF,
              millisecondsDelay: 600,
            ),
          ),
          const SpacerHorizontal(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Expanded(
                      flex: 4,
                      child: FadeShimmer(
                        height: 20,
                        width: double.infinity,
                        radius: 16,
                        highlightColor: AppColourConstant.grey9A9A9A,
                        baseColor: AppColourConstant.greyE6EFFF,
                        millisecondsDelay: 300,
                      ),
                    ),
                    SpacerHorizontal(8),
                    Expanded(
                      child: FadeShimmer(
                        height: 20,
                        width: double.infinity,
                        radius: 16,
                        highlightColor: AppColourConstant.grey9A9A9A,
                        baseColor: AppColourConstant.greyE6EFFF,
                        millisecondsDelay: 300,
                      ),
                    ),
                  ],
                ),
                const SpacerVertical(8),
                const FadeShimmer(
                  height: 20,
                  width: 50,
                  radius: 16,
                  highlightColor: AppColourConstant.grey9A9A9A,
                  baseColor: AppColourConstant.greyE6EFFF,
                  millisecondsDelay: 600,
                ),
                const SpacerVertical(8),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: const [
                          FadeShimmer(
                            height: 12,
                            width: 50,
                            radius: 16,
                            highlightColor: AppColourConstant.grey9A9A9A,
                            baseColor: AppColourConstant.greyE6EFFF,
                            millisecondsDelay: 600,
                          ),
                          FadeShimmer(
                            height: 12,
                            width: 50,
                            radius: 16,
                            highlightColor: AppColourConstant.grey9A9A9A,
                            baseColor: AppColourConstant.greyE6EFFF,
                            millisecondsDelay: 600,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
