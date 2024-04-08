// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AssessmentRepo {
  AssessmentRepo._();

  static Future<List<Assessment>?> getAllAssessments() async {
    logInfo('getAllAssessments()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'assessments',
      'listAssessments',
      variables: <String, dynamic>{},
      fromJson: Assessment.fromJson,
    );
  }

  static Future<List<Assessment>?> getAllAssessmentsByProfileID(String profileID) async {
    logInfo('getAllAssessments()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'assessments_by_profileid',
      'listAssessments',
      variables: <String, dynamic>{'profileID': profileID},
      fromJson: Assessment.fromJson,
    );
  }

  static Future<Tuple2<Assessment?, int?>?> getAssessment(
    String assessmentId,
  ) async {
    logInfo('getAssessment(): $assessmentId');
    await CoreRepo.init();
    return CoreRepo.getItem<Assessment>(
      'assessment',
      'getAssessment',
      variables: <String, dynamic>{
        'assessmentID': assessmentId,
      },
      fromJson: Assessment.fromJson,
    );
  }

  static Future<Tuple2<Assessment?, int?>?> createAssessment({
    DateTime? startDate,
    DateTime? endDate,
    String? mood,
    String? stressLevel,
    double? oxygenLevel,
    double? oxygenSaturationLevel,
    double? respiratoryRate,
    double? stressIndex,
    double? bodyTemperature,
    double? systolicBloodPressure,
    double? diastolicBloodPressure,
    double? heartRate,
    double? heartRateManual,
    String? heartRateManualSource,
    double? heartRateVariability,
    String? kbType,
    double? kbArtefact,
    String? kbArtefactLevel,
    String? kbCreateTimestamp,
    double? kbMeanHrBpm,
    double? kbMeanRRMs,
    double? kbPnsIndex,
    double? kbReadiness,
    double? kbRmssdMs,
    double? kbSd1Ms,
    double? kbSd2Ms,
    double? kbSdnnMs,
    double? kbSnsIndex,
    double? kbStressIndex,
    int? score,
    String? timezone = 'Asia/Singapore',
    String? selfCareId,
  }) async {
    logInfo('createAssessment()');
    await CoreRepo.init();
    final resp = await CoreRepo.createItem<Assessment>(
      'assessment_create',
      'createAssessment',
      variables: <String, dynamic>{
        'input': {
          'profileID': CoreRepo.profileId,
          'organisationID': CoreRepo.organisationId,
          'startDate': TemporalDateTime(startDate!).toString(),
          'endDate': TemporalDateTime(endDate!).toString(),
          'mood': mood,
          'stressLevel': stressLevel,
          'oxygenLevel': oxygenLevel,
          'oxygenSaturationLevel': oxygenSaturationLevel,
          'respiratoryRate': respiratoryRate,
          'stressIndex': stressIndex,
          'bodyTemperature': bodyTemperature,
          'systolicBloodPressure': systolicBloodPressure,
          'diastolicBloodPressure': diastolicBloodPressure,
          'heartRate': heartRate,
          'heartRateManual': heartRateManual,
          'heartRateManualSource': heartRateManualSource,
          'heartRateVariability': heartRateVariability,
          'kbType': kbType,
          'kbArtefact': kbArtefact,
          'kbArtefactLevel': kbArtefactLevel,
          'kbCreateTimestamp': kbCreateTimestamp,
          'kbMeanHrBpm': kbMeanHrBpm,
          'kbMeanRRMs': kbMeanRRMs,
          'kbPnsIndex': kbPnsIndex,
          'kbReadiness': kbReadiness,
          'kbRmssdMs': kbRmssdMs,
          'kbSd1Ms': kbSd1Ms,
          'kbSd2Ms': kbSd2Ms,
          'kbSdnnMs': kbSdnnMs,
          'kbSnsIndex': kbSnsIndex,
          'kbStressIndex': kbStressIndex,
          'score': score,
          'timezone': timezone,
          'assessmentSelfCareId': selfCareId,
        },
      },
      fromJson: Assessment.fromJson,
    );
    return resp;
  }

  static Future<Tuple2<Assessment?, int?>?> updateAssessment({
    String? assessmentId,
    DateTime? endDate,
    String? mood,
    String? stressLevel,
    double? oxygenLevel,
    double? oxygenSaturationLevel,
    double? respiratoryRate,
    double? stressIndex,
    double? bodyTemperature,
    double? systolicBloodPressure,
    double? diastolicBloodPressure,
    double? heartRate,
    double? heartRateManual,
    String? heartRateManualSource,
    double? heartRateVariability,
    double? sympatheticNervousSystemIndex,
    String? kbType,
    double? kbArtefact,
    String? kbArtefactLevel,
    String? kbCreateTimestamp,
    double? kbMeanHrBpm,
    double? kbMeanRRMs,
    double? kbPnsIndex,
    double? kbReadiness,
    double? kbRmssdMs,
    double? kbSd1Ms,
    double? kbSd2Ms,
    double? kbSdnnMs,
    double? kbSnsIndex,
    double? kbStressIndex,
    int? score,
    String? timezone = 'Asia/Singapore',
    String? selfCareId,
    int? version = 1,
  }) async {
    logInfo('updateAssessment()');
    await CoreRepo.init();

    return CoreRepo.updateItem<Assessment>(
      'assessment_update',
      'updateAssessment',
      variables: <String, dynamic>{
        'input': {
          'id': assessmentId,
          'profileID': CoreRepo.profileId,
          'organisationID': CoreRepo.organisationId,
          'endDate': TemporalDateTime(endDate!).toString(),
          'mood': mood,
          'stressLevel': stressLevel,
          'oxygenLevel': oxygenLevel,
          'oxygenSaturationLevel': oxygenSaturationLevel,
          'respiratoryRate': respiratoryRate,
          'stressIndex': stressIndex,
          'bodyTemperature': bodyTemperature,
          'systolicBloodPressure': systolicBloodPressure,
          'diastolicBloodPressure': diastolicBloodPressure,
          'heartRate': heartRate,
          'heartRateManual': heartRateManual,
          'heartRateManualSource': heartRateManualSource,
          'heartRateVariability': heartRateVariability,
          'sympatheticNervousSystemIndex': sympatheticNervousSystemIndex,
          'kbType': kbType,
          'kbArtefact': kbArtefact,
          'kbArtefactLevel': kbArtefactLevel,
          'kbCreateTimestamp': kbCreateTimestamp,
          'kbMeanHrBpm': kbMeanHrBpm,
          'kbMeanRRMs': kbMeanRRMs,
          'kbPnsIndex': kbPnsIndex,
          'kbReadiness': kbReadiness,
          'kbRmssdMs': kbRmssdMs,
          'kbSd1Ms': kbSd1Ms,
          'kbSd2Ms': kbSd2Ms,
          'kbSdnnMs': kbSdnnMs,
          'kbSnsIndex': kbSnsIndex,
          'kbStressIndex': kbStressIndex,
          'score': score,
          'timezone': timezone,
          'assessmentSelfCareId': selfCareId,
          '_version': version,
        },
      },
      fromJson: Assessment.fromJson,
    );
  }
}
