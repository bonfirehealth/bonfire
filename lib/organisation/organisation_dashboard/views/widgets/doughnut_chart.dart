part of '../organisation_dashboard_page.dart';

class DoughnutChart extends StatefulWidget {
  const DoughnutChart({
    super.key,
    required this.dataPoints,
    required this.title,
    this.subtitle,
    this.icon,
    this.showTooltip = false,
    this.onPressed,
  });

  final List<StringChartDataPoint>? dataPoints;
  final String title;
  final String? subtitle;
  final String? icon;
  final bool showTooltip;
  final void Function()? onPressed;

  @override
  State<DoughnutChart> createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(
      enable: widget.showTooltip,
      format: 'point.x: point.y',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16) - const EdgeInsets.only(bottom: 8),
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
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    if (widget.icon != null) AppImage.asset(widget.icon!),
                    AutoSizeText(
                      widget.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColourConstant.black1E1F2B,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 160,
                      height: 170,
                      child: SfCircularChart(
                        margin: EdgeInsets.zero,
                        series: [
                          DoughnutSeries<StringChartDataPoint, String>(
                            radius: '80%',
                            explode: true,
                            explodeOffset: '10%',
                            dataSource: widget.dataPoints,
                            xValueMapper: (StringChartDataPoint data, _) =>
                                data.x,
                            yValueMapper: (StringChartDataPoint data, _) =>
                                data.y,
                            pointColorMapper: (StringChartDataPoint data, _) =>
                                data.color,
                            dataLabelMapper: (StringChartDataPoint data, _) =>
                                data.name,
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: AppColourConstant.black1E1F2B,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          )
                        ],
                        tooltipBehavior: _tooltip,
                      ),
                    ),
                    if (widget.dataPoints != null) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          widget.dataPoints!.length,
                          (index) {
                            final dataPoint = widget.dataPoints![index];

                            return Column(
                              children: [
                                Row(
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColourConstant.grey9A9A9A,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.circle,
                                        size: 20,
                                        color: dataPoint.color,
                                      ),
                                    ),
                                    const SpacerHorizontal(8),
                                    Text(
                                      '${dataPoint.x}: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: AppColourConstant.grey777777,
                                          ),
                                    ),
                                    Text(
                                      dataPoint.y.numeral(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                const SpacerVertical(8),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
