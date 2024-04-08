// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class PoweredBy extends StatelessWidget {
  const PoweredBy({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.poweredBy,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColourConstant.grey50535A,
                      ),
                ),
                AppImage.asset(
                  ImageConstant.logoCompanyGrey,
                  width: 90,
                  height: 90,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
