// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webviewx/webviewx.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/browser/blocs/browser_bloc.dart';
import 'package:bonfirehealth/browser/browser.dart';

class BrowserPage extends StatelessWidget {
  const BrowserPage({
    super.key,
    @QueryParam('title') this.title,
    @QueryParam('url') this.url,
    @QueryParam('is_url_bypass') this.isUrlBypass = false,
  });

  final String? title;
  final String? url;
  final bool isUrlBypass;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BrowserBloc>(
      create: (_) => BrowserBloc(
        title: title,
        url: url,
        isUrlBypass: isUrlBypass,
      ),
      child: Scaffold(
        backgroundColor: AppColourConstant.whiteF8F8F8,
        appBar: AppBar(
          backgroundColor: AppColourConstant.whiteF8F8F8,
          iconTheme: Theme.of(context).iconTheme,
          centerTitle: true,
          title: BlocSelector<BrowserBloc, BrowserState, String?>(
            selector: (state) => state.title,
            builder: (_, title) {
              return Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge,
              );
            },
          ),
        ),
        body: const SafeArea(
          child: BrowserBody(),
        ),
      ),
    );
  }
}

class BrowserBody extends StatefulWidget {
  const BrowserBody({super.key});

  @override
  State<BrowserBody> createState() => _BrowserBodyState();
}

class _BrowserBodyState extends State<BrowserBody> {
  late WebViewXController<dynamic> webviewController;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowserBloc, BrowserState>(
      builder: (_, state) {
        if (state.url == null) {
          return const SizedBox.shrink();
        }

        Future.delayed(const Duration(milliseconds: 1000), () {
          webviewController.loadContent(
            state.url!,
            state.isUrlBypass ? SourceType.urlBypass : SourceType.url,
          );
        });
        return WebViewX(
          key: const ValueKey('webviewx'),
          onWebViewCreated: (controller) {
            webviewController = controller;
          },
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        );
      },
    );
  }
}
