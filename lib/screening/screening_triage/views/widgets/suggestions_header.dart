part of '../screening_triage_page.dart';

class SuggestionsHeader extends StatelessWidget {
  const SuggestionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocSelector<ScreeningTriageBloc, ScreeningTriageState,
        StressLevel?>(
      selector: (state) => state.stressLevel,
      builder: (context, stressLevel) {
        if (stressLevel == null) {
          return const SizedBox.shrink();
        }

        final newStressLevel = stressLevel;
        final stressLevelText = newStressLevel.name
            .replaceAll('StressLevel.', '')
            .capitalizeFirstofEach;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage.asset(
                  ImageConstant.alissaAvatar,
                  width: 120,
                  height: 120,
                ),
              ],
            ),
            const SpacerVertical(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    children: <TextSpan>[
                      TextSpan(text: '${l10n.stressLevelTitle} '),
                      TextSpan(
                        text: stressLevelText,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColourConstant.blue1A56CF,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SpacerVertical(32),
            SizedBox(
              width: 300,
              child: AutoSizeText(
                l10n.suggestionsSubtitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
