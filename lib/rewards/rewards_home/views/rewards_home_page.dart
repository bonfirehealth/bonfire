// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class RewardsHomePage extends StatelessWidget {
  const RewardsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: RewardsHomeBody(),
      ),
    );
  }
}

class RewardsHomeBody extends StatelessWidget {
  const RewardsHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(child: Text(l10n.rewards));
  }
}
