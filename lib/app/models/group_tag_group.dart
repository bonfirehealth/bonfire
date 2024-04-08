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

/** This is an auto generated class representing the GroupTagGroup type in your schema. */
class GroupTagGroup extends amplify_core.Model {
  static const classType = const _GroupTagGroupModelType();
  final String id;
  final Group? _group;
  final GroupTag? _groupTag;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Group get group {
    try {
      return _group!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  GroupTag get groupTag {
    try {
      return _groupTag!;
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
  
  const GroupTagGroup._internal({required this.id, required group, required groupTag, createdAt, updatedAt}): _group = group, _groupTag = groupTag, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory GroupTagGroup({String? id, required Group group, required GroupTag groupTag}) {
    return GroupTagGroup._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      group: group,
      groupTag: groupTag);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupTagGroup &&
      id == other.id &&
      _group == other._group &&
      _groupTag == other._groupTag;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("GroupTagGroup {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("group=" + (_group != null ? _group!.toString() : "null") + ", ");
    buffer.write("groupTag=" + (_groupTag != null ? _groupTag!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  GroupTagGroup copyWith({String? id, Group? group, GroupTag? groupTag}) {
    return GroupTagGroup._internal(
      id: id ?? this.id,
      group: group ?? this.group,
      groupTag: groupTag ?? this.groupTag);
  }
  
  GroupTagGroup copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<Group>? group,
    ModelFieldValue<GroupTag>? groupTag
  }) {
    return GroupTagGroup._internal(
      id: id == null ? this.id : id.value,
      group: group == null ? this.group : group.value,
      groupTag: groupTag == null ? this.groupTag : groupTag.value
    );
  }
  
  GroupTagGroup.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _group = json['group'] != null
        ? Group.fromJson(new Map<String, dynamic>.from(json['group']))
        : null,
      _groupTag = json['groupTag'] != null
        ? GroupTag.fromJson(new Map<String, dynamic>.from(json['groupTag']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'group': _group?.toJson(), 'groupTag': _groupTag?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'group': _group,
    'groupTag': _groupTag,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final GROUP = amplify_core.QueryField(
    fieldName: "group",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Group'));
  static final GROUPTAG = amplify_core.QueryField(
    fieldName: "groupTag",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupTag'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "GroupTagGroup";
    modelSchemaDefinition.pluralName = "GroupTagGroups";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["groupID"], name: "byGroup"),
      amplify_core.ModelIndex(fields: const ["groupTagID"], name: "byGroupTag")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: GroupTagGroup.GROUP,
      isRequired: true,
      targetName: 'groupID',
      ofModelName: 'Group'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: GroupTagGroup.GROUPTAG,
      isRequired: true,
      targetName: 'groupTagID',
      ofModelName: 'GroupTag'
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

class _GroupTagGroupModelType extends amplify_core.ModelType<GroupTagGroup> {
  const _GroupTagGroupModelType();
  
  @override
  GroupTagGroup fromJson(Map<String, dynamic> jsonData) {
    return GroupTagGroup.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'GroupTagGroup';
  }
}
