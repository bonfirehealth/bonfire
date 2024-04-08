// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/helpers/helpers.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.current,
    required this.total,
    this.horizontal,
    this.color,
  });

  final double current;
  final double total;
  final double? horizontal;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final totalPosition = MediaQuery.of(context).size.width -
        resizeByWidth(context, horizontal ?? 22) * 2;
    final currentPostion = current * totalPosition / total;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: resizeByWidth(context, horizontal ?? 22),
      ),
      child: Container(
        height: 10,
        margin: const EdgeInsets.only(top: 10),
        width: totalPosition,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColourConstant.blue8DA2CD.withOpacity(0.3),
        ),
        child: Row(
          children: [
            Container(
              height: 10,
              width: currentPostion,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color ?? Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
