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

/** This is an auto generated class representing the Answer type in your schema. */
class Answer extends amplify_core.Model {
  static const classType = const _AnswerModelType();
  final String id;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _description;
  final String? _identifier;
  final int? _index;
  final bool? _isHidden;
  final String? _name;
  final int? _numberOfClicks;
  final int? _numberOfComments;
  final int? _numberOfVotes;
  final int? _numberOfViews;
  final Question? _question;
  final User? _user;
  final List<Comment>? _comments;
  final List<AnswerFile>? _files;
  final List<AnswerVote>? _votes;

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
  
  int? get numberOfComments {
    return _numberOfComments;
  }
  
  int? get numberOfVotes {
    return _numberOfVotes;
  }
  
  int? get numberOfViews {
    return _numberOfViews;
  }
  
  Question? get question {
    return _question;
  }
  
  User? get user {
    return _user;
  }
  
  List<Comment>? get comments {
    return _comments;
  }
  
  List<AnswerFile>? get files {
    return _files;
  }
  
  List<AnswerVote>? get votes {
    return _votes;
  }
  
  const Answer._internal({required this.id, createdAt, updatedAt, description, identifier, index, isHidden, name, numberOfClicks, numberOfComments, numberOfVotes, numberOfViews, question, user, comments, files, votes}): _createdAt = createdAt, _updatedAt = updatedAt, _description = description, _identifier = identifier, _index = index, _isHidden = isHidden, _name = name, _numberOfClicks = numberOfClicks, _numberOfComments = numberOfComments, _numberOfVotes = numberOfVotes, _numberOfViews = numberOfViews, _question = question, _user = user, _comments = comments, _files = files, _votes = votes;
  
  factory Answer({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, String? identifier, int? index, bool? isHidden, String? name, int? numberOfClicks, int? numberOfComments, int? numberOfVotes, int? numberOfViews, Question? question, User? user, List<Comment>? comments, List<AnswerFile>? files, List<AnswerVote>? votes}) {
    return Answer._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: description,
      identifier: identifier,
      index: index,
      isHidden: isHidden,
      name: name,
      numberOfClicks: numberOfClicks,
      numberOfComments: numberOfComments,
      numberOfVotes: numberOfVotes,
      numberOfViews: numberOfViews,
      question: question,
      user: user,
      comments: comments != null ? List<Comment>.unmodifiable(comments) : comments,
      files: files != null ? List<AnswerFile>.unmodifiable(files) : files,
      votes: votes != null ? List<AnswerVote>.unmodifiable(votes) : votes);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Answer &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _description == other._description &&
      _identifier == other._identifier &&
      _index == other._index &&
      _isHidden == other._isHidden &&
      _name == other._name &&
      _numberOfClicks == other._numberOfClicks &&
      _numberOfComments == other._numberOfComments &&
      _numberOfVotes == other._numberOfVotes &&
      _numberOfViews == other._numberOfViews &&
      _question == other._question &&
      _user == other._user &&
      DeepCollectionEquality().equals(_comments, other._comments) &&
      DeepCollectionEquality().equals(_files, other._files) &&
      DeepCollectionEquality().equals(_votes, other._votes);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Answer {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("identifier=" + "$_identifier" + ", ");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("isHidden=" + (_isHidden != null ? _isHidden!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("numberOfClicks=" + (_numberOfClicks != null ? _numberOfClicks!.toString() : "null") + ", ");
    buffer.write("numberOfComments=" + (_numberOfComments != null ? _numberOfComments!.toString() : "null") + ", ");
    buffer.write("numberOfVotes=" + (_numberOfVotes != null ? _numberOfVotes!.toString() : "null") + ", ");
    buffer.write("numberOfViews=" + (_numberOfViews != null ? _numberOfViews!.toString() : "null") + ", ");
    buffer.write("question=" + (_question != null ? _question!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Answer copyWith({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, String? identifier, int? index, bool? isHidden, String? name, int? numberOfClicks, int? numberOfComments, int? numberOfVotes, int? numberOfViews, Question? question, User? user, List<Comment>? comments, List<AnswerFile>? files, List<AnswerVote>? votes}) {
    return Answer._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      identifier: identifier ?? this.identifier,
      index: index ?? this.index,
      isHidden: isHidden ?? this.isHidden,
      name: name ?? this.name,
      numberOfClicks: numberOfClicks ?? this.numberOfClicks,
      numberOfComments: numberOfComments ?? this.numberOfComments,
      numberOfVotes: numberOfVotes ?? this.numberOfVotes,
      numberOfViews: numberOfViews ?? this.numberOfViews,
      question: question ?? this.question,
      user: user ?? this.user,
      comments: comments ?? this.comments,
      files: files ?? this.files,
      votes: votes ?? this.votes);
  }
  
  Answer copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? identifier,
    ModelFieldValue<int?>? index,
    ModelFieldValue<bool?>? isHidden,
    ModelFieldValue<String?>? name,
    ModelFieldValue<int?>? numberOfClicks,
    ModelFieldValue<int?>? numberOfComments,
    ModelFieldValue<int?>? numberOfVotes,
    ModelFieldValue<int?>? numberOfViews,
    ModelFieldValue<Question?>? question,
    ModelFieldValue<User?>? user,
    ModelFieldValue<List<Comment>?>? comments,
    ModelFieldValue<List<AnswerFile>?>? files,
    ModelFieldValue<List<AnswerVote>?>? votes
  }) {
    return Answer._internal(
      id: id == null ? this.id : id.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      description: description == null ? this.description : description.value,
      identifier: identifier == null ? this.identifier : identifier.value,
      index: index == null ? this.index : index.value,
      isHidden: isHidden == null ? this.isHidden : isHidden.value,
      name: name == null ? this.name : name.value,
      numberOfClicks: numberOfClicks == null ? this.numberOfClicks : numberOfClicks.value,
      numberOfComments: numberOfComments == null ? this.numberOfComments : numberOfComments.value,
      numberOfVotes: numberOfVotes == null ? this.numberOfVotes : numberOfVotes.value,
      numberOfViews: numberOfViews == null ? this.numberOfViews : numberOfViews.value,
      question: question == null ? this.question : question.value,
      user: user == null ? this.user : user.value,
      comments: comments == null ? this.comments : comments.value,
      files: files == null ? this.files : files.value,
      votes: votes == null ? this.votes : votes.value
    );
  }
  
  Answer.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _description = json['description'],
      _identifier = json['identifier'],
      _index = (json['index'] as num?)?.toInt(),
      _isHidden = json['isHidden'],
      _name = json['name'],
      _numberOfClicks = (json['numberOfClicks'] as num?)?.toInt(),
      _numberOfComments = (json['numberOfComments'] as num?)?.toInt(),
      _numberOfVotes = (json['numberOfVotes'] as num?)?.toInt(),
      _numberOfViews = (json['numberOfViews'] as num?)?.toInt(),
      _question = json['question'] != null
        ? Question.fromJson(new Map<String, dynamic>.from(json['question']))
        : null,
      _user = json['user'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']))
        : null,
      _comments = json['comments']?['items'] is List
        ? (json['comments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _files = json['files']?['items'] is List
        ? (json['files']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AnswerFile.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _votes = json['votes']?['items'] is List
        ? (json['votes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AnswerVote.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'description': _description, 'identifier': _identifier, 'index': _index, 'isHidden': _isHidden, 'name': _name, 'numberOfClicks': _numberOfClicks, 'numberOfComments': _numberOfComments, 'numberOfVotes': _numberOfVotes, 'numberOfViews': _numberOfViews, 'question': _question?.toJson(), 'user': _user?.toJson(), 'comments': _comments?.map((Comment? e) => e?.toJson()).toList(), 'files': _files?.map((AnswerFile? e) => e?.toJson()).toList(), 'votes': _votes?.map((AnswerVote? e) => e?.toJson()).toList()
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
    'numberOfComments': _numberOfComments,
    'numberOfVotes': _numberOfVotes,
    'numberOfViews': _numberOfViews,
    'question': _question,
    'user': _user,
    'comments': _comments,
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
  static final NUMBEROFCOMMENTS = amplify_core.QueryField(fieldName: "numberOfComments");
  static final NUMBEROFVOTES = amplify_core.QueryField(fieldName: "numberOfVotes");
  static final NUMBEROFVIEWS = amplify_core.QueryField(fieldName: "numberOfViews");
  static final QUESTION = amplify_core.QueryField(
    fieldName: "question",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Question'));
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final COMMENTS = amplify_core.QueryField(
    fieldName: "comments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Comment'));
  static final FILES = amplify_core.QueryField(
    fieldName: "files",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AnswerFile'));
  static final VOTES = amplify_core.QueryField(
    fieldName: "votes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AnswerVote'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Answer";
    modelSchemaDefinition.pluralName = "Answers";
    
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
      amplify_core.ModelIndex(fields: const ["questionID", "updatedAt", "numberOfVotes"], name: "byQuestion"),
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.IDENTIFIER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.INDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.ISHIDDEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.NUMBEROFCLICKS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.NUMBEROFCOMMENTS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.NUMBEROFVOTES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Answer.NUMBEROFVIEWS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Answer.QUESTION,
      isRequired: false,
      targetName: 'questionID',
      ofModelName: 'Question'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Answer.USER,
      isRequired: false,
      targetName: 'userID',
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Answer.COMMENTS,
      isRequired: false,
      ofModelName: 'Comment',
      associatedKey: Comment.ANSWER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Answer.FILES,
      isRequired: false,
      ofModelName: 'AnswerFile',
      associatedKey: AnswerFile.ANSWER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Answer.VOTES,
      isRequired: false,
      ofModelName: 'AnswerVote',
      associatedKey: AnswerVote.ANSWER
    ));
  });
}

class _AnswerModelType extends amplify_core.ModelType<Answer> {
  const _AnswerModelType();
  
  @override
  Answer fromJson(Map<String, dynamic> jsonData) {
    return Answer.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Answer';
  }
}
