// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_browser_detect/web_browser_detect.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(const LandingState()) {
    on<LandingInitSet>(_onLandingLandingInitSet);
  }

  Future<void> _onLandingLandingInitSet(
    LandingInitSet event,
    Emitter<LandingState> emit,
  ) async {
    final deviceInfo = DeviceInfoPlugin();
    final webBrowserInfo = await deviceInfo.webBrowserInfo;
    final webBrowserName = webBrowserInfo.browserName;
    final browser = Browser();
    final webUserAgent = html.window.navigator.userAgent;
    emit(
      state.copyWith(
        deviceInfo:
            '${webBrowserName.name} (${browser.version}): $webUserAgent',
      ),
    );
  }
}
