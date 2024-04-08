part of '../organisation_dashboard_page.dart';

class OrganisationDashboardCountCards extends StatelessWidget {
  const OrganisationDashboardCountCards({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<OrganisationDashboardBloc, OrganisationDashboardState>(
      builder: (_, state) {
        return Row(
          children: [
            Expanded(
              child: CountCard(
                title: l10n.totalNumberOfUsers,
                subtitle: l10n.allTime,
                value: state.totalNumberOfUsers,
              ),
            ),
            Expanded(
              child: CountCard(
                title: l10n.totalNumberOfActiveUsers,
                subtitle: l10n.setLastDays(7),
                value: state.totalNumberOfActiveUsers,
              ),
            ),
            Expanded(
              child: CountCard(
                title: l10n.totalNumberOfCompletedScreenings,
                subtitle: l10n.allTime,
                value: state.totalNumberOfCompletedScreenings,
              ),
            ),
            Expanded(
              child: CountCard(
                title: l10n.totalNumberOfIncompletedScreenings,
                subtitle: l10n.allTime,
                value: state.totalNumberOfIncompletedScreenings,
              ),
            ),
            Expanded(
              child: CountCard(
                title: l10n.totalNumberOfSuggestionsViewed,
                subtitle: l10n.allTime,
                value: state.totalNumberOfSuggestionsViewed,
              ),
            ),
            Expanded(
              child: CountCard(
                title: l10n.totalNumberOfSuggestionsClicked,
                subtitle: l10n.allTime,
                value: state.totalNumberOfSuggestionsClicked,
              ),
            ),
            Expanded(
              child: CountCard(
                title: l10n.totalNumberOfEAPSuggestionsClicked,
                subtitle: l10n.allTime,
                value: state.totalNumberOfEAPSuggestionsClicked,
              ),
            ),
            AddButtonCard(
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
