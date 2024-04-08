// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/widgets/app_image.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.backgroundColor = AppColourConstant.blue1A56CF,
    this.textColor = Colors.white,
    this.icon,
    required this.title,
    this.onPressed,
    this.disabledColor,
    this.disabledTextColor,
    this.isLoading = false,
  });

  final Color backgroundColor;
  final Color textColor;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final AssetImage? icon;
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        overlayColor: MaterialStateProperty.resolveWith(
          (state) {
            if (state.contains(MaterialState.pressed)) {
              return textColor.withOpacity(0.10);
            }
            return null;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return disabledColor ?? backgroundColor.withOpacity(0.3);
          }
          return backgroundColor;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return disabledTextColor ?? textColor.withOpacity(0.5);
          }
          return textColor;
        }),
      ),
      onPressed: !isLoading ? onPressed : null,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 20),
          child: Stack(
            children: !isLoading
                ? [
                    if (icon != null)
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        alignment: Alignment.centerLeft,
                        child: AppImage.asset(
                          icon!.assetName,
                          package: icon!.package,
                        ),
                      ),
                    Center(
                      child: Text(
                        title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                      ),
                    ),
                  ]
                : [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          backgroundColor: backgroundColor,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
