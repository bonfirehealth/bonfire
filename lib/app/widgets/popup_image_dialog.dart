// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class PopupImageDialog extends StatelessWidget {
  const PopupImageDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.buttonText,
    required this.onButtonPressed,
    this.isStarred = false,
  });

  final String title;
  final String subtitle;
  final String image;
  final String buttonText;
  final void Function()? onButtonPressed;
  final bool isStarred;

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
                      if (isStarred) AppImage.asset(ImageConstant.star),
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
                    textAlign: TextAlign.center,
                  ),
                  const SpacerVertical(18),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColourConstant.grey50535A,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SpacerVertical(18),
                  AppImage.asset(
                    image,
                    width: 250,
                    height: 250,
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
