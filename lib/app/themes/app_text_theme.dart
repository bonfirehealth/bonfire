// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/helpers/helpers.dart';
import 'package:bonfirehealth/app/themes/style_dictionary.dart';

class AppTextTheme extends TextTheme {
  // Display
  @override
  TextStyle? get displayLarge => AppTextStyle.displayLarge();
  @override
  TextStyle? get displayMedium => AppTextStyle.displayLarge();
  @override
  TextStyle? get displaySmall => AppTextStyle.displayLarge();

  // Headline
  @override
  TextStyle? get headlineLarge => AppTextStyle.headlineLarge();
  @override
  TextStyle? get headlineMedium => AppTextStyle.headlineMedium();
  @override
  TextStyle? get headlineSmall => AppTextStyle.headlineSmall();

  // Title
  @override
  TextStyle? get titleLarge => AppTextStyle.titleLarge();
  @override
  TextStyle? get titleMedium => AppTextStyle.titleMedium();
  @override
  TextStyle? get titleSmall => AppTextStyle.titleSmall();

  // Label
  @override
  TextStyle? get labelLarge => AppTextStyle.labelLarge();
  @override
  TextStyle? get labelMedium => AppTextStyle.labelMedium();
  @override
  TextStyle? get labelSmall => AppTextStyle.labelSmall();

  // Body
  @override
  TextStyle? get bodyLarge => AppTextStyle.bodyLarge();
  @override
  TextStyle? get bodyMedium => AppTextStyle.bodyMedium();
  @override
  TextStyle? get bodySmall => AppTextStyle.bodySmall();
}

class AppTextStyle {
  AppTextStyle._();

  // Display
  static TextStyle displayLarge() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleDisplayLargeSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleDisplayLargeFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleDisplayLargeWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle displayMedium() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleDisplayMediumSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleDisplayMediumFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleDisplayMediumWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle displaySmall() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleDisplaySmallSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleDisplaySmallFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleDisplaySmallWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  // Headline
  static TextStyle headlineLarge() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleHeadlineLargeSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleHeadlineLargeFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleHeadlineLargeWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle headlineMedium() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleHeadlineMediumSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleHeadlineMediumFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleHeadlineMediumWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle headlineSmall() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleHeadlineSmallSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleHeadlineSmallFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleHeadlineSmallWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  // Title
  static TextStyle titleLarge() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleTitleLargeSize.toDouble(),
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleTitleLargeWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle titleMedium() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleTitleMediumSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleTitleMediumFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleTitleMediumWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle titleSmall() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleTitleSmallSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleTitleSmallFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleTitleSmallWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  // Label
  static TextStyle labelLarge() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleLabelLargeSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleTitleSmallFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleLabelLargeWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle labelMedium() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleLabelMediumSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleLabelMediumFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleLabelMediumWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle labelSmall() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleLabelSmallSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleLabelSmallFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleLabelSmallWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  // Body
  static TextStyle bodyLarge() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleBodyLargeSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleBodyLargeFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleBodyLargeWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle bodyMedium() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleBodyMediumSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleBodyMediumFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleBodyMediumWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );

  static TextStyle bodySmall() => TextStyle(
        color: StyleDictionary.mdRefPaletteNeutral0,
        fontSize: StyleDictionary.mdSysTypescaleBodySmallSize.toDouble(),
        fontFamily: StyleDictionary.mdSysTypescaleBodySmallFamily,
        fontWeight:
            getFontWeight(StyleDictionary.mdSysTypescaleBodySmallWeight),
        fontStyle: FontStyle.normal,
        letterSpacing: 0,
      );
}
