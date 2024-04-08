// Project imports:
import 'package:bonfirehealth/app/helpers/helpers.dart';

class AppConstant {
  AppConstant._();

  static const String appName = 'Bonfire Health';
  static const String appPrefix = 'bonfirehealth';
  static const String appUrl = 'https://app.bonfire.health';
  static const String companyUrl = 'https://bonfire.health';
  static const String timezone = 'Asia/Singapore';
  static const String themeColor = '#1A56CF';

  static String? emailDomainUrl;

  static void init(AppFlavor environment) {
    switch (environment) {
      case AppFlavor.development:
        emailDomainUrl = 'dev.bonfire.love';
        break;
      case AppFlavor.staging:
        emailDomainUrl = 'stg.bonfire.love';
        break;
      case AppFlavor.production:
        emailDomainUrl = 'bonfire.love';
        break;
    }
  }
}
