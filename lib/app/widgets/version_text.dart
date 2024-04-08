// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/helpers/helpers.dart';

class VersionText extends StatelessWidget {
  const VersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: generatePackageInfo(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              data,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
