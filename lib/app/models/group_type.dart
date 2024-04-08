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

/** This is an auto generated class representing the GroupType type in your schema. */
class GroupType extends amplify_core.Model {
  static const classType = const _GroupTypeModelType();
  final String id;
  final String? _description;
  final String? _icon;
  final String? _identifier;
  final String? _name;
  final Preference? _preference;
  final String? _organisationID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

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
  
  Preference? get preference {
    return _preference;
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
  
  const GroupType._internal({required this.id, description, icon, identifier, name, preference, required organisationID, createdAt, updatedAt}): _description = description, _icon = icon, _identifier = identifier, _name = name, _preference = preference, _organisationID = organisationID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GroupType({String? id, String? description, String? icon, String? identifier, String? name, Preference? preference, required String organisationID}) {
    return GroupType._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      description: description,
      icon: icon,
      identifier: identifier,
      name: name,
      preference: preference,
      organisationID: organisationID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupType &&
      id == other.id &&
      _description == other._description &&
      _icon == other._icon &&
      _identifier == other._identifier &&
      _name == other._name &&
      _preference == other._preference &&
      _organisationID == other._organisationID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GroupType {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("icon=" + "$_icon" + ", ");
    buffer.write("identifier=" + "$_identifier" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("preference=" + (_preference != null ? _preference!.toString() : "null") + ", ");
    buffer.write("organisationID=" + "$_organisationID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GroupType copyWith({String? id, String? description, String? icon, String? identifier, String? name, Preference? preference, String? organisationID}) {
    return GroupType._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      identifier: identifier ?? this.identifier,
      name: name ?? this.name,
      preference: preference ?? this.preference,
      organisationID: organisationID ?? this.organisationID);
  }
  
  GroupType copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? icon,
    ModelFieldValue<String?>? identifier,
    ModelFieldValue<String?>? name,
    ModelFieldValue<Preference?>? preference,
    ModelFieldValue<String>? organisationID
  }) {
    return GroupType._internal(
      id: id == null ? this.id : id.value,
      description: description == null ? this.description : description.value,
      icon: icon == null ? this.icon : icon.value,
      identifier: identifier == null ? this.identifier : identifier.value,
      name: name == null ? this.name : name.value,
      preference: preference == null ? this.preference : preference.value,
      organisationID: organisationID == null ? this.organisationID : organisationID.value
    );
  }
  
  GroupType.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'],
      _icon = json['icon'],
      _identifier = json['identifier'],
      _name = json['name'],
      _preference = json['preference'] != null
        ? Preference.fromJson(new Map<String, dynamic>.from(json['preference']))
        : null,
      _organisationID = json['organisationID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description, 'icon': _icon, 'identifier': _identifier, 'name': _name, 'preference': _preference?.toJson(), 'organisationID': _organisationID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'description': _description,
    'icon': _icon,
    'identifier': _identifier,
    'name': _name,
    'preference': _preference,
    'organisationID': _organisationID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final ICON = amplify_core.QueryField(fieldName: "icon");
  static final IDENTIFIER = amplify_core.QueryField(fieldName: "identifier");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final PREFERENCE = amplify_core.QueryField(
    fieldName: "preference",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Preference'));
  static final ORGANISATIONID = amplify_core.QueryField(fieldName: "organisationID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GroupType";
    modelSchemaDefinition.pluralName = "GroupTypes";
    
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
      amplify_core.ModelIndex(fields: const ["groupTypeID"], name: "byGroupType"),
      amplify_core.ModelIndex(fields: const ["organisationID"], name: "byOrganisation")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GroupType.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GroupType.ICON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GroupType.IDENTIFIER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GroupType.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: GroupType.PREFERENCE,
      isRequired: false,
      targetName: 'groupTypeID',
      ofModelName: 'Preference'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GroupType.ORGANISATIONID,
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

class _GroupTypeModelType extends amplify_core.ModelType<GroupType> {
  const _GroupTypeModelType();
  
  @override
  GroupType fromJson(Map<String, dynamic> jsonData) {
    return GroupType.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'GroupType';
  }
}
