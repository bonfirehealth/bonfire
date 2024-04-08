// ignore_for_file: use_build_context_synchronously

// Dart imports:
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_browser_detect/web_browser_detect.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/js/onesignal.dart';

/// Generate ID with current timestamp,
/// in addition of 7 random number at the end.
String generateId() {
  final now = DateTime.now();
  final year = (now.year % 100).toString();
  final month = (now.month).toString().padLeft(2, '0');
  final day = (now.day).toString().padLeft(2, '0');
  final hour = (now.hour).toString().padLeft(2, '0');
  final minute = (now.minute).toString().padLeft(2, '0');
  final second = (now.second).toString().padLeft(2, '0');
  final randomSequence = randomNumeric(7);
  return '$year$month$day$hour$minute$second$randomSequence';
}

Future<String> generatePackageInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();

  var env = 'Prod';
  final version = packageInfo.version;
  final buildNumber = packageInfo.buildNumber;

  if (FlavorConfig.isStaging()) {
    env = 'Stg';
  } else if (FlavorConfig.isDevelopment()) {
    env = 'Dev';
  }

  return '$env v$version ($buildNumber)';
}

Future<Map<String, dynamic>> generatePackageData() async {
  final packageInfo = await PackageInfo.fromPlatform();

  return <String, dynamic>{
    'package_id': packageInfo.packageName,
    'platform_name': defaultTargetPlatform.name,
    'version': packageInfo.version,
    'build_number': packageInfo.buildNumber,
  };
}

double resizeByHeight(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * value / 812;
}

double resizeByWidth(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * value / 375;
}

Future<String?> convertImagePathToBase64(String? imagePath) async {
  final pathOfImage = File(imagePath!);
  final bytes = await pathOfImage.readAsBytes();

  return base64.encode(bytes);
}

Future<String?> convertUint8ListToBase64(Uint8List? image) async {
  final directory = await getApplicationDocumentsDirectory();
  final pathOfImage = await File('${directory.path}/image.png').create();
  await pathOfImage.writeAsBytes(image!);

  final bytes = await pathOfImage.readAsBytes();

  return base64.encode(bytes);
}

Uint8List convertBase64ToImage(String base64Image) {
  return base64.decode(base64Image);
}

String convertUint8ListToBase64String(Uint8List image) {
  final base64String = base64Encode(image);
  return base64String;
}

PermissionStatus getPermissionStatus(String permission) {
  switch (permission) {
    case 'granted':
      return PermissionStatus.granted;
    case 'denied':
      return PermissionStatus.denied;
    case 'limited':
      return PermissionStatus.limited;
    case 'permanentlyDenied':
      return PermissionStatus.permanentlyDenied;
    case 'restricted':
      return PermissionStatus.restricted;
    default:
      return PermissionStatus.denied;
  }
}

void logInfo(dynamic value) {
  if (kDebugMode) {
    developer.log('\x1B[34m$value\x1B[0m');
  }
}

void logSuccess(dynamic value) {
  if (kDebugMode) {
    developer.log('\x1B[32m$value\x1B[0m');
  }
}

void logWarning(dynamic value) {
  if (kDebugMode) {
    developer.log('\x1B[33m$value\x1B[0m');
  }
}

void logError(dynamic value) {
  if (kDebugMode) {
    developer.log('\x1B[31m$value\x1B[0m');
  }
}

Gender getGender(String? value) {
  switch (value) {
    case 'Male':
      return Gender.Male;
    case 'Female':
      return Gender.Female;
    default:
      return Gender.ThirdGender;
  }
}

StressLevel getStressLevel(String? value) {
  switch (value) {
    case 'Very Low':
      return StressLevel.veryLow;
    case 'Low':
      return StressLevel.low;
    case 'Normal':
      return StressLevel.normal;
    case 'High':
      return StressLevel.high;
    case 'Very High':
      return StressLevel.veryHigh;
    default:
      return StressLevel.normal;
  }
}

String getStressLevelName(StressLevel value) {
  switch (value) {
    case StressLevel.veryLow:
      return 'Very Low';
    case StressLevel.low:
      return 'Low';
    case StressLevel.normal:
      return 'Normal';
    case StressLevel.high:
      return 'High';
    case StressLevel.veryHigh:
      return 'Very High';
    case StressLevel.unknown:
      return 'Unknown';
  }
}

String partialObscureText(String value) {
  return value.substring(0, 2) + '*' * (value.length - 2);
}

String partialObscureTextList(BuildContext context, List<String> list) {
  final l10n = context.l10n;
  if (list.length > 1) {
    return '${list[0].substring(0, 2)} ${'*' * 5} + ${l10n.setMore(list.length - 1)}';
  } else if (list.length == 1) {
    return '${list[0].substring(0, 2)} ${'*' * (list[0].length - 2)}';
  }
  return '';
}

Future<bool> checkForMobileBrowserCompatibility() async {
  var isBrowserSupported = false;
  final deviceInfo = DeviceInfoPlugin();
  final webBrowserInfo = await deviceInfo.webBrowserInfo;
  final webBrowserName = webBrowserInfo.browserName;
  final browser = Browser();
  final webUserAgent = html.window.navigator.userAgent;

  if (webUserAgent.contains('CriOS')) {
    isBrowserSupported = false;
  }

  if (kIsWeb) {
    var versionNumber = 56;

    if (browser.version != 'Unknown version') {
      if (browser.version.contains('.')) {
        versionNumber = int.parse(browser.version.split('.')[0]);
      }
    }

    switch (webBrowserName) {
      case BrowserName.chrome:
        if (!html.window.navigator.userAgent.contains('CriOS')) {
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
        if (!html.window.navigator.userAgent.contains('CriOS')) {
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
  }
  return isBrowserSupported;
}

int daysBetween(DateTime from, DateTime to) {
  final newFrom = DateTime(from.year, from.month, from.day);
  final newTo = DateTime(to.year, to.month, to.day);
  return (newTo.difference(newFrom).inHours / 24).round();
}

String generateGraphqlFilePath(String type, String value) {
  return 'lib/app/graphql/$type/$value.graphql';
}

Future<String> loadQuery(String filePath) async {
  return rootBundle.loadString(filePath);
}

Future<String> getLocale() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  final locale = sharedPrefs.getString('locale') ?? 'en';
  Intl.defaultLocale = locale;
  return Future.value(locale);
}

Future<void> onTermsOfServiceHTMLSelected(BuildContext context) async {
  final l10n = context.l10n;
  final url = '${Uri.base.origin}/policies/terms_of_service.html';
  await context.router.push(
    BrowserRoute(
      title: l10n.termsOfService,
      url: url,
    ),
  );
}

Future<void> onPDPANoticeHTMLSelected(BuildContext context) async {
  final url = '${Uri.base.origin}/policies/data_protection_notice.html';
  await context.router.push(
    BrowserRoute(
      title: 'Data protection notice',
      url: url,
    ),
  );
}

Future<void> onAllowPushNotifications(BuildContext context) async {
  final l10n = context.l10n;
  var permissionStatus = PermissionStatus.denied;

  if (!kIsWeb) {
    permissionStatus = await Permission.notification.request();
  } else {
    try {
      permissionStatus =
          getPermissionStatus(await html.Notification.requestPermission());
      logInfo(permissionStatus);
    } catch (e) {
      if (kIsWeb) {
        checkPushNotificationEnabled();
        Future<void>.delayed(
          const Duration(milliseconds: 1000),
          () async {
            await updatePushNotificationToken();
          },
        );
      }
    }
  }

  switch (permissionStatus) {
    case PermissionStatus.granted:
    case PermissionStatus.limited:
      if (kIsWeb) {
        checkPushNotificationEnabled();
        Future<void>.delayed(const Duration(milliseconds: 1000), () async {
          await updatePushNotificationToken();
        });
      }
      break;
    case PermissionStatus.restricted:
    case PermissionStatus.provisional:
    case PermissionStatus.denied:
      break;

    case PermissionStatus.permanentlyDenied:
      showSnackbarDialog(
        context,
        l10n.allowNotifications,
        onPressed: openAppSettings,
      );
      break;
  }
}

Future<void> updatePushNotificationToken() async {
  final webPushNotificationToken =
      html.window.localStorage['flutter.web_push_notification_token'];
  logInfo('webPushNotificationToken $webPushNotificationToken');
  if (webPushNotificationToken != null && webPushNotificationToken != '') {
    final user = await UserRepo.updateUser(
      webPushNotificationToken: webPushNotificationToken,
    );
    logInfo('updatePushNotificationToken(): $user');
  }
}

String formatDateString(String dateString) {
  return dateString.replaceAll('000000000Z', '000Z');
}
