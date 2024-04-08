// // ignore_for_file: depend_on_referenced_packages

// // Flutter imports:
// import 'package:flutter/services.dart';

// // Package imports:
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:local_auth/error_codes.dart' as auth_error;
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';
// import 'package:local_auth_ios/local_auth_ios.dart';

// class Biometrics {
//   Biometrics._();

//   static final localAuth = LocalAuthentication();

//   static Future<bool> checkBioMetricsAvailable() async {
//     return await localAuth.canCheckBiometrics ||
//         await localAuth.isDeviceSupported();
//   }

//   static Future<bool> checkBiometricsEnrolled() async {
//     final list = await localAuth.getAvailableBiometrics();
//     return list.isNotEmpty;
//   }

//   static Future<List<BiometricType>> getAvailableBiometrics() async {
//     return localAuth.getAvailableBiometrics();
//   }

//   static Future<bool> authenticate(AppLocalizations l10n) async {
//     try {
//       return localAuth.authenticate(
//         localizedReason: l10n.useTouchFaceIdSubtitle,
//         authMessages: <AuthMessages>[
//           AndroidAuthMessages(
//             signInTitle: l10n.secureWithBiometrics,
//             cancelButton: l10n.cancel,
//           ),
//           IOSAuthMessages(
//             localizedFallbackTitle: l10n.secureWithBiometrics,
//             cancelButton: l10n.cancel,
//           ),
//         ],
//       );
//     } on PlatformException catch (e) {
//       if (e.code == auth_error.notEnrolled) {
//         // ...
//       } else if (e.code == auth_error.lockedOut ||
//           e.code == auth_error.permanentlyLockedOut) {
//         // ...
//       } else {
//         // ...
//       }
//       return Future.value(false);
//     }
//   }
// }
