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

/** This is an auto generated class representing the ReportedUser type in your schema. */
class ReportedUser extends amplify_core.Model {
  static const classType = const _ReportedUserModelType();
  final String id;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _description;
  final bool? _isVerified;
  final bool? _isHidden;
  final String? _name;
  final Organisation? _organisation;
  final String? _reporterID;
  final User? _reporter;
  final String? _userID;
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
  
  String? get description {
    return _description;
  }
  
  bool? get isVerified {
    return _isVerified;
  }
  
  bool? get isHidden {
    return _isHidden;
  }
  
  String? get name {
    return _name;
  }
  
  Organisation? get organisation {
    return _organisation;
  }
  
  String get reporterID {
    try {
      return _reporterID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User? get reporter {
    return _reporter;
  }
  
  String get userID {
    try {
      return _userID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User? get user {
    return _user;
  }
  
  const ReportedUser._internal({required this.id, createdAt, updatedAt, description, isVerified, isHidden, name, organisation, required reporterID, reporter, required userID, user}): _createdAt = createdAt, _updatedAt = updatedAt, _description = description, _isVerified = isVerified, _isHidden = isHidden, _name = name, _organisation = organisation, _reporterID = reporterID, _reporter = reporter, _userID = userID, _user = user;
  
  factory ReportedUser({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, bool? isVerified, bool? isHidden, String? name, Organisation? organisation, required String reporterID, User? reporter, required String userID, User? user}) {
    return ReportedUser._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: description,
      isVerified: isVerified,
      isHidden: isHidden,
      name: name,
      organisation: organisation,
      reporterID: reporterID,
      reporter: reporter,
      userID: userID,
      user: user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportedUser &&
      id == other.id &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _description == other._description &&
      _isVerified == other._isVerified &&
      _isHidden == other._isHidden &&
      _name == other._name &&
      _organisation == other._organisation &&
      _reporterID == other._reporterID &&
      _reporter == other._reporter &&
      _userID == other._userID &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ReportedUser {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("isVerified=" + (_isVerified != null ? _isVerified!.toString() : "null") + ", ");
    buffer.write("isHidden=" + (_isHidden != null ? _isHidden!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("organisation=" + (_organisation != null ? _organisation!.toString() : "null") + ", ");
    buffer.write("reporterID=" + "$_reporterID" + ", ");
    buffer.write("userID=" + "$_userID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ReportedUser copyWith({String? id, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? description, bool? isVerified, bool? isHidden, String? name, Organisation? organisation, String? reporterID, User? reporter, String? userID, User? user}) {
    return ReportedUser._internal(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      isVerified: isVerified ?? this.isVerified,
      isHidden: isHidden ?? this.isHidden,
      name: name ?? this.name,
      organisation: organisation ?? this.organisation,
      reporterID: reporterID ?? this.reporterID,
      reporter: reporter ?? this.reporter,
      userID: userID ?? this.userID,
      user: user ?? this.user);
  }
  
  ReportedUser copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt,
    ModelFieldValue<String?>? description,
    ModelFieldValue<bool?>? isVerified,
    ModelFieldValue<bool?>? isHidden,
    ModelFieldValue<String?>? name,
    ModelFieldValue<Organisation?>? organisation,
    ModelFieldValue<String>? reporterID,
    ModelFieldValue<User?>? reporter,
    ModelFieldValue<String>? userID,
    ModelFieldValue<User?>? user
  }) {
    return ReportedUser._internal(
      id: id == null ? this.id : id.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      description: description == null ? this.description : description.value,
      isVerified: isVerified == null ? this.isVerified : isVerified.value,
      isHidden: isHidden == null ? this.isHidden : isHidden.value,
      name: name == null ? this.name : name.value,
      organisation: organisation == null ? this.organisation : organisation.value,
      reporterID: reporterID == null ? this.reporterID : reporterID.value,
      reporter: reporter == null ? this.reporter : reporter.value,
      userID: userID == null ? this.userID : userID.value,
      user: user == null ? this.user : user.value
    );
  }
  
  ReportedUser.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _description = json['description'],
      _isVerified = json['isVerified'],
      _isHidden = json['isHidden'],
      _name = json['name'],
      _organisation = json['organisation'] != null
        ? Organisation.fromJson(new Map<String, dynamic>.from(json['organisation']))
        : null,
      _reporterID = json['reporterID'],
      _reporter = json['reporter'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['reporter']))
        : null,
      _userID = json['userID'],
      _user = json['user'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'description': _description, 'isVerified': _isVerified, 'isHidden': _isHidden, 'name': _name, 'organisation': _organisation?.toJson(), 'reporterID': _reporterID, 'reporter': _reporter?.toJson(), 'userID': _userID, 'user': _user?.toJson()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'description': _description,
    'isVerified': _isVerified,
    'isHidden': _isHidden,
    'name': _name,
    'organisation': _organisation,
    'reporterID': _reporterID,
    'reporter': _reporter,
    'userID': _userID,
    'user': _user
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final ISVERIFIED = amplify_core.QueryField(fieldName: "isVerified");
  static final ISHIDDEN = amplify_core.QueryField(fieldName: "isHidden");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final ORGANISATION = amplify_core.QueryField(
    fieldName: "organisation",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Organisation'));
  static final REPORTERID = amplify_core.QueryField(fieldName: "reporterID");
  static final REPORTER = amplify_core.QueryField(
    fieldName: "reporter",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final USERID = amplify_core.QueryField(fieldName: "userID");
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ReportedUser";
    modelSchemaDefinition.pluralName = "ReportedUsers";
    
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
      amplify_core.ModelIndex(fields: const ["organisationID", "updatedAt"], name: "byOrganisation"),
      amplify_core.ModelIndex(fields: const ["reporterID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReportedUser.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReportedUser.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReportedUser.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReportedUser.ISVERIFIED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReportedUser.ISHIDDEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReportedUser.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: ReportedUser.ORGANISATION,
      isRequired: false,
      targetName: 'organisationID',
      ofModelName: 'Organisation'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReportedUser.REPORTERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: ReportedUser.REPORTER,
      isRequired: false,
      ofModelName: 'User',
      associatedKey: User.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: ReportedUser.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: ReportedUser.USER,
      isRequired: false,
      ofModelName: 'User',
      associatedKey: User.ID
    ));
  });
}

class _ReportedUserModelType extends amplify_core.ModelType<ReportedUser> {
  const _ReportedUserModelType();
  
  @override
  ReportedUser fromJson(Map<String, dynamic> jsonData) {
    return ReportedUser.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ReportedUser';
  }
}
