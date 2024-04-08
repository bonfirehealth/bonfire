part of '../profile_home_page.dart';

class HealthDataItem extends StatelessWidget {
  const HealthDataItem({
    super.key,
    required this.profile,
    this.onPressed,
  });

  final Profile? profile;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    var stressIndex = profile?.stressIndex;
    if (profile?.sympatheticNervousSystemIndex != null) {
      if (profile?.sympatheticNervousSystemIndex! != -9999) {
        stressIndex = profile?.sympatheticNervousSystemIndex;
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
                    '${l10n.lastUpdatedAt} ${Jiffy(profile?.updatedAt?.format()).format('do MMM yyyy, h:mm a')}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                if (profile != null && profile?.updatedAt != null)
                  Text(
                    timeago.format(profile!.updatedAt!.getDateTimeInUtc()),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppImage.asset(
                  ImageConstant.stressLevel,
                  width: 20,
                  height: 20,
                ),
                const SpacerHorizontal(16),
                Text(
                  '${l10n.stressLevel} / ${l10n.fatigueLevel}: ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SpacerHorizontal(8),
                Text(
                  profile?.stressLevel ?? '',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
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
                    value: profile?.heartRate ?? 0,
                    label: l10n.heartRate,
                  ),
                ),
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.stressIndex,
                    value: stressIndex ?? 0,
                    label: l10n.stressIndex,
                    fractionDigits: 2,
                  ),
                ),
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.heartRateVariability,
                    value: profile?.heartRateVariability ?? 0,
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
                    value: profile?.systolicBloodPressure ?? 0,
                    secondaryValue: profile?.diastolicBloodPressure ?? 0,
                    label: l10n.bloodPressure,
                  ),
                ),
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.oxygenSaturationLevel,
                    value: profile?.oxygenSaturationLevel ?? 0,
                    label: l10n.bloodOxygenLevel,
                  ),
                ),
                Expanded(
                  child: VitalBox(
                    vitalSign: VitalSign.respiratoryRate,
                    value: profile?.respiratoryRate ?? 0,
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
