part of '../screening_triage_page.dart';

class SuggestionsPageView extends StatelessWidget {
  const SuggestionsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final bloc = context.read<ScreeningTriageBloc>();
    return BlocSelector<ScreeningTriageBloc, ScreeningTriageState,
        List<Suggestion>?>(
      selector: (state) => state.suggestions,
      builder: (context, suggestions) {
        final suggestionsList = suggestions ?? [];

        return SizedBox(
          height: 200,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.85),
              itemBuilder: (_, int index) {
                final suggestion = suggestionsList[index];

                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SuggestionCard(
                    onPressed: () {
                      bloc
                        ..add(
                          ScreeningTriageClickCountSet(
                            suggestion.id,
                          ),
                        )
                        ..add(
                          ScreeningTriageViewCountSet(
                            suggestion.id,
                          ),
                        );
                      appBloc.add(
                        AppNextRoutePath(
                          context,
                          suggestion.name ?? '',
                          suggestion.routePath ?? '/',
                          suggestion.url ?? suggestion.uri ?? '',
                        ),
                      );
                    },
                    icon: suggestion.icon,
                    title: '${l10n.suggestion} ${index + 1}',
                    subtitle: suggestion.description!,
                    rewardCredits:
                        suggestion.activity?.reward?.rewardCredits ?? 0,
                  ),
                );
              },
              itemCount: suggestionsList.length,
            ),
          ),
        );
      },
    );
  }
}
