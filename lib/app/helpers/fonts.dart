// Flutter imports:
import 'package:flutter/material.dart';

FontWeight getFontWeight(String fontWeight) {
  switch (fontWeight) {
    case 'Thin':
      return FontWeight.w100;
    case 'ExtraLight':
      return FontWeight.w200;
    case 'Light':
      return FontWeight.w300;
    case 'Regular':
      return FontWeight.w400;
    case 'Medium':
      return FontWeight.w500;
    case 'SemiBold':
      return FontWeight.w600;
    case 'Bold':
      return FontWeight.w700;
    case 'ExtraBold':
      return FontWeight.w800;
    case 'Black':
      return FontWeight.w900;
    default:
      return FontWeight.normal;
  }
}
