// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class SelfCareUsageRepo {
  SelfCareUsageRepo._();

  static Future<List<SelfCareUsage>?> getAllSelfCareUsagesByProfile() async {
    logInfo('getAllSelfCareUsagesByProfile()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'self_care_usages_by_profile',
      'listSelfCareUsages',
      variables: <String, dynamic>{
        'profileID': CoreRepo.profileId,
        'limit': 999999999,
      },
      fromJson: SelfCareUsage.fromJson,
    );
  }

  static Future<Tuple2<SelfCareUsage?, int?>?> getSelfCareUsage(
    String selfCareUsageId,
  ) async {
    logInfo('getSelfCareUsage(): $selfCareUsageId');
    await CoreRepo.init();
    return CoreRepo.getItem<SelfCareUsage>(
      'self_care_usage',
      'getSelfCareUsage',
      variables: <String, dynamic>{
        'selfCareUsageID': selfCareUsageId,
      },
      fromJson: SelfCareUsage.fromJson,
    );
  }

  static Future<Tuple2<SelfCareUsage?, int?>?> createSelfCareUsage({
    String? selfCareID,
  }) async {
    logInfo('createSelfCareUsage()');
    await CoreRepo.init();
    return CoreRepo.createItem<SelfCareUsage>(
      'self_care_usage_create',
      'createSelfCareUsage',
      variables: <String, dynamic>{
        'input': {
          'profileID': CoreRepo.profileId,
          'selfCareID': selfCareID,
        },
      },
      fromJson: SelfCareUsage.fromJson,
    );
  }
}
