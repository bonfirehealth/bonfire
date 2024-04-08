// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';

class TopButton extends StatelessWidget {
  const TopButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 34,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: onPressed != null
              ? Theme.of(context).primaryColor
              : AppColourConstant.greyCDD5E0,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColourConstant.whiteFFFFFF,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(
                FontAwesomeIcons.chevronRight,
                color: AppColourConstant.whiteFFFFFF,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
