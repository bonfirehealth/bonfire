part of '../latest_vitals_page.dart';

class LatestVitalBoxPopupDialog extends StatelessWidget {
  const LatestVitalBoxPopupDialog({
    super.key,
    required this.value,
    required this.title,
    required this.subtitle,
    this.secondaryValue,
    this.normalRange,
    this.description,
    this.fractionDigits = 0,
  });

  final double value;

  final String title;
  final String subtitle;
  final double? secondaryValue;
  final String? normalRange;
  final String? description;
  final int fractionDigits;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.zero,
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      InkWell(
                        child: SizedBox(
                          width: 18,
                          height: 18,
                          child: AppImage.asset(
                            ImageConstant.closeCross,
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SpacerVertical(18),
                  if (secondaryValue != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedCount(
                          count: value,
                          duration: const Duration(milliseconds: 5000),
                        ),
                        Text(
                          '/',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColourConstant.black1E1F2B,
                                  ),
                        ),
                        AnimatedCount(
                          count: secondaryValue!,
                          duration: const Duration(milliseconds: 5000),
                        ),
                      ],
                    ),
                  ] else ...[
                    AnimatedCount(
                      count: value,
                      duration: const Duration(milliseconds: 5000),
                      fractionDigits: fractionDigits,
                    ),
                  ],
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColourConstant.grey50535A,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SpacerVertical(8),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColourConstant.grey50535A,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SpacerVertical(8),
                  if (normalRange != null) ...[
                    Text(
                      '${l10n.normalRange}: $normalRange',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SpacerVertical(32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
