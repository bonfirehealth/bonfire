part of '../web_screening_page.dart';

class VitalBoxLoader extends StatelessWidget {
  const VitalBoxLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 135,
          height: 135,
          decoration: BoxDecoration(
            color: AppColourConstant.greyE6EFFF,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              FadeShimmer(
                height: 24,
                width: double.infinity,
                radius: 16,
                highlightColor: AppColourConstant.grey9A9A9A,
                baseColor: AppColourConstant.greyE6EFFF,
                millisecondsDelay: 300,
              ),
              SpacerVertical(16),
              FadeShimmer(
                height: 24,
                width: 50,
                radius: 16,
                highlightColor: AppColourConstant.grey9A9A9A,
                baseColor: AppColourConstant.greyE6EFFF,
                millisecondsDelay: 600,
              ),
            ],
          ),
        ),
        Positioned(
          top: 2,
          left: 2,
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
