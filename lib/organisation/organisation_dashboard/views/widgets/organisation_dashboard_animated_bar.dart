part of '../organisation_dashboard_page.dart';

class OrganisationDashboardAnimatedBar extends StatelessWidget {
  const OrganisationDashboardAnimatedBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OrganisationDashboardBloc>();
    return BlocBuilder<OrganisationDashboardBloc, OrganisationDashboardState>(
      builder: (_, state) {
        return Row(
          children: [
            Container(
              width: 800,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                border: Border.all(
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              child: AnimatedButtonBar(
                foregroundColor: AppColourConstant.blue1A56CF,
                backgroundColor: AppColourConstant.whiteFFFFFF,
                radius: 18,
                padding: const EdgeInsets.all(8),
                invertedSelection: true,
                children: [
                  ButtonBarEntry(
                    onTap: () => bloc.add(
                      const OrganisationDashboardAggregateTypeSet(),
                    ),
                    child: Text(
                      l10n.day,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  ButtonBarEntry(
                    onTap: () => bloc.add(
                      const OrganisationDashboardAggregateTypeSet(
                        aggregateType: AggregateType.week,
                      ),
                    ),
                    child: Text(
                      l10n.week,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  ButtonBarEntry(
                    onTap: () => bloc.add(
                      const OrganisationDashboardAggregateTypeSet(
                        aggregateType: AggregateType.month,
                      ),
                    ),
                    child: Text(
                      l10n.month,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  ButtonBarEntry(
                    onTap: () => bloc.add(
                      const OrganisationDashboardAggregateTypeSet(
                        aggregateType: AggregateType.year,
                      ),
                    ),
                    child: Text(
                      l10n.year,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 250,
              height: 70,
              padding: const EdgeInsets.all(16),
              child: DropdownMenuButton<VitalSign>(
                onChanged: (value) {
                  bloc.add(
                    OrganisationDashboardVitalSignSet(
                      currentVitalSign: value!.item2,
                    ),
                  );
                },
                hintText: state.currentVitalSign.name.titleCase,
                items: [
                  Tuple2(l10n.readinessIndex, VitalSign.readinessIndex),
                  Tuple2(l10n.bloodPressure, VitalSign.bloodPressure),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
