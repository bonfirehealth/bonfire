part of '../web_screening_page.dart';

class PermissionDeniedView extends StatelessWidget {
  const PermissionDeniedView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (!context.router.isTopMost) {
                    context.router.pop();
                  } else {
                    context.router.replace(const HomeRoute());
                  }
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColourConstant.grey50535A.withOpacity(0.3),
                ),
              ),
              Text(
                l10n.cameraPermissionDeniedTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Text(
            l10n.cameraPermissionDeniedMessage,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
