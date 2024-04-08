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

/** This is an auto generated class representing the Provider type in your schema. */
class Provider extends amplify_core.Model {
  static const classType = const _ProviderModelType();
  final String id;
  final List<Professional>? _professionals;
  final String? _countryID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  List<Professional>? get professionals {
    return _professionals;
  }
  
  String get countryID {
    try {
      return _countryID!;
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
  
  const Provider._internal({required this.id, professionals, required countryID, createdAt, updatedAt}): _professionals = professionals, _countryID = countryID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Provider({String? id, List<Professional>? professionals, required String countryID}) {
    return Provider._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      professionals: professionals != null ? List<Professional>.unmodifiable(professionals) : professionals,
      countryID: countryID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Provider &&
      id == other.id &&
      DeepCollectionEquality().equals(_professionals, other._professionals) &&
      _countryID == other._countryID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Provider {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("countryID=" + "$_countryID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Provider copyWith({String? id, List<Professional>? professionals, String? countryID}) {
    return Provider._internal(
      id: id ?? this.id,
      professionals: professionals ?? this.professionals,
      countryID: countryID ?? this.countryID);
  }
  
  Provider copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<List<Professional>?>? professionals,
    ModelFieldValue<String>? countryID
  }) {
    return Provider._internal(
      id: id == null ? this.id : id.value,
      professionals: professionals == null ? this.professionals : professionals.value,
      countryID: countryID == null ? this.countryID : countryID.value
    );
  }
  
  Provider.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _professionals = json['professionals']?['items'] is List
        ? (json['professionals']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Professional.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _countryID = json['countryID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'professionals': _professionals?.map((Professional? e) => e?.toJson()).toList(), 'countryID': _countryID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'professionals': _professionals,
    'countryID': _countryID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PROFESSIONALS = amplify_core.QueryField(
    fieldName: "professionals",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Professional'));
  static final COUNTRYID = amplify_core.QueryField(fieldName: "countryID");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Provider";
    modelSchemaDefinition.pluralName = "Providers";
    
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
      amplify_core.ModelIndex(fields: const ["countryID"], name: "byCountry")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Provider.PROFESSIONALS,
      isRequired: false,
      ofModelName: 'Professional',
      associatedKey: Professional.PROVIDERID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Provider.COUNTRYID,
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

class _ProviderModelType extends amplify_core.ModelType<Provider> {
  const _ProviderModelType();
  
  @override
  Provider fromJson(Map<String, dynamic> jsonData) {
    return Provider.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Provider';
  }
}
