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

/** This is an auto generated class representing the AggregateHourAssessment type in your schema. */
class AggregateHourAssessment extends amplify_core.Model {
  static const classType = const _AggregateHourAssessmentModelType();
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
  final int? _numberOfAssessments;
  final String? _profileID;
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
  
  int? get numberOfAssessments {
    return _numberOfAssessments;
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const AggregateHourAssessment._internal({required this.id, startDate, endDate, latestMood, latestStressLevel, averageOxygenLevel, averageOxygenSaturationLevel, averageRespiratoryRate, averageStressIndex, averageBodyTemperature, averageSystolicBloodPressure, averageDiastolicBloodPressure, averageHeartRate, averageHeartRateVariability, averageSympatheticNervousSystemIndex, averageScore, numberOfAssessments, required profileID, createdAt, updatedAt}): _startDate = startDate, _endDate = endDate, _latestMood = latestMood, _latestStressLevel = latestStressLevel, _averageOxygenLevel = averageOxygenLevel, _averageOxygenSaturationLevel = averageOxygenSaturationLevel, _averageRespiratoryRate = averageRespiratoryRate, _averageStressIndex = averageStressIndex, _averageBodyTemperature = averageBodyTemperature, _averageSystolicBloodPressure = averageSystolicBloodPressure, _averageDiastolicBloodPressure = averageDiastolicBloodPressure, _averageHeartRate = averageHeartRate, _averageHeartRateVariability = averageHeartRateVariability, _averageSympatheticNervousSystemIndex = averageSympatheticNervousSystemIndex, _averageScore = averageScore, _numberOfAssessments = numberOfAssessments, _profileID = profileID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory AggregateHourAssessment({String? id, amplify_core.TemporalDateTime? startDate, amplify_core.TemporalDateTime? endDate, String? latestMood, String? latestStressLevel, double? averageOxygenLevel, double? averageOxygenSaturationLevel, double? averageRespiratoryRate, double? averageStressIndex, double? averageBodyTemperature, double? averageSystolicBloodPressure, double? averageDiastolicBloodPressure, double? averageHeartRate, double? averageHeartRateVariability, double? averageSympatheticNervousSystemIndex, double? averageScore, int? numberOfAssessments, required String profileID}) {
    return AggregateHourAssessment._internal(
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
      numberOfAssessments: numberOfAssessments,
      profileID: profileID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AggregateHourAssessment &&
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
      _numberOfAssessments == other._numberOfAssessments &&
      _profileID == other._profileID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("AggregateHourAssessment {");
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
    buffer.write("numberOfAssessments=" + (_numberOfAssessments != null ? _numberOfAssessments!.toString() : "null") + ", ");
    buffer.write("profileID=" + "$_profileID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  AggregateHourAssessment copyWith({String? id, amplify_core.TemporalDateTime? startDate, amplify_core.TemporalDateTime? endDate, String? latestMood, String? latestStressLevel, double? averageOxygenLevel, double? averageOxygenSaturationLevel, double? averageRespiratoryRate, double? averageStressIndex, double? averageBodyTemperature, double? averageSystolicBloodPressure, double? averageDiastolicBloodPressure, double? averageHeartRate, double? averageHeartRateVariability, double? averageSympatheticNervousSystemIndex, double? averageScore, int? numberOfAssessments, String? profileID}) {
    return AggregateHourAssessment._internal(
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
      numberOfAssessments: numberOfAssessments ?? this.numberOfAssessments,
      profileID: profileID ?? this.profileID);
  }
  
  AggregateHourAssessment copyWithModelFieldValues({
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
    ModelFieldValue<int?>? numberOfAssessments,
    ModelFieldValue<String>? profileID
  }) {
    return AggregateHourAssessment._internal(
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
      numberOfAssessments: numberOfAssessments == null ? this.numberOfAssessments : numberOfAssessments.value,
      profileID: profileID == null ? this.profileID : profileID.value
    );
  }
  
  AggregateHourAssessment.fromJson(Map<String, dynamic> json)  
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
      _numberOfAssessments = (json['numberOfAssessments'] as num?)?.toInt(),
      _profileID = json['profileID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'startDate': _startDate?.format(), 'endDate': _endDate?.format(), 'latestMood': _latestMood, 'latestStressLevel': _latestStressLevel, 'averageOxygenLevel': _averageOxygenLevel, 'averageOxygenSaturationLevel': _averageOxygenSaturationLevel, 'averageRespiratoryRate': _averageRespiratoryRate, 'averageStressIndex': _averageStressIndex, 'averageBodyTemperature': _averageBodyTemperature, 'averageSystolicBloodPressure': _averageSystolicBloodPressure, 'averageDiastolicBloodPressure': _averageDiastolicBloodPressure, 'averageHeartRate': _averageHeartRate, 'averageHeartRateVariability': _averageHeartRateVariability, 'averageSympatheticNervousSystemIndex': _averageSympatheticNervousSystemIndex, 'averageScore': _averageScore, 'numberOfAssessments': _numberOfAssessments, 'profileID': _profileID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
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
    'numberOfAssessments': _numberOfAssessments,
    'profileID': _profileID,
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
  static final NUMBEROFASSESSMENTS = amplify_core.QueryField(fieldName: "numberOfAssessments");
  static final PROFILEID = amplify_core.QueryField(fieldName: "profileID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AggregateHourAssessment";
    modelSchemaDefinition.pluralName = "AggregateHourAssessments";
    
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
      amplify_core.ModelIndex(fields: const ["profileID", "endDate"], name: "byProfile")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.STARTDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.ENDDATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.LATESTMOOD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.LATESTSTRESSLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGEOXYGENLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGEOXYGENSATURATIONLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGERESPIRATORYRATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGESTRESSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGEBODYTEMPERATURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGESYSTOLICBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGEDIASTOLICBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGEHEARTRATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGEHEARTRATEVARIABILITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGESYMPATHETICNERVOUSSYSTEMINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.AVERAGESCORE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.NUMBEROFASSESSMENTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: AggregateHourAssessment.PROFILEID,
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

class _AggregateHourAssessmentModelType extends amplify_core.ModelType<AggregateHourAssessment> {
  const _AggregateHourAssessmentModelType();
  
  @override
  AggregateHourAssessment fromJson(Map<String, dynamic> jsonData) {
    return AggregateHourAssessment.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'AggregateHourAssessment';
  }
}
