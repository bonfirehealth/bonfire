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

/** This is an auto generated class representing the Country type in your schema. */
class Country extends amplify_core.Model {
  static const classType = const _CountryModelType();
  final String id;
  final String? _description;
  final String? _name;
  final String? _countryCode;
  final String? _countryDialCode;
  final List<Provider>? _providers;
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
  
  String? get countryCode {
    return _countryCode;
  }
  
  String? get countryDialCode {
    return _countryDialCode;
  }
  
  List<Provider>? get providers {
    return _providers;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Country._internal({required this.id, description, name, countryCode, countryDialCode, providers, createdAt, updatedAt}): _description = description, _name = name, _countryCode = countryCode, _countryDialCode = countryDialCode, _providers = providers, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Country({String? id, String? description, String? name, String? countryCode, String? countryDialCode, List<Provider>? providers}) {
    return Country._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      description: description,
      name: name,
      countryCode: countryCode,
      countryDialCode: countryDialCode,
      providers: providers != null ? List<Provider>.unmodifiable(providers) : providers);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Country &&
      id == other.id &&
      _description == other._description &&
      _name == other._name &&
      _countryCode == other._countryCode &&
      _countryDialCode == other._countryDialCode &&
      DeepCollectionEquality().equals(_providers, other._providers);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Country {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("countryCode=" + "$_countryCode" + ", ");
    buffer.write("countryDialCode=" + "$_countryDialCode" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Country copyWith({String? id, String? description, String? name, String? countryCode, String? countryDialCode, List<Provider>? providers}) {
    return Country._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      countryDialCode: countryDialCode ?? this.countryDialCode,
      providers: providers ?? this.providers);
  }
  
  Country copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? countryCode,
    ModelFieldValue<String?>? countryDialCode,
    ModelFieldValue<List<Provider>?>? providers
  }) {
    return Country._internal(
      id: id == null ? this.id : id.value,
      description: description == null ? this.description : description.value,
      name: name == null ? this.name : name.value,
      countryCode: countryCode == null ? this.countryCode : countryCode.value,
      countryDialCode: countryDialCode == null ? this.countryDialCode : countryDialCode.value,
      providers: providers == null ? this.providers : providers.value
    );
  }
  
  Country.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'],
      _name = json['name'],
      _countryCode = json['countryCode'],
      _countryDialCode = json['countryDialCode'],
      _providers = json['providers']?['items'] is List
        ? (json['providers']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Provider.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description, 'name': _name, 'countryCode': _countryCode, 'countryDialCode': _countryDialCode, 'providers': _providers?.map((Provider? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'description': _description,
    'name': _name,
    'countryCode': _countryCode,
    'countryDialCode': _countryDialCode,
    'providers': _providers,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final COUNTRYCODE = amplify_core.QueryField(fieldName: "countryCode");
  static final COUNTRYDIALCODE = amplify_core.QueryField(fieldName: "countryDialCode");
  static final PROVIDERS = amplify_core.QueryField(
    fieldName: "providers",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Provider'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Country";
    modelSchemaDefinition.pluralName = "Countries";
    
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Country.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Country.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Country.COUNTRYCODE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Country.COUNTRYDIALCODE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Country.PROVIDERS,
      isRequired: false,
      ofModelName: 'Provider',
      associatedKey: Provider.COUNTRYID
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

class _CountryModelType extends amplify_core.ModelType<Country> {
  const _CountryModelType();
  
  @override
  Country fromJson(Map<String, dynamic> jsonData) {
    return Country.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Country';
  }
}
