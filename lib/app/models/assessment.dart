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

/** This is an auto generated class representing the Assessment type in your schema. */
class Assessment extends amplify_core.Model {
  static const classType = const _AssessmentModelType();
  final String id;
  final amplify_core.TemporalDateTime? _startDate;
  final amplify_core.TemporalDateTime? _endDate;
  final String? _mood;
  final String? _stressLevel;
  final double? _oxygenLevel;
  final double? _oxygenSaturationLevel;
  final double? _respiratoryRate;
  final double? _stressIndex;
  final double? _bodyTemperature;
  final double? _systolicBloodPressure;
  final double? _diastolicBloodPressure;
  final double? _heartRate;
  final double? _heartRateManual;
  final String? _heartRateManualSource;
  final double? _heartRateVariability;
  final double? _sympatheticNervousSystemIndex;
  final String? _kbType;
  final double? _kbArtefact;
  final String? _kbArtefactLevel;
  final String? _kbCreateTimestamp;
  final double? _kbMeanHrBpm;
  final double? _kbMeanRRMs;
  final double? _kbPnsIndex;
  final double? _kbReadiness;
  final double? _kbRmssdMs;
  final double? _kbSd1Ms;
  final double? _kbSd2Ms;
  final double? _kbSdnnMs;
  final double? _kbSnsIndex;
  final double? _kbStressIndex;
  final double? _score;
  final String? _timezone;
  final String? _profileID;
  final String? _organisationID;
  final SelfCare? _selfCare;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _assessmentSelfCareId;

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
  
  String? get mood {
    return _mood;
  }
  
  String? get stressLevel {
    return _stressLevel;
  }
  
  double? get oxygenLevel {
    return _oxygenLevel;
  }
  
  double? get oxygenSaturationLevel {
    return _oxygenSaturationLevel;
  }
  
  double? get respiratoryRate {
    return _respiratoryRate;
  }
  
  double? get stressIndex {
    return _stressIndex;
  }
  
  double? get bodyTemperature {
    return _bodyTemperature;
  }
  
  double? get systolicBloodPressure {
    return _systolicBloodPressure;
  }
  
  double? get diastolicBloodPressure {
    return _diastolicBloodPressure;
  }
  
  double? get heartRate {
    return _heartRate;
  }
  
  double? get heartRateManual {
    return _heartRateManual;
  }
  
  String? get heartRateManualSource {
    return _heartRateManualSource;
  }
  
  double? get heartRateVariability {
    return _heartRateVariability;
  }
  
  double? get sympatheticNervousSystemIndex {
    return _sympatheticNervousSystemIndex;
  }
  
  String? get kbType {
    return _kbType;
  }
  
  double? get kbArtefact {
    return _kbArtefact;
  }
  
  String? get kbArtefactLevel {
    return _kbArtefactLevel;
  }
  
  String? get kbCreateTimestamp {
    return _kbCreateTimestamp;
  }
  
  double? get kbMeanHrBpm {
    return _kbMeanHrBpm;
  }
  
  double? get kbMeanRRMs {
    return _kbMeanRRMs;
  }
  
  double? get kbPnsIndex {
    return _kbPnsIndex;
  }
  
  double? get kbReadiness {
    return _kbReadiness;
  }
  
  double? get kbRmssdMs {
    return _kbRmssdMs;
  }
  
  double? get kbSd1Ms {
    return _kbSd1Ms;
  }
  
  double? get kbSd2Ms {
    return _kbSd2Ms;
  }
  
  double? get kbSdnnMs {
    return _kbSdnnMs;
  }
  
  double? get kbSnsIndex {
    return _kbSnsIndex;
  }
  
  double? get kbStressIndex {
    return _kbStressIndex;
  }
  
  double? get score {
    return _score;
  }
  
  String? get timezone {
    return _timezone;
  }
  
  String get profileID {
    try {
      return _profileID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get organisationID {
    return _organisationID;
  }
  
  SelfCare? get selfCare {
    return _selfCare;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get assessmentSelfCareId {
    return _assessmentSelfCareId;
  }
  
  const Assessment._internal({required this.id, startDate, endDate, mood, stressLevel, oxygenLevel, oxygenSaturationLevel, respiratoryRate, stressIndex, bodyTemperature, systolicBloodPressure, diastolicBloodPressure, heartRate, heartRateManual, heartRateManualSource, heartRateVariability, sympatheticNervousSystemIndex, kbType, kbArtefact, kbArtefactLevel, kbCreateTimestamp, kbMeanHrBpm, kbMeanRRMs, kbPnsIndex, kbReadiness, kbRmssdMs, kbSd1Ms, kbSd2Ms, kbSdnnMs, kbSnsIndex, kbStressIndex, score, timezone, required profileID, organisationID, selfCare, createdAt, updatedAt, assessmentSelfCareId}): _startDate = startDate, _endDate = endDate, _mood = mood, _stressLevel = stressLevel, _oxygenLevel = oxygenLevel, _oxygenSaturationLevel = oxygenSaturationLevel, _respiratoryRate = respiratoryRate, _stressIndex = stressIndex, _bodyTemperature = bodyTemperature, _systolicBloodPressure = systolicBloodPressure, _diastolicBloodPressure = diastolicBloodPressure, _heartRate = heartRate, _heartRateManual = heartRateManual, _heartRateManualSource = heartRateManualSource, _heartRateVariability = heartRateVariability, _sympatheticNervousSystemIndex = sympatheticNervousSystemIndex, _kbType = kbType, _kbArtefact = kbArtefact, _kbArtefactLevel = kbArtefactLevel, _kbCreateTimestamp = kbCreateTimestamp, _kbMeanHrBpm = kbMeanHrBpm, _kbMeanRRMs = kbMeanRRMs, _kbPnsIndex = kbPnsIndex, _kbReadiness = kbReadiness, _kbRmssdMs = kbRmssdMs, _kbSd1Ms = kbSd1Ms, _kbSd2Ms = kbSd2Ms, _kbSdnnMs = kbSdnnMs, _kbSnsIndex = kbSnsIndex, _kbStressIndex = kbStressIndex, _score = score, _timezone = timezone, _profileID = profileID, _organisationID = organisationID, _selfCare = selfCare, _createdAt = createdAt, _updatedAt = updatedAt, _assessmentSelfCareId = assessmentSelfCareId;
  
  factory Assessment({String? id, amplify_core.TemporalDateTime? startDate, amplify_core.TemporalDateTime? endDate, String? mood, String? stressLevel, double? oxygenLevel, double? oxygenSaturationLevel, double? respiratoryRate, double? stressIndex, double? bodyTemperature, double? systolicBloodPressure, double? diastolicBloodPressure, double? heartRate, double? heartRateManual, String? heartRateManualSource, double? heartRateVariability, double? sympatheticNervousSystemIndex, String? kbType, double? kbArtefact, String? kbArtefactLevel, String? kbCreateTimestamp, double? kbMeanHrBpm, double? kbMeanRRMs, double? kbPnsIndex, double? kbReadiness, double? kbRmssdMs, double? kbSd1Ms, double? kbSd2Ms, double? kbSdnnMs, double? kbSnsIndex, double? kbStressIndex, double? score, String? timezone, required String profileID, String? organisationID, SelfCare? selfCare, String? assessmentSelfCareId}) {
    return Assessment._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      startDate: startDate,
      endDate: endDate,
      mood: mood,
      stressLevel: stressLevel,
      oxygenLevel: oxygenLevel,
      oxygenSaturationLevel: oxygenSaturationLevel,
      respiratoryRate: respiratoryRate,
      stressIndex: stressIndex,
      bodyTemperature: bodyTemperature,
      systolicBloodPressure: systolicBloodPressure,
      diastolicBloodPressure: diastolicBloodPressure,
      heartRate: heartRate,
      heartRateManual: heartRateManual,
      heartRateManualSource: heartRateManualSource,
      heartRateVariability: heartRateVariability,
      sympatheticNervousSystemIndex: sympatheticNervousSystemIndex,
      kbType: kbType,
      kbArtefact: kbArtefact,
      kbArtefactLevel: kbArtefactLevel,
      kbCreateTimestamp: kbCreateTimestamp,
      kbMeanHrBpm: kbMeanHrBpm,
      kbMeanRRMs: kbMeanRRMs,
      kbPnsIndex: kbPnsIndex,
      kbReadiness: kbReadiness,
      kbRmssdMs: kbRmssdMs,
      kbSd1Ms: kbSd1Ms,
      kbSd2Ms: kbSd2Ms,
      kbSdnnMs: kbSdnnMs,
      kbSnsIndex: kbSnsIndex,
      kbStressIndex: kbStressIndex,
      score: score,
      timezone: timezone,
      profileID: profileID,
      organisationID: organisationID,
      selfCare: selfCare,
      assessmentSelfCareId: assessmentSelfCareId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Assessment &&
      id == other.id &&
      _startDate == other._startDate &&
      _endDate == other._endDate &&
      _mood == other._mood &&
      _stressLevel == other._stressLevel &&
      _oxygenLevel == other._oxygenLevel &&
      _oxygenSaturationLevel == other._oxygenSaturationLevel &&
      _respiratoryRate == other._respiratoryRate &&
      _stressIndex == other._stressIndex &&
      _bodyTemperature == other._bodyTemperature &&
      _systolicBloodPressure == other._systolicBloodPressure &&
      _diastolicBloodPressure == other._diastolicBloodPressure &&
      _heartRate == other._heartRate &&
      _heartRateManual == other._heartRateManual &&
      _heartRateManualSource == other._heartRateManualSource &&
      _heartRateVariability == other._heartRateVariability &&
      _sympatheticNervousSystemIndex == other._sympatheticNervousSystemIndex &&
      _kbType == other._kbType &&
      _kbArtefact == other._kbArtefact &&
      _kbArtefactLevel == other._kbArtefactLevel &&
      _kbCreateTimestamp == other._kbCreateTimestamp &&
      _kbMeanHrBpm == other._kbMeanHrBpm &&
      _kbMeanRRMs == other._kbMeanRRMs &&
      _kbPnsIndex == other._kbPnsIndex &&
      _kbReadiness == other._kbReadiness &&
      _kbRmssdMs == other._kbRmssdMs &&
      _kbSd1Ms == other._kbSd1Ms &&
      _kbSd2Ms == other._kbSd2Ms &&
      _kbSdnnMs == other._kbSdnnMs &&
      _kbSnsIndex == other._kbSnsIndex &&
      _kbStressIndex == other._kbStressIndex &&
      _score == other._score &&
      _timezone == other._timezone &&
      _profileID == other._profileID &&
      _organisationID == other._organisationID &&
      _selfCare == other._selfCare &&
      _assessmentSelfCareId == other._assessmentSelfCareId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Assessment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("startDate=" + (_startDate != null ? _startDate!.format() : "null") + ", ");
    buffer.write("endDate=" + (_endDate != null ? _endDate!.format() : "null") + ", ");
    buffer.write("mood=" + "$_mood" + ", ");
    buffer.write("stressLevel=" + "$_stressLevel" + ", ");
    buffer.write("oxygenLevel=" + (_oxygenLevel != null ? _oxygenLevel!.toString() : "null") + ", ");
    buffer.write("oxygenSaturationLevel=" + (_oxygenSaturationLevel != null ? _oxygenSaturationLevel!.toString() : "null") + ", ");
    buffer.write("respiratoryRate=" + (_respiratoryRate != null ? _respiratoryRate!.toString() : "null") + ", ");
    buffer.write("stressIndex=" + (_stressIndex != null ? _stressIndex!.toString() : "null") + ", ");
    buffer.write("bodyTemperature=" + (_bodyTemperature != null ? _bodyTemperature!.toString() : "null") + ", ");
    buffer.write("systolicBloodPressure=" + (_systolicBloodPressure != null ? _systolicBloodPressure!.toString() : "null") + ", ");
    buffer.write("diastolicBloodPressure=" + (_diastolicBloodPressure != null ? _diastolicBloodPressure!.toString() : "null") + ", ");
    buffer.write("heartRate=" + (_heartRate != null ? _heartRate!.toString() : "null") + ", ");
    buffer.write("heartRateManual=" + (_heartRateManual != null ? _heartRateManual!.toString() : "null") + ", ");
    buffer.write("heartRateManualSource=" + "$_heartRateManualSource" + ", ");
    buffer.write("heartRateVariability=" + (_heartRateVariability != null ? _heartRateVariability!.toString() : "null") + ", ");
    buffer.write("sympatheticNervousSystemIndex=" + (_sympatheticNervousSystemIndex != null ? _sympatheticNervousSystemIndex!.toString() : "null") + ", ");
    buffer.write("kbType=" + "$_kbType" + ", ");
    buffer.write("kbArtefact=" + (_kbArtefact != null ? _kbArtefact!.toString() : "null") + ", ");
    buffer.write("kbArtefactLevel=" + "$_kbArtefactLevel" + ", ");
    buffer.write("kbCreateTimestamp=" + "$_kbCreateTimestamp" + ", ");
    buffer.write("kbMeanHrBpm=" + (_kbMeanHrBpm != null ? _kbMeanHrBpm!.toString() : "null") + ", ");
    buffer.write("kbMeanRRMs=" + (_kbMeanRRMs != null ? _kbMeanRRMs!.toString() : "null") + ", ");
    buffer.write("kbPnsIndex=" + (_kbPnsIndex != null ? _kbPnsIndex!.toString() : "null") + ", ");
    buffer.write("kbReadiness=" + (_kbReadiness != null ? _kbReadiness!.toString() : "null") + ", ");
    buffer.write("kbRmssdMs=" + (_kbRmssdMs != null ? _kbRmssdMs!.toString() : "null") + ", ");
    buffer.write("kbSd1Ms=" + (_kbSd1Ms != null ? _kbSd1Ms!.toString() : "null") + ", ");
    buffer.write("kbSd2Ms=" + (_kbSd2Ms != null ? _kbSd2Ms!.toString() : "null") + ", ");
    buffer.write("kbSdnnMs=" + (_kbSdnnMs != null ? _kbSdnnMs!.toString() : "null") + ", ");
    buffer.write("kbSnsIndex=" + (_kbSnsIndex != null ? _kbSnsIndex!.toString() : "null") + ", ");
    buffer.write("kbStressIndex=" + (_kbStressIndex != null ? _kbStressIndex!.toString() : "null") + ", ");
    buffer.write("score=" + (_score != null ? _score!.toString() : "null") + ", ");
    buffer.write("timezone=" + "$_timezone" + ", ");
    buffer.write("profileID=" + "$_profileID" + ", ");
    buffer.write("organisationID=" + "$_organisationID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("assessmentSelfCareId=" + "$_assessmentSelfCareId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Assessment copyWith({String? id, amplify_core.TemporalDateTime? startDate, amplify_core.TemporalDateTime? endDate, String? mood, String? stressLevel, double? oxygenLevel, double? oxygenSaturationLevel, double? respiratoryRate, double? stressIndex, double? bodyTemperature, double? systolicBloodPressure, double? diastolicBloodPressure, double? heartRate, double? heartRateManual, String? heartRateManualSource, double? heartRateVariability, double? sympatheticNervousSystemIndex, String? kbType, double? kbArtefact, String? kbArtefactLevel, String? kbCreateTimestamp, double? kbMeanHrBpm, double? kbMeanRRMs, double? kbPnsIndex, double? kbReadiness, double? kbRmssdMs, double? kbSd1Ms, double? kbSd2Ms, double? kbSdnnMs, double? kbSnsIndex, double? kbStressIndex, double? score, String? timezone, String? profileID, String? organisationID, SelfCare? selfCare, String? assessmentSelfCareId}) {
    return Assessment._internal(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      mood: mood ?? this.mood,
      stressLevel: stressLevel ?? this.stressLevel,
      oxygenLevel: oxygenLevel ?? this.oxygenLevel,
      oxygenSaturationLevel: oxygenSaturationLevel ?? this.oxygenSaturationLevel,
      respiratoryRate: respiratoryRate ?? this.respiratoryRate,
      stressIndex: stressIndex ?? this.stressIndex,
      bodyTemperature: bodyTemperature ?? this.bodyTemperature,
      systolicBloodPressure: systolicBloodPressure ?? this.systolicBloodPressure,
      diastolicBloodPressure: diastolicBloodPressure ?? this.diastolicBloodPressure,
      heartRate: heartRate ?? this.heartRate,
      heartRateManual: heartRateManual ?? this.heartRateManual,
      heartRateManualSource: heartRateManualSource ?? this.heartRateManualSource,
      heartRateVariability: heartRateVariability ?? this.heartRateVariability,
      sympatheticNervousSystemIndex: sympatheticNervousSystemIndex ?? this.sympatheticNervousSystemIndex,
      kbType: kbType ?? this.kbType,
      kbArtefact: kbArtefact ?? this.kbArtefact,
      kbArtefactLevel: kbArtefactLevel ?? this.kbArtefactLevel,
      kbCreateTimestamp: kbCreateTimestamp ?? this.kbCreateTimestamp,
      kbMeanHrBpm: kbMeanHrBpm ?? this.kbMeanHrBpm,
      kbMeanRRMs: kbMeanRRMs ?? this.kbMeanRRMs,
      kbPnsIndex: kbPnsIndex ?? this.kbPnsIndex,
      kbReadiness: kbReadiness ?? this.kbReadiness,
      kbRmssdMs: kbRmssdMs ?? this.kbRmssdMs,
      kbSd1Ms: kbSd1Ms ?? this.kbSd1Ms,
      kbSd2Ms: kbSd2Ms ?? this.kbSd2Ms,
      kbSdnnMs: kbSdnnMs ?? this.kbSdnnMs,
      kbSnsIndex: kbSnsIndex ?? this.kbSnsIndex,
      kbStressIndex: kbStressIndex ?? this.kbStressIndex,
      score: score ?? this.score,
      timezone: timezone ?? this.timezone,
      profileID: profileID ?? this.profileID,
      organisationID: organisationID ?? this.organisationID,
      selfCare: selfCare ?? this.selfCare,
      assessmentSelfCareId: assessmentSelfCareId ?? this.assessmentSelfCareId);
  }
  
  Assessment copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<amplify_core.TemporalDateTime?>? startDate,
    ModelFieldValue<amplify_core.TemporalDateTime?>? endDate,
    ModelFieldValue<String?>? mood,
    ModelFieldValue<String?>? stressLevel,
    ModelFieldValue<double?>? oxygenLevel,
    ModelFieldValue<double?>? oxygenSaturationLevel,
    ModelFieldValue<double?>? respiratoryRate,
    ModelFieldValue<double?>? stressIndex,
    ModelFieldValue<double?>? bodyTemperature,
    ModelFieldValue<double?>? systolicBloodPressure,
    ModelFieldValue<double?>? diastolicBloodPressure,
    ModelFieldValue<double?>? heartRate,
    ModelFieldValue<double?>? heartRateManual,
    ModelFieldValue<String?>? heartRateManualSource,
    ModelFieldValue<double?>? heartRateVariability,
    ModelFieldValue<double?>? sympatheticNervousSystemIndex,
    ModelFieldValue<String?>? kbType,
    ModelFieldValue<double?>? kbArtefact,
    ModelFieldValue<String?>? kbArtefactLevel,
    ModelFieldValue<String?>? kbCreateTimestamp,
    ModelFieldValue<double?>? kbMeanHrBpm,
    ModelFieldValue<double?>? kbMeanRRMs,
    ModelFieldValue<double?>? kbPnsIndex,
    ModelFieldValue<double?>? kbReadiness,
    ModelFieldValue<double?>? kbRmssdMs,
    ModelFieldValue<double?>? kbSd1Ms,
    ModelFieldValue<double?>? kbSd2Ms,
    ModelFieldValue<double?>? kbSdnnMs,
    ModelFieldValue<double?>? kbSnsIndex,
    ModelFieldValue<double?>? kbStressIndex,
    ModelFieldValue<double?>? score,
    ModelFieldValue<String?>? timezone,
    ModelFieldValue<String>? profileID,
    ModelFieldValue<String?>? organisationID,
    ModelFieldValue<SelfCare?>? selfCare,
    ModelFieldValue<String?>? assessmentSelfCareId
  }) {
    return Assessment._internal(
      id: id == null ? this.id : id.value,
      startDate: startDate == null ? this.startDate : startDate.value,
      endDate: endDate == null ? this.endDate : endDate.value,
      mood: mood == null ? this.mood : mood.value,
      stressLevel: stressLevel == null ? this.stressLevel : stressLevel.value,
      oxygenLevel: oxygenLevel == null ? this.oxygenLevel : oxygenLevel.value,
      oxygenSaturationLevel: oxygenSaturationLevel == null ? this.oxygenSaturationLevel : oxygenSaturationLevel.value,
      respiratoryRate: respiratoryRate == null ? this.respiratoryRate : respiratoryRate.value,
      stressIndex: stressIndex == null ? this.stressIndex : stressIndex.value,
      bodyTemperature: bodyTemperature == null ? this.bodyTemperature : bodyTemperature.value,
      systolicBloodPressure: systolicBloodPressure == null ? this.systolicBloodPressure : systolicBloodPressure.value,
      diastolicBloodPressure: diastolicBloodPressure == null ? this.diastolicBloodPressure : diastolicBloodPressure.value,
      heartRate: heartRate == null ? this.heartRate : heartRate.value,
      heartRateManual: heartRateManual == null ? this.heartRateManual : heartRateManual.value,
      heartRateManualSource: heartRateManualSource == null ? this.heartRateManualSource : heartRateManualSource.value,
      heartRateVariability: heartRateVariability == null ? this.heartRateVariability : heartRateVariability.value,
      sympatheticNervousSystemIndex: sympatheticNervousSystemIndex == null ? this.sympatheticNervousSystemIndex : sympatheticNervousSystemIndex.value,
      kbType: kbType == null ? this.kbType : kbType.value,
      kbArtefact: kbArtefact == null ? this.kbArtefact : kbArtefact.value,
      kbArtefactLevel: kbArtefactLevel == null ? this.kbArtefactLevel : kbArtefactLevel.value,
      kbCreateTimestamp: kbCreateTimestamp == null ? this.kbCreateTimestamp : kbCreateTimestamp.value,
      kbMeanHrBpm: kbMeanHrBpm == null ? this.kbMeanHrBpm : kbMeanHrBpm.value,
      kbMeanRRMs: kbMeanRRMs == null ? this.kbMeanRRMs : kbMeanRRMs.value,
      kbPnsIndex: kbPnsIndex == null ? this.kbPnsIndex : kbPnsIndex.value,
      kbReadiness: kbReadiness == null ? this.kbReadiness : kbReadiness.value,
      kbRmssdMs: kbRmssdMs == null ? this.kbRmssdMs : kbRmssdMs.value,
      kbSd1Ms: kbSd1Ms == null ? this.kbSd1Ms : kbSd1Ms.value,
      kbSd2Ms: kbSd2Ms == null ? this.kbSd2Ms : kbSd2Ms.value,
      kbSdnnMs: kbSdnnMs == null ? this.kbSdnnMs : kbSdnnMs.value,
      kbSnsIndex: kbSnsIndex == null ? this.kbSnsIndex : kbSnsIndex.value,
      kbStressIndex: kbStressIndex == null ? this.kbStressIndex : kbStressIndex.value,
      score: score == null ? this.score : score.value,
      timezone: timezone == null ? this.timezone : timezone.value,
      profileID: profileID == null ? this.profileID : profileID.value,
      organisationID: organisationID == null ? this.organisationID : organisationID.value,
      selfCare: selfCare == null ? this.selfCare : selfCare.value,
      assessmentSelfCareId: assessmentSelfCareId == null ? this.assessmentSelfCareId : assessmentSelfCareId.value
    );
  }
  
  Assessment.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _startDate = json['startDate'] != null ? amplify_core.TemporalDateTime.fromString(json['startDate']) : null,
      _endDate = json['endDate'] != null ? amplify_core.TemporalDateTime.fromString(json['endDate']) : null,
      _mood = json['mood'],
      _stressLevel = json['stressLevel'],
      _oxygenLevel = (json['oxygenLevel'] as num?)?.toDouble(),
      _oxygenSaturationLevel = (json['oxygenSaturationLevel'] as num?)?.toDouble(),
      _respiratoryRate = (json['respiratoryRate'] as num?)?.toDouble(),
      _stressIndex = (json['stressIndex'] as num?)?.toDouble(),
      _bodyTemperature = (json['bodyTemperature'] as num?)?.toDouble(),
      _systolicBloodPressure = (json['systolicBloodPressure'] as num?)?.toDouble(),
      _diastolicBloodPressure = (json['diastolicBloodPressure'] as num?)?.toDouble(),
      _heartRate = (json['heartRate'] as num?)?.toDouble(),
      _heartRateManual = (json['heartRateManual'] as num?)?.toDouble(),
      _heartRateManualSource = json['heartRateManualSource'],
      _heartRateVariability = (json['heartRateVariability'] as num?)?.toDouble(),
      _sympatheticNervousSystemIndex = (json['sympatheticNervousSystemIndex'] as num?)?.toDouble(),
      _kbType = json['kbType'],
      _kbArtefact = (json['kbArtefact'] as num?)?.toDouble(),
      _kbArtefactLevel = json['kbArtefactLevel'],
      _kbCreateTimestamp = json['kbCreateTimestamp'],
      _kbMeanHrBpm = (json['kbMeanHrBpm'] as num?)?.toDouble(),
      _kbMeanRRMs = (json['kbMeanRRMs'] as num?)?.toDouble(),
      _kbPnsIndex = (json['kbPnsIndex'] as num?)?.toDouble(),
      _kbReadiness = (json['kbReadiness'] as num?)?.toDouble(),
      _kbRmssdMs = (json['kbRmssdMs'] as num?)?.toDouble(),
      _kbSd1Ms = (json['kbSd1Ms'] as num?)?.toDouble(),
      _kbSd2Ms = (json['kbSd2Ms'] as num?)?.toDouble(),
      _kbSdnnMs = (json['kbSdnnMs'] as num?)?.toDouble(),
      _kbSnsIndex = (json['kbSnsIndex'] as num?)?.toDouble(),
      _kbStressIndex = (json['kbStressIndex'] as num?)?.toDouble(),
      _score = (json['score'] as num?)?.toDouble(),
      _timezone = json['timezone'],
      _profileID = json['profileID'],
      _organisationID = json['organisationID'],
      _selfCare = json['selfCare'] != null
        ? SelfCare.fromJson(new Map<String, dynamic>.from(json['selfCare']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _assessmentSelfCareId = json['assessmentSelfCareId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'startDate': _startDate?.format(), 'endDate': _endDate?.format(), 'mood': _mood, 'stressLevel': _stressLevel, 'oxygenLevel': _oxygenLevel, 'oxygenSaturationLevel': _oxygenSaturationLevel, 'respiratoryRate': _respiratoryRate, 'stressIndex': _stressIndex, 'bodyTemperature': _bodyTemperature, 'systolicBloodPressure': _systolicBloodPressure, 'diastolicBloodPressure': _diastolicBloodPressure, 'heartRate': _heartRate, 'heartRateManual': _heartRateManual, 'heartRateManualSource': _heartRateManualSource, 'heartRateVariability': _heartRateVariability, 'sympatheticNervousSystemIndex': _sympatheticNervousSystemIndex, 'kbType': _kbType, 'kbArtefact': _kbArtefact, 'kbArtefactLevel': _kbArtefactLevel, 'kbCreateTimestamp': _kbCreateTimestamp, 'kbMeanHrBpm': _kbMeanHrBpm, 'kbMeanRRMs': _kbMeanRRMs, 'kbPnsIndex': _kbPnsIndex, 'kbReadiness': _kbReadiness, 'kbRmssdMs': _kbRmssdMs, 'kbSd1Ms': _kbSd1Ms, 'kbSd2Ms': _kbSd2Ms, 'kbSdnnMs': _kbSdnnMs, 'kbSnsIndex': _kbSnsIndex, 'kbStressIndex': _kbStressIndex, 'score': _score, 'timezone': _timezone, 'profileID': _profileID, 'organisationID': _organisationID, 'selfCare': _selfCare?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'assessmentSelfCareId': _assessmentSelfCareId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'startDate': _startDate,
    'endDate': _endDate,
    'mood': _mood,
    'stressLevel': _stressLevel,
    'oxygenLevel': _oxygenLevel,
    'oxygenSaturationLevel': _oxygenSaturationLevel,
    'respiratoryRate': _respiratoryRate,
    'stressIndex': _stressIndex,
    'bodyTemperature': _bodyTemperature,
    'systolicBloodPressure': _systolicBloodPressure,
    'diastolicBloodPressure': _diastolicBloodPressure,
    'heartRate': _heartRate,
    'heartRateManual': _heartRateManual,
    'heartRateManualSource': _heartRateManualSource,
    'heartRateVariability': _heartRateVariability,
    'sympatheticNervousSystemIndex': _sympatheticNervousSystemIndex,
    'kbType': _kbType,
    'kbArtefact': _kbArtefact,
    'kbArtefactLevel': _kbArtefactLevel,
    'kbCreateTimestamp': _kbCreateTimestamp,
    'kbMeanHrBpm': _kbMeanHrBpm,
    'kbMeanRRMs': _kbMeanRRMs,
    'kbPnsIndex': _kbPnsIndex,
    'kbReadiness': _kbReadiness,
    'kbRmssdMs': _kbRmssdMs,
    'kbSd1Ms': _kbSd1Ms,
    'kbSd2Ms': _kbSd2Ms,
    'kbSdnnMs': _kbSdnnMs,
    'kbSnsIndex': _kbSnsIndex,
    'kbStressIndex': _kbStressIndex,
    'score': _score,
    'timezone': _timezone,
    'profileID': _profileID,
    'organisationID': _organisationID,
    'selfCare': _selfCare,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'assessmentSelfCareId': _assessmentSelfCareId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final STARTDATE = amplify_core.QueryField(fieldName: "startDate");
  static final ENDDATE = amplify_core.QueryField(fieldName: "endDate");
  static final MOOD = amplify_core.QueryField(fieldName: "mood");
  static final STRESSLEVEL = amplify_core.QueryField(fieldName: "stressLevel");
  static final OXYGENLEVEL = amplify_core.QueryField(fieldName: "oxygenLevel");
  static final OXYGENSATURATIONLEVEL = amplify_core.QueryField(fieldName: "oxygenSaturationLevel");
  static final RESPIRATORYRATE = amplify_core.QueryField(fieldName: "respiratoryRate");
  static final STRESSINDEX = amplify_core.QueryField(fieldName: "stressIndex");
  static final BODYTEMPERATURE = amplify_core.QueryField(fieldName: "bodyTemperature");
  static final SYSTOLICBLOODPRESSURE = amplify_core.QueryField(fieldName: "systolicBloodPressure");
  static final DIASTOLICBLOODPRESSURE = amplify_core.QueryField(fieldName: "diastolicBloodPressure");
  static final HEARTRATE = amplify_core.QueryField(fieldName: "heartRate");
  static final HEARTRATEMANUAL = amplify_core.QueryField(fieldName: "heartRateManual");
  static final HEARTRATEMANUALSOURCE = amplify_core.QueryField(fieldName: "heartRateManualSource");
  static final HEARTRATEVARIABILITY = amplify_core.QueryField(fieldName: "heartRateVariability");
  static final SYMPATHETICNERVOUSSYSTEMINDEX = amplify_core.QueryField(fieldName: "sympatheticNervousSystemIndex");
  static final KBTYPE = amplify_core.QueryField(fieldName: "kbType");
  static final KBARTEFACT = amplify_core.QueryField(fieldName: "kbArtefact");
  static final KBARTEFACTLEVEL = amplify_core.QueryField(fieldName: "kbArtefactLevel");
  static final KBCREATETIMESTAMP = amplify_core.QueryField(fieldName: "kbCreateTimestamp");
  static final KBMEANHRBPM = amplify_core.QueryField(fieldName: "kbMeanHrBpm");
  static final KBMEANRRMS = amplify_core.QueryField(fieldName: "kbMeanRRMs");
  static final KBPNSINDEX = amplify_core.QueryField(fieldName: "kbPnsIndex");
  static final KBREADINESS = amplify_core.QueryField(fieldName: "kbReadiness");
  static final KBRMSSDMS = amplify_core.QueryField(fieldName: "kbRmssdMs");
  static final KBSD1MS = amplify_core.QueryField(fieldName: "kbSd1Ms");
  static final KBSD2MS = amplify_core.QueryField(fieldName: "kbSd2Ms");
  static final KBSDNNMS = amplify_core.QueryField(fieldName: "kbSdnnMs");
  static final KBSNSINDEX = amplify_core.QueryField(fieldName: "kbSnsIndex");
  static final KBSTRESSINDEX = amplify_core.QueryField(fieldName: "kbStressIndex");
  static final SCORE = amplify_core.QueryField(fieldName: "score");
  static final TIMEZONE = amplify_core.QueryField(fieldName: "timezone");
  static final PROFILEID = amplify_core.QueryField(fieldName: "profileID");
  static final ORGANISATIONID = amplify_core.QueryField(fieldName: "organisationID");
  static final SELFCARE = amplify_core.QueryField(
    fieldName: "selfCare",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'SelfCare'));
  static final ASSESSMENTSELFCAREID = amplify_core.QueryField(fieldName: "assessmentSelfCareId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Assessment";
    modelSchemaDefinition.pluralName = "Assessments";
    
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
      amplify_core.ModelIndex(fields: const ["profileID"], name: "byProfile")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.STARTDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.ENDDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.MOOD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.STRESSLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.OXYGENLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.OXYGENSATURATIONLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.RESPIRATORYRATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.STRESSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.BODYTEMPERATURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.SYSTOLICBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.DIASTOLICBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.HEARTRATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.HEARTRATEMANUAL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.HEARTRATEMANUALSOURCE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.HEARTRATEVARIABILITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.SYMPATHETICNERVOUSSYSTEMINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBARTEFACT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBARTEFACTLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBCREATETIMESTAMP,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBMEANHRBPM,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBMEANRRMS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBPNSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBREADINESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBRMSSDMS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBSD1MS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBSD2MS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBSDNNMS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBSNSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.KBSTRESSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.SCORE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.TIMEZONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.PROFILEID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.ORGANISATIONID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Assessment.SELFCARE,
      isRequired: false,
      ofModelName: 'SelfCare',
      associatedKey: SelfCare.ID
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Assessment.ASSESSMENTSELFCAREID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _AssessmentModelType extends amplify_core.ModelType<Assessment> {
  const _AssessmentModelType();
  
  @override
  Assessment fromJson(Map<String, dynamic> jsonData) {
    return Assessment.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Assessment';
  }
}
