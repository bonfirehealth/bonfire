// Flutter imports:
import 'package:flutter/material.dart';

class FooterViewWrapper extends StatelessWidget {
  const FooterViewWrapper({
    super.key,
    this.footer,
    required this.child,
  });

  final Widget? footer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: [
                child,
                if (footer != null) ...[
                  const Spacer(),
                  footer!,
                ],
              ],
            ),
          ),
        ),
      );
    });
  }
}
