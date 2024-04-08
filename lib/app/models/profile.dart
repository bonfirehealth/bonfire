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
import 'package:collection/collection.dart';

// Project imports:
import 'model_provider.dart';

/** This is an auto generated class representing the Profile type in your schema. */
class Profile extends amplify_core.Model {
  static const classType = const _ProfileModelType();
  final String id;
  final int? _age;
  final String? _gender;
  final double? _weight;
  final String? _weightUnit;
  final String? _weightUnitName;
  final double? _height;
  final String? _heightUnit;
  final String? _heightUnitName;
  final double? _bodyMassIndex;
  final String? _mood;
  final String? _stressLevel;
  final double? _oxygenLevel;
  final double? _oxygenSaturationLevel;
  final double? _respiratoryRate;
  final double? _bodyTemperature;
  final double? _stressIndex;
  final double? _systolicBloodPressure;
  final double? _diastolicBloodPressure;
  final double? _heartRate;
  final double? _heartRateVariability;
  final double? _sympatheticNervousSystemIndex;
  final String? _timezone;
  final User? _user;
  final List<ProfileActivity>? _activities;
  final List<Assessment>? _assessments;
  final List<AggregateHourAssessment>? _aggregateHourAssessments;
  final List<AggregateDayAssessment>? _aggregateDayAssessments;
  final List<AggregateMonthAssessment>? _aggregateMonthAssessments;
  final List<AggregateYearAssessment>? _aggregateYearAssessments;
  final List<Notification>? _notifications;
  final List<ProfilePreference>? _preferences;
  final List<SelfCareUsage>? _selfCareUsages;
  final List<ProfileSuggestion>? _suggestions;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int? get age {
    return _age;
  }
  
  String? get gender {
    return _gender;
  }
  
  double? get weight {
    return _weight;
  }
  
  String? get weightUnit {
    return _weightUnit;
  }
  
  String? get weightUnitName {
    return _weightUnitName;
  }
  
  double? get height {
    return _height;
  }
  
  String? get heightUnit {
    return _heightUnit;
  }
  
  String? get heightUnitName {
    return _heightUnitName;
  }
  
  double? get bodyMassIndex {
    return _bodyMassIndex;
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
  
  double? get bodyTemperature {
    return _bodyTemperature;
  }
  
  double? get stressIndex {
    return _stressIndex;
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
  
  double? get heartRateVariability {
    return _heartRateVariability;
  }
  
  double? get sympatheticNervousSystemIndex {
    return _sympatheticNervousSystemIndex;
  }
  
  String? get timezone {
    return _timezone;
  }
  
  User? get user {
    return _user;
  }
  
  List<ProfileActivity>? get activities {
    return _activities;
  }
  
  List<Assessment>? get assessments {
    return _assessments;
  }
  
  List<AggregateHourAssessment>? get aggregateHourAssessments {
    return _aggregateHourAssessments;
  }
  
  List<AggregateDayAssessment>? get aggregateDayAssessments {
    return _aggregateDayAssessments;
  }
  
  List<AggregateMonthAssessment>? get aggregateMonthAssessments {
    return _aggregateMonthAssessments;
  }
  
  List<AggregateYearAssessment>? get aggregateYearAssessments {
    return _aggregateYearAssessments;
  }
  
  List<Notification>? get notifications {
    return _notifications;
  }
  
  List<ProfilePreference>? get preferences {
    return _preferences;
  }
  
  List<SelfCareUsage>? get selfCareUsages {
    return _selfCareUsages;
  }
  
  List<ProfileSuggestion>? get suggestions {
    return _suggestions;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Profile._internal({required this.id, age, gender, weight, weightUnit, weightUnitName, height, heightUnit, heightUnitName, bodyMassIndex, mood, stressLevel, oxygenLevel, oxygenSaturationLevel, respiratoryRate, bodyTemperature, stressIndex, systolicBloodPressure, diastolicBloodPressure, heartRate, heartRateVariability, sympatheticNervousSystemIndex, timezone, user, activities, assessments, aggregateHourAssessments, aggregateDayAssessments, aggregateMonthAssessments, aggregateYearAssessments, notifications, preferences, selfCareUsages, suggestions, createdAt, updatedAt}): _age = age, _gender = gender, _weight = weight, _weightUnit = weightUnit, _weightUnitName = weightUnitName, _height = height, _heightUnit = heightUnit, _heightUnitName = heightUnitName, _bodyMassIndex = bodyMassIndex, _mood = mood, _stressLevel = stressLevel, _oxygenLevel = oxygenLevel, _oxygenSaturationLevel = oxygenSaturationLevel, _respiratoryRate = respiratoryRate, _bodyTemperature = bodyTemperature, _stressIndex = stressIndex, _systolicBloodPressure = systolicBloodPressure, _diastolicBloodPressure = diastolicBloodPressure, _heartRate = heartRate, _heartRateVariability = heartRateVariability, _sympatheticNervousSystemIndex = sympatheticNervousSystemIndex, _timezone = timezone, _user = user, _activities = activities, _assessments = assessments, _aggregateHourAssessments = aggregateHourAssessments, _aggregateDayAssessments = aggregateDayAssessments, _aggregateMonthAssessments = aggregateMonthAssessments, _aggregateYearAssessments = aggregateYearAssessments, _notifications = notifications, _preferences = preferences, _selfCareUsages = selfCareUsages, _suggestions = suggestions, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Profile({String? id, int? age, String? gender, double? weight, String? weightUnit, String? weightUnitName, double? height, String? heightUnit, String? heightUnitName, double? bodyMassIndex, String? mood, String? stressLevel, double? oxygenLevel, double? oxygenSaturationLevel, double? respiratoryRate, double? bodyTemperature, double? stressIndex, double? systolicBloodPressure, double? diastolicBloodPressure, double? heartRate, double? heartRateVariability, double? sympatheticNervousSystemIndex, String? timezone, User? user, List<ProfileActivity>? activities, List<Assessment>? assessments, List<AggregateHourAssessment>? aggregateHourAssessments, List<AggregateDayAssessment>? aggregateDayAssessments, List<AggregateMonthAssessment>? aggregateMonthAssessments, List<AggregateYearAssessment>? aggregateYearAssessments, List<Notification>? notifications, List<ProfilePreference>? preferences, List<SelfCareUsage>? selfCareUsages, List<ProfileSuggestion>? suggestions}) {
    return Profile._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      age: age,
      gender: gender,
      weight: weight,
      weightUnit: weightUnit,
      weightUnitName: weightUnitName,
      height: height,
      heightUnit: heightUnit,
      heightUnitName: heightUnitName,
      bodyMassIndex: bodyMassIndex,
      mood: mood,
      stressLevel: stressLevel,
      oxygenLevel: oxygenLevel,
      oxygenSaturationLevel: oxygenSaturationLevel,
      respiratoryRate: respiratoryRate,
      bodyTemperature: bodyTemperature,
      stressIndex: stressIndex,
      systolicBloodPressure: systolicBloodPressure,
      diastolicBloodPressure: diastolicBloodPressure,
      heartRate: heartRate,
      heartRateVariability: heartRateVariability,
      sympatheticNervousSystemIndex: sympatheticNervousSystemIndex,
      timezone: timezone,
      user: user,
      activities: activities != null ? List<ProfileActivity>.unmodifiable(activities) : activities,
      assessments: assessments != null ? List<Assessment>.unmodifiable(assessments) : assessments,
      aggregateHourAssessments: aggregateHourAssessments != null ? List<AggregateHourAssessment>.unmodifiable(aggregateHourAssessments) : aggregateHourAssessments,
      aggregateDayAssessments: aggregateDayAssessments != null ? List<AggregateDayAssessment>.unmodifiable(aggregateDayAssessments) : aggregateDayAssessments,
      aggregateMonthAssessments: aggregateMonthAssessments != null ? List<AggregateMonthAssessment>.unmodifiable(aggregateMonthAssessments) : aggregateMonthAssessments,
      aggregateYearAssessments: aggregateYearAssessments != null ? List<AggregateYearAssessment>.unmodifiable(aggregateYearAssessments) : aggregateYearAssessments,
      notifications: notifications != null ? List<Notification>.unmodifiable(notifications) : notifications,
      preferences: preferences != null ? List<ProfilePreference>.unmodifiable(preferences) : preferences,
      selfCareUsages: selfCareUsages != null ? List<SelfCareUsage>.unmodifiable(selfCareUsages) : selfCareUsages,
      suggestions: suggestions != null ? List<ProfileSuggestion>.unmodifiable(suggestions) : suggestions);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
      id == other.id &&
      _age == other._age &&
      _gender == other._gender &&
      _weight == other._weight &&
      _weightUnit == other._weightUnit &&
      _weightUnitName == other._weightUnitName &&
      _height == other._height &&
      _heightUnit == other._heightUnit &&
      _heightUnitName == other._heightUnitName &&
      _bodyMassIndex == other._bodyMassIndex &&
      _mood == other._mood &&
      _stressLevel == other._stressLevel &&
      _oxygenLevel == other._oxygenLevel &&
      _oxygenSaturationLevel == other._oxygenSaturationLevel &&
      _respiratoryRate == other._respiratoryRate &&
      _bodyTemperature == other._bodyTemperature &&
      _stressIndex == other._stressIndex &&
      _systolicBloodPressure == other._systolicBloodPressure &&
      _diastolicBloodPressure == other._diastolicBloodPressure &&
      _heartRate == other._heartRate &&
      _heartRateVariability == other._heartRateVariability &&
      _sympatheticNervousSystemIndex == other._sympatheticNervousSystemIndex &&
      _timezone == other._timezone &&
      _user == other._user &&
      DeepCollectionEquality().equals(_activities, other._activities) &&
      DeepCollectionEquality().equals(_assessments, other._assessments) &&
      DeepCollectionEquality().equals(_aggregateHourAssessments, other._aggregateHourAssessments) &&
      DeepCollectionEquality().equals(_aggregateDayAssessments, other._aggregateDayAssessments) &&
      DeepCollectionEquality().equals(_aggregateMonthAssessments, other._aggregateMonthAssessments) &&
      DeepCollectionEquality().equals(_aggregateYearAssessments, other._aggregateYearAssessments) &&
      DeepCollectionEquality().equals(_notifications, other._notifications) &&
      DeepCollectionEquality().equals(_preferences, other._preferences) &&
      DeepCollectionEquality().equals(_selfCareUsages, other._selfCareUsages) &&
      DeepCollectionEquality().equals(_suggestions, other._suggestions);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Profile {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("age=" + (_age != null ? _age!.toString() : "null") + ", ");
    buffer.write("gender=" + "$_gender" + ", ");
    buffer.write("weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("weightUnit=" + "$_weightUnit" + ", ");
    buffer.write("weightUnitName=" + "$_weightUnitName" + ", ");
    buffer.write("height=" + (_height != null ? _height!.toString() : "null") + ", ");
    buffer.write("heightUnit=" + "$_heightUnit" + ", ");
    buffer.write("heightUnitName=" + "$_heightUnitName" + ", ");
    buffer.write("bodyMassIndex=" + (_bodyMassIndex != null ? _bodyMassIndex!.toString() : "null") + ", ");
    buffer.write("mood=" + "$_mood" + ", ");
    buffer.write("stressLevel=" + "$_stressLevel" + ", ");
    buffer.write("oxygenLevel=" + (_oxygenLevel != null ? _oxygenLevel!.toString() : "null") + ", ");
    buffer.write("oxygenSaturationLevel=" + (_oxygenSaturationLevel != null ? _oxygenSaturationLevel!.toString() : "null") + ", ");
    buffer.write("respiratoryRate=" + (_respiratoryRate != null ? _respiratoryRate!.toString() : "null") + ", ");
    buffer.write("bodyTemperature=" + (_bodyTemperature != null ? _bodyTemperature!.toString() : "null") + ", ");
    buffer.write("stressIndex=" + (_stressIndex != null ? _stressIndex!.toString() : "null") + ", ");
    buffer.write("systolicBloodPressure=" + (_systolicBloodPressure != null ? _systolicBloodPressure!.toString() : "null") + ", ");
    buffer.write("diastolicBloodPressure=" + (_diastolicBloodPressure != null ? _diastolicBloodPressure!.toString() : "null") + ", ");
    buffer.write("heartRate=" + (_heartRate != null ? _heartRate!.toString() : "null") + ", ");
    buffer.write("heartRateVariability=" + (_heartRateVariability != null ? _heartRateVariability!.toString() : "null") + ", ");
    buffer.write("sympatheticNervousSystemIndex=" + (_sympatheticNervousSystemIndex != null ? _sympatheticNervousSystemIndex!.toString() : "null") + ", ");
    buffer.write("timezone=" + "$_timezone" + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Profile copyWith({String? id, int? age, String? gender, double? weight, String? weightUnit, String? weightUnitName, double? height, String? heightUnit, String? heightUnitName, double? bodyMassIndex, String? mood, String? stressLevel, double? oxygenLevel, double? oxygenSaturationLevel, double? respiratoryRate, double? bodyTemperature, double? stressIndex, double? systolicBloodPressure, double? diastolicBloodPressure, double? heartRate, double? heartRateVariability, double? sympatheticNervousSystemIndex, String? timezone, User? user, List<ProfileActivity>? activities, List<Assessment>? assessments, List<AggregateHourAssessment>? aggregateHourAssessments, List<AggregateDayAssessment>? aggregateDayAssessments, List<AggregateMonthAssessment>? aggregateMonthAssessments, List<AggregateYearAssessment>? aggregateYearAssessments, List<Notification>? notifications, List<ProfilePreference>? preferences, List<SelfCareUsage>? selfCareUsages, List<ProfileSuggestion>? suggestions}) {
    return Profile._internal(
      id: id ?? this.id,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      weightUnit: weightUnit ?? this.weightUnit,
      weightUnitName: weightUnitName ?? this.weightUnitName,
      height: height ?? this.height,
      heightUnit: heightUnit ?? this.heightUnit,
      heightUnitName: heightUnitName ?? this.heightUnitName,
      bodyMassIndex: bodyMassIndex ?? this.bodyMassIndex,
      mood: mood ?? this.mood,
      stressLevel: stressLevel ?? this.stressLevel,
      oxygenLevel: oxygenLevel ?? this.oxygenLevel,
      oxygenSaturationLevel: oxygenSaturationLevel ?? this.oxygenSaturationLevel,
      respiratoryRate: respiratoryRate ?? this.respiratoryRate,
      bodyTemperature: bodyTemperature ?? this.bodyTemperature,
      stressIndex: stressIndex ?? this.stressIndex,
      systolicBloodPressure: systolicBloodPressure ?? this.systolicBloodPressure,
      diastolicBloodPressure: diastolicBloodPressure ?? this.diastolicBloodPressure,
      heartRate: heartRate ?? this.heartRate,
      heartRateVariability: heartRateVariability ?? this.heartRateVariability,
      sympatheticNervousSystemIndex: sympatheticNervousSystemIndex ?? this.sympatheticNervousSystemIndex,
      timezone: timezone ?? this.timezone,
      user: user ?? this.user,
      activities: activities ?? this.activities,
      assessments: assessments ?? this.assessments,
      aggregateHourAssessments: aggregateHourAssessments ?? this.aggregateHourAssessments,
      aggregateDayAssessments: aggregateDayAssessments ?? this.aggregateDayAssessments,
      aggregateMonthAssessments: aggregateMonthAssessments ?? this.aggregateMonthAssessments,
      aggregateYearAssessments: aggregateYearAssessments ?? this.aggregateYearAssessments,
      notifications: notifications ?? this.notifications,
      preferences: preferences ?? this.preferences,
      selfCareUsages: selfCareUsages ?? this.selfCareUsages,
      suggestions: suggestions ?? this.suggestions);
  }
  
  Profile copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<int?>? age,
    ModelFieldValue<String?>? gender,
    ModelFieldValue<double?>? weight,
    ModelFieldValue<String?>? weightUnit,
    ModelFieldValue<String?>? weightUnitName,
    ModelFieldValue<double?>? height,
    ModelFieldValue<String?>? heightUnit,
    ModelFieldValue<String?>? heightUnitName,
    ModelFieldValue<double?>? bodyMassIndex,
    ModelFieldValue<String?>? mood,
    ModelFieldValue<String?>? stressLevel,
    ModelFieldValue<double?>? oxygenLevel,
    ModelFieldValue<double?>? oxygenSaturationLevel,
    ModelFieldValue<double?>? respiratoryRate,
    ModelFieldValue<double?>? bodyTemperature,
    ModelFieldValue<double?>? stressIndex,
    ModelFieldValue<double?>? systolicBloodPressure,
    ModelFieldValue<double?>? diastolicBloodPressure,
    ModelFieldValue<double?>? heartRate,
    ModelFieldValue<double?>? heartRateVariability,
    ModelFieldValue<double?>? sympatheticNervousSystemIndex,
    ModelFieldValue<String?>? timezone,
    ModelFieldValue<User?>? user,
    ModelFieldValue<List<ProfileActivity>?>? activities,
    ModelFieldValue<List<Assessment>?>? assessments,
    ModelFieldValue<List<AggregateHourAssessment>?>? aggregateHourAssessments,
    ModelFieldValue<List<AggregateDayAssessment>?>? aggregateDayAssessments,
    ModelFieldValue<List<AggregateMonthAssessment>?>? aggregateMonthAssessments,
    ModelFieldValue<List<AggregateYearAssessment>?>? aggregateYearAssessments,
    ModelFieldValue<List<Notification>?>? notifications,
    ModelFieldValue<List<ProfilePreference>?>? preferences,
    ModelFieldValue<List<SelfCareUsage>?>? selfCareUsages,
    ModelFieldValue<List<ProfileSuggestion>?>? suggestions
  }) {
    return Profile._internal(
      id: id == null ? this.id : id.value,
      age: age == null ? this.age : age.value,
      gender: gender == null ? this.gender : gender.value,
      weight: weight == null ? this.weight : weight.value,
      weightUnit: weightUnit == null ? this.weightUnit : weightUnit.value,
      weightUnitName: weightUnitName == null ? this.weightUnitName : weightUnitName.value,
      height: height == null ? this.height : height.value,
      heightUnit: heightUnit == null ? this.heightUnit : heightUnit.value,
      heightUnitName: heightUnitName == null ? this.heightUnitName : heightUnitName.value,
      bodyMassIndex: bodyMassIndex == null ? this.bodyMassIndex : bodyMassIndex.value,
      mood: mood == null ? this.mood : mood.value,
      stressLevel: stressLevel == null ? this.stressLevel : stressLevel.value,
      oxygenLevel: oxygenLevel == null ? this.oxygenLevel : oxygenLevel.value,
      oxygenSaturationLevel: oxygenSaturationLevel == null ? this.oxygenSaturationLevel : oxygenSaturationLevel.value,
      respiratoryRate: respiratoryRate == null ? this.respiratoryRate : respiratoryRate.value,
      bodyTemperature: bodyTemperature == null ? this.bodyTemperature : bodyTemperature.value,
      stressIndex: stressIndex == null ? this.stressIndex : stressIndex.value,
      systolicBloodPressure: systolicBloodPressure == null ? this.systolicBloodPressure : systolicBloodPressure.value,
      diastolicBloodPressure: diastolicBloodPressure == null ? this.diastolicBloodPressure : diastolicBloodPressure.value,
      heartRate: heartRate == null ? this.heartRate : heartRate.value,
      heartRateVariability: heartRateVariability == null ? this.heartRateVariability : heartRateVariability.value,
      sympatheticNervousSystemIndex: sympatheticNervousSystemIndex == null ? this.sympatheticNervousSystemIndex : sympatheticNervousSystemIndex.value,
      timezone: timezone == null ? this.timezone : timezone.value,
      user: user == null ? this.user : user.value,
      activities: activities == null ? this.activities : activities.value,
      assessments: assessments == null ? this.assessments : assessments.value,
      aggregateHourAssessments: aggregateHourAssessments == null ? this.aggregateHourAssessments : aggregateHourAssessments.value,
      aggregateDayAssessments: aggregateDayAssessments == null ? this.aggregateDayAssessments : aggregateDayAssessments.value,
      aggregateMonthAssessments: aggregateMonthAssessments == null ? this.aggregateMonthAssessments : aggregateMonthAssessments.value,
      aggregateYearAssessments: aggregateYearAssessments == null ? this.aggregateYearAssessments : aggregateYearAssessments.value,
      notifications: notifications == null ? this.notifications : notifications.value,
      preferences: preferences == null ? this.preferences : preferences.value,
      selfCareUsages: selfCareUsages == null ? this.selfCareUsages : selfCareUsages.value,
      suggestions: suggestions == null ? this.suggestions : suggestions.value
    );
  }
  
  Profile.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _age = (json['age'] as num?)?.toInt(),
      _gender = json['gender'],
      _weight = (json['weight'] as num?)?.toDouble(),
      _weightUnit = json['weightUnit'],
      _weightUnitName = json['weightUnitName'],
      _height = (json['height'] as num?)?.toDouble(),
      _heightUnit = json['heightUnit'],
      _heightUnitName = json['heightUnitName'],
      _bodyMassIndex = (json['bodyMassIndex'] as num?)?.toDouble(),
      _mood = json['mood'],
      _stressLevel = json['stressLevel'],
      _oxygenLevel = (json['oxygenLevel'] as num?)?.toDouble(),
      _oxygenSaturationLevel = (json['oxygenSaturationLevel'] as num?)?.toDouble(),
      _respiratoryRate = (json['respiratoryRate'] as num?)?.toDouble(),
      _bodyTemperature = (json['bodyTemperature'] as num?)?.toDouble(),
      _stressIndex = (json['stressIndex'] as num?)?.toDouble(),
      _systolicBloodPressure = (json['systolicBloodPressure'] as num?)?.toDouble(),
      _diastolicBloodPressure = (json['diastolicBloodPressure'] as num?)?.toDouble(),
      _heartRate = (json['heartRate'] as num?)?.toDouble(),
      _heartRateVariability = (json['heartRateVariability'] as num?)?.toDouble(),
      _sympatheticNervousSystemIndex = (json['sympatheticNervousSystemIndex'] as num?)?.toDouble(),
      _timezone = json['timezone'],
      _user = json['user'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']))
        : null,
      _activities = json['activities']?['items'] is List
        ? (json['activities']?['items'] as List)
          .where((e) => e != null)
          .map((e) => ProfileActivity.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _assessments = json['assessments']?['items'] is List
        ? (json['assessments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Assessment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _aggregateHourAssessments = json['aggregateHourAssessments']?['items'] is List
        ? (json['aggregateHourAssessments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AggregateHourAssessment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _aggregateDayAssessments = json['aggregateDayAssessments']?['items'] is List
        ? (json['aggregateDayAssessments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AggregateDayAssessment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _aggregateMonthAssessments = json['aggregateMonthAssessments']?['items'] is List
        ? (json['aggregateMonthAssessments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AggregateMonthAssessment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _aggregateYearAssessments = json['aggregateYearAssessments']?['items'] is List
        ? (json['aggregateYearAssessments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AggregateYearAssessment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _notifications = json['notifications']?['items'] is List
        ? (json['notifications']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Notification.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _preferences = json['preferences']?['items'] is List
        ? (json['preferences']?['items'] as List)
          .where((e) => e != null)
          .map((e) => ProfilePreference.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _selfCareUsages = json['selfCareUsages']?['items'] is List
        ? (json['selfCareUsages']?['items'] as List)
          .where((e) => e != null)
          .map((e) => SelfCareUsage.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _suggestions = json['suggestions']?['items'] is List
        ? (json['suggestions']?['items'] as List)
          .where((e) => e != null)
          .map((e) => ProfileSuggestion.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'age': _age, 'gender': _gender, 'weight': _weight, 'weightUnit': _weightUnit, 'weightUnitName': _weightUnitName, 'height': _height, 'heightUnit': _heightUnit, 'heightUnitName': _heightUnitName, 'bodyMassIndex': _bodyMassIndex, 'mood': _mood, 'stressLevel': _stressLevel, 'oxygenLevel': _oxygenLevel, 'oxygenSaturationLevel': _oxygenSaturationLevel, 'respiratoryRate': _respiratoryRate, 'bodyTemperature': _bodyTemperature, 'stressIndex': _stressIndex, 'systolicBloodPressure': _systolicBloodPressure, 'diastolicBloodPressure': _diastolicBloodPressure, 'heartRate': _heartRate, 'heartRateVariability': _heartRateVariability, 'sympatheticNervousSystemIndex': _sympatheticNervousSystemIndex, 'timezone': _timezone, 'user': _user?.toJson(), 'activities': _activities?.map((ProfileActivity? e) => e?.toJson()).toList(), 'assessments': _assessments?.map((Assessment? e) => e?.toJson()).toList(), 'aggregateHourAssessments': _aggregateHourAssessments?.map((AggregateHourAssessment? e) => e?.toJson()).toList(), 'aggregateDayAssessments': _aggregateDayAssessments?.map((AggregateDayAssessment? e) => e?.toJson()).toList(), 'aggregateMonthAssessments': _aggregateMonthAssessments?.map((AggregateMonthAssessment? e) => e?.toJson()).toList(), 'aggregateYearAssessments': _aggregateYearAssessments?.map((AggregateYearAssessment? e) => e?.toJson()).toList(), 'notifications': _notifications?.map((Notification? e) => e?.toJson()).toList(), 'preferences': _preferences?.map((ProfilePreference? e) => e?.toJson()).toList(), 'selfCareUsages': _selfCareUsages?.map((SelfCareUsage? e) => e?.toJson()).toList(), 'suggestions': _suggestions?.map((ProfileSuggestion? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'age': _age,
    'gender': _gender,
    'weight': _weight,
    'weightUnit': _weightUnit,
    'weightUnitName': _weightUnitName,
    'height': _height,
    'heightUnit': _heightUnit,
    'heightUnitName': _heightUnitName,
    'bodyMassIndex': _bodyMassIndex,
    'mood': _mood,
    'stressLevel': _stressLevel,
    'oxygenLevel': _oxygenLevel,
    'oxygenSaturationLevel': _oxygenSaturationLevel,
    'respiratoryRate': _respiratoryRate,
    'bodyTemperature': _bodyTemperature,
    'stressIndex': _stressIndex,
    'systolicBloodPressure': _systolicBloodPressure,
    'diastolicBloodPressure': _diastolicBloodPressure,
    'heartRate': _heartRate,
    'heartRateVariability': _heartRateVariability,
    'sympatheticNervousSystemIndex': _sympatheticNervousSystemIndex,
    'timezone': _timezone,
    'user': _user,
    'activities': _activities,
    'assessments': _assessments,
    'aggregateHourAssessments': _aggregateHourAssessments,
    'aggregateDayAssessments': _aggregateDayAssessments,
    'aggregateMonthAssessments': _aggregateMonthAssessments,
    'aggregateYearAssessments': _aggregateYearAssessments,
    'notifications': _notifications,
    'preferences': _preferences,
    'selfCareUsages': _selfCareUsages,
    'suggestions': _suggestions,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final AGE = amplify_core.QueryField(fieldName: "age");
  static final GENDER = amplify_core.QueryField(fieldName: "gender");
  static final WEIGHT = amplify_core.QueryField(fieldName: "weight");
  static final WEIGHTUNIT = amplify_core.QueryField(fieldName: "weightUnit");
  static final WEIGHTUNITNAME = amplify_core.QueryField(fieldName: "weightUnitName");
  static final HEIGHT = amplify_core.QueryField(fieldName: "height");
  static final HEIGHTUNIT = amplify_core.QueryField(fieldName: "heightUnit");
  static final HEIGHTUNITNAME = amplify_core.QueryField(fieldName: "heightUnitName");
  static final BODYMASSINDEX = amplify_core.QueryField(fieldName: "bodyMassIndex");
  static final MOOD = amplify_core.QueryField(fieldName: "mood");
  static final STRESSLEVEL = amplify_core.QueryField(fieldName: "stressLevel");
  static final OXYGENLEVEL = amplify_core.QueryField(fieldName: "oxygenLevel");
  static final OXYGENSATURATIONLEVEL = amplify_core.QueryField(fieldName: "oxygenSaturationLevel");
  static final RESPIRATORYRATE = amplify_core.QueryField(fieldName: "respiratoryRate");
  static final BODYTEMPERATURE = amplify_core.QueryField(fieldName: "bodyTemperature");
  static final STRESSINDEX = amplify_core.QueryField(fieldName: "stressIndex");
  static final SYSTOLICBLOODPRESSURE = amplify_core.QueryField(fieldName: "systolicBloodPressure");
  static final DIASTOLICBLOODPRESSURE = amplify_core.QueryField(fieldName: "diastolicBloodPressure");
  static final HEARTRATE = amplify_core.QueryField(fieldName: "heartRate");
  static final HEARTRATEVARIABILITY = amplify_core.QueryField(fieldName: "heartRateVariability");
  static final SYMPATHETICNERVOUSSYSTEMINDEX = amplify_core.QueryField(fieldName: "sympatheticNervousSystemIndex");
  static final TIMEZONE = amplify_core.QueryField(fieldName: "timezone");
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final ACTIVITIES = amplify_core.QueryField(
    fieldName: "activities",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ProfileActivity'));
  static final ASSESSMENTS = amplify_core.QueryField(
    fieldName: "assessments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Assessment'));
  static final AGGREGATEHOURASSESSMENTS = amplify_core.QueryField(
    fieldName: "aggregateHourAssessments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AggregateHourAssessment'));
  static final AGGREGATEDAYASSESSMENTS = amplify_core.QueryField(
    fieldName: "aggregateDayAssessments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AggregateDayAssessment'));
  static final AGGREGATEMONTHASSESSMENTS = amplify_core.QueryField(
    fieldName: "aggregateMonthAssessments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AggregateMonthAssessment'));
  static final AGGREGATEYEARASSESSMENTS = amplify_core.QueryField(
    fieldName: "aggregateYearAssessments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AggregateYearAssessment'));
  static final NOTIFICATIONS = amplify_core.QueryField(
    fieldName: "notifications",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Notification'));
  static final PREFERENCES = amplify_core.QueryField(
    fieldName: "preferences",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ProfilePreference'));
  static final SELFCAREUSAGES = amplify_core.QueryField(
    fieldName: "selfCareUsages",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'SelfCareUsage'));
  static final SUGGESTIONS = amplify_core.QueryField(
    fieldName: "suggestions",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ProfileSuggestion'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Profile";
    modelSchemaDefinition.pluralName = "Profiles";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
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
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.AGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.GENDER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.WEIGHT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.WEIGHTUNIT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.WEIGHTUNITNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.HEIGHT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.HEIGHTUNIT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.HEIGHTUNITNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.BODYMASSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.MOOD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.STRESSLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.OXYGENLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.OXYGENSATURATIONLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.RESPIRATORYRATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.BODYTEMPERATURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.STRESSINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.SYSTOLICBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.DIASTOLICBLOODPRESSURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.HEARTRATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.HEARTRATEVARIABILITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.SYMPATHETICNERVOUSSYSTEMINDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Profile.TIMEZONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Profile.USER,
      isRequired: false,
      targetName: 'userID',
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.ACTIVITIES,
      isRequired: false,
      ofModelName: 'ProfileActivity',
      associatedKey: ProfileActivity.PROFILE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.ASSESSMENTS,
      isRequired: false,
      ofModelName: 'Assessment',
      associatedKey: Assessment.PROFILEID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.AGGREGATEHOURASSESSMENTS,
      isRequired: false,
      ofModelName: 'AggregateHourAssessment',
      associatedKey: AggregateHourAssessment.PROFILEID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.AGGREGATEDAYASSESSMENTS,
      isRequired: false,
      ofModelName: 'AggregateDayAssessment',
      associatedKey: AggregateDayAssessment.PROFILEID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.AGGREGATEMONTHASSESSMENTS,
      isRequired: false,
      ofModelName: 'AggregateMonthAssessment',
      associatedKey: AggregateMonthAssessment.PROFILEID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.AGGREGATEYEARASSESSMENTS,
      isRequired: false,
      ofModelName: 'AggregateYearAssessment',
      associatedKey: AggregateYearAssessment.PROFILEID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.NOTIFICATIONS,
      isRequired: false,
      ofModelName: 'Notification',
      associatedKey: Notification.PROFILEID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.PREFERENCES,
      isRequired: false,
      ofModelName: 'ProfilePreference',
      associatedKey: ProfilePreference.PROFILE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.SELFCAREUSAGES,
      isRequired: false,
      ofModelName: 'SelfCareUsage',
      associatedKey: SelfCareUsage.PROFILE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Profile.SUGGESTIONS,
      isRequired: false,
      ofModelName: 'ProfileSuggestion',
      associatedKey: ProfileSuggestion.PROFILE
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

class _ProfileModelType extends amplify_core.ModelType<Profile> {
  const _ProfileModelType();
  
  @override
  Profile fromJson(Map<String, dynamic> jsonData) {
    return Profile.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Profile';
  }
}
