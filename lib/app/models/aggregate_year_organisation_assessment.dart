/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

// Package imports:
import 'package:amplify_core/amplify_core.dart' as amplify_core;

// Project imports:
import 'model_provider.dart';

/** This is an auto generated class representing the AggregateYearOrganisationAssessment type in your schema. */
class AggregateYearOrganisationAssessment extends amplify_core.Model {
  static const classType = const _AggregateYearOrganisationAssessmentModelType();
  final String id;
  final amplify_core.TemporalDateTime? _startDate;
  final amplify_core.TemporalDateTime? _endDate;
  final String? _latestMood;
  final String? _latestStressLevel;
  final double? _averageOxygenLevel;
  final double? _averageOxygenSaturationLevel;
  final double? _averageRespiratoryRate;
  final double? _averageStressIndex;
  final double? _averageBodyTemperature;
  final double? _averageSystolicBloodPressure;
  final double? _averageDiastolicBloodPressure;
  final double? _averageHeartRate;
  final double? _averageHeartRateVariability;
  final double? _averageSympatheticNervousSystemIndex;
  final double? _averageScore;
  final double? _averageOxygenLevelForMale;
  final double? _averageOxygenSaturationLevelForMale;
  final double? _averageRespiratoryRateForMale;
  final double? _averageStressIndexForMale;
  final double? _averageBodyTemperatureForMale;
  final double? _averageSystolicBloodPressureForMale;
  final double? _averageDiastolicBloodPressureForMale;
  final double? _averageHeartRateForMale;
  final double? _averageHeartRateVariabilityForMale;
  final double? _averageSympatheticNervousSystemIndexForMale;
  final double? _averageScoreForMale;
  final double? _averageOxygenLevelForFemale;
  final double? _averageOxygenSaturationLevelForFemale;
  final double? _averageRespiratoryRateForFemale;
  final double? _averageStressIndexForFemale;
  final double? _averageBodyTemperatureForFemale;
  final double? _averageSystolicBloodPressureForFemale;
  final double? _averageDiastolicBloodPressureForFemale;
  final double? _averageHeartRateForFemale;
  final double? _averageHeartRateVariabilityForFemale;
  final double? _averageSympatheticNervousSystemIndexForFemale;
  final double? _averageScoreForFemale;
  final int? _numberOfProfiles;
  final int? _numberOfMaleProfiles;
  final int? _numberOfFemaleProfiles;
  final int? _numberOfProfilesLowRiskStressIndex;
  final int? _numberOfProfilesMediumRiskStressIndex;
  final int? _numberOfProfilesHighRiskStressIndex;
  final int? _numberOfProfilesNormalRiskBloodPressure;
  final int? _numberOfProfilesElevatedRiskBloodPressure;
  final int? _numberOfProfilesHypertensiveRiskBloodPressure;
  final String? _organisationID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  amplify_core.TemporalDateTime? get startDate {
    return _startDate;
  }
  
  amplify_core.TemporalDateTime? get endDate {
    return _endDate;
  }
  
  String? get latestMood {
    return _latestMood;
  }
  
  String? get latestStressLevel {
    return _latestStressLevel;
  }
  
  double? get averageOxygenLevel {
    return _averageOxygenLevel;
  }
  
  double? get averageOxygenSaturationLevel {
    return _averageOxygenSaturationLevel;
  }
  
  double? get averageRespiratoryRate {
    return _averageRespiratoryRate;
  }
  
  double? get averageStressIndex {
    return _averageStressIndex;
  }
  
  double? get averageBodyTemperature {
    return _averageBodyTemperature;
  }
  
  double? get averageSystolicBloodPressure {
    return _averageSystolicBloodPressure;
  }
  
  double? get averageDiastolicBloodPressure {
    return _averageDiastolicBloodPressure;
  }
  
  double? get averageHeartRate {
    return _averageHeartRate;
  }
  
  double? get averageHeartRateVariability {
    return _averageHeartRateVariability;
  }
  
  double? get averageSympatheticNervousSystemIndex {
    return _averageSympatheticNervousSystemIndex;
  }
  
  double? get averageScore {
    return _averageScore;
  }
  
  double? get averageOxygenLevelForMale {
    return _averageOxygenLevelForMale;
  }
  
  double? get averageOxygenSaturationLevelForMale {
    return _averageOxygenSaturationLevelForMale;
  }
  
  double? get averageRespiratoryRateForMale {
    return _averageRespiratoryRateForMale;
  }
  
  double? get averageStressIndexForMale {
    return _averageStressIndexForMale;
  }
  
  double? get averageBodyTemperatureForMale {
    return _averageBodyTemperatureForMale;
  }
  
  double? get averageSystolicBloodPressureForMale {
    return _averageSystolicBloodPressureForMale;
  }
  
  double? get averageDiastolicBloodPressureForMale {
    return _averageDiastolicBloodPressureForMale;
  }
  
  double? get averageHeartRateForMale {
    return _averageHeartRateForMale;
  }
  
  double? get averageHeartRateVariabilityForMale {
    return _averageHeartRateVariabilityForMale;
  }
  
  double? get averageSympatheticNervousSystemIndexForMale {
    return _averageSympatheticNervousSystemIndexForMale;
  }
  
  double? get averageScoreForMale {
    return _averageScoreForMale;
  }
  
  double? get averageOxygenLevelForFemale {
    return _averageOxygenLevelForFemale;
  }
  
  double? get averageOxygenSaturationLevelForFemale {
    return _averageOxygenSaturationLevelForFemale;
  }
  
  double? get averageRespiratoryRateForFemale {
    return _averageRespiratoryRateForFemale;
  }
  
  double? get averageStressIndexForFemale {
    return _averageStressIndexForFemale;
  }
  
  double? get averageBodyTemperatureForFemale {
    return _averageBodyTemperatureForFemale;
  }
  
  double? get averageSystolicBloodPressureForFemale {
    return _averageSystolicBloodPressureForFemale;
  }
  
  double? get averageDiastolicBloodPressureForFemale {
    return _averageDiastolicBloodPressureForFemale;
  }
  
  double? get averageHeartRateForFemale {
    return _averageHeartRateForFemale;
  }
  
  double? get averageHeartRateVariabilityForFemale {
    return _averageHeartRateVariabilityForFemale;
  }
  
  double? get averageSympatheticNervousSystemIndexForFemale {
    return _averageSympatheticNervousSystemIndexForFemale;
  }
  
  double? get averageScoreForFemale {
    return _averageScoreForFemale;
  }
  
  int? get numberOfProfiles {
    return _numberOfProfiles;
  }
  
  int? get numberOfMaleProfiles {
    return _numberOfMaleProfiles;
  }
  
  int? get numberOfFemaleProfiles {
    return _numberOfFemaleProfiles;
  }
  
  int? get numberOfProfilesLowRiskStressIndex {
    return _numberOfProfilesLowRiskStressIndex;
  }
  
  int? get numberOfProfilesMediumRiskStressIndex {
    return _numberOfProfilesMediumRiskStressIndex;
  }
  
  int? get numberOfProfilesHighRiskStressIndex {
    return _numberOfProfilesHighRiskStressIndex;
  }
  
  int? get numberOfProfilesNormalRiskBloodPressure {
    return _numberOfProfilesNormalRiskBloodPressure;
  }
  
  int? get numberOfProfilesElevatedRiskBloodPressure {
    return _numberOfProfilesElevatedRiskBloodPressure;
  }
  
  int? get numberOfProfilesHypertensiveRiskBloodPressure {
    return _numberOfProfilesHypertensiveRiskBloodPressure;
  }
  
  String get organisationID {
    try {
      return _organisationID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const AggregateYearOrganisationAssessment._internal({required this.id, startDate, endDate, latestMood, latestStressLevel, averageOxygenLevel, averageOxygenSaturationLevel, averageRespiratoryRate, averageStressIndex, averageBodyTemperature, averageSystolicBloodPressure, averageDiastolicBloodPressure, averageHeartRate, averageHeartRateVariability, averageSympatheticNervousSystemIndex, averageScore, averageOxygenLevelForMale, averageOxygenSaturationLevelForMale, averageRespiratoryRateForMale, averageStressIndexForMale, averageBodyTemperatureForMale, averageSystolicBloodPressureForMale, averageDiastolicBloodPressureForMale, averageHeartRateForMale, averageHeartRateVariabilityForMale, averageSympatheticNervousSystemIndexForMale, averageScoreForMale, averageOxygenLevelForFemale, averageOxygenSaturationLevelForFemale, averageRespiratoryRateForFemale, averageStressIndexForFemale, averageBodyTemperatureForFemale, averageSystolicBloodPressureForFemale, averageDiastolicBloodPressureForFemale, averageHeartRateForFemale, averageHeartRateVariabilityForFemale, averageSympatheticNervousSystemIndexForFemale, averageScoreForFemale, numberOfProfiles, numberOfMaleProfiles, numberOfFemaleProfiles, numberOfProfilesLowRiskStressIndex, numberOfProfilesMediumRiskStressIndex, numberOfProfilesHighRiskStressIndex, numberOfProfilesNormalRiskBloodPressure, numberOfProfilesElevatedRiskBloodPressure, numberOfProfilesHypertensiveRiskBloodPressure, required organisationID, createdAt, updatedAt}): _startDate = startDate, _endDate = endDate, _latestMood = latestMood, _latestStressLevel = latestStressLevel, _averageOxygenLevel = averageOxygenLevel, _averageOxygenSaturationLevel = averageOxygenSaturationLevel, _averageRespiratoryRate = averageRespiratoryRate, _averageStressIndex = averageStressIndex, _averageBodyTemperature = averageBodyTemperature, _averageSystolicBloodPressure = averageSystolicBloodPressure, _averageDiastolicBloodPressure = averageDiastolicBloodPressure, _averageHeartRate = averageHeartRate, _averageHeartRateVariability = averageHeartRateVariability, _averageSympatheticNervousSystemIndex = averageSympatheticNervousSystemIndex, _averageScore = averageScore, _averageOxygenLevelForMale = averageOxygenLevelForMale, _averageOxygenSaturationLevelForMale = averageOxygenSaturationLevelForMale, _averageRespiratoryRateForMale = averageRespiratoryRateForMale, _averageStressIndexForMale = averageStressIndexForMale, _averageBodyTemperatureForMale = averageBodyTemperatureForMale, _averageSystolicBloodPressureForMale = averageSystolicBloodPressureForMale, _averageDiastolicBloodPressureForMale = averageDiastolicBloodPressureForMale, _averageHeartRateForMale = averageHeartRateForMale, _averageHeartRateVariabilityForMale = averageHeartRateVariabilityForMale, _averageSympatheticNervousSystemIndexForMale = averageSympatheticNervousSystemIndexForMale, _averageScoreForMale = averageScoreForMale, _averageOxygenLevelForFemale = averageOxygenLevelForFemale, _averageOxygenSaturationLevelForFemale = averageOxygenSaturationLevelForFemale, _averageRespiratoryRateForFemale = averageRespiratoryRateForFemale, _averageStressIndexForFemale = averageStressIndexForFemale, _averageBodyTemperatureForFemale = averageBodyTemperatureForFemale, _averageSystolicBloodPressureForFemale = averageSystolicBloodPressureForFemale, _averageDiastolicBloodPressureForFemale = averageDiastolicBloodPressureForFemale, _averageHeartRateForFemale = averageHeartRateForFemale, _averageHeartRateVariabilityForFemale = averageHeartRateVariabilityForFemale, _averageSympatheticNervousSystemIndexForFemale = averageSympatheticNervousSystemIndexForFemale, _averageScoreForFemale = averageScoreForFemale, _numberOfProfiles = numberOfProfiles, _numberOfMaleProfiles = numberOfMaleProfiles, _numberOfFemaleProfiles = numberOfFemaleProfiles, _numberOfProfilesLowRiskStressIndex = numberOfProfilesLowRiskStressIndex, _numberOfProfilesMediumRiskStressIndex = numberOfProfilesMediumRiskStressIndex, _numberOfProfilesHighRiskStressIndex = numberOfProfilesHighRiskStressIndex, _numberOfProfilesNormalRiskBloodPressure = numberOfProfilesNormalRiskBloodPressure, _numberOfProfilesElevatedRiskBloodPressure = numberOfProfilesElevatedRiskBloodPressure, _numberOfProfilesHypertensiveRiskBloodPressure = numberOfProfilesHypertensiveRiskBloodPressure, _organisationID = organisationID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory AggregateYearOrganisationAssessment({String? id, amplify_core.TemporalDateTime? startDate, amplify_core.TemporalDateTime? endDate, String? latestMood, String? latestStressLevel, double? averageOxygenLevel, double? averageOxygenSaturationLevel, double? averageRespiratoryRate, double? averageStressIndex, double? averageBodyTemperature, double? averageSystolicBloodPressure, double? averageDiastolicBloodPressure, double? averageHeartRate, double? averageHeartRateVariability, double? averageSympatheticNervousSystemIndex, double? averageScore, double? averageOxygenLevelForMale, double? averageOxygenSaturationLevelForMale, double? averageRespiratoryRateForMale, double? averageStressIndexForMale, double? averageBodyTemperatureForMale, double? averageSystolicBloodPressureForMale, double? averageDiastolicBloodPressureForMale, double? averageHeartRateForMale, double? averageHeartRateVariabilityForMale, double? averageSympatheticNervousSystemIndexForMale, double? averageScoreForMale, double? averageOxygenLevelForFemale, double? averageOxygenSaturationLevelForFemale, double? averageRespiratoryRateForFemale, double? averageStressIndexForFemale, double? averageBodyTemperatureForFemale, double? averageSystolicBloodPressureForFemale, double? averageDiastolicBloodPressureForFemale, double? averageHeartRateForFemale, double? averageHeartRateVariabilityForFemale, double? averageSympatheticNervousSystemIndexForFemale, double? averageScoreForFemale, int? numberOfProfiles, int? numberOfMaleProfiles, int? numberOfFemaleProfiles, int? numberOfProfilesLowRiskStressIndex, int? numberOfProfilesMediumRiskStressIndex, int? numberOfProfilesHighRiskStressIndex, int? numberOfProfilesNormalRiskBloodPressure, int? numberOfProfilesElevatedRiskBloodPressure, int? numberOfProfilesHypertensiveRiskBloodPressure, required String organisationID}) {
    return AggregateYearOrganisationAssessment._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      startDate: startDate,
      endDate: endDate,
      latestMood: latestMood,
      latestStressLevel: latestStressLevel,
      averageOxygenLevel: averageOxygenLevel,
      averageOxygenSaturationLevel: averageOxygenSaturationLevel,
      averageRespiratoryRate: averageRespiratoryRate,
      averageStressIndex: averageStressIndex,
      averageBodyTemperature: averageBodyTemperature,
      averageSystolicBloodPressure: averageSystolicBloodPressure,
      averageDiastolicBloodPressure: averageDiastolicBloodPressure,
      averageHeartRate: averageHeartRate,
      averageHeartRateVariability: averageHeartRateVariability,
      averageSympatheticNervousSystemIndex: averageSympatheticNervousSystemIndex,
      averageScore: averageScore,
      averageOxygenLevelForMale: averageOxygenLevelForMale,
      averageOxygenSaturationLevelForMale: averageOxygenSaturationLevelForMale,
      averageRespiratoryRateForMale: averageRespiratoryRateForMale,
      averageStressIndexForMale: averageStressIndexForMale,
      averageBodyTemperatureForMale: averageBodyTemperatureForMale,
      averageSystolicBloodPressureForMale: averageSystolicBloodPressureForMale,
      averageDiastolicBloodPressureForMale: averageDiastolicBloodPressureForMale,
      averageHeartRateForMale: averageHeartRateForMale,
      averageHeartRateVariabilityForMale: averageHeartRateVariabilityForMale,
      averageSympatheticNervousSystemIndexForMale: averageSympatheticNervousSystemIndexForMale,
      averageScoreForMale: averageScoreForMale,
      averageOxygenLevelForFemale: averageOxygenLevelForFemale,
      averageOxygenSaturationLevelForFemale: averageOxygenSaturationLevelForFemale,
      averageRespiratoryRateForFemale: averageRespiratoryRateForFemale,
      averageStressIndexForFemale: averageStressIndexForFemale,
      averageBodyTemperatureForFemale: averageBodyTemperatureForFemale,
      averageSystolicBloodPressureForFemale: averageSystolicBloodPressureForFemale,
      averageDiastolicBloodPressureForFemale: averageDiastolicBloodPressureForFemale,
      averageHeartRateForFemale: averageHeartRateForFemale,
      averageHeartRateVariabilityForFemale: averageHeartRateVariabilityForFemale,
      averageSympatheticNervousSystemIndexForFemale: averageSympatheticNervousSystemIndexForFemale,
      averageScoreForFemale: averageScoreForFemale,
      numberOfProfiles: numberOfProfiles,
      numberOfMaleProfiles: numberOfMaleProfiles,
      numberOfFemaleProfiles: numberOfFemaleProfiles,
      numberOfProfilesLowRiskStressIndex: numberOfProfilesLowRiskStressIndex,
      numberOfProfilesMediumRiskStressIndex: numberOfProfilesMediumRiskStressIndex,
      numberOfProfilesHighRiskStressIndex: numberOfProfilesHighRiskStressIndex,
      numberOfProfilesNormalRiskBloodPressure: numberOfProfilesNormalRiskBloodPressure,
      numberOfProfilesElevatedRiskBloodPressure: numberOfProfilesElevatedRiskBloodPressure,
      numberOfProfilesHypertensiveRiskBloodPressure: numberOfProfilesHypertensiveRiskBloodPressure,
      organisationID: organisationID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AggregateYearOrganisationAssessment &&
      id == other.id &&
      _startDate == other._startDate &&
      _endDate == other._endDate &&
      _latestMood == other._latestMood &&
      _latestStressLevel == other._latestStressLevel &&
      _averageOxygenLevel == other._averageOxygenLevel &&
      _averageOxygenSaturationLevel == other._averageOxygenSaturationLevel &&
      _averageRespiratoryRate == other._averageRespiratoryRate &&
      _averageStressIndex == other._averageStressIndex &&
      _averageBodyTemperature == other._averageBodyTemperature &&
      _averageSystolicBloodPressure == other._averageSystolicBloodPressure &&
      _averageDiastolicBloodPressure == other._averageDiastolicBloodPressure &&
      _averageHeartRate == other._averageHeartRate &&
      _averageHeartRateVariability == other._averageHeartRateVariability &&
      _averageSympatheticNervousSystemIndex == other._averageSympatheticNervousSystemIndex &&
      _averageScore == other._averageScore &&
      _averageOxygenLevelForMale == other._averageOxygenLevelForMale &&
      _averageOxygenSaturationLevelForMale == other._averageOxygenSaturationLevelForMale &&
      _averageRespiratoryRateForMale == other._averageRespiratoryRateForMale &&
      _averageStressIndexForMale == other._averageStressIndexForMale &&
      _averageBodyTemperatureForMale == other._averageBodyTemperatureForMale &&
      _averageSystolicBloodPressureForMale == other._averageSystolicBloodPressureForMale &&
      _averageDiastolicBloodPressureForMale == other._averageDiastolicBloodPressureForMale &&
      _averageHeartRateForMale == other._averageHeartRateForMale &&
      _averageHeartRateVariabilityForMale == other._averageHeartRateVariabilityForMale &&
      _averageSympatheticNervousSystemIndexForMale == other._averageSympatheticNervousSystemIndexForMale &&
      _averageScoreForMale == other._averageScoreForMale &&
      _averageOxygenLevelForFemale == other._averageOxygenLevelForFemale &&
      _averageOxygenSaturationLevelForFemale == other._averageOxygenSaturationLevelForFemale &&
      _averageRespiratoryRateForFemale == other._averageRespiratoryRateForFemale &&
      _averageStressIndexForFemale == other._averageStressIndexForFemale &&
      _averageBodyTemperatureForFemale == other._averageBodyTemperatureForFemale &&
      _averageSystolicBloodPressureForFemale == other._averageSystolicBloodPressureForFemale &&
      _averageDiastolicBloodPressureForFemale == other._averageDiastolicBloodPressureForFemale &&
      _averageHeartRateForFemale == other._averageHeartRateForFemale &&
      _averageHeartRateVariabilityForFemale == other._averageHeartRateVariabilityForFemale &&
      _averageSympatheticNervousSystemIndexForFemale == other._averageSympatheticNervousSystemIndexForFemale &&
      _averageScoreForFemale == other._averageScoreForFemale &&
      _numberOfProfiles == other._numberOfProfiles &&
      _numberOfMaleProfiles == other._numberOfMaleProfiles &&
      _numberOfFemaleProfiles == other._numberOfFemaleProfiles &&
      _numberOfProfilesLowRiskStressIndex == other._numberOfProfilesLowRiskStressIndex &&
      _numberOfProfilesMediumRiskStressIndex == other._numberOfProfilesMediumRiskStressIndex &&
      _numberOfProfilesHighRiskStressIndex == other._numberOfProfilesHighRiskStressIndex &&
      _numberOfProfilesNormalRiskBloodPressure == other._numberOfProfilesNormalRiskBloodPressure &&
      _numberOfProfilesElevatedRiskBloodPressure == other._numberOfProfilesElevatedRiskBloodPressure &&
      _numberOfProfilesHypertensiveRiskBloodPressure == other._numberOfProfilesHypertensiveRiskBloodPressure &&
      _organisationID == other._organisationID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AggregateYearOrganisationAssessment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("startDate=" + (_startDate != null ? _startDate!.format() : "null") + ", ");
    buffer.write("endDate=" + (_endDate != null ? _endDate!.format() : "null") + ", ");
    buffer.write("latestMood=" + "$_latestMood" + ", ");
    buffer.write("latestStressLevel=" + "$_latestStressLevel" + ", ");
    buffer.write("averageOxygenLevel=" + (_averageOxygenLevel != null ? _averageOxygenLevel!.toString() : "null") + ", ");
    buffer.write("averageOxygenSaturationLevel=" + (_averageOxygenSaturationLevel != null ? _averageOxygenSaturationLevel!.toString() : "null") + ", ");
    buffer.write("averageRespiratoryRate=" + (_averageRespiratoryRate != null ? _averageRespiratoryRate!.toString() : "null") + ", ");
    buffer.write("averageStressIndex=" + (_averageStressIndex != null ? _averageStressIndex!.toString() : "null") + ", ");
    buffer.write("averageBodyTemperature=" + (_averageBodyTemperature != null ? _averageBodyTemperature!.toString() : "null") + ", ");
    buffer.write("averageSystolicBloodPressure=" + (_averageSystolicBloodPressure != null ? _averageSystolicBloodPressure!.toString() : "null") + ", ");
    buffer.write("averageDiastolicBloodPressure=" + (_averageDiastolicBloodPressure != null ? _averageDiastolicBloodPressure!.toString() : "null") + ", ");
    buffer.write("averageHeartRate=" + (_averageHeartRate != null ? _averageHeartRate!.toString() : "null") + ", ");
    buffer.write("averageHeartRateVariability=" + (_averageHeartRateVariability != null ? _averageHeartRateVariability!.toString() : "null") + ", ");
    buffer.write("averageSympatheticNervousSystemIndex=" + (_averageSympatheticNervousSystemIndex != null ? _averageSympatheticNervousSystemIndex!.toString() : "null") + ", ");
    buffer.write("averageScore=" + (_averageScore != null ? _averageScore!.toString() : "null") + ", ");
    buffer.write("averageOxygenLevelForMale=" + (_averageOxygenLevelForMale != null ? _averageOxygenLevelForMale!.toString() : "null") + ", ");
    buffer.write("averageOxygenSaturationLevelForMale=" + (_averageOxygenSaturationLevelForMale != null ? _averageOxygenSaturationLevelForMale!.toString() : "null") + ", ");
    buffer.write("averageRespiratoryRateForMale=" + (_averageRespiratoryRateForMale != null ? _averageRespiratoryRateForMale!.toString() : "null") + ", ");
    buffer.write("averageStressIndexForMale=" + (_averageStressIndexForMale != null ? _averageStressIndexForMale!.toString() : "null") + ", ");
    buffer.write("averageBodyTemperatureForMale=" + (_averageBodyTemperatureForMale != null ? _averageBodyTemperatureForMale!.toString() : "null") + ", ");
    buffer.write("averageSystolicBloodPressureForMale=" + (_averageSystolicBloodPressureForMale != null ? _averageSystolicBloodPressureForMale!.toString() : "null") + ", ");
    buffer.write("averageDiastolicBloodPressureForMale=" + (_averageDiastolicBloodPressureForMale != null ? _averageDiastolicBloodPressureForMale!.toString() : "null") + ", ");
    buffer.write("averageHeartRateForMale=" + (_averageHeartRateForMale != null ? _averageHeartRateForMale!.toString() : "null") + ", ");
    buffer.write("averageHeartRateVariabilityForMale=" + (_averageHeartRateVariabilityForMale != null ? _averageHeartRateVariabilityForMale!.toString() : "null") + ", ");
    buffer.write("averageSympatheticNervousSystemIndexForMale=" + (_averageSympatheticNervousSystemIndexForMale != null ? _averageSympatheticNervousSystemIndexForMale!.toString() : "null") + ", ");
    buffer.write("averageScoreForMale=" + (_averageScoreForMale != null ? _averageScoreForMale!.toString() : "null") + ", ");
    buffer.write("averageOxygenLevelForFemale=" + (_averageOxygenLevelForFemale != null ? _averageOxygenLevelForFemale!.toString() : "null") + ", ");
    buffer.write("averageOxygenSaturationLevelForFemale=" + (_averageOxygenSaturationLevelForFemale != null ? _averageOxygenSaturationLevelForFemale!.toString() : "null") + ", ");
    buffer.write("averageRespiratoryRateForFemale=" + (_averageRespiratoryRateForFemale != null ? _averageRespiratoryRateForFemale!.toString() : "null") + ", ");
    buffer.write("averageStressIndexForFemale=" + (_averageStressIndexForFemale != null ? _averageStressIndexForFemale!.toString() : "null") + ", ");
    buffer.write("averageBodyTemperatureForFemale=" + (_averageBodyTemperatureForFemale != null ? _averageBodyTemperatureForFemale!.toString() : "null") + ", ");
    buffer.write("averageSystolicBloodPressureForFemale=" + (_averageSystolicBloodPressureForFemale != null ? _averageSystolicBloodPressureForFemale!.toString() : "null") + ", ");
    buffer.write("averageDiastolicBloodPressureForFemale=" + (_averageDiastolicBloodPressureForFemale != null ? _averageDiastolicBloodPressureForFemale!.toString() : "null") + ", ");
    buffer.write("averageHeartRateForFemale=" + (_averageHeartRateForFemale != null ? _averageHeartRateForFemale!.toString() : "null") + ", ");
    buffer.write("averageHeartRateVariabilityForFemale=" + (_averageHeartRateVariabilityForFemale != null ? _averageHeartRateVariabilityForFemale!.toString() : "null") + ", ");
    buffer.write("averageSympatheticNervousSystemIndexForFemale=" + (_averageSympatheticNervousSystemIndexForFemale != null ? _averageSympatheticNervousSystemIndexForFemale!.toString() : "null") + ", ");
    buffer.write("averageScoreForFemale=" + (_averageScoreForFemale != null ? _averageScoreForFemale!.toString() : "null") + ", ");
    buffer.write("numberOfProfiles=" + (_numberOfProfiles != null ? _numberOfProfiles!.toString() : "null") + ", ");
    buffer.write("numberOfMaleProfiles=" + (_numberOfMaleProfiles != null ? _numberOfMaleProfiles!.toString() : "null") + ", ");
    buffer.write("numberOfFemaleProfiles=" + (_numberOfFemaleProfiles != null ? _numberOfFemaleProfiles!.toString() : "null") + ", ");
    buffer.write("numberOfProfilesLowRiskStressIndex=" + (_numberOfProfilesLowRiskStressIndex != null ? _numberOfProfilesLowRiskStressIndex!.toString() : "null") + ", ");
    buffer.write("numberOfProfilesMediumRiskStressIndex=" + (_numberOfProfilesMediumRiskStressIndex != null ? _numberOfProfilesMediumRiskStressIndex!.toString() : "null") + ", ");
    buffer.write("numberOfProfilesHighRiskStressIndex=" + (_numberOfProfilesHighRiskStressIndex != null ? _numberOfProfilesHighRiskStressIndex!.toString() : "null") + ", ");
    buffer.write("numberOfProfilesNormalRiskBloodPressure=" + (_numberOfProfilesNormalRiskBloodPressure != null ? _numberOfProfilesNormalRiskBloodPressure!.toString() : "null") + ", ");
    buffer.write("numberOfProfilesElevatedRiskBloodPressure=" + (_numberOfProfilesElevatedRiskBloodPressure != null ? _numberOfProfilesElevatedRiskBloodPressure!.toString() : "null") + ", ");
    buffer.write("numberOfProfilesHypertensiveRiskBloodPressure=" + (_numberOfProfilesHypertensiveRiskBloodPressure != null ? _numberOfProfilesHypertensiveRiskBloodPressure!.toString() : "null") + ", ");
    buffer.write("organisationID=" + "$_organisationID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AggregateYearOrganisationAssessment copyWith({String? id, amplify_core.TemporalDateTime? startDate, amplify_core.TemporalDateTime? endDate, String? latestMood, String? latestStressLevel, double? averageOxygenLevel, double? averageOxygenSaturationLevel, double? averageRespiratoryRate, double? averageStressIndex, double? averageBodyTemperature, double? averageSystolicBloodPressure, double? averageDiastolicBloodPressure, double? averageHeartRate, double? averageHeartRateVariability, double? averageSympatheticNervousSystemIndex, double? averageScore, double? averageOxygenLevelForMale, double? averageOxygenSaturationLevelForMale, double? averageRespiratoryRateForMale, double? averageStressIndexForMale, double? averageBodyTemperatureForMale, double? averageSystolicBloodPressureForMale, double? averageDiastolicBloodPressureForMale, double? averageHeartRateForMale, double? averageHeartRateVariabilityForMale, double? averageSympatheticNervousSystemIndexForMale, double? averageScoreForMale, double? averageOxygenLevelForFemale, double? averageOxygenSaturationLevelForFemale, double? averageRespiratoryRateForFemale, double? averageStressIndexForFemale, double? averageBodyTemperatureForFemale, double? averageSystolicBloodPressureForFemale, double? averageDiastolicBloodPressureForFemale, double? averageHeartRateForFemale, double? averageHeartRateVariabilityForFemale, double? averageSympatheticNervousSystemIndexForFemale, double? averageScoreForFemale, int? numberOfProfiles, int? numberOfMaleProfiles, int? numberOfFemaleProfiles, int? numberOfProfilesLowRiskStressIndex, int? numberOfProfilesMediumRiskStressIndex, int? numberOfProfilesHighRiskStressIndex, int? numberOfProfilesNormalRiskBloodPressure, int? numberOfProfilesElevatedRiskBloodPressure, int? numberOfProfilesHypertensiveRiskBloodPressure, String? organisationID}) {
    return AggregateYearOrganisationAssessment._internal(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      latestMood: latestMood ?? this.latestMood,
      latestStressLevel: latestStressLevel ?? this.latestStressLevel,
      averageOxygenLevel: averageOxygenLevel ?? this.averageOxygenLevel,
      averageOxygenSaturationLevel: averageOxygenSaturationLevel ?? this.averageOxygenSaturationLevel,
      averageRespiratoryRate: averageRespiratoryRate ?? this.averageRespiratoryRate,
      averageStressIndex: averageStressIndex ?? this.averageStressIndex,
      averageBodyTemperature: averageBodyTemperature ?? this.averageBodyTemperature,
      averageSystolicBloodPressure: averageSystolicBloodPressure ?? this.averageSystolicBloodPressure,
      averageDiastolicBloodPressure: averageDiastolicBloodPressure ?? this.averageDiastolicBloodPressure,
      averageHeartRate: averageHeartRate ?? this.averageHeartRate,
      averageHeartRateVariability: averageHeartRateVariability ?? this.averageHeartRateVariability,
      averageSympatheticNervousSystemIndex: averageSympatheticNervousSystemIndex ?? this.averageSympatheticNervousSystemIndex,
      averageScore: averageScore ?? this.averageScore,
      averageOxygenLevelForMale: averageOxygenLevelForMale ?? this.averageOxygenLevelForMale,
      averageOxygenSaturationLevelForMale: averageOxygenSaturationLevelForMale ?? this.averageOxygenSaturationLevelForMale,
      averageRespiratoryRateForMale: averageRespiratoryRateForMale ?? this.averageRespiratoryRateForMale,
      averageStressIndexForMale: averageStressIndexForMale ?? this.averageStressIndexForMale,
      averageBodyTemperatureForMale: averageBodyTemperatureForMale ?? this.averageBodyTemperatureForMale,
      averageSystolicBloodPressureForMale: averageSystolicBloodPressureForMale ?? this.averageSystolicBloodPressureForMale,
      averageDiastolicBloodPressureForMale: averageDiastolicBloodPressureForMale ?? this.averageDiastolicBloodPressureForMale,
      averageHeartRateForMale: averageHeartRateForMale ?? this.averageHeartRateForMale,
      averageHeartRateVariabilityForMale: averageHeartRateVariabilityForMale ?? this.averageHeartRateVariabilityForMale,
      averageSympatheticNervousSystemIndexForMale: averageSympatheticNervousSystemIndexForMale ?? this.averageSympatheticNervousSystemIndexForMale,
      averageScoreForMale: averageScoreForMale ?? this.averageScoreForMale,
      averageOxygenLevelForFemale: averageOxygenLevelForFemale ?? this.averageOxygenLevelForFemale,
      averageOxygenSaturationLevelForFemale: averageOxygenSaturationLevelForFemale ?? this.averageOxygenSaturationLevelForFemale,
      averageRespiratoryRateForFemale: averageRespiratoryRateForFemale ?? this.averageRespiratoryRateForFemale,
      averageStressIndexForFemale: averageStressIndexForFemale ?? this.averageStressIndexForFemale,
      averageBodyTemperatureForFemale: averageBodyTemperatureForFemale ?? this.averageBodyTemperatureForFemale,
      averageSystolicBloodPressureForFemale: averageSystolicBloodPressureForFemale ?? this.averageSystolicBloodPressureForFemale,
      averageDiastolicBloodPressureForFemale: averageDiastolicBloodPressureForFemale ?? this.averageDiastolicBloodPressureForFemale,
      averageHeartRateForFemale: averageHeartRateForFemale ?? this.averageHeartRateForFemale,
      averageHeartRateVariabilityForFemale: averageHeartRateVariabilityForFemale ?? this.averageHeartRateVariabilityForFemale,
      averageSympatheticNervousSystemIndexForFemale: averageSympatheticNervousSystemIndexForFemale ?? this.averageSympatheticNervousSystemIndexForFemale,
      averageScoreForFemale: averageScoreForFemale ?? this.averageScoreForFemale,
      numberOfProfiles: numberOfProfiles ?? this.numberOfProfiles,
      numberOfMaleProfiles: numberOfMaleProfiles ?? this.numberOfMaleProfiles,
      numberOfFemaleProfiles: numberOfFemaleProfiles ?? this.numberOfFemaleProfiles,
      numberOfProfilesLowRiskStressIndex: numberOfProfilesLowRiskStressIndex ?? this.numberOfProfilesLowRiskStressIndex,
      numberOfProfilesMediumRiskStressIndex: numberOfProfilesMediumRiskStressIndex ?? this.numberOfProfilesMediumRiskStressIndex,
      numberOfProfilesHighRiskStressIndex: numberOfProfilesHighRiskStressIndex ?? this.numberOfProfilesHighRiskStressIndex,
      numberOfProfilesNormalRiskBloodPressure: numberOfProfilesNormalRiskBloodPressure ?? this.numberOfProfilesNormalRiskBloodPressure,
      numberOfProfilesElevatedRiskBloodPressure: numberOfProfilesElevatedRiskBloodPressure ?? this.numberOfProfilesElevatedRiskBloodPressure,
      numberOfProfilesHypertensiveRiskBloodPressure: numberOfProfilesHypertensiveRiskBloodPressure ?? this.numberOfProfilesHypertensiveRiskBloodPressure,
      organisationID: organisationID ?? this.organisationID);
  }
  
  AggregateYearOrganisationAssessment copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<amplify_core.TemporalDateTime?>? startDate,
    ModelFieldValue<amplify_core.TemporalDateTime?>? endDate,
    ModelFieldValue<String?>? latestMood,
    ModelFieldValue<String?>? latestStressLevel,
    ModelFieldValue<double?>? averageOxygenLevel,
    ModelFieldValue<double?>? averageOxygenSaturationLevel,
    ModelFieldValue<double?>? averageRespiratoryRate,
    ModelFieldValue<double?>? averageStressIndex,
    ModelFieldValue<double?>? averageBodyTemperature,
    ModelFieldValue<double?>? averageSystolicBloodPressure,
    ModelFieldValue<double?>? averageDiastolicBloodPressure,
    ModelFieldValue<double?>? averageHeartRate,
    ModelFieldValue<double?>? averageHeartRateVariability,
    ModelFieldValue<double?>? averageSympatheticNervousSystemIndex,
    ModelFieldValue<double?>? averageScore,
    ModelFieldValue<double?>? averageOxygenLevelForMale,
    ModelFieldValue<double?>? averageOxygenSaturationLevelForMale,
    ModelFieldValue<double?>? averageRespiratoryRateForMale,
    ModelFieldValue<double?>? averageStressIndexForMale,
    ModelFieldValue<double?>? averageBodyTemperatureForMale,
    ModelFieldValue<double?>? averageSystolicBloodPressureForMale,
    ModelFieldValue<double?>? averageDiastolicBloodPressureForMale,
    ModelFieldValue<double?>? averageHeartRateForMale,
    ModelFieldValue<double?>? averageHeartRateVariabilityForMale,
    ModelFieldValue<double?>? averageSympatheticNervousSystemIndexForMale,
    ModelFieldValue<double?>? averageScoreForMale,
    ModelFieldValue<double?>? averageOxygenLevelForFemale,
    ModelFieldValue<double?>? averageOxygenSaturationLevelForFemale,
    ModelFieldValue<double?>? averageRespiratoryRateForFemale,
    ModelFieldValue<double?>? averageStressIndexForFemale,
    ModelFieldValue<double?>? averageBodyTemperatureForFemale,
    ModelFieldValue<double?>? averageSystolicBloodPressureForFemale,
    ModelFieldValue<double?>? averageDiastolicBloodPressureForFemale,
    ModelFieldValue<double?>? averageHeartRateForFemale,
    ModelFieldValue<double?>? averageHeartRateVariabilityForFemale,
    ModelFieldValue<double?>? averageSympatheticNervousSystemIndexForFemale,
    ModelFieldValue<double?>? averageScoreForFemale,
    ModelFieldValue<int?>? numberOfProfiles,
    ModelFieldValue<int?>? numberOfMaleProfiles,
    ModelFieldValue<int?>? numberOfFemaleProfiles,
    ModelFieldValue<int?>? numberOfProfilesLowRiskStressIndex,
    ModelFieldValue<int?>? numberOfProfilesMediumRiskStressIndex,
    ModelFieldValue<int?>? numberOfProfilesHighRiskStressIndex,
    ModelFieldValue<int?>? numberOfProfilesNormalRiskBloodPressure,
    ModelFieldValue<int?>? numberOfProfilesElevatedRiskBloodPressure,
    ModelFieldValue<int?>? numberOfProfilesHypertensiveRiskBloodPressure,
    ModelFieldValue<String>? organisationID
  }) {
    return AggregateYearOrganisationAssessment._internal(
      id: id == null ? this.id : id.value,
      startDate: startDate == null ? this.startDate : startDate.value,
      endDate: endDate == null ? this.endDate : endDate.value,
      latestMood: latestMood == null ? this.latestMood : latestMood.value,
      latestStressLevel: latestStressLevel == null ? this.latestStressLevel : latestStressLevel.value,
      averageOxygenLevel: averageOxygenLevel == null ? this.averageOxygenLevel : averageOxygenLevel.value,
      averageOxygenSaturationLevel: averageOxygenSaturationLevel == null ? this.averageOxygenSaturationLevel : averageOxygenSaturationLevel.value,
      averageRespiratoryRate: averageRespiratoryRate == null ? this.averageRespiratoryRate : averageRespiratoryRate.value,
      averageStressIndex: averageStressIndex == null ? this.averageStressIndex : averageStressIndex.value,
      averageBodyTemperature: averageBodyTemperature == null ? this.averageBodyTemperature : averageBodyTemperature.value,
      averageSystolicBloodPressure: averageSystolicBloodPressure == null ? this.averageSystolicBloodPressure : averageSystolicBloodPressure.value,
      averageDiastolicBloodPressure: averageDiastolicBloodPressure == null ? this.averageDiastolicBloodPressure : averageDiastolicBloodPressure.value,
      averageHeartRate: averageHeartRate == null ? this.averageHeartRate : averageHeartRate.value,
      averageHeartRateVariability: averageHeartRateVariability == null ? this.averageHeartRateVariability : averageHeartRateVariability.value,
      averageSympatheticNervousSystemIndex: averageSympatheticNervousSystemIndex == null ? this.averageSympatheticNervousSystemIndex : averageSympatheticNervousSystemIndex.value,
      averageScore: averageScore == null ? this.averageScore : averageScore.value,
      averageOxygenLevelForMale: averageOxygenLevelForMale == null ? this.averageOxygenLevelForMale : averageOxygenLevelForMale.value,
      averageOxygenSaturationLevelForMale: averageOxygenSaturationLevelForMale == null ? this.averageOxygenSaturationLevelForMale : averageOxygenSaturationLevelForMale.value,
      averageRespiratoryRateForMale: averageRespiratoryRateForMale == null ? this.averageRespiratoryRateForMale : averageRespiratoryRateForMale.value,
      averageStressIndexForMale: averageStressIndexForMale == null ? this.averageStressIndexForMale : averageStressIndexForMale.value,
      averageBodyTemperatureForMale: averageBodyTemperatureForMale == null ? this.averageBodyTemperatureForMale : averageBodyTemperatureForMale.value,
      averageSystolicBloodPressureForMale: averageSystolicBloodPressureForMale == null ? this.averageSystolicBloodPressureForMale : averageSystolicBloodPressureForMale.value,
      averageDiastolicBloodPressureForMale: averageDiastolicBloodPressureForMale == null ? this.averageDiastolicBloodPressureForMale : averageDiastolicBloodPressureForMale.value,
      averageHeartRateForMale: averageHeartRateForMale == null ? this.averageHeartRateForMale : averageHeartRateForMale.value,
      averageHeartRateVariabilityForMale: averageHeartRateVariabilityForMale == null ? this.averageHeartRateVariabilityForMale : averageHeartRateVariabilityForMale.value,
      averageSympatheticNervousSystemIndexForMale: averageSympatheticNervousSystemIndexForMale == null ? this.averageSympatheticNervousSystemIndexForMale : averageSympatheticNervousSystemIndexForMale.value,
      averageScoreForMale: averageScoreForMale == null ? this.averageScoreForMale : averageScoreForMale.value,
      averageOxygenLevelForFemale: averageOxygenLevelForFemale == null ? this.averageOxygenLevelForFemale : averageOxygenLevelForFemale.value,
      averageOxygenSaturationLevelForFemale: averageOxygenSaturationLevelForFemale == null ? this.averageOxygenSaturationLevelForFemale : averageOxygenSaturationLevelForFemale.value,
      averageRespiratoryRateForFemale: averageRespiratoryRateForFemale == null ? this.averageRespiratoryRateForFemale : averageRespiratoryRateForFemale.value,
      averageStressIndexForFemale: averageStressIndexForFemale == null ? this.averageStressIndexForFemale : averageStressIndexForFemale.value,
      averageBodyTemperatureForFemale: averageBodyTemperatureForFemale == null ? this.averageBodyTemperatureForFemale : averageBodyTemperatureForFemale.value,
      averageSystolicBloodPressureForFemale: averageSystolicBloodPressureForFemale == null ? this.averageSystolicBloodPressureForFemale : averageSystolicBloodPressureForFemale.value,
      averageDiastolicBloodPressureForFemale: averageDiastolicBloodPressureForFemale == null ? this.averageDiastolicBloodPressureForFemale : averageDiastolicBloodPressureForFemale.value,
      averageHeartRateForFemale: averageHeartRateForFemale == null ? this.averageHeartRateForFemale : averageHeartRateForFemale.value,
      averageHeartRateVariabilityForFemale: averageHeartRateVariabilityForFemale == null ? this.averageHeartRateVariabilityForFemale : averageHeartRateVariabilityForFemale.value,
      averageSympatheticNervousSystemIndexForFemale: averageSympatheticNervousSystemIndexForFemale == null ? this.averageSympatheticNervousSystemIndexForFemale : averageSympatheticNervousSystemIndexForFemale.value,
      averageScoreForFemale: averageScoreForFemale == null ? this.averageScoreForFemale : averageScoreForFemale.value,
      numberOfProfiles: numberOfProfiles == null ? this.numberOfProfiles : numberOfProfiles.value,
      numberOfMaleProfiles: numberOfMaleProfiles == null ? this.numberOfMaleProfiles : numberOfMaleProfiles.value,
      numberOfFemaleProfiles: numberOfFemaleProfiles == null ? this.numberOfFemaleProfiles : numberOfFemaleProfiles.value,
      numberOfProfilesLowRiskStressIndex: numberOfProfilesLowRiskStressIndex == null ? this.numberOfProfilesLowRiskStressIndex : numberOfProfilesLowRiskStressIndex.value,
      numberOfProfilesMediumRiskStressIndex: numberOfProfilesMediumRiskStressIndex == null ? this.numberOfProfilesMediumRiskStressIndex : numberOfProfilesMediumRiskStressIndex.value,
      numberOfProfilesHighRiskStressIndex: numberOfProfilesHighRiskStressIndex == null ? this.numberOfProfilesHighRiskStressIndex : numberOfProfilesHighRiskStressIndex.value,
      numberOfProfilesNormalRiskBloodPressure: numberOfProfilesNormalRiskBloodPressure == null ? this.numberOfProfilesNormalRiskBloodPressure : numberOfProfilesNormalRiskBloodPressure.value,
      numberOfProfilesElevatedRiskBloodPressure: numberOfProfilesElevatedRiskBloodPressure == null ? this.numberOfProfilesElevatedRiskBloodPressure : numberOfProfilesElevatedRiskBloodPressure.value,
      numberOfProfilesHypertensiveRiskBloodPressure: numberOfProfilesHypertensiveRiskBloodPressure == null ? this.numberOfProfilesHypertensiveRiskBloodPressure : numberOfProfilesHypertensiveRiskBloodPressure.value,
      organisationID: organisationID == null ? this.organisationID : organisationID.value
    );
  }
  
  AggregateYearOrganisationAssessment.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _startDate = json['startDate'] != null ? amplify_core.TemporalDateTime.fromString(json['startDate']) : null,
      _endDate = json['endDate'] != null ? amplify_core.TemporalDateTime.fromString(json['endDate']) : null,
      _latestMood = json['latestMood'],
      _latestStressLevel = json['latestStressLevel'],
      _averageOxygenLevel = (json['averageOxygenLevel'] as num?)?.toDouble(),
      _averageOxygenSaturationLevel = (json['averageOxygenSaturationLevel'] as num?)?.toDouble(),
      _averageRespiratoryRate = (json['averageRespiratoryRate'] as num?)?.toDouble(),
      _averageStressIndex = (json['averageStressIndex'] as num?)?.toDouble(),
      _averageBodyTemperature = (json['averageBodyTemperature'] as num?)?.toDouble(),
      _averageSystolicBloodPressure = (json['averageSystolicBloodPressure'] as num?)?.toDouble(),
      _averageDiastolicBloodPressure = (json['averageDiastolicBloodPressure'] as num?)?.toDouble(),
      _averageHeartRate = (json['averageHeartRate'] as num?)?.toDouble(),
      _averageHeartRateVariability = (json['averageHeartRateVariability'] as num?)?.toDouble(),
      _averageSympatheticNervousSystemIndex = (json['averageSympatheticNervousSystemIndex'] as num?)?.toDouble(),
      _averageScore = (json['averageScore'] as num?)?.toDouble(),
      _averageOxygenLevelForMale = (json['averageOxygenLevelForMale'] as num?)?.toDouble(),
      _averageOxygenSaturationLevelForMale = (json['averageOxygenSaturationLevelForMale'] as num?)?.toDouble(),
      _averageRespiratoryRateForMale = (json['averageRespiratoryRateForMale'] as num?)?.toDouble(),
      _averageStressIndexForMale = (json['averageStressIndexForMale'] as num?)?.toDouble(),
      _averageBodyTemperatureForMale = (json['averageBodyTemperatureForMale'] as num?)?.toDouble(),
      _averageSystolicBloodPressureForMale = (json['averageSystolicBloodPressureForMale'] as num?)?.toDouble(),
      _averageDiastolicBloodPressureForMale = (json['averageDiastolicBloodPressureForMale'] as num?)?.toDouble(),
      _averageHeartRateForMale = (json['averageHeartRateForMale'] as num?)?.toDouble(),
      _averageHeartRateVariabilityForMale = (json['averageHeartRateVariabilityForMale'] as num?)?.toDouble(),
      _averageSympatheticNervousSystemIndexForMale = (json['averageSympatheticNervousSystemIndexForMale'] as num?)?.toDouble(),
      _averageScoreForMale = (json['averageScoreForMale'] as num?)?.toDouble(),
      _averageOxygenLevelForFemale = (json['averageOxygenLevelForFemale'] as num?)?.toDouble(),
      _averageOxygenSaturationLevelForFemale = (json['averageOxygenSaturationLevelForFemale'] as num?)?.toDouble(),
      _averageRespiratoryRateForFemale = (json['averageRespiratoryRateForFemale'] as num?)?.toDouble(),
      _averageStressIndexForFemale = (json['averageStressIndexForFemale'] as num?)?.toDouble(),
      _averageBodyTemperatureForFemale = (json['averageBodyTemperatureForFemale'] as num?)?.toDouble(),
      _averageSystolicBloodPressureForFemale = (json['averageSystolicBloodPressureForFemale'] as num?)?.toDouble(),
      _averageDiastolicBloodPressureForFemale = (json['averageDiastolicBloodPressureForFemale'] as num?)?.toDouble(),
      _averageHeartRateForFemale = (json['averageHeartRateForFemale'] as num?)?.toDouble(),
      _averageHeartRateVariabilityForFemale = (json['averageHeartRateVariabilityForFemale'] as num?)?.toDouble(),
      _averageSympatheticNervousSystemIndexForFemale = (json['averageSympatheticNervousSystemIndexForFemale'] as num?)?.toDouble(),
      _averageScoreForFemale = (json['averageScoreForFemale'] as num?)?.toDouble(),
      _numberOfProfiles = (json['numberOfProfiles'] as num?)?.toInt(),
      _numberOfMaleProfiles = (json['numberOfMaleProfiles'] as num?)?.toInt(),
      _numberOfFemaleProfiles = (json['numberOfFemaleProfiles'] as num?)?.toInt(),
      _numberOfProfilesLowRiskStressIndex = (json['numberOfProfilesLowRiskStressIndex'] as num?)?.toInt(),
      _numberOfProfilesMediumRiskStressIndex = (json['numberOfProfilesMediumRiskStressIndex'] as num?)?.toInt(),
      _numberOfProfilesHighRiskStressIndex = (json['numberOfProfilesHighRiskStressIndex'] as num?)?.toInt(),
      _numberOfProfilesNormalRiskBloodPressure = (json['numberOfProfilesNormalRiskBloodPressure'] as num?)?.toInt(),
      _numberOfProfilesElevatedRiskBloodPressure = (json['numberOfProfilesElevatedRiskBloodPressure'] as num?)?.toInt(),
      _numberOfProfilesHypertensiveRiskBloodPressure = (json['numberOfProfilesHypertensiveRiskBloodPressure'] as num?)?.toInt(),
      _organisationID = json['organisationID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'startDate': _startDate?.format(), 'endDate': _endDate?.format(), 'latestMood': _latestMood, 'latestStressLevel': _latestStressLevel, 'averageOxygenLevel': _averageOxygenLevel, 'averageOxygenSaturationLevel': _averageOxygenSaturationLevel, 'averageRespiratoryRate': _averageRespiratoryRate, 'averageStressIndex': _averageStressIndex, 'averageBodyTemperature': _averageBodyTemperature, 'averageSystolicBloodPressure': _averageSystolicBloodPressure, 'averageDiastolicBloodPressure': _averageDiastolicBloodPressure, 'averageHeartRate': _averageHeartRate, 'averageHeartRateVariability': _averageHeartRateVariability, 'averageSympatheticNervousSystemIndex': _averageSympatheticNervousSystemIndex, 'averageScore': _averageScore, 'averageOxygenLevelForMale': _averageOxygenLevelForMale, 'averageOxygenSaturationLevelForMale': _averageOxygenSaturationLevelForMale, 'averageRespiratoryRateForMale': _averageRespiratoryRateForMale, 'averageStressIndexForMale': _averageStressIndexForMale, 'averageBodyTemperatureForMale': _averageBodyTemperatureForMale, 'averageSystolicBloodPressureForMale': _averageSystolicBloodPressureForMale, 'averageDiastolicBloodPressureForMale': _averageDiastolicBloodPressureForMale, 'averageHeartRateForMale': _averageHeartRateForMale, 'averageHeartRateVariabilityForMale': _averageHeartRateVariabilityForMale, 'averageSympatheticNervousSystemIndexForMale': _averageSympatheticNervousSystemIndexForMale, 'averageScoreForMale': _averageScoreForMale, 'averageOxygenLevelForFemale': _averageOxygenLevelForFemale, 'averageOxygenSaturationLevelForFemale': _averageOxygenSaturationLevelForFemale, 'averageRespiratoryRateForFemale': _averageRespiratoryRateForFemale, 'averageStressIndexForFemale': _averageStressIndexForFemale, 'averageBodyTemperatureForFemale': _averageBodyTemperatureForFemale, 'averageSystolicBloodPressureForFemale': _averageSystolicBloodPressureForFemale, 'averageDiastolicBloodPressureForFemale': _averageDiastolicBloodPressureForFemale, 'averageHeartRateForFemale': _averageHeartRateForFemale, 'averageHeartRateVariabilityForFemale': _averageHeartRateVariabilityForFemale, 'averageSympatheticNervousSystemIndexForFemale': _averageSympatheticNervousSystemIndexForFemale, 'averageScoreForFemale': _averageScoreForFemale, 'numberOfProfiles': _numberOfProfiles, 'numberOfMaleProfiles': _numberOfMaleProfiles, 'numberOfFemaleProfiles': _numberOfFemaleProfiles, 'numberOfProfilesLowRiskStressIndex': _numberOfProfilesLowRiskStressIndex, 'numberOfProfilesMediumRiskStressIndex': _numberOfProfilesMediumRiskStressIndex, 'numberOfProfilesHighRiskStressIndex': _numberOfProfilesHighRiskStressIndex, 'numberOfProfilesNormalRiskBloodPressure': _numberOfProfilesNormalRiskBloodPressure, 'numberOfProfilesElevatedRiskBloodPressure': _numberOfProfilesElevatedRiskBloodPressure, 'numberOfProfilesHypertensiveRiskBloodPressure': _numberOfProfilesHypertensiveRiskBloodPressure, 'organisationID': _organisationID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'startDate': _startDate,
    'endDate': _endDate,
    'latestMood': _latestMood,
    'latestStressLevel': _latestStressLevel,
    'averageOxygenLevel': _averageOxygenLevel,
    'averageOxygenSaturationLevel': _averageOxygenSaturationLevel,
    'averageRespiratoryRate': _averageRespiratoryRate,
    'averageStressIndex': _averageStressIndex,
    'averageBodyTemperature': _averageBodyTemperature,
    'averageSystolicBloodPressure': _averageSystolicBloodPressure,
    'averageDiastolicBloodPressure': _averageDiastolicBloodPressure,
    'averageHeartRate': _averageHeartRate,
    'averageHeartRateVariability': _averageHeartRateVariability,
    'averageSympatheticNervousSystemIndex': _averageSympatheticNervousSystemIndex,
    'averageScore': _averageScore,
    'averageOxygenLevelForMale': _averageOxygenLevelForMale,
    'averageOxygenSaturationLevelForMale': _averageOxygenSaturationLevelForMale,
    'averageRespiratoryRateForMale': _averageRespiratoryRateForMale,
    'averageStressIndexForMale': _averageStressIndexForMale,
    'averageBodyTemperatureForMale': _averageBodyTemperatureForMale,
    'averageSystolicBloodPressureForMale': _averageSystolicBloodPressureForMale,
    'averageDiastolicBloodPressureForMale': _averageDiastolicBloodPressureForMale,
    'averageHeartRateForMale': _averageHeartRateForMale,
    'averageHeartRateVariabilityForMale': _averageHeartRateVariabilityForMale,
    'averageSympatheticNervousSystemIndexForMale': _averageSympatheticNervousSystemIndexForMale,
    'averageScoreForMale': _averageScoreForMale,
    'averageOxygenLevelForFemale': _averageOxygenLevelForFemale,
    'averageOxygenSaturationLevelForFemale': _averageOxygenSaturationLevelForFemale,
    'averageRespiratoryRateForFemale': _averageRespiratoryRateForFemale,
    'averageStressIndexForFemale': _averageStressIndexForFemale,
    'averageBodyTemperatureForFemale': _averageBodyTemperatureForFemale,
    'averageSystolicBloodPressureForFemale': _averageSystolicBloodPressureForFemale,
    'averageDiastolicBloodPressureForFemale': _averageDiastolicBloodPressureForFemale,
    'averageHeartRateForFemale': _averageHeartRateForFemale,
    'averageHeartRateVariabilityForFemale': _averageHeartRateVariabilityForFemale,
    'averageSympatheticNervousSystemIndexForFemale': _averageSympatheticNervousSystemIndexForFemale,
    'averageScoreForFemale': _averageScoreForFemale,
    'numberOfProfiles': _numberOfProfiles,
    'numberOfMaleProfiles': _numberOfMaleProfiles,
    'numberOfFemaleProfiles': _numberOfFemaleProfiles,
    'numberOfProfilesLowRiskStressIndex': _numberOfProfilesLowRiskStressIndex,
    'numberOfProfilesMediumRiskStressIndex': _numberOfProfilesMediumRiskStressIndex,
    'numberOfProfilesHighRiskStressIndex': _numberOfProfilesHighRiskStressIndex,
    'numberOfProfilesNormalRiskBloodPressure': _numberOfProfilesNormalRiskBloodPressure,
    'numberOfProfilesElevatedRiskBloodPressure': _numberOfProfilesElevatedRiskBloodPressure,
    'numberOfProfilesHypertensiveRiskBloodPressure': _numberOfProfilesHypertensiveRiskBloodPressure,
    'organisationID': _organisationID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final STARTDATE = amplify_core.QueryField(fieldName: "startDate");
  static final ENDDATE = amplify_core.QueryField(fieldName: "endDate");
  static final LATESTMOOD = amplify_core.QueryField(fieldName: "latestMood");
  static final LATESTSTRESSLEVEL = amplify_core.QueryField(fieldName: "latestStressLevel");
  static final AVERAGEOXYGENLEVEL = amplify_core.QueryField(fieldName: "averageOxygenLevel");
  static final AVERAGEOXYGENSATURATIONLEVEL = amplify_core.QueryField(fieldName: "averageOxygenSaturationLevel");
  static final AVERAGERESPIRATORYRATE = amplify_core.QueryField(fieldName: "averageRespiratoryRate");
  static final AVERAGESTRESSINDEX = amplify_core.QueryField(fieldName: "averageStressIndex");
  static final AVERAGEBODYTEMPERATURE = amplify_core.QueryField(fieldName: "averageBodyTemperature");
  static final AVERAGESYSTOLICBLOODPRESSURE = amplify_core.QueryField(fieldName: "averageSystolicBloodPressure");
  static final AVERAGEDIASTOLICBLOODPRESSURE = amplify_core.QueryField(fieldName: "averageDiastolicBloodPressure");
  static final AVERAGEHEARTRATE = amplify_core.QueryField(fieldName: "averageHeartRate");
  static final AVERAGEHEARTRATEVARIABILITY = amplify_core.QueryField(fieldName: "averageHeartRateVariability");
  static final AVERAGESYMPATHETICNERVOUSSYSTEMINDEX = amplify_core.QueryField(fieldName: "averageSympatheticNervousSystemIndex");
  static final AVERAGESCORE = amplify_core.QueryField(fieldName: "averageScore");
  static final AVERAGEOXYGENLEVELFORMALE = amplify_core.QueryField(fieldName: "averageOxygenLevelForMale");
  static final AVERAGEOXYGENSATURATIONLEVELFORMALE = amplify_core.QueryField(fieldName: "averageOxygenSaturationLevelForMale");
  static final AVERAGERESPIRATORYRATEFORMALE = amplify_core.QueryField(fieldName: "averageRespiratoryRateForMale");
  static final AVERAGESTRESSINDEXFORMALE = amplify_core.QueryField(fieldName: "averageStressIndexForMale");
  static final AVERAGEBODYTEMPERATUREFORMALE = amplify_core.QueryField(fieldName: "averageBodyTemperatureForMale");
  static final AVERAGESYSTOLICBLOODPRESSUREFORMALE = amplify_core.QueryField(fieldName: "averageSystolicBloodPressureForMale");
  static final AVERAGEDIASTOLICBLOODPRESSUREFORMALE = amplify_core.QueryField(fieldName: "averageDiastolicBloodPressureForMale");
  static final AVERAGEHEARTRATEFORMALE = amplify_core.QueryField(fieldName: "averageHeartRateForMale");
  static final AVERAGEHEARTRATEVARIABILITYFORMALE = amplify_core.QueryField(fieldName: "averageHeartRateVariabilityForMale");
  static final AVERAGESYMPATHETICNERVOUSSYSTEMINDEXFORMALE = amplify_core.QueryField(fieldName: "averageSympatheticNervousSystemIndexForMale");
  static final AVERAGESCOREFORMALE = amplify_core.QueryField(fieldName: "averageScoreForMale");
  static final AVERAGEOXYGENLEVELFORFEMALE = amplify_core.QueryField(fieldName: "averageOxygenLevelForFemale");
  static final AVERAGEOXYGENSATURATIONLEVELFORFEMALE = amplify_core.QueryField(fieldName: "averageOxygenSaturationLevelForFemale");
  static final AVERAGERESPIRATORYRATEFORFEMALE = amplify_core.QueryField(fieldName: "averageRespiratoryRateForFemale");
  static final AVERAGESTRESSINDEXFORFEMALE = amplify_core.QueryField(fieldName: "averageStressIndexForFemale");
  static final AVERAGEBODYTEMPERATUREFORFEMALE = amplify_core.QueryField(fieldName: "averageBodyTemperatureForFemale");
  static final AVERAGESYSTOLICBLOODPRESSUREFORFEMALE = amplify_core.QueryField(fieldName: "averageSystolicBloodPressureForFemale");
  static final AVERAGEDIASTOLICBLOODPRESSUREFORFEMALE = amplify_core.QueryField(fieldName: "averageDiastolicBloodPressureForFemale");
  static final AVERAGEHEARTRATEFORFEMALE = amplify_core.QueryField(fieldName: "averageHeartRateForFemale");
  static final AVERAGEHEARTRATEVARIABILITYFORFEMALE = amplify_core.QueryField(fieldName: "averageHeartRateVariabilityForFemale");
  static final AVERAGESYMPATHETICNERVOUSSYSTEMINDEXFORFEMALE = amplify_core.QueryField(fieldName: "averageSympatheticNervousSystemIndexForFemale");
  static final AVERAGESCOREFORFEMALE = amplify_core.QueryField(fieldName: "averageScoreForFemale");
  static final NUMBEROFPROFILES = amplify_core.QueryField(fieldName: "numberOfProfiles");
  static final NUMBEROFMALEPROFILES = amplify_core.QueryField(fieldName: "numberOfMaleProfiles");
  static final NUMBEROFFEMALEPROFILES = amplify_core.QueryField(fieldName: "numberOfFemaleProfiles");
  static final NUMBEROFPROFILESLOWRISKSTRESSINDEX = amplify_core.QueryField(fieldName: "numberOfProfilesLowRiskStressIndex");
  static final NUMBEROFPROFILESMEDIUMRISKSTRESSINDEX = amplify_core.QueryField(fieldName: "numberOfProfilesMediumRiskStressIndex");
  static final NUMBEROFPROFILESHIGHRISKSTRESSINDEX = amplify_core.QueryField(fieldName: "numberOfProfilesHighRiskStressIndex");
  static final NUMBEROFPROFILESNORMALRISKBLOODPRESSURE = amplify_core.QueryField(fieldName: "numberOfProfilesNormalRiskBloodPressure");
  static final NUMBEROFPROFILESELEVATEDRISKBLOODPRESSURE = amplify_core.QueryField(fieldName: "numberOfProfilesElevatedRiskBloodPressure");
  static final NUMBEROFPROFILESHYPERTENSIVERISKBLOODPRESSURE = amplify_core.QueryField(fieldName: "numberOfProfilesHypertensiveRiskBloodPressure");
  static final ORGANISATIONID = amplify_core.QueryField(fieldName: "organisationID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AggregateYearOrganisationAssessment";
    modelSchemaDefinition.pluralName = "AggregateYearOrganisationAssessments";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["organisationID", "endDate"], name: "byOrganisation")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.STARTDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.ENDDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.LATESTMOOD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.LATESTSTRESSLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEOXYGENLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEOXYGENSATURATIONLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGERESPIRATORYRATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESTRESSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEBODYTEMPERATURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESYSTOLICBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEDIASTOLICBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEHEARTRATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEHEARTRATEVARIABILITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESYMPATHETICNERVOUSSYSTEMINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESCORE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEOXYGENLEVELFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEOXYGENSATURATIONLEVELFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGERESPIRATORYRATEFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESTRESSINDEXFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEBODYTEMPERATUREFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESYSTOLICBLOODPRESSUREFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEDIASTOLICBLOODPRESSUREFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEHEARTRATEFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEHEARTRATEVARIABILITYFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESYMPATHETICNERVOUSSYSTEMINDEXFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESCOREFORMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEOXYGENLEVELFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEOXYGENSATURATIONLEVELFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGERESPIRATORYRATEFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESTRESSINDEXFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEBODYTEMPERATUREFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESYSTOLICBLOODPRESSUREFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEDIASTOLICBLOODPRESSUREFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEHEARTRATEFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGEHEARTRATEVARIABILITYFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESYMPATHETICNERVOUSSYSTEMINDEXFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.AVERAGESCOREFORFEMALE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.NUMBEROFPROFILES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.NUMBEROFMALEPROFILES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.NUMBEROFFEMALEPROFILES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.NUMBEROFPROFILESLOWRISKSTRESSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.NUMBEROFPROFILESMEDIUMRISKSTRESSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.NUMBEROFPROFILESHIGHRISKSTRESSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.NUMBEROFPROFILESNORMALRISKBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.NUMBEROFPROFILESELEVATEDRISKBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.NUMBEROFPROFILESHYPERTENSIVERISKBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateYearOrganisationAssessment.ORGANISATIONID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _AggregateYearOrganisationAssessmentModelType extends amplify_core.ModelType<AggregateYearOrganisationAssessment> {
  const _AggregateYearOrganisationAssessmentModelType();
  
  @override
  AggregateYearOrganisationAssessment fromJson(Map<String, dynamic> jsonData) {
    return AggregateYearOrganisationAssessment.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'AggregateYearOrganisationAssessment';
  }
}
