part of '../organisation_dashboard_page.dart';

class AggregatedVitalLineChart extends StatelessWidget {
  const AggregatedVitalLineChart({
    super.key,
    this.title,
    this.xAxisIntervalType = DateTimeIntervalType.hours,
    this.xAxisMinimumDate,
    this.xAxisMaximumDate,
    this.yAxisMinimumValue,
    this.yAxisMaximumValue,
    this.dataPointName,
    this.dataPoints,
    this.dataPoints1,
    this.dataPoints2,
    this.yAxisAnnotations,
    this.yAxisPlotBands,
  });

  final String? title;
  final DateTimeIntervalType xAxisIntervalType;
  final DateTime? xAxisMinimumDate;
  final DateTime? xAxisMaximumDate;
  final double? yAxisMinimumValue;
  final double? yAxisMaximumValue;
  final String? dataPointName;
  final List<DateTimeChartDataPoint>? dataPoints;
  final List<DateTimeChartDataPoint>? dataPoints1;
  final List<DateTimeChartDataPoint>? dataPoints2;
  final List<CartesianChartAnnotation>? yAxisAnnotations;
  final List<ChartPlotBand>? yAxisPlotBands;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: AppColourConstant.whiteFFFFFF,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColourConstant.greyE0E0E0,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              AutoSizeText(
                title!,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColourConstant.black1E1F2B,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.left,
              ),
              const SpacerVertical(8),
            ],
            SizedBox(
              height: 265,
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(
                  intervalType: xAxisIntervalType,
                  minimum: xAxisMinimumDate,
                  maximum: xAxisMaximumDate,
                  rangePadding: ChartRangePadding.auto,
                ),
                primaryYAxis: NumericAxis(
                  minimum: yAxisMinimumValue,
                  maximum: yAxisMaximumValue,
                  plotBands: List.generate(
                    yAxisPlotBands?.length ?? 0,
                    (index) {
                      final plotBand = yAxisPlotBands?[index];
                      return PlotBand(
                        text: plotBand?.text,
                        textAngle: 0,
                        start: plotBand?.start,
                        end: plotBand?.end,
                        textStyle:
                            Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: plotBand!.color,
                                ),
                        borderColor: plotBand!.color,
                        borderWidth: 2,
                      );
                    },
                  ),
                ),
                series: <ChartSeries<dynamic, dynamic>>[
                  if (dataPoints != null) ...[
                    LineSeries<DateTimeChartDataPoint, DateTime>(
                      width: 4,
                      dataSource: dataPoints!,
                      pointColorMapper: (DateTimeChartDataPoint data, _) =>
                          data.color,
                      xValueMapper: (DateTimeChartDataPoint data, _) => data.x,
                      yValueMapper: (DateTimeChartDataPoint data, _) => data.y,
                      dataLabelMapper: (DateTimeChartDataPoint data, _) =>
                          data.name,
                      name: dataPointName,
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                  ],
                  if (dataPoints1 != null) ...[
                    LineSeries<DateTimeChartDataPoint, DateTime>(
                      width: 4,
                      dataSource: dataPoints1!,
                      pointColorMapper: (DateTimeChartDataPoint data, _) =>
                          data.color,
                      xValueMapper: (DateTimeChartDataPoint data, _) => data.x,
                      yValueMapper: (DateTimeChartDataPoint data, _) => data.y,
                      dataLabelMapper: (DateTimeChartDataPoint data, _) =>
                          data.name,
                      name: dataPointName,
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                  ],
                  if (dataPoints2 != null) ...[
                    LineSeries<DateTimeChartDataPoint, DateTime>(
                      width: 4,
                      dataSource: dataPoints2!,
                      pointColorMapper: (DateTimeChartDataPoint data, _) =>
                          data.color,
                      xValueMapper: (DateTimeChartDataPoint data, _) => data.x,
                      yValueMapper: (DateTimeChartDataPoint data, _) => data.y,
                      dataLabelMapper: (DateTimeChartDataPoint data, _) =>
                          data.name,
                      name: dataPointName,
                      markerSettings: const MarkerSettings(isVisible: true),
                    ),
                  ],
                ],
                annotations: yAxisAnnotations,
                plotAreaBorderWidth: 0,
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
