part of '../organisation_dashboard_page.dart';

class CountCard extends StatelessWidget {
  const CountCard({
    super.key,
    required this.value,
    required this.title,
    this.subtitle,
    this.icon,
    this.onPressed,
  });

  final int value;
  final String title;
  final String? subtitle;
  final String? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          height: 125,
          margin: const EdgeInsets.all(16) - const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppColourConstant.whiteFFFFFF,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColourConstant.greyE0E0E0,
                spreadRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) AppImage.asset(icon!),
                    SizedBox(
                      width: 90,
                      child: AutoSizeText(
                        title,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColourConstant.black1E1F2B,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              AutoSizeText(
                value.numeral(),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: AppColourConstant.black1E1F2B,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              if (subtitle != null)
                Expanded(
                  child: AutoSizeText(
                    subtitle!,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColourConstant.grey9A9A9A,
                          fontSize: 7,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
