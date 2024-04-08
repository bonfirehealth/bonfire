// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:blobs/blobs.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AnimatedAvatar extends StatelessWidget {
  const AnimatedAvatar({
    super.key,
    this.showAnimatedBackground = false,
    this.child,
    this.size = 140,
  });

  final bool showAnimatedBackground;
  final Widget? child;
  final double size;

  @override
  Widget build(BuildContext context) {
    final sensorTransformPink = Matrix4.translationValues(-4, -2, 0);
    final sensorTransformBlue = Matrix4.translationValues(2, 3, 0);
    final sensorTransformYellow = Matrix4.translationValues(0, -3, 0);
    return Stack(
      children: [
        if (showAnimatedBackground)
          Container(
            transform: sensorTransformPink,
            alignment: Alignment.center,
            child: Blob.animatedRandom(
              size: size,
              loop: true,
              duration: const Duration(milliseconds: 800),
              styles: BlobStyles(
                fillType: BlobFillType.fill,
                color: AppColourConstant.pinkFF6188.withOpacity(0.6),
              ),
            ),
          ),
        if (showAnimatedBackground)
          Container(
            transform: sensorTransformBlue,
            alignment: Alignment.center,
            child: Blob.animatedRandom(
              size: size,
              loop: true,
              duration: const Duration(milliseconds: 800),
              styles: BlobStyles(
                fillType: BlobFillType.fill,
                color: AppColourConstant.blue1A56CF.withOpacity(0.6),
              ),
            ),
          ),
        if (showAnimatedBackground)
          Container(
            transform: sensorTransformYellow,
            alignment: Alignment.center,
            child: Blob.animatedRandom(
              size: size,
              loop: true,
              duration: const Duration(milliseconds: 800),
              styles: BlobStyles(
                fillType: BlobFillType.fill,
                color: AppColourConstant.yellowD5AC05.withOpacity(0.6),
              ),
            ),
          ),
        if (child != null)
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              child: child,
            ),
          ),
      ],
    );
  }
}
