// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class SaveIconButton extends StatelessWidget {
  const SaveIconButton({
    super.key,
    this.isLoading = false,
    this.isSaved = false,
    this.size = 20,
    this.onPressed,
  });

  final bool isLoading;
  final bool isSaved;
  final double size;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          return null;
        }),
      ),
      child: Row(
        children: [
          if (isLoading) ...[
            if (!isSaved) ...[
              Icon(
                FontAwesomeIcons.heart,
                color: AppColourConstant.redAA0000,
                size: size,
              ),
            ] else ...[
              Icon(
                FontAwesomeIcons.solidHeart,
                color: AppColourConstant.redAA0000,
                size: size,
              ),
            ],
          ] else ...[
            if (!isSaved) ...[
              Icon(
                FontAwesomeIcons.heart,
                color: AppColourConstant.redAA0000,
                size: size,
              ),
            ] else ...[
              Icon(
                FontAwesomeIcons.solidHeart,
                color: AppColourConstant.redAA0000,
                size: size,
              ),
            ],
          ],
        ],
      ),
    );
  }
}
