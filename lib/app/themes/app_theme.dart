// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/themes/themes.dart';

mixin AppTheme {
  static ThemeData lightThemeData = themeData(Brightness.light);
  static ThemeData darkThemeData = themeData(Brightness.dark);
  static ThemeData dynamicThemeData({
    Color backgroundColor = AppColourConstant.whiteF8F8F8,
    Color primaryColor = AppColourConstant.blue1A56CF,
  }) {
    return themeData(
      Brightness.light,
      backgroundColor: backgroundColor,
      primaryColor: primaryColor,
    );
  }

  static final textTheme = AppTextTheme();

  static ThemeData themeData(
    Brightness brightness, {
    Color backgroundColor = AppColourConstant.whiteF8F8F8,
    Color primaryColor = AppColourConstant.blue1A56CF,
  }) {
    const darkColor = AppColourConstant.black1E1F2B;
    const iconColor = AppColourConstant.grey50535A;
    // final highlightColor = Colors.grey[200];

    return ThemeData(
      // General Configurations
      useMaterial3: true,
      // Colors
      brightness: brightness,
      canvasColor: backgroundColor,
      cardColor: backgroundColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: backgroundColor,
        secondary: darkColor,
        error: AppColourConstant.pinkFF6188,
      ),
      dialogBackgroundColor: backgroundColor,
      disabledColor: AppColourConstant.blue8DA2CD,
      dividerColor: AppColourConstant.greyCDD5E0,
      focusColor: primaryColor,
      highlightColor: Colors.transparent,
      hintColor: darkColor,
      hoverColor: Colors.transparent,
      // indicatorColor: _darkColor,
      primaryColor: primaryColor,
      primaryColorDark: primaryColor,
      primaryColorLight: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      // shadowColor: _darkColor,
      splashColor: Colors.transparent,
      // toggleableActiveColor: _highlightColor,
      // unselectedWidgetColor: Colors.transparent,

      // Typography & Iconography
      fontFamily: FontFamilyConstant.metropolis,
      iconTheme: const IconThemeData(
        color: iconColor,
      ),
      primaryIconTheme: const IconThemeData(
        color: iconColor,
      ),
      primaryTextTheme: textTheme,
      textTheme: textTheme,
      // typography: Typography(),

      // Component Themes
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: AppColourConstant.black1E1F2B,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: backgroundColor,
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: primaryColor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: backgroundColor,
      ),
      buttonBarTheme: const ButtonBarThemeData(),
      buttonTheme: const ButtonThemeData(),
      cardTheme: const CardTheme(),
      checkboxTheme: const CheckboxThemeData(),
      chipTheme: const ChipThemeData(),
      dataTableTheme: const DataTableThemeData(),
      dialogTheme: const DialogTheme(),
      dividerTheme: const DividerThemeData(),
      drawerTheme: const DrawerThemeData(),
      elevatedButtonTheme: const ElevatedButtonThemeData(),
      expansionTileTheme: const ExpansionTileThemeData(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      listTileTheme: const ListTileThemeData(),
      navigationBarTheme: const NavigationBarThemeData(),
      navigationRailTheme: const NavigationRailThemeData(),
      outlinedButtonTheme: const OutlinedButtonThemeData(),
      popupMenuTheme: const PopupMenuThemeData(),
      progressIndicatorTheme: const ProgressIndicatorThemeData(),
      radioTheme: const RadioThemeData(),
      sliderTheme: const SliderThemeData(),
      snackBarTheme: const SnackBarThemeData(),
      switchTheme: const SwitchThemeData(),
      tabBarTheme: TabBarTheme(
        indicator: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: primaryColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 16),
        labelStyle: textTheme.labelLarge,
        unselectedLabelStyle: textTheme.labelLarge,
        unselectedLabelColor: primaryColor,
      ),
      textButtonTheme: const TextButtonThemeData(),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: darkColor,
      ),
      timePickerTheme: const TimePickerThemeData(),
      toggleButtonsTheme: const ToggleButtonsThemeData(),
      tooltipTheme: const TooltipThemeData(),
    );
  }
}
