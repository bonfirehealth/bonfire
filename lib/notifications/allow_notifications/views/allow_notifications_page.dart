// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AllowNotificationsPage extends StatelessWidget {
  const AllowNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: AllowNotificationsBody(),
      ),
    );
  }
}

class AllowNotificationsBody extends StatelessWidget {
  const AllowNotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppImage.asset(
                    ImageConstant.alissaAvatar,
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
            const SpacerVertical(32),
            Text(
              l10n.helloAlissa,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColourConstant.grey50535A,
                  ),
            ),
            const SpacerVertical(32),
            Text(
              l10n.helloAlissaSubtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColourConstant.grey50535A,
                  ),
            ),
            const SpacerVertical(64),
            RoundedButton(
              onPressed: () => onAllowPushNotifications(context),
              title: l10n.allowNotifications,
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
