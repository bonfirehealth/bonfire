// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';

class AnimatedCheck extends StatefulWidget {
  const AnimatedCheck({super.key});

  @override
  AnimatedCheckState createState() => AnimatedCheckState();
}

class AnimatedCheckState extends State<AnimatedCheck>
    with TickerProviderStateMixin {
  late AnimationController scaleController = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );
  late final Animation<double> _scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );
  late final Animation<double> _checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);

  @override
  void initState() {
    super.initState();
    scaleController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          checkController.forward();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const circleSize = 100.0;
    const iconSize = 80.0;

    return Stack(
      children: [
        Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              height: circleSize,
              width: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 6,
                  color: AppColourConstant.green3AE2D6,
                ),
              ),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _checkAnimation,
          axis: Axis.horizontal,
          axisAlignment: -1,
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.check,
                color: AppColourConstant.green3AE2D6,
                size: iconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
