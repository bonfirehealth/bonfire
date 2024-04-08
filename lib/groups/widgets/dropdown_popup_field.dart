// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/app_colour_constant.dart';

class DropdownPopupField extends StatelessWidget {
  const DropdownPopupField({
    super.key,
    required this.title,
    this.hideIcon = false,
    this.onTap,
  });

  final String title;
  final bool hideIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColourConstant.greyCDD5E0),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColourConstant.grey50535A,
                      ),
                ),
              ),
            ),
            if (!hideIcon) const Icon(FontAwesomeIcons.chevronDown),
          ],
        ),
      ),
    );
  }
}
