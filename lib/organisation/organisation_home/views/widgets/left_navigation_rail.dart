part of '../organisation_home_page.dart';

class LeftNavigationRail extends StatelessWidget {
  const LeftNavigationRail({
    super.key,
    this.selectedIndex = 0,
    this.onDestinationSelected,
  });

  final int selectedIndex;
  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: <Widget>[
        NavigationRail(
          useIndicator: false,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          labelType: NavigationRailLabelType.all,
          destinations: [
            NavigationRailDestination(
              padding: const EdgeInsets.only(top: 8),
              icon: AppImage.asset(
                ImageConstant.dashboard,
                color: AppColourConstant.blue8DA2CD,
              ),
              selectedIcon: AppImage.asset(
                ImageConstant.dashboard,
                color: Theme.of(context).primaryColor,
              ),
              label: Text(
                l10n.dashboard,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: selectedIndex == 0
                          ? Theme.of(context).primaryColor
                          : AppColourConstant.blue8DA2CD,
                    ),
              ),
            ),
            NavigationRailDestination(
              padding: const EdgeInsets.only(top: 8),
              icon: AppImage.asset(
                ImageConstant.journeys,
                color: AppColourConstant.blue8DA2CD,
              ),
              selectedIcon: AppImage.asset(
                ImageConstant.journeys,
                color: Theme.of(context).primaryColor,
              ),
              label: Text(
                l10n.journeys,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: selectedIndex == 1
                          ? Theme.of(context).primaryColor
                          : AppColourConstant.blue8DA2CD,
                    ),
              ),
            ),
            // NavigationRailDestination(
            //   padding: const EdgeInsets.only(top: 8),
            //   icon: AppImage.asset(
            //     ImageConstant.profile,
            //     color: AppColourConstant.blue8DA2CD,
            //   ),
            //   selectedIcon: AppImage.asset(
            //     ImageConstant.profile,
            //     color: Theme.of(context).primaryColor,
            //   ),
            //   label: Text(
            //     l10n.profile,
            //     style: Theme.of(context).textTheme.labelSmall?.copyWith(
            //           color: selectedIndex == 1
            //               ? Theme.of(context).primaryColor
            //               : AppColourConstant.blue8DA2CD,
            //         ),
            //   ),
            // ),
            NavigationRailDestination(
              padding: const EdgeInsets.only(top: 8),
              icon: AppImage.asset(
                ImageConstant.invoices,
                color: AppColourConstant.blue8DA2CD,
              ),
              selectedIcon: AppImage.asset(
                ImageConstant.invoices,
                color: Theme.of(context).primaryColor,
              ),
              label: Text(
                l10n.invoices,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: selectedIndex == 1
                          ? Theme.of(context).primaryColor
                          : AppColourConstant.blue8DA2CD,
                    ),
              ),
            ),
            NavigationRailDestination(
              padding: const EdgeInsets.only(top: 8),
              icon: AppImage.asset(
                ImageConstant.settings,
                color: AppColourConstant.blue8DA2CD,
              ),
              selectedIcon: AppImage.asset(
                ImageConstant.settings,
                color: Theme.of(context).primaryColor,
              ),
              label: Text(
                l10n.settings,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: selectedIndex == 1
                          ? Theme.of(context).primaryColor
                          : AppColourConstant.blue8DA2CD,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
