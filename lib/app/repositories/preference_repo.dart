// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class PreferenceRepo {
  PreferenceRepo._();

  static Future<List<Preference>?> getAllPreferences() async {
    logInfo('getAllPreferences()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'preferences',
      'listPreferences',
      fromJson: Preference.fromJson,
    );
  }

  static Future<List<ProfilePreference>?> getAllProfilePreferences() async {
    logInfo('getAllProfilePreferences()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'profile_preferences',
      'listProfilePreferences',
      variables: <String, dynamic>{
        'limit': 999999999,
        'profileID': CoreRepo.profileId,
      },
      fromJson: ProfilePreference.fromJson,
    );
  }

  static Future<bool> batchProcessProfilePreferences(
    List<ProfilePreference> profilePreferences,
  ) async {
    logInfo('batchProcessProfilePreferences()');

    for (final profilePreference in profilePreferences) {
      if (profilePreference.preference.isToDelete != null) {
        if (profilePreference.preference.isToDelete!) {
          logInfo('deleteProfilePreference()');
          await deleteProfilePreference(
            profilePreferenceId: profilePreference.id,
          );
        }
      } else {
        if (profilePreference.createdAt == null) {
          logInfo('createProfilePreference(): $profilePreference');
          await createProfilePreference(
            preferenceId: profilePreference.preference.id,
          );
        }
      }
    }

    return true;
  }

  static Future<Tuple2<ProfilePreference?, int?>?> createProfilePreference({
    String? preferenceId,
  }) async {
    logInfo('createProfilePreference()');
    await CoreRepo.init();
    return CoreRepo.createItem<ProfilePreference>(
      'profile_preference_create',
      'createProfilePreference',
      variables: <String, dynamic>{
        'input': {
          'profileID': CoreRepo.profileId,
          'preferenceID': preferenceId,
        },
      },
      fromJson: ProfilePreference.fromJson,
    );
  }

  static Future<bool> batchCreateProfilePreferences(
    List<ProfilePreference> profilePreferences,
  ) async {
    logInfo('batchCreateProfilePreference()');

    for (final profilePreference in profilePreferences) {
      await createProfilePreference(
        preferenceId: profilePreference.preference.id,
      );
    }

    return true;
  }

  static Future<Tuple2<ProfilePreference?, int?>?> updateProfilePreference({
    String? profilePreferenceId,
    String? preferenceId,
  }) async {
    logInfo('updateProfilePreference()');
    await CoreRepo.init();
    return CoreRepo.updateItem<ProfilePreference>(
      'profile_preference_update',
      'updateProfilePreference',
      variables: <String, dynamic>{
        'input': {
          'id': profilePreferenceId,
          'profileID': CoreRepo.profileId,
          'preferenceID': preferenceId,
        },
      },
      fromJson: ProfilePreference.fromJson,
    );
  }

  static Future<bool> batchUpdateProfilePreferences(
    List<ProfilePreference> profilePreferences,
  ) async {
    logInfo('batchUpdateProfilePreferences()');

    for (final profilePreference in profilePreferences) {
      await updateProfilePreference(
        preferenceId: profilePreference.preference.id,
      );
    }

    return true;
  }

  static Future<Tuple2<ProfilePreference?, int?>?> deleteProfilePreference({
    String? profilePreferenceId,
    int version = 1,
  }) async {
    logInfo('deleteProfilePreference()');
    await CoreRepo.init();
    return CoreRepo.deleteItem<ProfilePreference>(
      'profile_preference_delete',
      'deleteProfilePreference',
      variables: <String, dynamic>{
        'input': {
          'id': profilePreferenceId,
          '_version': version,
        },
      },
      fromJson: ProfilePreference.fromJson,
    );
  }
}
