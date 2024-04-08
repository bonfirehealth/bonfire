part of '../latest_vitals_page.dart';

class LatestVitalBoxesLoader extends StatelessWidget {
  const LatestVitalBoxesLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const title = FadeShimmer(
      height: 28,
      width: 128,
      radius: 10,
      highlightColor: AppColourConstant.grey9A9A9A,
      baseColor: AppColourConstant.textFieldGreyFillF4F4F8,
      millisecondsDelay: 300,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Align(
        alignment: Alignment.topRight,
        child: isTrialCustomer
            ? SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 30),
                    title,
                    SizedBox(height: 6),
                    LatestVitalBoxLoader(),
                    SizedBox(height: 36),
                    title,
                    SizedBox(height: 6),
                    LatestVitalBoxLoader(),
                  ],
                ),
              )
            : SizedBox(
                width: 330,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    title,
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        LatestVitalBoxLoader(),
                        SizedBox(width: 10),
                        LatestVitalBoxLoader(),
                      ],
                    ),
                    const SizedBox(height: 36),
                    title,
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        LatestVitalBoxLoader(),
                        SizedBox(width: 10),
                        LatestVitalBoxLoader(),
                      ],
                    ),
                    const SizedBox(height: 36),
                    title,
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        LatestVitalBoxLoader(),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
