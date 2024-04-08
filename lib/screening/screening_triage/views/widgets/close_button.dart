part of '../screening_triage_page.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 10,
      child: GestureDetector(
        onTap: () {
          if (!context.router.isTopMost) {
            context.router.pop();
          } else {
            context.router.replace(const HomeRoute());
          }
        },
        child: AppImage.asset(
          ImageConstant.closeCross,
          width: 18,
          height: 18,
          fit: BoxFit.cover,
          color: AppColourConstant.grey50535A.withOpacity(0.3),
        ),
      ),
    );
  }
}
