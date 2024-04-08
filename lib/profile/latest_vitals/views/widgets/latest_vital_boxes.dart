part of '../latest_vitals_page.dart';

class LatestVitalBoxes extends StatefulWidget {
  const LatestVitalBoxes({
    super.key,
    required this.assessment,
  });

  final Assessment? assessment;

  @override
  State<LatestVitalBoxes> createState() => _LatestVitalBoxesState();
}

class _LatestVitalBoxesState extends State<LatestVitalBoxes> with AfterLayoutMixin {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    var stressIndex = 0.0;
    var heartRate = 0.0;
    var bodyTemperature = 0.0;
    var respiratoryRate = 0.0;
    var systolicBloodPressure = 0.0;
    var diastolicBloodPressure = 0.0;

    var message = '';

    if (isTrialCustomer) {
      if (widget.assessment != null && widget.assessment!.heartRate != null) {
        heartRate = widget.assessment!.heartRate ?? 0.0;
        if (heartRate < 60) {
          message = 'Your Heart Rate seems Low';
        } else if (stressIndex > 100) {
          message = 'Your Heart Rate seems High';
        } else {
          message = 'Your Heart Rate seems normal';
        }
      }
    } else {
      if (widget.assessment != null && widget.assessment!.stressIndex != null) {
        stressIndex = widget.assessment!.stressIndex ?? 0.0;
        if (stressIndex < 50) {
          message += 'readiness index is low - ${stressIndex.toStringAsFixed(2)}, ';
        } else if (stressIndex > 100) {
          message += 'readiness index is high - ${stressIndex.toStringAsFixed(2)}, ';
        }
      }

      if (widget.assessment != null && widget.assessment!.heartRate != null) {
        heartRate = widget.assessment!.heartRate ?? 0.0;
        if (heartRate < 60) {
          message += 'heart rate is low - ${heartRate.toStringAsFixed(2)} BPM, ';
        } else if (stressIndex > 100) {
          message += 'heart rate is high - ${heartRate.toStringAsFixed(2)} BPM, ';
        }
      }

      if (widget.assessment != null &&
          widget.assessment!.bodyTemperature != null &&
          widget.assessment!.bodyTemperature != -9999) {
        bodyTemperature = widget.assessment!.bodyTemperature ?? 0.0;
        if (bodyTemperature < 36.1) {
          message += 'body temperature is low - ${bodyTemperature.toStringAsFixed(2)} °C, ';
        } else if (bodyTemperature > 36.1) {
          message += 'body temperature is high - ${bodyTemperature.toStringAsFixed(2)} °C, ';
        }
      }

      if (widget.assessment != null &&
          widget.assessment!.respiratoryRate != null &&
          widget.assessment!.respiratoryRate != -9999) {
        respiratoryRate = widget.assessment!.respiratoryRate ?? 0.0;
        if (respiratoryRate < 12) {
          message += 'respiratory rate is low - ${respiratoryRate.toStringAsFixed(2)} RR, ';
        } else if (respiratoryRate > 16) {
          message += 'respiratory rate is high - ${respiratoryRate.toStringAsFixed(2)} RR, ';
        }
      }

      if (widget.assessment != null &&
          widget.assessment!.systolicBloodPressure != null &&
          widget.assessment!.systolicBloodPressure != -9999) {
        systolicBloodPressure = widget.assessment!.systolicBloodPressure ?? 0.0;
      }

      if (widget.assessment != null &&
          widget.assessment!.diastolicBloodPressure != null &&
          widget.assessment!.diastolicBloodPressure != -9999) {
        diastolicBloodPressure = widget.assessment!.diastolicBloodPressure ?? 0.0;
      }
    }
    message.trim();

    Widget buildTitle(String label) {
      return Container(
        alignment: Alignment.center,
        height: 28,
        width: 128,
        decoration: BoxDecoration(
          color: AppColourConstant.textFieldGreyFillF4F4F8,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColourConstant.grey50535A,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
    }

    return FooterViewWrapper(
      footer: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (descriptionView != null)
            Container(
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColourConstant.textFieldGreyFillF4F4F8,
                borderRadius: BorderRadius.circular(15),
              ),
              child: descriptionView,
            ),
          BlocBuilder<LatestVitalsBloc, LatestVitalsState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  child: RoundedButton(
                    onPressed: () {
                      // context.read<ScreeningTriageBloc>().add(
                      //       ScreeningTriageStressLevelSet(
                      //         LogicHelper.calculateStressLevel(
                      //           state.assessment!.stressIndex ?? 0,
                      //         ),
                      //       ),
                      //     );
                      // context.read<AppBloc>().add(
                      //       AppReplaceRoute(
                      //         context,
                      //         const ScreeningTriageRoute(),
                      //       ),
                      //     );
                      if (isTrialCustomer) {
                        context.read<AppBloc>().add(
                              AppReplaceRoutePath(
                                context,
                                'Driver Assistant',
                                '/home/chats?message=$message',
                                '',
                              ),
                            );
                      } else {
                        context.read<AppBloc>().add(
                              AppReplaceRoutePath(
                                context,
                                'Driver Assistant',
                                '/home/chats?message=${message.isEmpty ? "" : "Give me a suggestion to improve my health and manage stress. Currently, my $message"}',
                                '',
                              ),
                            );
                      }
                    },
                    title: l10n.assessmentActionSubtitle,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: isTrialCustomer
            ? Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      buildTitle('Mental'),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                descriptionView = VitalBoxSummaryCard(
                                  symbol: l10n.readinessIndexSymbol,
                                  title: l10n.readinessIndex,
                                  normalRange: l10n.readinessIndexNormalRangeValues,
                                  description: l10n.readinessIndexDescription,
                                );
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColourConstant.greyE6EFFF,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                              height: 100,
                              width: 150,
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        '?',
                                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                              color: AppColourConstant.green00A25D,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 25,
                                            ),
                                      ),
                                      AutoSizeText(
                                        l10n.readinessIndex,
                                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                              color: AppColourConstant.black1E1F2B,
                                              fontSize: 15,
                                            ),
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 6,
                                    child: AppImage.asset(
                                      ImageConstant.locked,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      buildTitle('Heart'),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                descriptionView = VitalBoxSummaryCard(
                                  symbol: l10n.heartRateSymbol,
                                  title: l10n.heartRate,
                                  normalRange: l10n.heartRateNormalRangeValues,
                                  description: l10n.heartRateDescription,
                                );
                              });
                            },
                            child: LatestVitalBox(
                              vitalSign: VitalSign.heartRate,
                              value: heartRate,
                              label: l10n.heartRate,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  Visibility(
                    visible: widget.assessment?.bodyTemperature != null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.temperature,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColourConstant.grey777777,
                              ),
                        ),
                        Text(
                          ' ${bodyTemperature.toStringAsFixed(1)} ${l10n.temperatureSymbol}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: (bodyTemperature >= 36.1 && bodyTemperature <= 37.2)
                                    ? AppColourConstant.redFF5034
                                    : AppColourConstant.green00A25D,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 330,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          buildTitle('Mental'),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    descriptionView = VitalBoxSummaryCard(
                                      symbol: l10n.readinessIndexSymbol,
                                      title: l10n.readinessIndex,
                                      normalRange: l10n.readinessIndexNormalRangeValues,
                                      description: l10n.readinessIndexDescription,
                                    );
                                  });
                                },
                                child: LatestVitalBox(
                                  vitalSign: VitalSign.readinessIndex,
                                  value: stressIndex,
                                  secondaryValue: 100,
                                  label: l10n.readinessIndex,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColourConstant.greyE6EFFF,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                                height: 100,
                                width: 150,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          '?',
                                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                                color: AppColourConstant.green00A25D,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 25,
                                              ),
                                        ),
                                        AutoSizeText(
                                          l10n.fatigueLevel,
                                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                                color: AppColourConstant.black1E1F2B,
                                                fontSize: 15,
                                              ),
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 6,
                                      child: AppImage.asset(
                                        ImageConstant.passed,
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 36),
                          buildTitle('Heart'),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    descriptionView = VitalBoxSummaryCard(
                                      symbol: l10n.heartRateSymbol,
                                      title: l10n.heartRate,
                                      normalRange: l10n.heartRateNormalRangeValues,
                                      description: l10n.heartRateDescription,
                                    );
                                  });
                                },
                                child: LatestVitalBox(
                                  vitalSign: VitalSign.heartRate,
                                  value: heartRate,
                                  label: l10n.heartRate,
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    descriptionView = VitalBoxSummaryCard(
                                      symbol: l10n.bloodPressureSymbol,
                                      title: l10n.bloodPressure,
                                      normalRange: l10n.bloodPressureNormalRangeValues,
                                      description: l10n.bloodPressureDescription,
                                    );
                                  });
                                },
                                child: LatestVitalBox(
                                  vitalSign: VitalSign.bloodPressure,
                                  value: systolicBloodPressure,
                                  secondaryValue: diastolicBloodPressure,
                                  label: l10n.bloodPressure,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 36),
                          buildTitle('Respiatory'),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    descriptionView = VitalBoxSummaryCard(
                                      title: l10n.respiratoryRate,
                                      symbol: l10n.respiratoryRateSymbol,
                                      normalRange: l10n.respiratoryRateNormalRangeValues,
                                      description: l10n.respiratoryRateDescription,
                                    );
                                  });
                                },
                                child: LatestVitalBox(
                                  vitalSign: VitalSign.respiratoryRate,
                                  value: respiratoryRate,
                                  label: l10n.respiratoryRate,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
