// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    this.backgroundColor = AppColourConstant.black1E1F2B,
    this.backgroundColorOpacity = 0.7,
    this.color = AppColourConstant.whiteFFFFFF,
    this.text,
  });

  final Color backgroundColor;
  final double backgroundColorOpacity;
  final Color color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor.withOpacity(backgroundColorOpacity),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              color: color,
            ),
            if (text != null && text != '')
              SizedBox(
                width: 300,
                child: AutoSizeText(
                  text!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: backgroundColorOpacity < 1.0
                            ? AppColourConstant.whiteFFFFFF
                            : AppColourConstant.black1E1F2B,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
