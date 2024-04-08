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

/** This is an auto generated class representing the CommentVote type in your schema. */
class CommentVote extends amplify_core.Model {
  static const classType = const _CommentVoteModelType();
  final String id;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final bool? _isHidden;
  final Comment? _comment;
  final User? _user;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  bool? get isHidden {
    return _isHidden;
  }
  
  Comment? get comment {
    return _comment;
  }
  
  User? get user {
    return _user;
  }
  
  const CommentVote._internal({required this.id, createdAt, updatedAt, isHidden, comment, user}): _createdAt = createdAt, _updatedAt = updatedAt, _isHidden = isHidden, _comment = comment, _user = user;
  
  factory CommentVote({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, bool? isHidden, Comment? comment, User? user}) {
    return CommentVote._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isHidden: isHidden,
      comment: comment,
      user: user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentVote &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _isHidden == other._isHidden &&
      _comment == other._comment &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CommentVote {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("isHidden=" + (_isHidden != null ? _isHidden!.toString() : "null") + ", ");
    buffer.write("comment=" + (_comment != null ? _comment!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CommentVote copyWith({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, bool? isHidden, Comment? comment, User? user}) {
    return CommentVote._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isHidden: isHidden ?? this.isHidden,
      comment: comment ?? this.comment,
      user: user ?? this.user);
  }
  
  CommentVote copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt,
    ModelFieldValue<bool?>? isHidden,
    ModelFieldValue<Comment?>? comment,
    ModelFieldValue<User?>? user
  }) {
    return CommentVote._internal(
      id: id == null ? this.id : id.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      isHidden: isHidden == null ? this.isHidden : isHidden.value,
      comment: comment == null ? this.comment : comment.value,
      user: user == null ? this.user : user.value
    );
  }
  
  CommentVote.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _isHidden = json['isHidden'],
      _comment = json['comment'] != null
        ? Comment.fromJson(new Map<String, dynamic>.from(json['comment']))
        : null,
      _user = json['user'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'isHidden': _isHidden, 'comment': _comment?.toJson(), 'user': _user?.toJson()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'isHidden': _isHidden,
    'comment': _comment,
    'user': _user
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static final ISHIDDEN = amplify_core.QueryField(fieldName: "isHidden");
  static final COMMENT = amplify_core.QueryField(
    fieldName: "comment",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Comment'));
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CommentVote";
    modelSchemaDefinition.pluralName = "CommentVotes";
    
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
      amplify_core.ModelIndex(fields: const ["commentID", "updatedAt"], name: "byComment"),
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CommentVote.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CommentVote.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: CommentVote.ISHIDDEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: CommentVote.COMMENT,
      isRequired: false,
      targetName: 'commentID',
      ofModelName: 'Comment'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: CommentVote.USER,
      isRequired: false,
      targetName: 'userID',
      ofModelName: 'User'
    ));
  });
}

class _CommentVoteModelType extends amplify_core.ModelType<CommentVote> {
  const _CommentVoteModelType();
  
  @override
  CommentVote fromJson(Map<String, dynamic> jsonData) {
    return CommentVote.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'CommentVote';
  }
}
