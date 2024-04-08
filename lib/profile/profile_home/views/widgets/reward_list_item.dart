part of '../profile_home_page.dart';

class RewardListItem extends StatelessWidget {
  const RewardListItem({
    super.key,
    this.icon,
    this.rewardCredits = 20,
    required this.title,
    required this.subtitle,
    this.onPressed,
    this.showRewardCredits = false,
    this.botttomRightText,
  });

  final String? icon;
  final int? rewardCredits;
  final String title;
  final String subtitle;
  final void Function()? onPressed;
  final bool showRewardCredits;
  final String? botttomRightText;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColourConstant.whiteEFF3FB),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 23,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColourConstant.blue8DA2CD,
                          ),
                    ),
                  ),
                ),
                if (showRewardCredits)
                  Row(
                    children: [
                      AppImage.asset(
                        ImageConstant.creditCoin,
                        width: 16,
                        height: 16,
                      ),
                      const SpacerHorizontal(8),
                      Text(
                        l10n.setCreditsToEarn(rewardCredits.toString()),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
              ],
            ),
            const SpacerVertical(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: AmplifyConstant.generateFullS3FilePath(
                        FlavorConfig.instance!.flavor,
                        icon!,
                      ),
                      width: 55,
                      height: 55,
                    ),
                  ),
                const SpacerHorizontal(12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 7),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          subtitle,
                          textAlign: TextAlign.left,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColourConstant.grey50535A
                                        .withOpacity(0.6),
                                  ),
                        ),
                      ),
                      if (botttomRightText != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              botttomRightText!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color: AppColourConstant.blue8DA2CD,
                                  ),
                            ),
                            const SpacerHorizontal(8),
                          ],
                        ),
                      const SpacerVertical(12),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColourConstant.grey50535A.withOpacity(0.6),
                    size: 16,
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
