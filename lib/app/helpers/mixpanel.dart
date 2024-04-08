// Package imports:
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/helpers/helpers.dart';

class MixpanelHelper {
  MixpanelHelper._();

  static Mixpanel? mixpanel;

  static Future<void> init(AppFlavor environment) async {
    final token = MixpanelConstant.getProjectToken(
      environment,
    );
    final superProperties = <String, dynamic>{};
    if (mixpanel == null) {
      mixpanel = await Mixpanel.init(token, trackAutomaticEvents: true);
      mixpanel?.registerSuperPropertiesOnce(superProperties);
    }
  }

  static void setCredentials(String userId, String name, String emailAddress) {
    mixpanel?.identify(userId);
    mixpanel?.getPeople().set(r'$name', name);
    mixpanel?.getPeople().set(r'$email', emailAddress);
  }

  static void track(String eventName, Map<String, dynamic> properties) =>
      mixpanel?.track(eventName, properties: properties);

  static void timeEvent(String eventName) => mixpanel?.timeEvent(eventName);
}
