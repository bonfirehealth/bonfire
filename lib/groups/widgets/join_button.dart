// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/l10n/l10n.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 108,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: onPressed != null
              ? AppColourConstant.green3AE2D6
              : AppColourConstant.greyCDD5E0,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Text(
          onPressed != null ? l10n.join : l10n.joined,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColourConstant.whiteFFFFFF,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
