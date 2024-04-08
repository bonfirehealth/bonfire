// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class ActivityRepo {
  ActivityRepo._();

  static Future<List<ProfileActivity>?>
      getAllProfileActivitiesByProfile() async {
    logInfo('getAllProfileActivitiesByProfile()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'profile_activities_by_profile',
      'listProfileActivities',
      variables: <String, dynamic>{
        'profileID': CoreRepo.profileId,
        'limit': 999999999,
      },
      fromJson: ProfileActivity.fromJson,
    );
  }

  static Future<Tuple2<ProfileActivity?, int?>?> getProfileActivity(
    String profileActivityId,
  ) async {
    logInfo('getProfileActivity(): $profileActivityId');
    await CoreRepo.init();
    return CoreRepo.getItem<ProfileActivity>(
      'profile_activity',
      'getProfileActivity',
      variables: <String, dynamic>{
        'profileActivityID': profileActivityId,
      },
      fromJson: ProfileActivity.fromJson,
    );
  }

  static Future<Tuple2<ProfileActivity?, int?>?> createProfileActivity({
    String? activityId,
  }) async {
    logInfo('createProfileActivity()');
    await CoreRepo.init();
    return CoreRepo.createItem<ProfileActivity>(
      'profile_activity_create',
      'createProfileActivity',
      variables: <String, dynamic>{
        'input': {
          'profileID': CoreRepo.profileId,
          'activityID': activityId,
        },
      },
      fromJson: ProfileActivity.fromJson,
    );
  }
}
