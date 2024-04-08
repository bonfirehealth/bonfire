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

/** This is an auto generated class representing the Activity type in your schema. */
class Activity extends amplify_core.Model {
  static const classType = const _ActivityModelType();
  final String id;
  final String? _description;
  final int? _duration;
  final String? _name;
  final ActivityType? _activityType;
  final Reward? _reward;
  final List<ProfileActivity>? _profiles;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _activityActivityTypeId;
  final String? _activityRewardId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get description {
    return _description;
  }
  
  int? get duration {
    return _duration;
  }
  
  String? get name {
    return _name;
  }
  
  ActivityType? get activityType {
    return _activityType;
  }
  
  Reward? get reward {
    return _reward;
  }
  
  List<ProfileActivity>? get profiles {
    return _profiles;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get activityActivityTypeId {
    return _activityActivityTypeId;
  }
  
  String? get activityRewardId {
    return _activityRewardId;
  }
  
  const Activity._internal({required this.id, description, duration, name, activityType, reward, profiles, createdAt, updatedAt, activityActivityTypeId, activityRewardId}): _description = description, _duration = duration, _name = name, _activityType = activityType, _reward = reward, _profiles = profiles, _createdAt = createdAt, _updatedAt = updatedAt, _activityActivityTypeId = activityActivityTypeId, _activityRewardId = activityRewardId;
  
  factory Activity({String? id, String? description, int? duration, String? name, ActivityType? activityType, Reward? reward, List<ProfileActivity>? profiles, String? activityActivityTypeId, String? activityRewardId}) {
    return Activity._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      description: description,
      duration: duration,
      name: name,
      activityType: activityType,
      reward: reward,
      profiles: profiles != null ? List<ProfileActivity>.unmodifiable(profiles) : profiles,
      activityActivityTypeId: activityActivityTypeId,
      activityRewardId: activityRewardId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Activity &&
      id == other.id &&
      _description == other._description &&
      _duration == other._duration &&
      _name == other._name &&
      _activityType == other._activityType &&
      _reward == other._reward &&
      DeepCollectionEquality().equals(_profiles, other._profiles) &&
      _activityActivityTypeId == other._activityActivityTypeId &&
      _activityRewardId == other._activityRewardId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Activity {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("duration=" + (_duration != null ? _duration!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("activityActivityTypeId=" + "$_activityActivityTypeId" + ", ");
    buffer.write("activityRewardId=" + "$_activityRewardId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Activity copyWith({String? id, String? description, int? duration, String? name, ActivityType? activityType, Reward? reward, List<ProfileActivity>? profiles, String? activityActivityTypeId, String? activityRewardId}) {
    return Activity._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      name: name ?? this.name,
      activityType: activityType ?? this.activityType,
      reward: reward ?? this.reward,
      profiles: profiles ?? this.profiles,
      activityActivityTypeId: activityActivityTypeId ?? this.activityActivityTypeId,
      activityRewardId: activityRewardId ?? this.activityRewardId);
  }
  
  Activity copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? description,
    ModelFieldValue<int?>? duration,
    ModelFieldValue<String?>? name,
    ModelFieldValue<ActivityType?>? activityType,
    ModelFieldValue<Reward?>? reward,
    ModelFieldValue<List<ProfileActivity>?>? profiles,
    ModelFieldValue<String?>? activityActivityTypeId,
    ModelFieldValue<String?>? activityRewardId
  }) {
    return Activity._internal(
      id: id == null ? this.id : id.value,
      description: description == null ? this.description : description.value,
      duration: duration == null ? this.duration : duration.value,
      name: name == null ? this.name : name.value,
      activityType: activityType == null ? this.activityType : activityType.value,
      reward: reward == null ? this.reward : reward.value,
      profiles: profiles == null ? this.profiles : profiles.value,
      activityActivityTypeId: activityActivityTypeId == null ? this.activityActivityTypeId : activityActivityTypeId.value,
      activityRewardId: activityRewardId == null ? this.activityRewardId : activityRewardId.value
    );
  }
  
  Activity.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'],
      _duration = (json['duration'] as num?)?.toInt(),
      _name = json['name'],
      _activityType = json['activityType'] != null
        ? ActivityType.fromJson(new Map<String, dynamic>.from(json['activityType']))
        : null,
      _reward = json['reward'] != null
        ? Reward.fromJson(new Map<String, dynamic>.from(json['reward']))
        : null,
      _profiles = json['profiles']?['items'] is List
        ? (json['profiles']?['items'] as List)
          .where((e) => e != null)
          .map((e) => ProfileActivity.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _activityActivityTypeId = json['activityActivityTypeId'],
      _activityRewardId = json['activityRewardId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description, 'duration': _duration, 'name': _name, 'activityType': _activityType?.toJson(), 'reward': _reward?.toJson(), 'profiles': _profiles?.map((ProfileActivity? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'activityActivityTypeId': _activityActivityTypeId, 'activityRewardId': _activityRewardId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'description': _description,
    'duration': _duration,
    'name': _name,
    'activityType': _activityType,
    'reward': _reward,
    'profiles': _profiles,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'activityActivityTypeId': _activityActivityTypeId,
    'activityRewardId': _activityRewardId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final DURATION = amplify_core.QueryField(fieldName: "duration");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ACTIVITYTYPE = amplify_core.QueryField(
    fieldName: "activityType",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ActivityType'));
  static final REWARD = amplify_core.QueryField(
    fieldName: "reward",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Reward'));
  static final PROFILES = amplify_core.QueryField(
    fieldName: "profiles",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ProfileActivity'));
  static final ACTIVITYACTIVITYTYPEID = amplify_core.QueryField(fieldName: "activityActivityTypeId");
  static final ACTIVITYREWARDID = amplify_core.QueryField(fieldName: "activityRewardId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Activity";
    modelSchemaDefinition.pluralName = "Activities";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Activity.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Activity.DURATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Activity.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Activity.ACTIVITYTYPE,
      isRequired: false,
      ofModelName: 'ActivityType',
      associatedKey: ActivityType.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Activity.REWARD,
      isRequired: false,
      ofModelName: 'Reward',
      associatedKey: Reward.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Activity.PROFILES,
      isRequired: false,
      ofModelName: 'ProfileActivity',
      associatedKey: ProfileActivity.ACTIVITY
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
      key: Activity.ACTIVITYACTIVITYTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Activity.ACTIVITYREWARDID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _ActivityModelType extends amplify_core.ModelType<Activity> {
  const _ActivityModelType();
  
  @override
  Activity fromJson(Map<String, dynamic> jsonData) {
    return Activity.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Activity';
  }
}
