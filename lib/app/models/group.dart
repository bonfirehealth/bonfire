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

/** This is an auto generated class representing the Group type in your schema. */
class Group extends amplify_core.Model {
  static const classType = const _GroupModelType();
  final String id;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _description;
  final String? _icon;
  final String? _identifier;
  final int? _index;
  final bool? _isApproved;
  final bool? _isHidden;
  final String? _name;
  final int? _numberOfClicks;
  final int? _numberOfQuestions;
  final int? _numberOfUsers;
  final int? _numberOfViews;
  final int? _numberOfVotes;
  final Organisation? _organisation;
  final User? _suggester;
  final GroupType? _groupType;
  final List<UserGroup>? _users;
  final List<Question>? _questions;
  final List<GroupFile>? _files;
  final List<GroupTagGroup>? _tags;
  final List<GroupVote>? _votes;
  final String? _groupGroupTypeId;

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
  
  bool? get isApproved {
    return _isApproved;
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
  
  int? get numberOfQuestions {
    return _numberOfQuestions;
  }
  
  int? get numberOfUsers {
    return _numberOfUsers;
  }
  
  int? get numberOfViews {
    return _numberOfViews;
  }
  
  int? get numberOfVotes {
    return _numberOfVotes;
  }
  
  Organisation? get organisation {
    return _organisation;
  }
  
  User? get suggester {
    return _suggester;
  }
  
  GroupType? get groupType {
    return _groupType;
  }
  
  List<UserGroup>? get users {
    return _users;
  }
  
  List<Question>? get questions {
    return _questions;
  }
  
  List<GroupFile>? get files {
    return _files;
  }
  
  List<GroupTagGroup>? get tags {
    return _tags;
  }
  
  List<GroupVote>? get votes {
    return _votes;
  }
  
  String? get groupGroupTypeId {
    return _groupGroupTypeId;
  }
  
  const Group._internal({required this.id, createdAt, updatedAt, description, icon, identifier, index, isApproved, isHidden, name, numberOfClicks, numberOfQuestions, numberOfUsers, numberOfViews, numberOfVotes, organisation, suggester, groupType, users, questions, files, tags, votes, groupGroupTypeId}): _createdAt = createdAt, _updatedAt = updatedAt, _description = description, _icon = icon, _identifier = identifier, _index = index, _isApproved = isApproved, _isHidden = isHidden, _name = name, _numberOfClicks = numberOfClicks, _numberOfQuestions = numberOfQuestions, _numberOfUsers = numberOfUsers, _numberOfViews = numberOfViews, _numberOfVotes = numberOfVotes, _organisation = organisation, _suggester = suggester, _groupType = groupType, _users = users, _questions = questions, _files = files, _tags = tags, _votes = votes, _groupGroupTypeId = groupGroupTypeId;
  
  factory Group({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, String? icon, String? identifier, int? index, bool? isApproved, bool? isHidden, String? name, int? numberOfClicks, int? numberOfQuestions, int? numberOfUsers, int? numberOfViews, int? numberOfVotes, Organisation? organisation, User? suggester, GroupType? groupType, List<UserGroup>? users, List<Question>? questions, List<GroupFile>? files, List<GroupTagGroup>? tags, List<GroupVote>? votes, String? groupGroupTypeId}) {
    return Group._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: description,
      icon: icon,
      identifier: identifier,
      index: index,
      isApproved: isApproved,
      isHidden: isHidden,
      name: name,
      numberOfClicks: numberOfClicks,
      numberOfQuestions: numberOfQuestions,
      numberOfUsers: numberOfUsers,
      numberOfViews: numberOfViews,
      numberOfVotes: numberOfVotes,
      organisation: organisation,
      suggester: suggester,
      groupType: groupType,
      users: users != null ? List<UserGroup>.unmodifiable(users) : users,
      questions: questions != null ? List<Question>.unmodifiable(questions) : questions,
      files: files != null ? List<GroupFile>.unmodifiable(files) : files,
      tags: tags != null ? List<GroupTagGroup>.unmodifiable(tags) : tags,
      votes: votes != null ? List<GroupVote>.unmodifiable(votes) : votes,
      groupGroupTypeId: groupGroupTypeId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Group &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _description == other._description &&
      _icon == other._icon &&
      _identifier == other._identifier &&
      _index == other._index &&
      _isApproved == other._isApproved &&
      _isHidden == other._isHidden &&
      _name == other._name &&
      _numberOfClicks == other._numberOfClicks &&
      _numberOfQuestions == other._numberOfQuestions &&
      _numberOfUsers == other._numberOfUsers &&
      _numberOfViews == other._numberOfViews &&
      _numberOfVotes == other._numberOfVotes &&
      _organisation == other._organisation &&
      _suggester == other._suggester &&
      _groupType == other._groupType &&
      DeepCollectionEquality().equals(_users, other._users) &&
      DeepCollectionEquality().equals(_questions, other._questions) &&
      DeepCollectionEquality().equals(_files, other._files) &&
      DeepCollectionEquality().equals(_tags, other._tags) &&
      DeepCollectionEquality().equals(_votes, other._votes) &&
      _groupGroupTypeId == other._groupGroupTypeId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Group {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("icon=" + "$_icon" + ", ");
    buffer.write("identifier=" + "$_identifier" + ", ");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("isApproved=" + (_isApproved != null ? _isApproved!.toString() : "null") + ", ");
    buffer.write("isHidden=" + (_isHidden != null ? _isHidden!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("numberOfClicks=" + (_numberOfClicks != null ? _numberOfClicks!.toString() : "null") + ", ");
    buffer.write("numberOfQuestions=" + (_numberOfQuestions != null ? _numberOfQuestions!.toString() : "null") + ", ");
    buffer.write("numberOfUsers=" + (_numberOfUsers != null ? _numberOfUsers!.toString() : "null") + ", ");
    buffer.write("numberOfViews=" + (_numberOfViews != null ? _numberOfViews!.toString() : "null") + ", ");
    buffer.write("numberOfVotes=" + (_numberOfVotes != null ? _numberOfVotes!.toString() : "null") + ", ");
    buffer.write("organisation=" + (_organisation != null ? _organisation!.toString() : "null") + ", ");
    buffer.write("suggester=" + (_suggester != null ? _suggester!.toString() : "null") + ", ");
    buffer.write("groupGroupTypeId=" + "$_groupGroupTypeId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Group copyWith({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, String? icon, String? identifier, int? index, bool? isApproved, bool? isHidden, String? name, int? numberOfClicks, int? numberOfQuestions, int? numberOfUsers, int? numberOfViews, int? numberOfVotes, Organisation? organisation, User? suggester, GroupType? groupType, List<UserGroup>? users, List<Question>? questions, List<GroupFile>? files, List<GroupTagGroup>? tags, List<GroupVote>? votes, String? groupGroupTypeId}) {
    return Group._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      identifier: identifier ?? this.identifier,
      index: index ?? this.index,
      isApproved: isApproved ?? this.isApproved,
      isHidden: isHidden ?? this.isHidden,
      name: name ?? this.name,
      numberOfClicks: numberOfClicks ?? this.numberOfClicks,
      numberOfQuestions: numberOfQuestions ?? this.numberOfQuestions,
      numberOfUsers: numberOfUsers ?? this.numberOfUsers,
      numberOfViews: numberOfViews ?? this.numberOfViews,
      numberOfVotes: numberOfVotes ?? this.numberOfVotes,
      organisation: organisation ?? this.organisation,
      suggester: suggester ?? this.suggester,
      groupType: groupType ?? this.groupType,
      users: users ?? this.users,
      questions: questions ?? this.questions,
      files: files ?? this.files,
      tags: tags ?? this.tags,
      votes: votes ?? this.votes,
      groupGroupTypeId: groupGroupTypeId ?? this.groupGroupTypeId);
  }
  
  Group copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? icon,
    ModelFieldValue<String?>? identifier,
    ModelFieldValue<int?>? index,
    ModelFieldValue<bool?>? isApproved,
    ModelFieldValue<bool?>? isHidden,
    ModelFieldValue<String?>? name,
    ModelFieldValue<int?>? numberOfClicks,
    ModelFieldValue<int?>? numberOfQuestions,
    ModelFieldValue<int?>? numberOfUsers,
    ModelFieldValue<int?>? numberOfViews,
    ModelFieldValue<int?>? numberOfVotes,
    ModelFieldValue<Organisation?>? organisation,
    ModelFieldValue<User?>? suggester,
    ModelFieldValue<GroupType?>? groupType,
    ModelFieldValue<List<UserGroup>?>? users,
    ModelFieldValue<List<Question>?>? questions,
    ModelFieldValue<List<GroupFile>?>? files,
    ModelFieldValue<List<GroupTagGroup>?>? tags,
    ModelFieldValue<List<GroupVote>?>? votes,
    ModelFieldValue<String?>? groupGroupTypeId
  }) {
    return Group._internal(
      id: id == null ? this.id : id.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      description: description == null ? this.description : description.value,
      icon: icon == null ? this.icon : icon.value,
      identifier: identifier == null ? this.identifier : identifier.value,
      index: index == null ? this.index : index.value,
      isApproved: isApproved == null ? this.isApproved : isApproved.value,
      isHidden: isHidden == null ? this.isHidden : isHidden.value,
      name: name == null ? this.name : name.value,
      numberOfClicks: numberOfClicks == null ? this.numberOfClicks : numberOfClicks.value,
      numberOfQuestions: numberOfQuestions == null ? this.numberOfQuestions : numberOfQuestions.value,
      numberOfUsers: numberOfUsers == null ? this.numberOfUsers : numberOfUsers.value,
      numberOfViews: numberOfViews == null ? this.numberOfViews : numberOfViews.value,
      numberOfVotes: numberOfVotes == null ? this.numberOfVotes : numberOfVotes.value,
      organisation: organisation == null ? this.organisation : organisation.value,
      suggester: suggester == null ? this.suggester : suggester.value,
      groupType: groupType == null ? this.groupType : groupType.value,
      users: users == null ? this.users : users.value,
      questions: questions == null ? this.questions : questions.value,
      files: files == null ? this.files : files.value,
      tags: tags == null ? this.tags : tags.value,
      votes: votes == null ? this.votes : votes.value,
      groupGroupTypeId: groupGroupTypeId == null ? this.groupGroupTypeId : groupGroupTypeId.value
    );
  }
  
  Group.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _description = json['description'],
      _icon = json['icon'],
      _identifier = json['identifier'],
      _index = (json['index'] as num?)?.toInt(),
      _isApproved = json['isApproved'],
      _isHidden = json['isHidden'],
      _name = json['name'],
      _numberOfClicks = (json['numberOfClicks'] as num?)?.toInt(),
      _numberOfQuestions = (json['numberOfQuestions'] as num?)?.toInt(),
      _numberOfUsers = (json['numberOfUsers'] as num?)?.toInt(),
      _numberOfViews = (json['numberOfViews'] as num?)?.toInt(),
      _numberOfVotes = (json['numberOfVotes'] as num?)?.toInt(),
      _organisation = json['organisation'] != null
        ? Organisation.fromJson(new Map<String, dynamic>.from(json['organisation']))
        : null,
      _suggester = json['suggester'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['suggester']))
        : null,
      _groupType = json['groupType'] != null
        ? GroupType.fromJson(new Map<String, dynamic>.from(json['groupType']))
        : null,
      _users = json['users']?['items'] is List
        ? (json['users']?['items'] as List)
          .where((e) => e != null)
          .map((e) => UserGroup.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _questions = json['questions']?['items'] is List
        ? (json['questions']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Question.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _files = json['files']?['items'] is List
        ? (json['files']?['items'] as List)
          .where((e) => e != null)
          .map((e) => GroupFile.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _tags = json['tags']?['items'] is List
        ? (json['tags']?['items'] as List)
          .where((e) => e != null)
          .map((e) => GroupTagGroup.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _votes = json['votes']?['items'] is List
        ? (json['votes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => GroupVote.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _groupGroupTypeId = json['groupGroupTypeId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'description': _description, 'icon': _icon, 'identifier': _identifier, 'index': _index, 'isApproved': _isApproved, 'isHidden': _isHidden, 'name': _name, 'numberOfClicks': _numberOfClicks, 'numberOfQuestions': _numberOfQuestions, 'numberOfUsers': _numberOfUsers, 'numberOfViews': _numberOfViews, 'numberOfVotes': _numberOfVotes, 'organisation': _organisation?.toJson(), 'suggester': _suggester?.toJson(), 'groupType': _groupType?.toJson(), 'users': _users?.map((UserGroup? e) => e?.toJson()).toList(), 'questions': _questions?.map((Question? e) => e?.toJson()).toList(), 'files': _files?.map((GroupFile? e) => e?.toJson()).toList(), 'tags': _tags?.map((GroupTagGroup? e) => e?.toJson()).toList(), 'votes': _votes?.map((GroupVote? e) => e?.toJson()).toList(), 'groupGroupTypeId': _groupGroupTypeId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'description': _description,
    'icon': _icon,
    'identifier': _identifier,
    'index': _index,
    'isApproved': _isApproved,
    'isHidden': _isHidden,
    'name': _name,
    'numberOfClicks': _numberOfClicks,
    'numberOfQuestions': _numberOfQuestions,
    'numberOfUsers': _numberOfUsers,
    'numberOfViews': _numberOfViews,
    'numberOfVotes': _numberOfVotes,
    'organisation': _organisation,
    'suggester': _suggester,
    'groupType': _groupType,
    'users': _users,
    'questions': _questions,
    'files': _files,
    'tags': _tags,
    'votes': _votes,
    'groupGroupTypeId': _groupGroupTypeId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final ICON = amplify_core.QueryField(fieldName: "icon");
  static final IDENTIFIER = amplify_core.QueryField(fieldName: "identifier");
  static final INDEX = amplify_core.QueryField(fieldName: "index");
  static final ISAPPROVED = amplify_core.QueryField(fieldName: "isApproved");
  static final ISHIDDEN = amplify_core.QueryField(fieldName: "isHidden");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final NUMBEROFCLICKS = amplify_core.QueryField(fieldName: "numberOfClicks");
  static final NUMBEROFQUESTIONS = amplify_core.QueryField(fieldName: "numberOfQuestions");
  static final NUMBEROFUSERS = amplify_core.QueryField(fieldName: "numberOfUsers");
  static final NUMBEROFVIEWS = amplify_core.QueryField(fieldName: "numberOfViews");
  static final NUMBEROFVOTES = amplify_core.QueryField(fieldName: "numberOfVotes");
  static final ORGANISATION = amplify_core.QueryField(
    fieldName: "organisation",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Organisation'));
  static final SUGGESTER = amplify_core.QueryField(
    fieldName: "suggester",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final GROUPTYPE = amplify_core.QueryField(
    fieldName: "groupType",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupType'));
  static final USERS = amplify_core.QueryField(
    fieldName: "users",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserGroup'));
  static final QUESTIONS = amplify_core.QueryField(
    fieldName: "questions",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Question'));
  static final FILES = amplify_core.QueryField(
    fieldName: "files",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupFile'));
  static final TAGS = amplify_core.QueryField(
    fieldName: "tags",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupTagGroup'));
  static final VOTES = amplify_core.QueryField(
    fieldName: "votes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupVote'));
  static final GROUPGROUPTYPEID = amplify_core.QueryField(fieldName: "groupGroupTypeId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Group";
    modelSchemaDefinition.pluralName = "Groups";
    
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
      amplify_core.ModelIndex(fields: const ["organisationID", "updatedAt", "numberOfVotes"], name: "byOrganisation"),
      amplify_core.ModelIndex(fields: const ["suggesterID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.ICON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.IDENTIFIER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.INDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.ISAPPROVED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.ISHIDDEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.NUMBEROFCLICKS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.NUMBEROFQUESTIONS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.NUMBEROFUSERS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.NUMBEROFVIEWS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.NUMBEROFVOTES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Group.ORGANISATION,
      isRequired: false,
      targetName: 'organisationID',
      ofModelName: 'Organisation'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Group.SUGGESTER,
      isRequired: false,
      targetName: 'suggesterID',
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Group.GROUPTYPE,
      isRequired: false,
      ofModelName: 'GroupType',
      associatedKey: GroupType.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Group.USERS,
      isRequired: false,
      ofModelName: 'UserGroup',
      associatedKey: UserGroup.GROUP
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Group.QUESTIONS,
      isRequired: false,
      ofModelName: 'Question',
      associatedKey: Question.GROUP
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Group.FILES,
      isRequired: false,
      ofModelName: 'GroupFile',
      associatedKey: GroupFile.GROUP
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Group.TAGS,
      isRequired: false,
      ofModelName: 'GroupTagGroup',
      associatedKey: GroupTagGroup.GROUP
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Group.VOTES,
      isRequired: false,
      ofModelName: 'GroupVote',
      associatedKey: GroupVote.GROUP
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Group.GROUPGROUPTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _GroupModelType extends amplify_core.ModelType<Group> {
  const _GroupModelType();
  
  @override
  Group fromJson(Map<String, dynamic> jsonData) {
    return Group.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Group';
  }
}
