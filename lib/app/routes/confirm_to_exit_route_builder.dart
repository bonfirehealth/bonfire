// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/routes/app_router_observer.dart';
import 'package:bonfirehealth/app/widgets/spacer.dart';

Route<T> confirmToExitRouteBuilder<T>(
  BuildContext context,
  Widget child,
  CustomPage<T> page,
) {
  return PageRouteBuilder(
    fullscreenDialog: page.fullscreenDialog,
    settings: page,
    pageBuilder: (context, __, ___) => WillPopScope(
      onWillPop: () => confirmToExit(context),
      child: child,
    ),
  );
}

Future<bool> confirmToExit(BuildContext context) async {
  final isLastRoute = AppRouterObserver().history.length <= 1;
  if (isLastRoute) {
    final res = await showDialog<bool>(
      context: context,
      builder: (_) => const _ConfirmToExitAppDialog(),
    );
    if (res != null && res) {
      return Future.value(true);
    }
    return Future.value(false);
  }
  return Future.value(true);
}

class _ConfirmToExitAppDialog extends StatelessWidget {
  const _ConfirmToExitAppDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      key: key,
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(26, 22, 26, 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.globalConfirmation,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SpacerVertical(4),
            Text(
              context.l10n.exitAppConfirmationTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SpacerVertical(8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(context.l10n.no),
                ),
                const SpacerHorizontal(8),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(context.l10n.yes),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
