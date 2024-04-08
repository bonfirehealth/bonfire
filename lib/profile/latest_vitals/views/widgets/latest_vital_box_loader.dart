part of '../latest_vitals_page.dart';

class LatestVitalBoxLoader extends StatelessWidget {
  const LatestVitalBoxLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            color: AppColourConstant.greyE6EFFF,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              FadeShimmer(
                height: 24,
                width: 100,
                radius: 16,
                highlightColor: AppColourConstant.grey9A9A9A,
                baseColor: AppColourConstant.greyE6EFFF,
                millisecondsDelay: 300,
              ),
              SpacerVertical(16),
              FadeShimmer(
                height: 14,
                width: double.maxFinite,
                radius: 12,
                highlightColor: AppColourConstant.grey9A9A9A,
                baseColor: AppColourConstant.greyE6EFFF,
                millisecondsDelay: 600,
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 6,
          child: FadeShimmer.round(
            size: 25,
            highlightColor: AppColourConstant.grey9A9A9A,
            baseColor: AppColourConstant.greyE6EFFF,
            millisecondsDelay: 600,
          ),
        ),
      ],
    );
  }
}
