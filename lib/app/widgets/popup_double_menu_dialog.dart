// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class PopupDoubleMenuDialog extends StatelessWidget {
  const PopupDoubleMenuDialog({
    super.key,
    required this.buttonText1,
    required this.buttonText2,
    this.buttonBackground1 = AppColourConstant.blue1A56CF,
    this.buttonBackground2 = AppColourConstant.blue1A56CF,
    this.showButton1 = true,
    this.showButton2 = true,
    required this.onButtonPressed1,
    required this.onButtonPressed2,
  });

  final String buttonText1;
  final String buttonText2;
  final Color buttonBackground1;
  final Color buttonBackground2;
  final bool showButton1;
  final bool showButton2;
  final void Function()? onButtonPressed1;
  final void Function()? onButtonPressed2;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColourConstant.black1E1F2B.withOpacity(0),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.zero,
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
                  if (showButton1) ...[
                    RoundedButton(
                      onPressed: onButtonPressed1,
                      title: buttonText1,
                      backgroundColor: buttonBackground1,
                    ),
                    const SpacerVertical(16),
                  ],
                  if (showButton2) ...[
                    RoundedButton(
                      onPressed: onButtonPressed2,
                      title: buttonText2,
                      backgroundColor: buttonBackground2,
                    ),
                    const SpacerVertical(16),
                  ],
                  RoundedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    },
                    backgroundColor: AppColourConstant.grey50535A,
                    title: l10n.cancel,
                  ),
                  const SpacerVertical(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
