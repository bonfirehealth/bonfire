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

/** This is an auto generated class representing the Question type in your schema. */
class Question extends amplify_core.Model {
  static const classType = const _QuestionModelType();
  final String id;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _description;
  final String? _icon;
  final String? _identifier;
  final int? _index;
  final bool? _isHidden;
  final String? _name;
  final int? _numberOfAnswers;
  final int? _numberOfClicks;
  final int? _numberOfSaves;
  final int? _numberOfVotes;
  final int? _numberOfViews;
  final Group? _group;
  final User? _user;
  final List<Answer>? _answers;
  final List<QuestionFile>? _files;
  final List<QuestionSave>? _saves;
  final List<QuestionVote>? _votes;

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
  
  String? get icon {
    return _icon;
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
  
  int? get numberOfAnswers {
    return _numberOfAnswers;
  }
  
  int? get numberOfClicks {
    return _numberOfClicks;
  }
  
  int? get numberOfSaves {
    return _numberOfSaves;
  }
  
  int? get numberOfVotes {
    return _numberOfVotes;
  }
  
  int? get numberOfViews {
    return _numberOfViews;
  }
  
  Group? get group {
    return _group;
  }
  
  User? get user {
    return _user;
  }
  
  List<Answer>? get answers {
    return _answers;
  }
  
  List<QuestionFile>? get files {
    return _files;
  }
  
  List<QuestionSave>? get saves {
    return _saves;
  }
  
  List<QuestionVote>? get votes {
    return _votes;
  }
  
  const Question._internal({required this.id, createdAt, updatedAt, description, icon, identifier, index, isHidden, name, numberOfAnswers, numberOfClicks, numberOfSaves, numberOfVotes, numberOfViews, group, user, answers, files, saves, votes}): _createdAt = createdAt, _updatedAt = updatedAt, _description = description, _icon = icon, _identifier = identifier, _index = index, _isHidden = isHidden, _name = name, _numberOfAnswers = numberOfAnswers, _numberOfClicks = numberOfClicks, _numberOfSaves = numberOfSaves, _numberOfVotes = numberOfVotes, _numberOfViews = numberOfViews, _group = group, _user = user, _answers = answers, _files = files, _saves = saves, _votes = votes;
  
  factory Question({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, String? icon, String? identifier, int? index, bool? isHidden, String? name, int? numberOfAnswers, int? numberOfClicks, int? numberOfSaves, int? numberOfVotes, int? numberOfViews, Group? group, User? user, List<Answer>? answers, List<QuestionFile>? files, List<QuestionSave>? saves, List<QuestionVote>? votes}) {
    return Question._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: description,
      icon: icon,
      identifier: identifier,
      index: index,
      isHidden: isHidden,
      name: name,
      numberOfAnswers: numberOfAnswers,
      numberOfClicks: numberOfClicks,
      numberOfSaves: numberOfSaves,
      numberOfVotes: numberOfVotes,
      numberOfViews: numberOfViews,
      group: group,
      user: user,
      answers: answers != null ? List<Answer>.unmodifiable(answers) : answers,
      files: files != null ? List<QuestionFile>.unmodifiable(files) : files,
      saves: saves != null ? List<QuestionSave>.unmodifiable(saves) : saves,
      votes: votes != null ? List<QuestionVote>.unmodifiable(votes) : votes);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Question &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _description == other._description &&
      _icon == other._icon &&
      _identifier == other._identifier &&
      _index == other._index &&
      _isHidden == other._isHidden &&
      _name == other._name &&
      _numberOfAnswers == other._numberOfAnswers &&
      _numberOfClicks == other._numberOfClicks &&
      _numberOfSaves == other._numberOfSaves &&
      _numberOfVotes == other._numberOfVotes &&
      _numberOfViews == other._numberOfViews &&
      _group == other._group &&
      _user == other._user &&
      DeepCollectionEquality().equals(_answers, other._answers) &&
      DeepCollectionEquality().equals(_files, other._files) &&
      DeepCollectionEquality().equals(_saves, other._saves) &&
      DeepCollectionEquality().equals(_votes, other._votes);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Question {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("icon=" + "$_icon" + ", ");
    buffer.write("identifier=" + "$_identifier" + ", ");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("isHidden=" + (_isHidden != null ? _isHidden!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("numberOfAnswers=" + (_numberOfAnswers != null ? _numberOfAnswers!.toString() : "null") + ", ");
    buffer.write("numberOfClicks=" + (_numberOfClicks != null ? _numberOfClicks!.toString() : "null") + ", ");
    buffer.write("numberOfSaves=" + (_numberOfSaves != null ? _numberOfSaves!.toString() : "null") + ", ");
    buffer.write("numberOfVotes=" + (_numberOfVotes != null ? _numberOfVotes!.toString() : "null") + ", ");
    buffer.write("numberOfViews=" + (_numberOfViews != null ? _numberOfViews!.toString() : "null") + ", ");
    buffer.write("group=" + (_group != null ? _group!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Question copyWith({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, String? icon, String? identifier, int? index, bool? isHidden, String? name, int? numberOfAnswers, int? numberOfClicks, int? numberOfSaves, int? numberOfVotes, int? numberOfViews, Group? group, User? user, List<Answer>? answers, List<QuestionFile>? files, List<QuestionSave>? saves, List<QuestionVote>? votes}) {
    return Question._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      identifier: identifier ?? this.identifier,
      index: index ?? this.index,
      isHidden: isHidden ?? this.isHidden,
      name: name ?? this.name,
      numberOfAnswers: numberOfAnswers ?? this.numberOfAnswers,
      numberOfClicks: numberOfClicks ?? this.numberOfClicks,
      numberOfSaves: numberOfSaves ?? this.numberOfSaves,
      numberOfVotes: numberOfVotes ?? this.numberOfVotes,
      numberOfViews: numberOfViews ?? this.numberOfViews,
      group: group ?? this.group,
      user: user ?? this.user,
      answers: answers ?? this.answers,
      files: files ?? this.files,
      saves: saves ?? this.saves,
      votes: votes ?? this.votes);
  }
  
  Question copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? icon,
    ModelFieldValue<String?>? identifier,
    ModelFieldValue<int?>? index,
    ModelFieldValue<bool?>? isHidden,
    ModelFieldValue<String?>? name,
    ModelFieldValue<int?>? numberOfAnswers,
    ModelFieldValue<int?>? numberOfClicks,
    ModelFieldValue<int?>? numberOfSaves,
    ModelFieldValue<int?>? numberOfVotes,
    ModelFieldValue<int?>? numberOfViews,
    ModelFieldValue<Group?>? group,
    ModelFieldValue<User?>? user,
    ModelFieldValue<List<Answer>?>? answers,
    ModelFieldValue<List<QuestionFile>?>? files,
    ModelFieldValue<List<QuestionSave>?>? saves,
    ModelFieldValue<List<QuestionVote>?>? votes
  }) {
    return Question._internal(
      id: id == null ? this.id : id.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      description: description == null ? this.description : description.value,
      icon: icon == null ? this.icon : icon.value,
      identifier: identifier == null ? this.identifier : identifier.value,
      index: index == null ? this.index : index.value,
      isHidden: isHidden == null ? this.isHidden : isHidden.value,
      name: name == null ? this.name : name.value,
      numberOfAnswers: numberOfAnswers == null ? this.numberOfAnswers : numberOfAnswers.value,
      numberOfClicks: numberOfClicks == null ? this.numberOfClicks : numberOfClicks.value,
      numberOfSaves: numberOfSaves == null ? this.numberOfSaves : numberOfSaves.value,
      numberOfVotes: numberOfVotes == null ? this.numberOfVotes : numberOfVotes.value,
      numberOfViews: numberOfViews == null ? this.numberOfViews : numberOfViews.value,
      group: group == null ? this.group : group.value,
      user: user == null ? this.user : user.value,
      answers: answers == null ? this.answers : answers.value,
      files: files == null ? this.files : files.value,
      saves: saves == null ? this.saves : saves.value,
      votes: votes == null ? this.votes : votes.value
    );
  }
  
  Question.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _description = json['description'],
      _icon = json['icon'],
      _identifier = json['identifier'],
      _index = (json['index'] as num?)?.toInt(),
      _isHidden = json['isHidden'],
      _name = json['name'],
      _numberOfAnswers = (json['numberOfAnswers'] as num?)?.toInt(),
      _numberOfClicks = (json['numberOfClicks'] as num?)?.toInt(),
      _numberOfSaves = (json['numberOfSaves'] as num?)?.toInt(),
      _numberOfVotes = (json['numberOfVotes'] as num?)?.toInt(),
      _numberOfViews = (json['numberOfViews'] as num?)?.toInt(),
      _group = json['group'] != null
        ? Group.fromJson(new Map<String, dynamic>.from(json['group']))
        : null,
      _user = json['user'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']))
        : null,
      _answers = json['answers']?['items'] is List
        ? (json['answers']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Answer.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _files = json['files']?['items'] is List
        ? (json['files']?['items'] as List)
          .where((e) => e != null)
          .map((e) => QuestionFile.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _saves = json['saves']?['items'] is List
        ? (json['saves']?['items'] as List)
          .where((e) => e != null)
          .map((e) => QuestionSave.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _votes = json['votes']?['items'] is List
        ? (json['votes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => QuestionVote.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'description': _description, 'icon': _icon, 'identifier': _identifier, 'index': _index, 'isHidden': _isHidden, 'name': _name, 'numberOfAnswers': _numberOfAnswers, 'numberOfClicks': _numberOfClicks, 'numberOfSaves': _numberOfSaves, 'numberOfVotes': _numberOfVotes, 'numberOfViews': _numberOfViews, 'group': _group?.toJson(), 'user': _user?.toJson(), 'answers': _answers?.map((Answer? e) => e?.toJson()).toList(), 'files': _files?.map((QuestionFile? e) => e?.toJson()).toList(), 'saves': _saves?.map((QuestionSave? e) => e?.toJson()).toList(), 'votes': _votes?.map((QuestionVote? e) => e?.toJson()).toList()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'description': _description,
    'icon': _icon,
    'identifier': _identifier,
    'index': _index,
    'isHidden': _isHidden,
    'name': _name,
    'numberOfAnswers': _numberOfAnswers,
    'numberOfClicks': _numberOfClicks,
    'numberOfSaves': _numberOfSaves,
    'numberOfVotes': _numberOfVotes,
    'numberOfViews': _numberOfViews,
    'group': _group,
    'user': _user,
    'answers': _answers,
    'files': _files,
    'saves': _saves,
    'votes': _votes
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final ICON = amplify_core.QueryField(fieldName: "icon");
  static final IDENTIFIER = amplify_core.QueryField(fieldName: "identifier");
  static final INDEX = amplify_core.QueryField(fieldName: "index");
  static final ISHIDDEN = amplify_core.QueryField(fieldName: "isHidden");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final NUMBEROFANSWERS = amplify_core.QueryField(fieldName: "numberOfAnswers");
  static final NUMBEROFCLICKS = amplify_core.QueryField(fieldName: "numberOfClicks");
  static final NUMBEROFSAVES = amplify_core.QueryField(fieldName: "numberOfSaves");
  static final NUMBEROFVOTES = amplify_core.QueryField(fieldName: "numberOfVotes");
  static final NUMBEROFVIEWS = amplify_core.QueryField(fieldName: "numberOfViews");
  static final GROUP = amplify_core.QueryField(
    fieldName: "group",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Group'));
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final ANSWERS = amplify_core.QueryField(
    fieldName: "answers",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Answer'));
  static final FILES = amplify_core.QueryField(
    fieldName: "files",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'QuestionFile'));
  static final SAVES = amplify_core.QueryField(
    fieldName: "saves",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'QuestionSave'));
  static final VOTES = amplify_core.QueryField(
    fieldName: "votes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'QuestionVote'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Question";
    modelSchemaDefinition.pluralName = "Questions";
    
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
      amplify_core.ModelIndex(fields: const ["groupID", "updatedAt", "numberOfVotes"], name: "byGroup"),
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.ICON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.IDENTIFIER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.INDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.ISHIDDEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.NUMBEROFANSWERS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.NUMBEROFCLICKS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.NUMBEROFSAVES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.NUMBEROFVOTES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.NUMBEROFVIEWS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Question.GROUP,
      isRequired: false,
      targetName: 'groupID',
      ofModelName: 'Group'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Question.USER,
      isRequired: false,
      targetName: 'userID',
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Question.ANSWERS,
      isRequired: false,
      ofModelName: 'Answer',
      associatedKey: Answer.QUESTION
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Question.FILES,
      isRequired: false,
      ofModelName: 'QuestionFile',
      associatedKey: QuestionFile.QUESTION
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Question.SAVES,
      isRequired: false,
      ofModelName: 'QuestionSave',
      associatedKey: QuestionSave.QUESTION
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Question.VOTES,
      isRequired: false,
      ofModelName: 'QuestionVote',
      associatedKey: QuestionVote.QUESTION
    ));
  });
}

class _QuestionModelType extends amplify_core.ModelType<Question> {
  const _QuestionModelType();
  
  @override
  Question fromJson(Map<String, dynamic> jsonData) {
    return Question.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Question';
  }
}
