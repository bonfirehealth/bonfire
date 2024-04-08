part of '../profile_home_page.dart';

class VitalLineChart extends StatelessWidget {
  const VitalLineChart({
    super.key,
    this.title,
    this.subtitle,
    this.header,
    this.footer,
    this.xAxisIntervalType = DateTimeIntervalType.hours,
    this.xAxisMinimumDate,
    this.xAxisMaximumDate,
    this.yAxisMinimumValue,
    this.yAxisMaximumValue,
    this.dataPointName,
    this.comparedDataPointName,
    this.dataPoints,
    this.comparedDataPoints,
    this.yAxisAnnotations,
    this.showPreviousDay = false,
    this.showNextDay = false,
    this.yAxisPlotBands,
  });

  final String? title;
  final String? subtitle;
  final Widget? header;
  final Widget? footer;
  final DateTimeIntervalType xAxisIntervalType;
  final DateTime? xAxisMinimumDate;
  final DateTime? xAxisMaximumDate;
  final double? yAxisMinimumValue;
  final double? yAxisMaximumValue;
  final String? dataPointName;
  final String? comparedDataPointName;
  final List<DateTimeChartDataPoint>? dataPoints;
  final List<DateTimeChartDataPoint>? comparedDataPoints;
  final List<CartesianChartAnnotation>? yAxisAnnotations;
  final List<ChartPlotBand>? yAxisPlotBands;
  final bool showPreviousDay;
  final bool showNextDay;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColourConstant.textFieldGreyFillF4F4F8,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              if (header != null) header!,
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showPreviousDay)
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<ProfileHomeBloc>(context).add(
                              const ProfileHomeAggregateHourAssessmentsPreviousDaySet(),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: AppColourConstant.grey50535A,
                            size: 24,
                          )),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        if (title != null) ...[
                          AutoSizeText(
                            title!,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColourConstant.grey50535A,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                        if (subtitle != null) ...[
                          AutoSizeText(
                            subtitle!,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: AppColourConstant.grey50535A,
                                  fontWeight: FontWeight.bold,
                                ),
                            textAlign: TextAlign.left,
                          ),
                          const SpacerVertical(8),
                        ],
                      ],
                    ),
                    if (showNextDay)
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<ProfileHomeBloc>(context).add(
                              const ProfileHomeAggregateHourAssessmentsNextDaySet(),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_outlined,
                            color: AppColourConstant.grey50535A,
                            size: 24,
                          )),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 265,
                child: SfCartesianChart(
                  enableMultiSelection: true,
                  primaryXAxis: DateTimeAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColourConstant.grey50535A),
                    intervalType: xAxisIntervalType,
                    minimum: xAxisMinimumDate,
                    maximum: xAxisMaximumDate,
                    rangePadding: ChartRangePadding.auto,
                  ),
                  primaryYAxis: NumericAxis(
                    majorGridLines: const MajorGridLines(width: 0),
                    labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColourConstant.grey50535A),
                    minimum: yAxisMinimumValue,
                    maximum: yAxisMaximumValue,
                    plotBands: dataPoints != null && dataPoints!.isNotEmpty
                        ? List.generate(
                            yAxisPlotBands?.length ?? 0,
                            (index) {
                              final plotBand = yAxisPlotBands?[index];
                              return PlotBand(
                                text: plotBand?.text,
                                textAngle: 0,
                                start: plotBand?.start,
                                end: plotBand?.end,
                                textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColourConstant.grey50535A,
                                    ),
                                borderColor: plotBand!.color,
                                borderWidth: 2,
                              );
                            },
                          )
                        : [],
                  ),
                  series: <ChartSeries<dynamic, dynamic>>[
                    if (dataPoints != null) ...[
                      LineSeries<DateTimeChartDataPoint, DateTime>(
                        width: 2,
                        dataSource: dataPoints!,
                        pointColorMapper: (DateTimeChartDataPoint data, _) => data.color,
                        xValueMapper: (DateTimeChartDataPoint data, _) => data.x,
                        yValueMapper: (DateTimeChartDataPoint data, _) => data.y,
                        dataLabelMapper: (DateTimeChartDataPoint data, _) => data.name,
                        name: dataPointName,
                        markerSettings: const MarkerSettings(
                          isVisible: true,
                          color: AppColourConstant.yellowFFD700,
                        ),
                      ),
                    ],
                    if (comparedDataPoints != null) ...[
                      LineSeries<DateTimeChartDataPoint, DateTime>(
                        width: 2,
                        dataSource: comparedDataPoints!,
                        pointColorMapper: (DateTimeChartDataPoint data, _) => data.color,
                        xValueMapper: (DateTimeChartDataPoint data, _) => data.x,
                        yValueMapper: (DateTimeChartDataPoint data, _) => data.y,
                        dataLabelMapper: (DateTimeChartDataPoint data, _) => data.name,
                        name: comparedDataPointName,
                        markerSettings: const MarkerSettings(
                          isVisible: true,
                          color: AppColourConstant.blue1A56CF,
                        ),
                      ),
                    ],
                  ],
                  annotations: yAxisAnnotations,
                  plotAreaBorderWidth: 0,
                  tooltipBehavior: TooltipBehavior(enable: true),
                ),
              ),
              if (footer != null) footer!,
            ],
          ),
        ),
        if (dataPoints != null) ...[
          if (dataPoints!.isEmpty) ...[
            Positioned.fill(
              child: Align(
                child: Text(
                  l10n.noData,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColourConstant.grey50535A,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ],
      ],
    );
  }
}
