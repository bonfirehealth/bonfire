// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class PopupTextDialog extends StatelessWidget {
  const PopupTextDialog({
    super.key,
    this.icon,
    this.iconSize = 48,
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.buttonText,
    required this.onButtonPressed,
  });

  final String? icon;
  final double iconSize;
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final String buttonText;
  final void Function()? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColourConstant.black1E1F2B.withOpacity(0),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.zero,
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      InkWell(
                        child: SizedBox(
                          width: 18,
                          height: 18,
                          child: AppImage.asset(
                            ImageConstant.closeCross,
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SpacerVertical(18),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColourConstant.grey50535A,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (icon != null) ...[
                    const SpacerVertical(18),
                    AppImage.asset(
                      icon!,
                      width: iconSize,
                      height: iconSize,
                      fit: BoxFit.cover,
                    ),
                  ],
                  const SpacerVertical(18),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: subtitle1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColourConstant.grey50535A,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: subtitle2,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    height: 1.4,
                                  ),
                        ),
                        TextSpan(
                          text: subtitle3,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColourConstant.grey50535A,
                                    height: 1.4,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SpacerVertical(32),
                  RoundedButton(
                    onPressed: onButtonPressed,
                    title: buttonText,
                  ),
                  const SpacerVertical(32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
