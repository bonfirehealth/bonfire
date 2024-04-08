part of '../web_screening_page.dart';

class VitalBox extends StatelessWidget {
  const VitalBox({
    super.key,
    required this.vitalSign,
    required this.value,
    required this.label,
    this.secondaryValue,
    this.fractionDigits = 0,
    this.boxSize = 40,
  });

  final VitalSign vitalSign;
  final double value;
  final String label;
  final double? secondaryValue;
  final int fractionDigits;
  final double boxSize;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final fontSize = boxSize >= 100 ? 25.0 : 28.0;
    final iconSize = boxSize >= 100 ? 25.0 : 18.0;
    final valueColor = vitalSign.isNormal(value, secondaryValue: secondaryValue)
        ? AppColourConstant.green00A25D
        : AppColourConstant.redFF5034;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColourConstant.greyE6EFFF,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          height: boxSize * 2,
          width: boxSize,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (secondaryValue == null) ...[
                if (value != -9999) ...[
                  AnimatedCount(
                    fontSize: fontSize,
                    count: value,
                    duration: const Duration(milliseconds: 5000),
                    fractionDigits: fractionDigits,
                    color: valueColor,
                  ),
                ] else ...[
                  AutoSizeText(
                    l10n.unknown,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColourConstant.greyCDD5E0,
                        ),
                  ),
                ],
              ] else ...[
                Row(
                  children: [
                    AnimatedCount(
                      fontSize: fontSize - 1,
                      count: value,
                      duration: const Duration(milliseconds: 5000),
                      color: valueColor,
                    ),
                    AutoSizeText(
                      '/',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: valueColor,
                          ),
                    ),
                    AnimatedCount(
                      fontSize: fontSize - 1,
                      count: secondaryValue!,
                      duration: const Duration(milliseconds: 5000),
                      color: valueColor,
                    ),
                  ],
                ),
              ],
              // AutoSizeText(
              //   label,
              //   style: Theme.of(context).textTheme.labelSmall?.copyWith(
              //         color: AppColourConstant.black1E1F2B,
              //         fontSize: 15,
              //       ),
              //   textAlign: TextAlign.start,
              //   maxLines: 2,
              // ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 6,
          child: LogicHelper.getVitalSignReadingStatus(
            vitalSign,
            value,
            secondaryValue: secondaryValue,
            size: iconSize,
          ),
        ),
      ],
    );
  }
}
