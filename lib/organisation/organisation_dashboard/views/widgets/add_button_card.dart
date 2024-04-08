part of '../organisation_dashboard_page.dart';

class AddButtonCard extends StatelessWidget {
  const AddButtonCard({
    super.key,
    this.onPressed,
    this.width = 150,
    this.height = 125,
  });

  final void Function()? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: width,
          height: height,
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
          child: Center(
            child: Stack(
              children: [
                const Align(
                  child: Icon(
                    Icons.circle,
                    size: 80,
                    color: AppColourConstant.greyE6EFFF,
                  ),
                ),
                Align(
                  child: AppImage.asset(ImageConstant.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
