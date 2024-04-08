part of '../organisation_home_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.currentIndex = 0,
    this.unread = false,
    this.onTap,
  });

  final int currentIndex;
  final bool unread;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomNavigationBar(
      unselectedItemColor: AppColourConstant.blue8DA2CD,
      selectedItemColor: Theme.of(context).primaryColor,
      showUnselectedLabels: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      iconSize: 20,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
      unselectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: AppColourConstant.blue8DA2CD,
          ),
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          label: l10n.dashboard,
          icon: BottomNavigationIcon(
            imageAsset: ImageConstant.dashboard,
            color: currentIndex == 0
                ? Theme.of(context).primaryColor
                : AppColourConstant.blue8DA2CD,
            unread: unread,
          ),
        ),
        BottomNavigationBarItem(
          label: l10n.profile,
          icon: BottomNavigationIcon(
            imageAsset: ImageConstant.profile,
            color: currentIndex == 1
                ? Theme.of(context).primaryColor
                : AppColourConstant.blue8DA2CD,
            unread: unread,
          ),
        ),
      ],
    );
  }
}
