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

/** This is an auto generated class representing the Preference type in your schema. */
class Preference extends amplify_core.Model {
  static const classType = const _PreferenceModelType();
  final String id;
  final String? _description;
  final String? _icon;
  final String? _identifier;
  final String? _name;
  final bool? _isToDelete;
  final GroupType? _groupType;
  final List<ProfilePreference>? _profiles;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _preferenceGroupTypeId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get description {
    return _description;
  }
  
  String? get icon {
    return _icon;
  }
  
  String? get identifier {
    return _identifier;
  }
  
  String? get name {
    return _name;
  }
  
  bool? get isToDelete {
    return _isToDelete;
  }
  
  GroupType? get groupType {
    return _groupType;
  }
  
  List<ProfilePreference>? get profiles {
    return _profiles;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get preferenceGroupTypeId {
    return _preferenceGroupTypeId;
  }
  
  const Preference._internal({required this.id, description, icon, identifier, name, isToDelete, groupType, profiles, createdAt, updatedAt, preferenceGroupTypeId}): _description = description, _icon = icon, _identifier = identifier, _name = name, _isToDelete = isToDelete, _groupType = groupType, _profiles = profiles, _createdAt = createdAt, _updatedAt = updatedAt, _preferenceGroupTypeId = preferenceGroupTypeId;
  
  factory Preference({String? id, String? description, String? icon, String? identifier, String? name, bool? isToDelete, GroupType? groupType, List<ProfilePreference>? profiles, String? preferenceGroupTypeId}) {
    return Preference._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      description: description,
      icon: icon,
      identifier: identifier,
      name: name,
      isToDelete: isToDelete,
      groupType: groupType,
      profiles: profiles != null ? List<ProfilePreference>.unmodifiable(profiles) : profiles,
      preferenceGroupTypeId: preferenceGroupTypeId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Preference &&
      id == other.id &&
      _description == other._description &&
      _icon == other._icon &&
      _identifier == other._identifier &&
      _name == other._name &&
      _isToDelete == other._isToDelete &&
      _groupType == other._groupType &&
      DeepCollectionEquality().equals(_profiles, other._profiles) &&
      _preferenceGroupTypeId == other._preferenceGroupTypeId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Preference {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("icon=" + "$_icon" + ", ");
    buffer.write("identifier=" + "$_identifier" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("isToDelete=" + (_isToDelete != null ? _isToDelete!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("preferenceGroupTypeId=" + "$_preferenceGroupTypeId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Preference copyWith({String? id, String? description, String? icon, String? identifier, String? name, bool? isToDelete, GroupType? groupType, List<ProfilePreference>? profiles, String? preferenceGroupTypeId}) {
    return Preference._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      identifier: identifier ?? this.identifier,
      name: name ?? this.name,
      isToDelete: isToDelete ?? this.isToDelete,
      groupType: groupType ?? this.groupType,
      profiles: profiles ?? this.profiles,
      preferenceGroupTypeId: preferenceGroupTypeId ?? this.preferenceGroupTypeId);
  }
  
  Preference copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? icon,
    ModelFieldValue<String?>? identifier,
    ModelFieldValue<String?>? name,
    ModelFieldValue<bool?>? isToDelete,
    ModelFieldValue<GroupType?>? groupType,
    ModelFieldValue<List<ProfilePreference>?>? profiles,
    ModelFieldValue<String?>? preferenceGroupTypeId
  }) {
    return Preference._internal(
      id: id == null ? this.id : id.value,
      description: description == null ? this.description : description.value,
      icon: icon == null ? this.icon : icon.value,
      identifier: identifier == null ? this.identifier : identifier.value,
      name: name == null ? this.name : name.value,
      isToDelete: isToDelete == null ? this.isToDelete : isToDelete.value,
      groupType: groupType == null ? this.groupType : groupType.value,
      profiles: profiles == null ? this.profiles : profiles.value,
      preferenceGroupTypeId: preferenceGroupTypeId == null ? this.preferenceGroupTypeId : preferenceGroupTypeId.value
    );
  }
  
  Preference.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'],
      _icon = json['icon'],
      _identifier = json['identifier'],
      _name = json['name'],
      _isToDelete = json['isToDelete'],
      _groupType = json['groupType'] != null
        ? GroupType.fromJson(new Map<String, dynamic>.from(json['groupType']))
        : null,
      _profiles = json['profiles']?['items'] is List
        ? (json['profiles']?['items'] as List)
          .where((e) => e != null)
          .map((e) => ProfilePreference.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _preferenceGroupTypeId = json['preferenceGroupTypeId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description, 'icon': _icon, 'identifier': _identifier, 'name': _name, 'isToDelete': _isToDelete, 'groupType': _groupType?.toJson(), 'profiles': _profiles?.map((ProfilePreference? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'preferenceGroupTypeId': _preferenceGroupTypeId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'description': _description,
    'icon': _icon,
    'identifier': _identifier,
    'name': _name,
    'isToDelete': _isToDelete,
    'groupType': _groupType,
    'profiles': _profiles,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'preferenceGroupTypeId': _preferenceGroupTypeId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final ICON = amplify_core.QueryField(fieldName: "icon");
  static final IDENTIFIER = amplify_core.QueryField(fieldName: "identifier");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ISTODELETE = amplify_core.QueryField(fieldName: "isToDelete");
  static final GROUPTYPE = amplify_core.QueryField(
    fieldName: "groupType",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupType'));
  static final PROFILES = amplify_core.QueryField(
    fieldName: "profiles",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ProfilePreference'));
  static final PREFERENCEGROUPTYPEID = amplify_core.QueryField(fieldName: "preferenceGroupTypeId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Preference";
    modelSchemaDefinition.pluralName = "Preferences";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
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
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Preference.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Preference.ICON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Preference.IDENTIFIER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Preference.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Preference.ISTODELETE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Preference.GROUPTYPE,
      isRequired: false,
      ofModelName: 'GroupType',
      associatedKey: GroupType.PREFERENCE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Preference.PROFILES,
      isRequired: false,
      ofModelName: 'ProfilePreference',
      associatedKey: ProfilePreference.PREFERENCE
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
      key: Preference.PREFERENCEGROUPTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _PreferenceModelType extends amplify_core.ModelType<Preference> {
  const _PreferenceModelType();
  
  @override
  Preference fromJson(Map<String, dynamic> jsonData) {
    return Preference.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Preference';
  }
}
