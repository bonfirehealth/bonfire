part of '../profile_home_page.dart';

class ProfileHomeHealthData extends StatelessWidget {
  const ProfileHomeHealthData({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final screeningTriageBloc = context.read<ScreeningTriageBloc>();
    return BlocBuilder<ProfileHomeBloc, ProfileHomeState>(
      builder: (_, state) {
        return Column(
          children: [
            if (state.profile?.heartRate != null ||
                state.profile?.stressLevel != null) ...[
              Column(
                children: [
                  if (state.profile != null) ...[
                    const SpacerVertical(32),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            l10n.myLatestVitalReadings,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColourConstant.grey50535A,
                                ),
                          ),
                        ),
                        const SpacerHorizontal(8),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: HealthDataItem(profile: state.profile),
                    ),
                  ],
                  if (state.suggestions != null) ...[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            l10n.myLatestSuggestions,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColourConstant.grey50535A,
                                ),
                          ),
                        ),
                        const SpacerHorizontal(8),
                      ],
                    ),
                    const SpacerVertical(8),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: state.suggestions?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final suggestions = state.suggestions;
                          final suggestion = suggestions?[index];
                          return Column(
                            children: [
                              RewardListItem(
                                onPressed: () {
                                  screeningTriageBloc
                                    ..add(
                                      ScreeningTriageClickCountSet(
                                        suggestion?.id ?? '',
                                      ),
                                    )
                                    ..add(
                                      ScreeningTriageViewCountSet(
                                        suggestion?.id ?? '',
                                      ),
                                    );
                                  appBloc.add(
                                    AppNextRoutePath(
                                      context,
                                      suggestion?.name ?? '',
                                      suggestion?.routePath ?? '/',
                                      suggestion?.url ?? suggestion!.uri ?? '',
                                    ),
                                  );
                                },
                                icon: suggestion?.icon,
                                title: '${l10n.suggestion} ${index + 1}',
                                subtitle: suggestion?.description ?? '',
                                rewardCredits: suggestion
                                        ?.activity?.reward?.rewardCredits ??
                                    0,
                              ),
                              const SpacerVertical(8),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          l10n.mySavedQuestions,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColourConstant.grey50535A,
                                  ),
                        ),
                      ),
                      const SpacerHorizontal(8),
                    ],
                  ),
                  const SpacerVertical(8),
                  SettingListItem(
                    onPressed: () => context.router.push(
                      const SavedQuestionsRoute(),
                    ),
                    icon: ImageConstant.savedQuestions,
                    title: l10n.mySavedQuestions,
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
}
