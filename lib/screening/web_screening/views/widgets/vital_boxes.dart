part of '../web_screening_page.dart';

class VitalBoxes extends StatefulWidget {
  const VitalBoxes({
    super.key,
    required this.assessment,
    required this.boxSize,
  });

  final ScreeningResultAssessment? assessment;
  final double boxSize;

  @override
  State<VitalBoxes> createState() => _VitalBoxesState();
}

class _VitalBoxesState extends State<VitalBoxes> with AfterLayoutMixin {
  VitalBoxSummaryCard? descriptionView;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final l10n = context.l10n;
    descriptionView = isTrialCustomer
        ? VitalBoxSummaryCard(
            symbol: l10n.heartRateSymbol,
            title: l10n.heartRate,
            normalRange: l10n.heartRateNormalRangeValues,
            description: l10n.heartRateDescription,
          )
        : VitalBoxSummaryCard(
            symbol: l10n.readinessIndexSymbol,
            title: l10n.readinessIndex,
            normalRange: l10n.readinessIndexNormalRangeValues,
            description: l10n.readinessIndexDescription,
          );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();

    final vo2Max = widget.assessment?.vo2Max ?? -1;
    final isVo2MaxNormal = vo2Max >= 27 && vo2Max <= 85;

    final bodyTemperature = widget.assessment?.bodyTemperature ?? -1;
    final isBodyTemperatureNormal =
        bodyTemperature >= 36.1 && bodyTemperature <= 37.2;

    final heartRate = widget.assessment?.heartRate ?? -1;
    final isHeartRateNormal = heartRate >= 60 && heartRate <= 100;

    final systolicBloodPressure =
        widget.assessment?.systolicBloodPressure ?? 1000;
    final diastolicBloodPressure =
        widget.assessment?.diastolicBloodPressure ?? 100;
    final isBloodPressureNormal = systolicBloodPressure > 0 &&
        systolicBloodPressure <= 140 &&
        diastolicBloodPressure > 0 &&
        diastolicBloodPressure <= 80;

    final readinessIndex = widget.assessment?.readinessIndex ?? -1;
    final isReadinessIndexNormal = readinessIndex >= 50 && readinessIndex < 100;

    return Padding(
      padding: const EdgeInsets.only(
        top: 80,
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // _buildVitalCardWithLink(
                    //   'Body Fat',
                    //   ImageConstant.bodyFat,
                    //   () {
                    //     appBloc.add(
                    //       AppNextRoutePath(
                    //         context,
                    //         'Body Fat',
                    //         '/place-holder/',
                    //         '',
                    //       ),
                    //     );
                    //   },
                    // ),
                    const SizedBox(height: 5),
                    _buildVitalCardWithLink(
                      'Fatigue',
                      ImageConstant.fatigue,
                      () {
                        appBloc.add(
                          AppNextRoutePath(
                            context,
                            'Driver Assistant',
                            '/screening/driver-assistant',
                            '',
                          ),
                        );
                      },
                    ),
                    // const SizedBox(height: 5),
                    // _buildVitalCard(
                    //   symbol: 'VO2-Max', // Replace with actual symbol
                    //   title: 'VO2-Max',
                    //   normalRange: '27-85',
                    //   description: 'VO2-Max Description',
                    //   image: ImageConstant.vo2Max, // Replace with actual image
                    //   primaryValue: widget.assessment?.vo2Max,
                    //   name: 'ml/kg/min',
                    //   fractionDigits: 2,
                    //   isNormal: isVo2MaxNormal,
                    // ),
                  ],
                )),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _buildVitalCard(
                  //   symbol: l10n.temperatureSymbol,
                  //   title: l10n.temperature,
                  //   normalRange: l10n.temperatureNormalRangeValues,
                  //   description: l10n.temperatureDescription,
                  //   image: ImageConstant.bodyTemperature,
                  //   primaryValue: widget.assessment?.bodyTemperature,
                  //   unit: '°C',
                  //   fractionDigits: 1,
                  //   isNormal: isBodyTemperatureNormal,
                  // ),
                  const SizedBox(height: 5),
                  _buildVitalCard(
                    symbol: l10n.heartRateSymbol,
                    title: l10n.heartRate,
                    normalRange: l10n.heartRateNormalRangeValues,
                    description: l10n.heartRateDescription,
                    image: ImageConstant.heartRate,
                    primaryValue: widget.assessment?.heartRate,
                    name: 'HR',
                    isNormal: isHeartRateNormal,
                  ),
                  const SizedBox(height: 5),
                  // _buildVitalCard(
                  //   symbol: l10n.bloodPressureSymbol,
                  //   title: l10n.bloodPressure,
                  //   normalRange: l10n.bloodPressureNormalRangeValues,
                  //   description: l10n.bloodPressureDescription,
                  //   image: ImageConstant.bloodPressure,
                  //   primaryValue: widget.assessment?.systolicBloodPressure,
                  //   secondaryValue: widget.assessment?.diastolicBloodPressure,
                  //   name: 'BP',
                  //   isNormal: isBloodPressureNormal,
                  // ),
                  const SizedBox(height: 5),
                  _buildVitalCard(
                    symbol: l10n.readinessIndexSymbol,
                    title: l10n.readinessIndex,
                    normalRange: l10n.readinessIndexNormalRangeValues,
                    description: l10n.readinessIndexDescription,
                    image: ImageConstant.readinessIndex,
                    primaryValue: widget.assessment?.readinessIndex,
                    secondaryValue: 100,
                    name: 'Mental',
                    subName: 'readiness',
                    isNormal: isReadinessIndexNormal,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVitalCardWithLink(
    String name,
    String image,
    VoidCallback onTapCallback,
  ) {
    return InkWell(
      onTap: onTapCallback,
      child: Container(
        decoration: BoxDecoration(
          color: AppColourConstant.black1E1F2B.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        width: widget.boxSize,
        margin: const EdgeInsets.only(
          top: 10,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage.asset(
              image,
              width: 40,
              height: 40,
            ),
            const SizedBox(height: 5),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            if (name.isNotEmpty)
              AutoSizeText(
                name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVitalCard({
    required String symbol,
    required String title,
    required String normalRange,
    required String description,
    required String image,
    required double? primaryValue,
    int fractionDigits = 0,
    double? secondaryValue,
    String? unit,
    String name = '',
    String subName = '',
    bool isNormal = true,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          descriptionView = VitalBoxSummaryCard(
            symbol: symbol,
            title: title,
            normalRange: normalRange,
            description: description,
          );
        });
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColourConstant.black1E1F2B.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            width: widget.boxSize,
            margin: const EdgeInsets.only(
              top: 10,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage.asset(
                  image,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(height: 5),
                if (primaryValue == null)
                  _buildLoaderWidget()
                else if (primaryValue < 0)
                  AutoSizeText(
                    '...',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  )
                else if ((name == 'BP' || name == 'Mental') &&
                    secondaryValue != null)
                  AutoSizeText(
                    '${primaryValue.toStringAsFixed(fractionDigits)}/${secondaryValue.toStringAsFixed(fractionDigits)}${unit != null ? ' $unit' : ''}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  )
                else
                  AutoSizeText(
                    '${primaryValue.toStringAsFixed(fractionDigits)} ${unit ?? ''}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                if (name.isNotEmpty)
                  AutoSizeText(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                if (subName.isNotEmpty)
                  AutoSizeText(
                    subName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
              ],
            ),
          ),
          if (primaryValue != null)
            Positioned(
              top: 0, // Adjust this value to position the circle as needed
              right: 0, // Adjust this value to position the circle as needed
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  isNormal ? ImageConstant.greenTick : ImageConstant.redAlert,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLoaderWidget({double? width = 16, double? height = 16}) {
    return SizedBox(
      height: height,
      width: width,
      child: const CircularProgressIndicator(
        color: AppColourConstant.blue2D77F6,
      ),
    );
  }
}
