// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/landing/blocs/landing_bloc.dart';
import 'package:bonfirehealth/landing/landing.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
    this.isSupportedBrowser = false,
  });

  final bool isSupportedBrowser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LandingBloc(),
      child: LandingView(isSupportedBrowser: isSupportedBrowser),
    );
  }
}

class LandingView extends StatefulWidget {
  const LandingView({
    super.key,
    this.isSupportedBrowser = false,
  });

  final bool isSupportedBrowser;

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView>
    with AfterLayoutMixin<LandingView> {
  @override
  void afterFirstLayout(BuildContext context) {
    context.read<LandingBloc>().add(const LandingInitSet());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<LandingBloc, LandingState>(
      builder: (_, state) {
        return Stack(
          children: [
            SafeArea(
              minimum: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppImage.asset(
                              ImageConstant.logoCompany,
                              width: 90,
                              height: 90,
                            ),
                          ),
                        ],
                      ),
                      SpacerVertical(resizeByHeight(context, 30)),
                      Text(
                        widget.isSupportedBrowser
                            ? l10n.landingTitle
                            : l10n.useSupportedBrowserTitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColourConstant.grey50535A,
                            ),
                      ),
                      SpacerVertical(resizeByHeight(context, 30)),
                      SizedBox(
                        width: resizeByWidth(context, 200),
                        child: Text(
                          widget.isSupportedBrowser
                              ? l10n.landingMessage
                              : l10n.useSupportedBrowserMessage,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: AppColourConstant.grey50535A,
                                  ),
                        ),
                      ),
                      if (state.deviceInfo != null) ...[
                        SpacerVertical(resizeByHeight(context, 16)),
                        SizedBox(
                          width: resizeByWidth(context, 200),
                          child: Text(
                            state.deviceInfo!,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                        SpacerVertical(resizeByHeight(context, 50)),
                      ],
                    ],
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: VersionText(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
