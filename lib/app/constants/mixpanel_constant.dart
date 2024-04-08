// Project imports:
import 'package:bonfirehealth/app/helpers/helpers.dart';

class MixpanelConstant {
  MixpanelConstant._();

  static String getProjectToken(AppFlavor environment) {
    switch (environment) {
      case AppFlavor.development:
        return 'b6191cdc69318142e03c83b3b5e17b74';
      case AppFlavor.staging:
        return '4b84cc87f59efc0d28741a6956ca59d3';
      case AppFlavor.production:
        return '843d59b0eb89152873f6dd35e95c6ecf';
    }
  }
}
