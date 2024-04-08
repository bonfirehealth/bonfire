// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tuple/tuple.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_browser_detect/web_browser_detect.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/screening/screening.dart';

class WebRTCHelper {
  WebRTCHelper._();

  static Future<Tuple2<BrowserName, bool>>
      checkMobileBrowserCompatibility() async {
    final deviceInfo = DeviceInfoPlugin();
    final webBrowserInfo = await deviceInfo.webBrowserInfo;
    final webBrowserName = webBrowserInfo.browserName;
    final browser = Browser();
    final webUserAgent = html.window.navigator.userAgent;

    var isBrowserSupported = true;
    var versionNumber = 56;
    if (browser.version != 'Unknown version') {
      if (browser.version.contains('.')) {
        versionNumber = int.parse(browser.version.split('.')[0]);
      }
    }

    switch (webBrowserName) {
      case BrowserName.chrome:
        if (!webUserAgent.contains('CriOS')) {
          if (versionNumber >= 56) {
            isBrowserSupported = true;
          } else {
            isBrowserSupported = false;
          }
        } else {
          isBrowserSupported = false;
        }
        break;

      case BrowserName.safari:
        if (!webUserAgent.contains('CriOS')) {
          isBrowserSupported = true;
        } else {
          isBrowserSupported = false;
        }
        break;
      case BrowserName.edge:
      case BrowserName.firefox:
      case BrowserName.samsungInternet:
      case BrowserName.opera:
      case BrowserName.msie:
      case BrowserName.unknown:
        isBrowserSupported = false;
        break;
    }

    return Tuple2<BrowserName, bool>(webBrowserName, isBrowserSupported);
  }

  static Future<PermissionStatus> checkMobileBrowserCameraPermissionStatus({
    bool isDenied = false,
  }) async {
    var cameraPermissionStatus = PermissionStatus.granted;
    final permission = await html.window.navigator.permissions
        ?.query(<String, dynamic>{'name': 'camera'});

    switch (permission?.state) {
      case 'granted':
        cameraPermissionStatus = PermissionStatus.granted;
        break;
      case 'denied':
      case 'prompt':
        cameraPermissionStatus = PermissionStatus.denied;
        break;
    }

    if (isDenied) {
      cameraPermissionStatus = PermissionStatus.denied;
    }

    logInfo(cameraPermissionStatus);
    return cameraPermissionStatus;
  }

  static Map<String, dynamic> setMediaConstraintsByBrowser(
    BrowserName browserName,
  ) {
    if (browserName == BrowserName.safari) {
      return <String, dynamic>{
        'audio': false,
        'video': {
          'width': '640',
          'height': '480',
          'frameRate': {
            'min': '30',
            'ideal': '30',
            'max': '30',
          },
          'facingMode': 'user',
        },
      };
    } else {
      return <String, dynamic>{
        'audio': false,
        'video': {
          'minWidth': 640,
          'maxWidth': 640,
          'minHeight': 480,
          'maxHeight': 480,
          'minFrameRate': 30,
          'maxFrameRate': 30,
          'frameRate': {'exact': 30},
          'facingMode': {'exact': 'user'},
        }
      };
    }
  }

  static Color setColourByScreeningStatus(
    ScreeningStatus? screeningStatus,
    double? bodyTemperature,
  ) {
    final newScreeningStatus = screeningStatus ?? ScreeningStatus.setup;
    switch (newScreeningStatus) {
      case ScreeningStatus.setup:
      case ScreeningStatus.start:
      case ScreeningStatus.record:
      case ScreeningStatus.confirmation:
      case ScreeningStatus.firstResult:
      case ScreeningStatus.warmDown:
      case ScreeningStatus.completed:
        return AppColourConstant.black000000;
      case ScreeningStatus.warmUp:
      case ScreeningStatus.predict:
        return bodyTemperature != null &&
                !VitalSign.temperature.isNormal(bodyTemperature)
            ? Colors.redAccent
            : AppColourConstant.green00A25D;
    }
  }

  static double generateRandomHumanTemperature() {
    return 36 + Random().nextDouble();
  }
}
