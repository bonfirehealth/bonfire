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

/** This is an auto generated class representing the Comment type in your schema. */
class Comment extends amplify_core.Model {
  static const classType = const _CommentModelType();
  final String id;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _description;
  final String? _identifier;
  final int? _index;
  final bool? _isHidden;
  final String? _name;
  final int? _numberOfClicks;
  final int? _numberOfVotes;
  final int? _numberOfViews;
  final Answer? _answer;
  final User? _user;
  final List<CommentFile>? _files;
  final List<CommentVote>? _votes;

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
  
  String? get description {
    return _description;
  }
  
  String? get identifier {
    return _identifier;
  }
  
  int? get index {
    return _index;
  }
  
  bool? get isHidden {
    return _isHidden;
  }
  
  String? get name {
    return _name;
  }
  
  int? get numberOfClicks {
    return _numberOfClicks;
  }
  
  int? get numberOfVotes {
    return _numberOfVotes;
  }
  
  int? get numberOfViews {
    return _numberOfViews;
  }
  
  Answer? get answer {
    return _answer;
  }
  
  User? get user {
    return _user;
  }
  
  List<CommentFile>? get files {
    return _files;
  }
  
  List<CommentVote>? get votes {
    return _votes;
  }
  
  const Comment._internal({required this.id, createdAt, updatedAt, description, identifier, index, isHidden, name, numberOfClicks, numberOfVotes, numberOfViews, answer, user, files, votes}): _createdAt = createdAt, _updatedAt = updatedAt, _description = description, _identifier = identifier, _index = index, _isHidden = isHidden, _name = name, _numberOfClicks = numberOfClicks, _numberOfVotes = numberOfVotes, _numberOfViews = numberOfViews, _answer = answer, _user = user, _files = files, _votes = votes;
  
  factory Comment({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, String? identifier, int? index, bool? isHidden, String? name, int? numberOfClicks, int? numberOfVotes, int? numberOfViews, Answer? answer, User? user, List<CommentFile>? files, List<CommentVote>? votes}) {
    return Comment._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: description,
      identifier: identifier,
      index: index,
      isHidden: isHidden,
      name: name,
      numberOfClicks: numberOfClicks,
      numberOfVotes: numberOfVotes,
      numberOfViews: numberOfViews,
      answer: answer,
      user: user,
      files: files != null ? List<CommentFile>.unmodifiable(files) : files,
      votes: votes != null ? List<CommentVote>.unmodifiable(votes) : votes);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comment &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _description == other._description &&
      _identifier == other._identifier &&
      _index == other._index &&
      _isHidden == other._isHidden &&
      _name == other._name &&
      _numberOfClicks == other._numberOfClicks &&
      _numberOfVotes == other._numberOfVotes &&
      _numberOfViews == other._numberOfViews &&
      _answer == other._answer &&
      _user == other._user &&
      DeepCollectionEquality().equals(_files, other._files) &&
      DeepCollectionEquality().equals(_votes, other._votes);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Comment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("identifier=" + "$_identifier" + ", ");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("isHidden=" + (_isHidden != null ? _isHidden!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("numberOfClicks=" + (_numberOfClicks != null ? _numberOfClicks!.toString() : "null") + ", ");
    buffer.write("numberOfVotes=" + (_numberOfVotes != null ? _numberOfVotes!.toString() : "null") + ", ");
    buffer.write("numberOfViews=" + (_numberOfViews != null ? _numberOfViews!.toString() : "null") + ", ");
    buffer.write("answer=" + (_answer != null ? _answer!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Comment copyWith({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, String? identifier, int? index, bool? isHidden, String? name, int? numberOfClicks, int? numberOfVotes, int? numberOfViews, Answer? answer, User? user, List<CommentFile>? files, List<CommentVote>? votes}) {
    return Comment._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      identifier: identifier ?? this.identifier,
      index: index ?? this.index,
      isHidden: isHidden ?? this.isHidden,
      name: name ?? this.name,
      numberOfClicks: numberOfClicks ?? this.numberOfClicks,
      numberOfVotes: numberOfVotes ?? this.numberOfVotes,
      numberOfViews: numberOfViews ?? this.numberOfViews,
      answer: answer ?? this.answer,
      user: user ?? this.user,
      files: files ?? this.files,
      votes: votes ?? this.votes);
  }
  
  Comment copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? identifier,
    ModelFieldValue<int?>? index,
    ModelFieldValue<bool?>? isHidden,
    ModelFieldValue<String?>? name,
    ModelFieldValue<int?>? numberOfClicks,
    ModelFieldValue<int?>? numberOfVotes,
    ModelFieldValue<int?>? numberOfViews,
    ModelFieldValue<Answer?>? answer,
    ModelFieldValue<User?>? user,
    ModelFieldValue<List<CommentFile>?>? files,
    ModelFieldValue<List<CommentVote>?>? votes
  }) {
    return Comment._internal(
      id: id == null ? this.id : id.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      description: description == null ? this.description : description.value,
      identifier: identifier == null ? this.identifier : identifier.value,
      index: index == null ? this.index : index.value,
      isHidden: isHidden == null ? this.isHidden : isHidden.value,
      name: name == null ? this.name : name.value,
      numberOfClicks: numberOfClicks == null ? this.numberOfClicks : numberOfClicks.value,
      numberOfVotes: numberOfVotes == null ? this.numberOfVotes : numberOfVotes.value,
      numberOfViews: numberOfViews == null ? this.numberOfViews : numberOfViews.value,
      answer: answer == null ? this.answer : answer.value,
      user: user == null ? this.user : user.value,
      files: files == null ? this.files : files.value,
      votes: votes == null ? this.votes : votes.value
    );
  }
  
  Comment.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _description = json['description'],
      _identifier = json['identifier'],
      _index = (json['index'] as num?)?.toInt(),
      _isHidden = json['isHidden'],
      _name = json['name'],
      _numberOfClicks = (json['numberOfClicks'] as num?)?.toInt(),
      _numberOfVotes = (json['numberOfVotes'] as num?)?.toInt(),
      _numberOfViews = (json['numberOfViews'] as num?)?.toInt(),
      _answer = json['answer'] != null
        ? Answer.fromJson(new Map<String, dynamic>.from(json['answer']))
        : null,
      _user = json['user'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']))
        : null,
      _files = json['files']?['items'] is List
        ? (json['files']?['items'] as List)
          .where((e) => e != null)
          .map((e) => CommentFile.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _votes = json['votes']?['items'] is List
        ? (json['votes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => CommentVote.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'description': _description, 'identifier': _identifier, 'index': _index, 'isHidden': _isHidden, 'name': _name, 'numberOfClicks': _numberOfClicks, 'numberOfVotes': _numberOfVotes, 'numberOfViews': _numberOfViews, 'answer': _answer?.toJson(), 'user': _user?.toJson(), 'files': _files?.map((CommentFile? e) => e?.toJson()).toList(), 'votes': _votes?.map((CommentVote? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'description': _description,
    'identifier': _identifier,
    'index': _index,
    'isHidden': _isHidden,
    'name': _name,
    'numberOfClicks': _numberOfClicks,
    'numberOfVotes': _numberOfVotes,
    'numberOfViews': _numberOfViews,
    'answer': _answer,
    'user': _user,
    'files': _files,
    'votes': _votes
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final IDENTIFIER = amplify_core.QueryField(fieldName: "identifier");
  static final INDEX = amplify_core.QueryField(fieldName: "index");
  static final ISHIDDEN = amplify_core.QueryField(fieldName: "isHidden");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final NUMBEROFCLICKS = amplify_core.QueryField(fieldName: "numberOfClicks");
  static final NUMBEROFVOTES = amplify_core.QueryField(fieldName: "numberOfVotes");
  static final NUMBEROFVIEWS = amplify_core.QueryField(fieldName: "numberOfViews");
  static final ANSWER = amplify_core.QueryField(
    fieldName: "answer",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Answer'));
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final FILES = amplify_core.QueryField(
    fieldName: "files",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CommentFile'));
  static final VOTES = amplify_core.QueryField(
    fieldName: "votes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CommentVote'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Comment";
    modelSchemaDefinition.pluralName = "Comments";
    
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
      amplify_core.ModelIndex(fields: const ["answerID", "updatedAt", "numberOfVotes"], name: "byAnswer"),
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.IDENTIFIER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.INDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.ISHIDDEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.NUMBEROFCLICKS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.NUMBEROFVOTES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Comment.NUMBEROFVIEWS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Comment.ANSWER,
      isRequired: false,
      targetName: 'answerID',
      ofModelName: 'Answer'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Comment.USER,
      isRequired: false,
      targetName: 'userID',
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Comment.FILES,
      isRequired: false,
      ofModelName: 'CommentFile',
      associatedKey: CommentFile.COMMENT
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Comment.VOTES,
      isRequired: false,
      ofModelName: 'CommentVote',
      associatedKey: CommentVote.COMMENT
    ));
  });
}

class _CommentModelType extends amplify_core.ModelType<Comment> {
  const _CommentModelType();
  
  @override
  Comment fromJson(Map<String, dynamic> jsonData) {
    return Comment.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Comment';
  }
}
