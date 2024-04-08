part of '../organisation_dashboard_page.dart';

class OrganisationDashboardAggregatedCharts extends StatelessWidget {
  const OrganisationDashboardAggregatedCharts({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<OrganisationDashboardBloc, OrganisationDashboardState>(
      builder: (_, state) {
        return BlocBuilder<OrganisationHomeBloc, OrganisationHomeState>(
          builder: (context, homeState) {
            return Column(
              children: [
                if (state.currentVitalSign == VitalSign.readinessIndex) ...[
                  Row(
                    children: [
                      Expanded(
                        child: AggregatedVitalLineChart(
                          title: "${state.totalNumberOfCompletedScreeningUsers} ${l10n.users}' ${l10n.readinessIndex}",
                          xAxisIntervalType: state.currentXAxisIntervalType,
                          xAxisMinimumDate: state.startDate,
                          xAxisMaximumDate: state.endDate,
                          yAxisMinimumValue: 0,
                          yAxisMaximumValue: state.totalNumberOfCompletedScreeningUsers + 3.0,
                          // yAxisPlotBands: [
                          //   ChartPlotBand(
                          //     -2.01 + 5,
                          //     -2.01 + 5,
                          //     l10n.low,
                          //     AppColourConstant.blue1A56CF,
                          //   ),
                          //   ChartPlotBand(
                          //     -1 + 5,
                          //     -1 + 5,
                          //     l10n.normal,
                          //     AppColourConstant.green3AE2D6,
                          //   ),
                          //   ChartPlotBand(
                          //     1.01 + 5,
                          //     1.01 + 5,
                          //     l10n.high,
                          //     Colors.red,
                          //   ),
                          // ],
                          yAxisAnnotations: [
                            CartesianChartAnnotation(
                              widget: SizedBox(
                                width: 120,
                                height: 80,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 12,
                                          color: AppColourConstant.pinkFF6188,
                                        ),
                                        Text(
                                          ' Low',
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 12,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          ' Medium',
                                          style: Theme.of(context).textTheme.labelMedium,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 12,
                                          color: AppColourConstant.green0CF218,
                                        ),
                                        Text(
                                          ' High',
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              coordinateUnit: CoordinateUnit.percentage,
                              x: '10%',
                              y: '19%',
                            ),
                          ],
                          dataPointName: l10n.stressLevel,
                          dataPoints: DataPointsHelper.generateLowStressLevelChartDataPoints(
                            context,
                            aggregateType: state.currentAggregateType,
                            aggregateHourOrganisationAssessmentsByOneDay: state.aggregateHourOrganisationAssessmentsByOneDay ?? [],
                            aggregateDayOrganisationAssessmentsByOneWeek: state.aggregateDayOrganisationAssessmentsByOneWeek ?? [],
                            aggregateDayOrganisationAssessmentsByOneMonth: state.aggregateDayOrganisationAssessmentsByOneMonth ?? [],
                            aggregateMonthOrganisationAssessmentsByOneYear: state.aggregateMonthOrganisationAssessmentsByOneYear ?? [],
                          ),
                          dataPoints1: DataPointsHelper.generateMediumStressLevelChartDataPoints(
                            context,
                            aggregateType: state.currentAggregateType,
                            aggregateHourOrganisationAssessmentsByOneDay: state.aggregateHourOrganisationAssessmentsByOneDay ?? [],
                            aggregateDayOrganisationAssessmentsByOneWeek: state.aggregateDayOrganisationAssessmentsByOneWeek ?? [],
                            aggregateDayOrganisationAssessmentsByOneMonth: state.aggregateDayOrganisationAssessmentsByOneMonth ?? [],
                            aggregateMonthOrganisationAssessmentsByOneYear: state.aggregateMonthOrganisationAssessmentsByOneYear ?? [],
                          ),
                          dataPoints2: DataPointsHelper.generateHighStressLevelChartDataPoints(
                            context,
                            aggregateType: state.currentAggregateType,
                            aggregateHourOrganisationAssessmentsByOneDay: state.aggregateHourOrganisationAssessmentsByOneDay ?? [],
                            aggregateDayOrganisationAssessmentsByOneWeek: state.aggregateDayOrganisationAssessmentsByOneWeek ?? [],
                            aggregateDayOrganisationAssessmentsByOneMonth: state.aggregateDayOrganisationAssessmentsByOneMonth ?? [],
                            aggregateMonthOrganisationAssessmentsByOneYear: state.aggregateMonthOrganisationAssessmentsByOneYear ?? [],
                          ),
                        ),
                      ),
                      AddButtonCard(
                        height: 324,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
                if (state.currentVitalSign == VitalSign.bloodPressure) ...[
                  Row(
                    children: [
                      Expanded(
                        child: AggregatedVitalLineChart(
                          title: "${state.totalNumberOfCompletedScreeningUsers} ${l10n.users}' ${l10n.bloodPressure}",
                          xAxisIntervalType: state.currentXAxisIntervalType,
                          xAxisMinimumDate: state.startDate,
                          xAxisMaximumDate: state.endDate,
                          yAxisMinimumValue: 0,
                          yAxisMaximumValue: state.totalNumberOfCompletedScreeningUsers + 3.0,
                          yAxisAnnotations: [
                            CartesianChartAnnotation(
                              widget: SizedBox(
                                width: 120,
                                height: 80,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 12,
                                          color: AppColourConstant.green0CF218,
                                        ),
                                        Text(
                                          ' Normal',
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 12,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          ' Elevated',
                                          style: Theme.of(context).textTheme.labelMedium,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 12,
                                          color: AppColourConstant.pinkFF6188,
                                        ),
                                        Text(
                                          ' Hypertensive',
                                          style: Theme.of(context).textTheme.labelMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              coordinateUnit: CoordinateUnit.percentage,
                              x: '10%',
                              y: '19%',
                            ),
                          ],
                          dataPointName: l10n.stressLevel,
                          dataPoints: DataPointsHelper.generateNormalBloodPressureChartDataPoints(
                            context,
                            aggregateType: state.currentAggregateType,
                            aggregateHourOrganisationAssessmentsByOneDay: state.aggregateHourOrganisationAssessmentsByOneDay ?? [],
                            aggregateDayOrganisationAssessmentsByOneWeek: state.aggregateDayOrganisationAssessmentsByOneWeek ?? [],
                            aggregateDayOrganisationAssessmentsByOneMonth: state.aggregateDayOrganisationAssessmentsByOneMonth ?? [],
                            aggregateMonthOrganisationAssessmentsByOneYear: state.aggregateMonthOrganisationAssessmentsByOneYear ?? [],
                          ),
                          dataPoints1: DataPointsHelper.generateElevatedBloodPressureChartDataPoints(
                            context,
                            aggregateType: state.currentAggregateType,
                            aggregateHourOrganisationAssessmentsByOneDay: state.aggregateHourOrganisationAssessmentsByOneDay ?? [],
                            aggregateDayOrganisationAssessmentsByOneWeek: state.aggregateDayOrganisationAssessmentsByOneWeek ?? [],
                            aggregateDayOrganisationAssessmentsByOneMonth: state.aggregateDayOrganisationAssessmentsByOneMonth ?? [],
                            aggregateMonthOrganisationAssessmentsByOneYear: state.aggregateMonthOrganisationAssessmentsByOneYear ?? [],
                          ),
                          dataPoints2: DataPointsHelper.generateHypertensiveBloodPressureChartDataPoints(
                            context,
                            aggregateType: state.currentAggregateType,
                            aggregateHourOrganisationAssessmentsByOneDay: state.aggregateHourOrganisationAssessmentsByOneDay ?? [],
                            aggregateDayOrganisationAssessmentsByOneWeek: state.aggregateDayOrganisationAssessmentsByOneWeek ?? [],
                            aggregateDayOrganisationAssessmentsByOneMonth: state.aggregateDayOrganisationAssessmentsByOneMonth ?? [],
                            aggregateMonthOrganisationAssessmentsByOneYear: state.aggregateMonthOrganisationAssessmentsByOneYear ?? [],
                          ),
                        ),
                      ),
                      AddButtonCard(
                        height: 324,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
