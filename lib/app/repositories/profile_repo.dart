// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class ProfileRepo {
  ProfileRepo._();

  static Future<Tuple2<Profile?, int?>?> getProfile() async {
    logInfo('getProfile() ${CoreRepo.profileId}');
    await CoreRepo.init();
    return CoreRepo.getItem<Profile>(
      'profile',
      'getProfile',
      variables: <String, dynamic>{
        'profileID': CoreRepo.profileId,
      },
      fromJson: Profile.fromJson,
    );
  }

  static Future<Tuple2<Profile?, int?>?> updateProfile({
    int? age,
    String? gender,
    double? weight,
    String? weightUnit,
    String? weightUnitName,
    double? height,
    String? heightUnit,
    String? heightUnitName,
    double? bodyMassIndex,
    String? stressLevel,
    double? oxygenLevel,
    double? oxygenSaturationLevel,
    double? respiratoryRate,
    double? stressIndex,
    double? bodyTemperature,
    double? systolicBloodPressure,
    double? diastolicBloodPressure,
    double? heartRate,
    double? heartRateVariability,
    double? sympatheticNervousSystemIndex,
    int? version = 1,
  }) async {
    logInfo('updateProfile()');
    await CoreRepo.init();

    final variables = <String, dynamic>{
      'input': {
        'id': CoreRepo.profileId,
        '_version': version,
      },
    };

    final input = variables['input'] as Map<String, dynamic>;

    if (age != null) {
      input['age'] = age.toString();
    }

    if (gender != null) {
      input['gender'] = gender;
    }
    if (weight != null) {
      input['weight'] = weight.toString();
    }

    if (weightUnit != null) {
      input['weightUnit'] = weightUnit;
    }
    if (weightUnitName != null) {
      input['weightUnitName'] = weightUnitName;
    }
    if (height != null) {
      input['height'] = height.toString();
    }
    if (heightUnit != null) {
      input['heightUnit'] = heightUnit;
    }
    if (heightUnitName != null) {
      input['heightUnitName'] = heightUnitName;
    }

    if (bodyMassIndex != null) {
      input['bodyMassIndex'] = bodyMassIndex;
    }

    if (stressLevel != null) {
      input['stressLevel'] = stressLevel;
    }
    if (oxygenLevel != null) {
      input['oxygenLevel'] = oxygenLevel;
    }
    if (oxygenSaturationLevel != null) {
      input['oxygenSaturationLevel'] = oxygenSaturationLevel;
    }
    if (respiratoryRate != null) {
      input['respiratoryRate'] = respiratoryRate;
    }
    if (stressIndex != null) {
      input['stressIndex'] = stressIndex;
    }
    if (bodyTemperature != null) {
      input['bodyTemperature'] = bodyTemperature;
    }
    if (systolicBloodPressure != null) {
      input['systolicBloodPressure'] = systolicBloodPressure;
    }
    if (diastolicBloodPressure != null) {
      input['diastolicBloodPressure'] = diastolicBloodPressure;
    }

    if (heartRate != null) {
      input['heartRate'] = heartRate;
    }

    if (heartRateVariability != null) {
      input['heartRateVariability'] = heartRateVariability;
    }

    if (sympatheticNervousSystemIndex != null) {
      input['sympatheticNervousSystemIndex'] = sympatheticNervousSystemIndex;
    }

    return CoreRepo.updateItem<Profile>(
      'profile_update',
      'updateProfile',
      variables: variables,
      fromJson: Profile.fromJson,
    );
  }
}
