// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:bonfirehealth/app/helpers/helpers.dart';

mixin AppImage {
  static Widget asset(
    String assetName, {
    double width = 30,
    double height = 30,
    BoxFit fit = BoxFit.contain,
    Color? color,
    String? semanticsLabel,
    String? package,
    bool gaplessPlayback = true,
  }) {
    if (assetName.contains('.svg')) {
      return SvgPicture.asset(
        assetName,
        width: width,
        height: height,
        fit: fit,
        color: color,
        semanticsLabel: semanticsLabel,
        package: package,
      );
    }

    if (assetName.contains('data:image/jpeg;base64') ||
        !assetName.contains('.')) {
      return Image.memory(
        convertBase64ToImage(assetName),
        gaplessPlayback: gaplessPlayback,
      );
    }

    return Image.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      color: color,
      semanticLabel: semanticsLabel,
      package: package,
      gaplessPlayback: gaplessPlayback,
    );
  }
}
