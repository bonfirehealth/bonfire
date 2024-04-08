part of '../web_screening_page.dart';

class VitalBoxSummaryCard extends StatelessWidget {
  const VitalBoxSummaryCard({
    super.key,
    required this.title,
    required this.symbol,
    this.normalRange,
    this.description,
    this.fractionDigits = 0,
  });
  final String title;
  final String symbol;
  final String? normalRange;
  final String? description;
  final int fractionDigits;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.zero,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        decoration: const BoxDecoration(
          color: AppColourConstant.textFieldGreyFillF4F4F8,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '$title or $symbol',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColourConstant.black000000,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SpacerVertical(4),
              if (normalRange != null) ...[
                Text(
                  '${l10n.normalRange}: $normalRange',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SpacerVertical(8),
              ],
              if (description != null) ...[
                Text(
                  description!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
