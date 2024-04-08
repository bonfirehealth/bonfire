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

/** This is an auto generated class representing the RecoveryCode type in your schema. */
class RecoveryCode extends amplify_core.Model {
  static const classType = const _RecoveryCodeModelType();
  final String id;
  final String? _hashedCode;
  final String? _ipAddress;
  final bool? _isUsed;
  final String? _userID;
  final String? _code;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get hashedCode {
    return _hashedCode;
  }
  
  String? get ipAddress {
    return _ipAddress;
  }
  
  bool? get isUsed {
    return _isUsed;
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
  
  String? get code {
    return _code;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const RecoveryCode._internal({required this.id, hashedCode, ipAddress, isUsed, required userID, code, createdAt, updatedAt}): _hashedCode = hashedCode, _ipAddress = ipAddress, _isUsed = isUsed, _userID = userID, _code = code, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory RecoveryCode({String? id, String? hashedCode, String? ipAddress, bool? isUsed, required String userID, String? code}) {
    return RecoveryCode._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      hashedCode: hashedCode,
      ipAddress: ipAddress,
      isUsed: isUsed,
      userID: userID,
      code: code);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecoveryCode &&
      id == other.id &&
      _hashedCode == other._hashedCode &&
      _ipAddress == other._ipAddress &&
      _isUsed == other._isUsed &&
      _userID == other._userID &&
      _code == other._code;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RecoveryCode {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("hashedCode=" + "$_hashedCode" + ", ");
    buffer.write("ipAddress=" + "$_ipAddress" + ", ");
    buffer.write("isUsed=" + (_isUsed != null ? _isUsed!.toString() : "null") + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("code=" + "$_code" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RecoveryCode copyWith({String? id, String? hashedCode, String? ipAddress, bool? isUsed, String? userID, String? code}) {
    return RecoveryCode._internal(
      id: id ?? this.id,
      hashedCode: hashedCode ?? this.hashedCode,
      ipAddress: ipAddress ?? this.ipAddress,
      isUsed: isUsed ?? this.isUsed,
      userID: userID ?? this.userID,
      code: code ?? this.code);
  }
  
  RecoveryCode copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? hashedCode,
    ModelFieldValue<String?>? ipAddress,
    ModelFieldValue<bool?>? isUsed,
    ModelFieldValue<String>? userID,
    ModelFieldValue<String?>? code
  }) {
    return RecoveryCode._internal(
      id: id == null ? this.id : id.value,
      hashedCode: hashedCode == null ? this.hashedCode : hashedCode.value,
      ipAddress: ipAddress == null ? this.ipAddress : ipAddress.value,
      isUsed: isUsed == null ? this.isUsed : isUsed.value,
      userID: userID == null ? this.userID : userID.value,
      code: code == null ? this.code : code.value
    );
  }
  
  RecoveryCode.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _hashedCode = json['hashedCode'],
      _ipAddress = json['ipAddress'],
      _isUsed = json['isUsed'],
      _userID = json['userID'],
      _code = json['code'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'hashedCode': _hashedCode, 'ipAddress': _ipAddress, 'isUsed': _isUsed, 'userID': _userID, 'code': _code, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'hashedCode': _hashedCode,
    'ipAddress': _ipAddress,
    'isUsed': _isUsed,
    'userID': _userID,
    'code': _code,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final HASHEDCODE = amplify_core.QueryField(fieldName: "hashedCode");
  static final IPADDRESS = amplify_core.QueryField(fieldName: "ipAddress");
  static final ISUSED = amplify_core.QueryField(fieldName: "isUsed");
  static final USERID = amplify_core.QueryField(fieldName: "userID");
  static final CODE = amplify_core.QueryField(fieldName: "code");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RecoveryCode";
    modelSchemaDefinition.pluralName = "RecoveryCodes";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        provider: amplify_core.AuthRuleProvider.IAM,
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
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: RecoveryCode.HASHEDCODE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: RecoveryCode.IPADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: RecoveryCode.ISUSED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: RecoveryCode.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: RecoveryCode.CODE,
      isRequired: false,
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

class _RecoveryCodeModelType extends amplify_core.ModelType<RecoveryCode> {
  const _RecoveryCodeModelType();
  
  @override
  RecoveryCode fromJson(Map<String, dynamic> jsonData) {
    return RecoveryCode.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'RecoveryCode';
  }
}
