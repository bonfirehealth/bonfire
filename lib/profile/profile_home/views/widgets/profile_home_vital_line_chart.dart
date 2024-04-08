part of '../profile_home_page.dart';

class ProfileHomeVitalLineChart extends StatefulWidget {
  const ProfileHomeVitalLineChart({super.key});

  @override
  State<ProfileHomeVitalLineChart> createState() => _ProfileHomeVitalLineChartState();
}

class _ProfileHomeVitalLineChartState extends State<ProfileHomeVitalLineChart> {
  ChartMode chartMode = ChartMode.readliness;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    TextStyle? getTitleStyle(bool isActive) => Theme.of(context).textTheme.titleMedium?.copyWith(
        color: isActive ? AppColourConstant.black1E1F2B : AppColourConstant.textFieldTextColorA0B2C6,
        fontWeight: FontWeight.bold);

    return BlocBuilder<ProfileHomeBloc, ProfileHomeState>(
      builder: (_, state) {
        final now = DateTime.now().toUtc();

        return VitalLineChart(
          header: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth,
                margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          chartMode = ChartMode.readliness;
                        });
                      },
                      child: Text(
                        context.l10n.readinessIndex2,
                        style: getTitleStyle(chartMode == ChartMode.readliness),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          chartMode = ChartMode.bloodPressure;
                        });
                      },
                      child: Text(
                        context.l10n.bloodPressure2,
                        style: getTitleStyle(chartMode == ChartMode.bloodPressure),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          footer: BlocProvider(
            create: (_) => FamilyMembersCubit()..load(),
            child: BlocBuilder<FamilyMembersCubit, List<User?>>(
              builder: (context, state) {
                if (state.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.compareWith,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SpacerVertical(resizeByHeight(context, 13)),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: state.map(
                            (user) {
                              final isSelected = user?.id == context.read<ProfileHomeBloc>().state.comparedMember?.id;
                              return Padding(
                                padding: const EdgeInsets.only(right: 28),
                                child: OutlinedButton(
                                  onPressed: () {
                                    if (user != null) {
                                      context.read<ProfileHomeBloc>().add(
                                            ProfileHomeComparedMemberSet(user),
                                          );
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color:
                                            isSelected ? AppColourConstant.blue1A56CF : AppColourConstant.grey3E3E31),
                                    backgroundColor: isSelected ? AppColourConstant.blue1A56CF : Colors.transparent,
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                  ),
                                  child: Text(
                                    '${user?.firstName?.allInCaps} ${user?.lastName?.allInCaps}',
                                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                          color:
                                              isSelected ? AppColourConstant.whiteFFFFFF : AppColourConstant.grey3E3E31,
                                        ),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          showPreviousDay: state.currentAggregateType == AggregateType.day,
          showNextDay: state.currentAggregateType == AggregateType.day &&
              ((state.endDate ?? now).difference(DateTime(now.year, now.month, now.day).toUtc()).inDays < 1),
          title: chartMode == ChartMode.readliness ? l10n.stressLevel : context.l10n.bloodPressure2,
          subtitle: DataPointsHelper.generateDateTitle(aggregateType: state.currentAggregateType, date: state.endDate),
          xAxisIntervalType: state.currentXAxisIntervalType,
          xAxisMinimumDate: state.startDate,
          xAxisMaximumDate: state.endDate,
          yAxisMinimumValue: 0,
          yAxisMaximumValue: chartMode == ChartMode.readliness ? 100 : 200,
          yAxisPlotBands: chartMode == ChartMode.readliness
              ? [
                  ChartPlotBand(
                    -1 + 50,
                    -1 + 50,
                    l10n.normal,
                    AppColourConstant.black1E1F2B,
                  ),
                  ChartPlotBand(
                    -1 + 60,
                    -1 + 60,
                    l10n.high,
                    AppColourConstant.green0CF218,
                  ),
                ]
              : [
                  ChartPlotBand(
                    -1 + 120,
                    -1 + 120,
                    l10n.normal,
                    AppColourConstant.black1E1F2B,
                  ),
                  ChartPlotBand(
                    -1 + 160,
                    -1 + 160,
                    l10n.high,
                    AppColourConstant.green0CF218,
                  ),
                ],
          dataPointName: chartMode == ChartMode.readliness ? l10n.stressLevel : 'Blood Pressure',
          comparedDataPointName: chartMode == ChartMode.readliness ? l10n.stressLevel : 'Blood Pressure',
          dataPoints: DataPointsHelper.generateStressLevelChartDataPoints(
            context,
            aggregateType: state.currentAggregateType,
            mode: chartMode,
            aggregateHourAssessmentsByOneDay: state.aggregateHourAssessmentsByOneDay ?? [],
            aggregateDayAssessmentsByOneWeek: state.aggregateDayAssessmentsByOneWeek ?? [],
            aggregateDayAssessmentsByOneMonth: state.aggregateDayAssessmentsByOneMonth ?? [],
            aggregateMonthAssessmentsByOneYear: state.aggregateMonthAssessmentsByOneYear ?? [],
          ),
          comparedDataPoints: DataPointsHelper.generateStressLevelChartDataPoints(
            context,
            color: AppColourConstant.blue008CD6,
            aggregateType: state.currentAggregateType,
            mode: chartMode,
            aggregateHourAssessmentsByOneDay: state.comparedAggregateHourAssessmentsByOneDay ?? [],
            aggregateDayAssessmentsByOneWeek: state.comparedAggregateDayAssessmentsByOneWeek ?? [],
            aggregateDayAssessmentsByOneMonth: state.comparedAggregateDayAssessmentsByOneMonth ?? [],
            aggregateMonthAssessmentsByOneYear: state.comparedAggregateMonthAssessmentsByOneYear ?? [],
          ),
        );
      },
    );
  }
}
