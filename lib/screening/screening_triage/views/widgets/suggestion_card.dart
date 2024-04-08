part of '../screening_triage_page.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({
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
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColourConstant.whiteEFF3FB),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColourConstant.black1E1F2B.withOpacity(0.4),
              blurRadius: 1,
            ),
          ],
        ),
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(16),
        width: 300,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Expanded(child: SizedBox.shrink()),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
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
                            height: 55,
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 7),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                subtitle,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: AppColourConstant.black1E1F2B,
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
                    ],
                  ),
                ],
              ),
            ),
            const SpacerHorizontal(8),
            Container(
              margin: const EdgeInsets.only(right: 5),
              width: 24,
              height: 24,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColourConstant.grey50535A.withOpacity(0.6),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
