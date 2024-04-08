part of '../latest_vitals_page.dart';

class LatestVitalBox extends StatelessWidget {
  const LatestVitalBox({
    super.key,
    required this.vitalSign,
    required this.value,
    required this.label,
    this.secondaryValue,
    this.fractionDigits = 0,
  });

  final VitalSign vitalSign;
  final double value;
  final String label;
  final double? secondaryValue;
  final int fractionDigits;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
          height: 100,
          width: 150,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (secondaryValue == null) ...[
                if (value != -9999) ...[
                  AnimatedCount(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AnimatedCount(
                      fontSize: 24,
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
                      fontSize: 24,
                      count: secondaryValue!,
                      duration: const Duration(milliseconds: 5000),
                      color: valueColor,
                    ),
                  ],
                ),
              ],
              AutoSizeText(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColourConstant.black1E1F2B,
                      fontSize: 15,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
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
          ),
        ),
      ],
    );
  }
}
