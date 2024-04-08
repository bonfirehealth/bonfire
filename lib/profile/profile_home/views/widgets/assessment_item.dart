part of '../profile_home_page.dart';

class AssessmentItem extends StatelessWidget {
  const AssessmentItem({
    super.key,
    required this.assessment,
    this.onPressed,
  });

  final Assessment? assessment;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    var stressIndex = assessment?.stressIndex;
    if (assessment?.sympatheticNervousSystemIndex != null) {
      if (assessment?.sympatheticNervousSystemIndex! != -9999) {
        stressIndex = assessment?.sympatheticNervousSystemIndex;
      }
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColourConstant.whiteEFF3FB,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: AppColourConstant.whiteEFF3FB.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 1.2,
              offset: const Offset(0, 1.2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    Jiffy(assessment?.updatedAt?.format())
                        .format('do MMM yyyy, h:mm a'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Text(
                  timeago.format(assessment!.updatedAt!.getDateTimeInUtc()),
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColourConstant.blue8DA2CD),
                ),
              ],
            ),
            const SpacerVertical(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: AppImage.asset(ImageConstant.stressLevel),
                ),
                Expanded(
                  child: Text(
                    '${l10n.stressLevel} / ${l10n.fatigueLevel}: ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Expanded(
                  child: Text(
                    assessment?.stressLevel ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SpacerVertical(12),
            Row(
              children: [
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.heartRate,
                    value: assessment?.heartRate ?? 0,
                    label: l10n.heartRate,
                  ),
                ),
                const SpacerHorizontal(8),
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.stressIndex,
                    value: stressIndex ?? 0,
                    label: l10n.stressIndex,
                    fractionDigits: 2,
                  ),
                ),
                const SpacerHorizontal(8),
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.heartRateVariability,
                    value: assessment?.heartRateVariability ?? 0,
                    label: l10n.heartRateVariability,
                  ),
                ),
              ],
            ),
            const SpacerVertical(8),
            Row(
              children: [
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.bloodPressure,
                    value: assessment?.systolicBloodPressure ?? 0,
                    secondaryValue: assessment?.diastolicBloodPressure ?? 0,
                    label: l10n.bloodPressure,
                  ),
                ),
                const SpacerHorizontal(8),
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.oxygenSaturationLevel,
                    value: assessment?.oxygenSaturationLevel ?? 0,
                    label: l10n.bloodOxygenLevel,
                  ),
                ),
                const SpacerHorizontal(8),
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.respiratoryRate,
                    value: assessment?.respiratoryRate ?? 0,
                    label: l10n.respiratoryRate,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
