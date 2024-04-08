// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';

class TextFooter extends StatelessWidget {
  const TextFooter({
    super.key,
    required this.text1,
    required this.text2,
    this.text3,
    this.text4,
    this.isText1Underlined = false,
    this.isText2Underlined = false,
    this.isText3Underlined = false,
    this.isText4Underlined = false,
    this.text1OnTap,
    this.text2OnTap,
    this.text3OnTap,
    this.text4OnTap,
  });

  final String text1;
  final String text2;
  final String? text3;
  final String? text4;
  final bool isText1Underlined;
  final bool isText2Underlined;
  final bool isText3Underlined;
  final bool isText4Underlined;
  final void Function()? text1OnTap;
  final void Function()? text2OnTap;
  final void Function()? text3OnTap;
  final void Function()? text4OnTap;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return Align(
          alignment: Alignment.bottomCenter,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: text1,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColourConstant.grey9A9A9A,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: text2,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColourConstant.grey9A9A9A,
                        decoration: isText2Underlined
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: AppColourConstant.grey9A9A9A,
                      ),
                  recognizer: TapGestureRecognizer()..onTap = text2OnTap,
                ),
                TextSpan(
                  text: text3 ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColourConstant.grey9A9A9A,
                      ),
                ),
                TextSpan(
                  text: text4 ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColourConstant.grey9A9A9A,
                        decoration: isText4Underlined
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: AppColourConstant.grey9A9A9A,
                      ),
                  recognizer: TapGestureRecognizer()..onTap = text4OnTap,
                ),
              ],
              recognizer: TapGestureRecognizer()..onTap = text1OnTap,
            ),
          ),
        );
      },
    );
  }
}
