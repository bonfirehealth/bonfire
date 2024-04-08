part of '../organisation_home_page.dart';

class OrganisationHomeAppBar extends StatelessWidget {
  const OrganisationHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final organisationProfileBloc = context.read<OrganisationProfileBloc>();
    return BlocSelector<OrganisationProfileBloc, OrganisationProfileState,
        User?>(
      selector: (state) => state.user,
      builder: (_, user) {
        final organisationUsers = user?.organisations;
        if (user == null || organisationUsers == null) {
          return const SizedBox.shrink();
        }

        final organisationUser = organisationUsers[0];

        return Container(
          margin: const EdgeInsets.only(right: 16),
          decoration: const BoxDecoration(
            color: AppColourConstant.whiteFFFFFF,
            boxShadow: [
              BoxShadow(
                color: AppColourConstant.greyE0E0E0,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: BlocBuilder<OrganisationHomeBloc,OrganisationHomeState>(builder: (_,homeState){
            return Row(
              children: [
                const SpacerHorizontal(60),
                getTypeSelector(context, 'My Employees', !homeState.isFamilyMembersTab, 0 ),
                getTypeSelector(context, 'Family Members', homeState.isFamilyMembersTab, 1),
                const Expanded(child: SizedBox.shrink()),
                Container(
                  color: AppColourConstant.whiteFFFFFF,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: double.infinity,
                        color: AppColourConstant.whiteFFFFFF,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: AppImage.asset(
                                ImageConstant.share,
                                width: 20,
                              ),
                            ),
                            const SpacerHorizontal(16),
                          ],
                        ),
                      ),
                      DropdownMenuButton<String>(
                        onChanged: (value) {
                          if (value?.item2 == 'sign_out') {
                            organisationProfileBloc
                                .add(OrganisationProfileSignOut(context));
                          } else {
                            appBloc.add(
                              AppNextRoutePath(context, '', value!.item2, ''),
                            );
                          }
                        },
                        hintText:
                        organisationUser.organisation.code.toUpperCase(),
                        items: [
                          // Tuple2(l10n.profile, '/organisation/profile'),
                          Tuple2(l10n.signOut, 'sign_out'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },),
        );
      },
    );
  }

  Widget getTypeSelector(BuildContext context, String text, bool selected, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(onPressed: () {
          context.read<OrganisationHomeBloc>().add(OrganisationHomeCurrentDashboardTypeSet(isFamilyMembersTab: index == 1));
        }, child: Text(text,style: Theme.of(context).textTheme.bodyLarge,)),
        if(selected) ...[
          const SpacerVertical(4),
          Container(height: 2,width: 80,color: AppColourConstant.blue1A56CF,)
        ]

      ],
    );
  }
}
