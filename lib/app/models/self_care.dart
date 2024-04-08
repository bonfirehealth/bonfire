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

/** This is an auto generated class representing the SelfCare type in your schema. */
class SelfCare extends amplify_core.Model {
  static const classType = const _SelfCareModelType();
  final String id;
  final String? _description;
  final String? _name;
  final String? _icon;
  final int? _index;
  final bool? _isHidden;
  final int? _numberOfAvailableSlots;
  final int? _numberOfTotalSlots;
  final String? _routePath;
  final String? _url;
  final Activity? _activity;
  final SelfCareType? _selfCareType;
  final List<SelfCareUsage>? _profiles;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _selfCareActivityId;
  final String? _selfCareSelfCareTypeId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get description {
    return _description;
  }
  
  String? get name {
    return _name;
  }
  
  String? get icon {
    return _icon;
  }
  
  int get index {
    try {
      return _index!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool? get isHidden {
    return _isHidden;
  }
  
  int? get numberOfAvailableSlots {
    return _numberOfAvailableSlots;
  }
  
  int? get numberOfTotalSlots {
    return _numberOfTotalSlots;
  }
  
  String? get routePath {
    return _routePath;
  }
  
  String? get url {
    return _url;
  }
  
  Activity? get activity {
    return _activity;
  }
  
  SelfCareType? get selfCareType {
    return _selfCareType;
  }
  
  List<SelfCareUsage>? get profiles {
    return _profiles;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get selfCareActivityId {
    return _selfCareActivityId;
  }
  
  String? get selfCareSelfCareTypeId {
    return _selfCareSelfCareTypeId;
  }
  
  const SelfCare._internal({required this.id, description, name, icon, required index, isHidden, numberOfAvailableSlots, numberOfTotalSlots, routePath, url, activity, selfCareType, profiles, createdAt, updatedAt, selfCareActivityId, selfCareSelfCareTypeId}): _description = description, _name = name, _icon = icon, _index = index, _isHidden = isHidden, _numberOfAvailableSlots = numberOfAvailableSlots, _numberOfTotalSlots = numberOfTotalSlots, _routePath = routePath, _url = url, _activity = activity, _selfCareType = selfCareType, _profiles = profiles, _createdAt = createdAt, _updatedAt = updatedAt, _selfCareActivityId = selfCareActivityId, _selfCareSelfCareTypeId = selfCareSelfCareTypeId;
  
  factory SelfCare({String? id, String? description, String? name, String? icon, required int index, bool? isHidden, int? numberOfAvailableSlots, int? numberOfTotalSlots, String? routePath, String? url, Activity? activity, SelfCareType? selfCareType, List<SelfCareUsage>? profiles, String? selfCareActivityId, String? selfCareSelfCareTypeId}) {
    return SelfCare._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      description: description,
      name: name,
      icon: icon,
      index: index,
      isHidden: isHidden,
      numberOfAvailableSlots: numberOfAvailableSlots,
      numberOfTotalSlots: numberOfTotalSlots,
      routePath: routePath,
      url: url,
      activity: activity,
      selfCareType: selfCareType,
      profiles: profiles != null ? List<SelfCareUsage>.unmodifiable(profiles) : profiles,
      selfCareActivityId: selfCareActivityId,
      selfCareSelfCareTypeId: selfCareSelfCareTypeId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SelfCare &&
      id == other.id &&
      _description == other._description &&
      _name == other._name &&
      _icon == other._icon &&
      _index == other._index &&
      _isHidden == other._isHidden &&
      _numberOfAvailableSlots == other._numberOfAvailableSlots &&
      _numberOfTotalSlots == other._numberOfTotalSlots &&
      _routePath == other._routePath &&
      _url == other._url &&
      _activity == other._activity &&
      _selfCareType == other._selfCareType &&
      DeepCollectionEquality().equals(_profiles, other._profiles) &&
      _selfCareActivityId == other._selfCareActivityId &&
      _selfCareSelfCareTypeId == other._selfCareSelfCareTypeId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SelfCare {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("icon=" + "$_icon" + ", ");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("isHidden=" + (_isHidden != null ? _isHidden!.toString() : "null") + ", ");
    buffer.write("numberOfAvailableSlots=" + (_numberOfAvailableSlots != null ? _numberOfAvailableSlots!.toString() : "null") + ", ");
    buffer.write("numberOfTotalSlots=" + (_numberOfTotalSlots != null ? _numberOfTotalSlots!.toString() : "null") + ", ");
    buffer.write("routePath=" + "$_routePath" + ", ");
    buffer.write("url=" + "$_url" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("selfCareActivityId=" + "$_selfCareActivityId" + ", ");
    buffer.write("selfCareSelfCareTypeId=" + "$_selfCareSelfCareTypeId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SelfCare copyWith({String? id, String? description, String? name, String? icon, int? index, bool? isHidden, int? numberOfAvailableSlots, int? numberOfTotalSlots, String? routePath, String? url, Activity? activity, SelfCareType? selfCareType, List<SelfCareUsage>? profiles, String? selfCareActivityId, String? selfCareSelfCareTypeId}) {
    return SelfCare._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      index: index ?? this.index,
      isHidden: isHidden ?? this.isHidden,
      numberOfAvailableSlots: numberOfAvailableSlots ?? this.numberOfAvailableSlots,
      numberOfTotalSlots: numberOfTotalSlots ?? this.numberOfTotalSlots,
      routePath: routePath ?? this.routePath,
      url: url ?? this.url,
      activity: activity ?? this.activity,
      selfCareType: selfCareType ?? this.selfCareType,
      profiles: profiles ?? this.profiles,
      selfCareActivityId: selfCareActivityId ?? this.selfCareActivityId,
      selfCareSelfCareTypeId: selfCareSelfCareTypeId ?? this.selfCareSelfCareTypeId);
  }
  
  SelfCare copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? icon,
    ModelFieldValue<int>? index,
    ModelFieldValue<bool?>? isHidden,
    ModelFieldValue<int?>? numberOfAvailableSlots,
    ModelFieldValue<int?>? numberOfTotalSlots,
    ModelFieldValue<String?>? routePath,
    ModelFieldValue<String?>? url,
    ModelFieldValue<Activity?>? activity,
    ModelFieldValue<SelfCareType?>? selfCareType,
    ModelFieldValue<List<SelfCareUsage>?>? profiles,
    ModelFieldValue<String?>? selfCareActivityId,
    ModelFieldValue<String?>? selfCareSelfCareTypeId
  }) {
    return SelfCare._internal(
      id: id == null ? this.id : id.value,
      description: description == null ? this.description : description.value,
      name: name == null ? this.name : name.value,
      icon: icon == null ? this.icon : icon.value,
      index: index == null ? this.index : index.value,
      isHidden: isHidden == null ? this.isHidden : isHidden.value,
      numberOfAvailableSlots: numberOfAvailableSlots == null ? this.numberOfAvailableSlots : numberOfAvailableSlots.value,
      numberOfTotalSlots: numberOfTotalSlots == null ? this.numberOfTotalSlots : numberOfTotalSlots.value,
      routePath: routePath == null ? this.routePath : routePath.value,
      url: url == null ? this.url : url.value,
      activity: activity == null ? this.activity : activity.value,
      selfCareType: selfCareType == null ? this.selfCareType : selfCareType.value,
      profiles: profiles == null ? this.profiles : profiles.value,
      selfCareActivityId: selfCareActivityId == null ? this.selfCareActivityId : selfCareActivityId.value,
      selfCareSelfCareTypeId: selfCareSelfCareTypeId == null ? this.selfCareSelfCareTypeId : selfCareSelfCareTypeId.value
    );
  }
  
  SelfCare.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'],
      _name = json['name'],
      _icon = json['icon'],
      _index = (json['index'] as num?)?.toInt(),
      _isHidden = json['isHidden'],
      _numberOfAvailableSlots = (json['numberOfAvailableSlots'] as num?)?.toInt(),
      _numberOfTotalSlots = (json['numberOfTotalSlots'] as num?)?.toInt(),
      _routePath = json['routePath'],
      _url = json['url'],
      _activity = json['activity'] != null
        ? Activity.fromJson(new Map<String, dynamic>.from(json['activity']))
        : null,
      _selfCareType = json['selfCareType'] != null
        ? SelfCareType.fromJson(new Map<String, dynamic>.from(json['selfCareType']))
        : null,
      _profiles = json['profiles']?['items'] is List
        ? (json['profiles']?['items'] as List)
          .where((e) => e != null)
          .map((e) => SelfCareUsage.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _selfCareActivityId = json['selfCareActivityId'],
      _selfCareSelfCareTypeId = json['selfCareSelfCareTypeId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description, 'name': _name, 'icon': _icon, 'index': _index, 'isHidden': _isHidden, 'numberOfAvailableSlots': _numberOfAvailableSlots, 'numberOfTotalSlots': _numberOfTotalSlots, 'routePath': _routePath, 'url': _url, 'activity': _activity?.toJson(), 'selfCareType': _selfCareType?.toJson(), 'profiles': _profiles?.map((SelfCareUsage? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'selfCareActivityId': _selfCareActivityId, 'selfCareSelfCareTypeId': _selfCareSelfCareTypeId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'description': _description,
    'name': _name,
    'icon': _icon,
    'index': _index,
    'isHidden': _isHidden,
    'numberOfAvailableSlots': _numberOfAvailableSlots,
    'numberOfTotalSlots': _numberOfTotalSlots,
    'routePath': _routePath,
    'url': _url,
    'activity': _activity,
    'selfCareType': _selfCareType,
    'profiles': _profiles,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'selfCareActivityId': _selfCareActivityId,
    'selfCareSelfCareTypeId': _selfCareSelfCareTypeId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ICON = amplify_core.QueryField(fieldName: "icon");
  static final INDEX = amplify_core.QueryField(fieldName: "index");
  static final ISHIDDEN = amplify_core.QueryField(fieldName: "isHidden");
  static final NUMBEROFAVAILABLESLOTS = amplify_core.QueryField(fieldName: "numberOfAvailableSlots");
  static final NUMBEROFTOTALSLOTS = amplify_core.QueryField(fieldName: "numberOfTotalSlots");
  static final ROUTEPATH = amplify_core.QueryField(fieldName: "routePath");
  static final URL = amplify_core.QueryField(fieldName: "url");
  static final ACTIVITY = amplify_core.QueryField(
    fieldName: "activity",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Activity'));
  static final SELFCARETYPE = amplify_core.QueryField(
    fieldName: "selfCareType",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'SelfCareType'));
  static final PROFILES = amplify_core.QueryField(
    fieldName: "profiles",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'SelfCareUsage'));
  static final SELFCAREACTIVITYID = amplify_core.QueryField(fieldName: "selfCareActivityId");
  static final SELFCARESELFCARETYPEID = amplify_core.QueryField(fieldName: "selfCareSelfCareTypeId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SelfCare";
    modelSchemaDefinition.pluralName = "SelfCares";
    
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
      key: SelfCare.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SelfCare.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SelfCare.ICON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SelfCare.INDEX,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SelfCare.ISHIDDEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SelfCare.NUMBEROFAVAILABLESLOTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SelfCare.NUMBEROFTOTALSLOTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SelfCare.ROUTEPATH,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SelfCare.URL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: SelfCare.ACTIVITY,
      isRequired: false,
      ofModelName: 'Activity',
      associatedKey: Activity.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: SelfCare.SELFCARETYPE,
      isRequired: false,
      ofModelName: 'SelfCareType',
      associatedKey: SelfCareType.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: SelfCare.PROFILES,
      isRequired: false,
      ofModelName: 'SelfCareUsage',
      associatedKey: SelfCareUsage.SELFCARE
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
      key: SelfCare.SELFCAREACTIVITYID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SelfCare.SELFCARESELFCARETYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _SelfCareModelType extends amplify_core.ModelType<SelfCare> {
  const _SelfCareModelType();
  
  @override
  SelfCare fromJson(Map<String, dynamic> jsonData) {
    return SelfCare.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'SelfCare';
  }
}
