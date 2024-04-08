// Flutter imports:
import 'package:flutter/foundation.dart';

class PlatformHelper {
  PlatformHelper._();

  static bool isMobile() {
    return defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android;
  }

  static bool isMobileWeb() {
    return kIsWeb && isMobile();
  }

  static bool isDesktopWeb() {
    return kIsWeb && !isMobile();
  }
}
