part of '../notifications_home_page.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.isCompleted = false,
    this.title,
    this.onPressed,
  });

  final bool isCompleted;
  final String? title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isCompleted) ...[
              const Icon(
                FontAwesomeIcons.check,
                color: AppColourConstant.whiteFFFFFF,
              ),
            ] else ...[
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColourConstant.whiteFFFFFF,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
