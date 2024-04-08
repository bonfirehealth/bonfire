// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/helpers/helpers.dart';

class CreditsProgressBar extends StatelessWidget {
  const CreditsProgressBar({
    super.key,
    required this.current,
    required this.total,
    required this.reward,
  });

  final double current;
  final double total;
  final String reward;

  @override
  Widget build(BuildContext context) {
    final totalPosition =
        MediaQuery.of(context).size.width - resizeByWidth(context, 22) * 2;
    final currentPostion = current * totalPosition / total;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: resizeByWidth(context, 22),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: AppColourConstant.blue8DA2CD,
                      ),
                    ),
                    child: Text(
                      total.round().toString(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColourConstant.blue8DA2CD,
                          ),
                    ),
                  ),
                ),
                if (current >= 850)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: AppColourConstant.blue8DA2CD,
                        ),
                      ),
                      child: Text(
                        current.round().toString(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  )
                else
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: currentPostion >= 23
                            ? (currentPostion - 23)
                            : currentPostion,
                      ),
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Text(
                        current.round().toString(),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
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
                  width: currentPostion >= totalPosition
                      ? totalPosition
                      : currentPostion,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(right: 2.5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColourConstant.whiteFFFFFF,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(right: 2.5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 19,
            margin: const EdgeInsets.only(top: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
                Text(
                  '',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColourConstant.grey50535A,
                      ),
                ),
                Text(
                  current >= 1000
                      ? '\$${(current / 1000).round() * 10} $reward'
                      : '',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColourConstant.grey50535A,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
