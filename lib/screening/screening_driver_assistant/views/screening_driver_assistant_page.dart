// Dart imports:
import 'dart:html';
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

class ScreeningDriverAssistantPage extends StatefulWidget {
  const ScreeningDriverAssistantPage({super.key});

  @override
  State<ScreeningDriverAssistantPage> createState() =>
      _ScreeningDriverAssistantPageState();
}

class _ScreeningDriverAssistantPageState
    extends State<ScreeningDriverAssistantPage> {
  final String viewID = 'screening-driver-assistant-id';

  @override
  void initState() {
    super.initState();
    loadHtmlFromAssets();
  }

  Future<void> loadHtmlFromAssets() async {
    // ignore: undefined_prefixed_name, avoid_dynamic_calls
    ui.platformViewRegistry.registerViewFactory(
      viewID,
      (int id) {
        final element = IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          ..style.border = 'none'
          ..style.padding = '0'
          ..style.overflow = 'hidden'
          ..style.width = '100%'
          ..style.height = '100%'
          ..src = 'screening_driver_assistant.html';

        return element;
      },
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: viewID,
    );
  }
}
