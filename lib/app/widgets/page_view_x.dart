// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class PageViewX extends StatelessWidget {
  const PageViewX({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColourConstant.whiteFFFFFF,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColourConstant.greyE6EFFF,
            blurRadius: 2,
            offset: Offset(
              0,
              -1,
            ),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Column(
            children: [
              const SpacerVertical(32),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
