part of '../organisation_dashboard_page.dart';

class OrganisationDashboardDonutCharts extends StatelessWidget {
  const OrganisationDashboardDonutCharts({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<OrganisationDashboardBloc, OrganisationDashboardState>(
      builder: (_, state) {
        return BlocBuilder<OrganisationHomeBloc, OrganisationHomeState>(
          builder: (context, homeState) {
            final userType = homeState.isFamilyMembersTab ? UserTypeEnum.familyMember : UserTypeEnum.organisationEmployee;
            return Column(
              children: [
                if (state.organisationUsers != null) ...[
                  Row(
                    children: [
                      Expanded(
                        child: DoughnutChart(
                          title: l10n.totalUsersByGender,
                          dataPoints: DataPointsHelper.generateTotalUsersGenderChartDataPoints(context,
                              organisationUsers: state.organisationUsers!, userType: userType),
                        ),
                      ),
                      Expanded(
                        child: DoughnutChart(
                          title: l10n.totalUsersByAgeGroup,
                          dataPoints: DataPointsHelper.generateTotalUsersAgeGroupChartDataPoints(context,
                              organisationUsers: state.organisationUsers!, userType: userType),
                        ),
                      ),
                      Expanded(
                        child: DoughnutChart(
                          title: l10n.totalUsersByBodyMassIndex,
                          dataPoints: DataPointsHelper.generateTotalUsersBodyMassIndexCategoryChartDataPoints(context,
                              organisationUsers: state.organisationUsers!, userType: userType),
                        ),
                      ),
                      AddButtonCard(
                        height: 220,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
