// Flutter imports:
import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;

  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
}
