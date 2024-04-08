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

/** This is an auto generated class representing the GroupTag type in your schema. */
class GroupTag extends amplify_core.Model {
  static const classType = const _GroupTagModelType();
  final String id;
  final String? _description;
  final String? _name;
  final String? _identifier;
  final String? _organisationID;
  final List<GroupTagGroup>? _groups;
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
  
  String? get name {
    return _name;
  }
  
  String? get identifier {
    return _identifier;
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
  
  List<GroupTagGroup>? get groups {
    return _groups;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const GroupTag._internal({required this.id, description, name, identifier, required organisationID, groups, createdAt, updatedAt}): _description = description, _name = name, _identifier = identifier, _organisationID = organisationID, _groups = groups, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GroupTag({String? id, String? description, String? name, String? identifier, required String organisationID, List<GroupTagGroup>? groups}) {
    return GroupTag._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      description: description,
      name: name,
      identifier: identifier,
      organisationID: organisationID,
      groups: groups != null ? List<GroupTagGroup>.unmodifiable(groups) : groups);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupTag &&
      id == other.id &&
      _description == other._description &&
      _name == other._name &&
      _identifier == other._identifier &&
      _organisationID == other._organisationID &&
      DeepCollectionEquality().equals(_groups, other._groups);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GroupTag {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("identifier=" + "$_identifier" + ", ");
    buffer.write("organisationID=" + "$_organisationID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GroupTag copyWith({String? id, String? description, String? name, String? identifier, String? organisationID, List<GroupTagGroup>? groups}) {
    return GroupTag._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      name: name ?? this.name,
      identifier: identifier ?? this.identifier,
      organisationID: organisationID ?? this.organisationID,
      groups: groups ?? this.groups);
  }
  
  GroupTag copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? identifier,
    ModelFieldValue<String>? organisationID,
    ModelFieldValue<List<GroupTagGroup>?>? groups
  }) {
    return GroupTag._internal(
      id: id == null ? this.id : id.value,
      description: description == null ? this.description : description.value,
      name: name == null ? this.name : name.value,
      identifier: identifier == null ? this.identifier : identifier.value,
      organisationID: organisationID == null ? this.organisationID : organisationID.value,
      groups: groups == null ? this.groups : groups.value
    );
  }
  
  GroupTag.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'],
      _name = json['name'],
      _identifier = json['identifier'],
      _organisationID = json['organisationID'],
      _groups = json['groups']?['items'] is List
        ? (json['groups']?['items'] as List)
          .where((e) => e != null)
          .map((e) => GroupTagGroup.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description, 'name': _name, 'identifier': _identifier, 'organisationID': _organisationID, 'groups': _groups?.map((GroupTagGroup? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'description': _description,
    'name': _name,
    'identifier': _identifier,
    'organisationID': _organisationID,
    'groups': _groups,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final IDENTIFIER = amplify_core.QueryField(fieldName: "identifier");
  static final ORGANISATIONID = amplify_core.QueryField(fieldName: "organisationID");
  static final GROUPS = amplify_core.QueryField(
    fieldName: "groups",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupTagGroup'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GroupTag";
    modelSchemaDefinition.pluralName = "GroupTags";
    
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
      amplify_core.ModelIndex(fields: const ["organisationID"], name: "byOrganisation")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GroupTag.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GroupTag.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GroupTag.IDENTIFIER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: GroupTag.ORGANISATIONID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: GroupTag.GROUPS,
      isRequired: false,
      ofModelName: 'GroupTagGroup',
      associatedKey: GroupTagGroup.GROUPTAG
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

class _GroupTagModelType extends amplify_core.ModelType<GroupTag> {
  const _GroupTagModelType();
  
  @override
  GroupTag fromJson(Map<String, dynamic> jsonData) {
    return GroupTag.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'GroupTag';
  }
}
