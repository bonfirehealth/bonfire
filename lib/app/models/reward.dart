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

/** This is an auto generated class representing the Reward type in your schema. */
class Reward extends amplify_core.Model {
  static const classType = const _RewardModelType();
  final String id;
  final String? _description;
  final String? _name;
  final int? _rewardCredits;
  final int? _maxNumberOfRedemptions;
  final RewardType? _rewardType;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _rewardRewardTypeId;

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
  
  int? get rewardCredits {
    return _rewardCredits;
  }
  
  int? get maxNumberOfRedemptions {
    return _maxNumberOfRedemptions;
  }
  
  RewardType? get rewardType {
    return _rewardType;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get rewardRewardTypeId {
    return _rewardRewardTypeId;
  }
  
  const Reward._internal({required this.id, description, name, rewardCredits, maxNumberOfRedemptions, rewardType, createdAt, updatedAt, rewardRewardTypeId}): _description = description, _name = name, _rewardCredits = rewardCredits, _maxNumberOfRedemptions = maxNumberOfRedemptions, _rewardType = rewardType, _createdAt = createdAt, _updatedAt = updatedAt, _rewardRewardTypeId = rewardRewardTypeId;
  
  factory Reward({String? id, String? description, String? name, int? rewardCredits, int? maxNumberOfRedemptions, RewardType? rewardType, String? rewardRewardTypeId}) {
    return Reward._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      description: description,
      name: name,
      rewardCredits: rewardCredits,
      maxNumberOfRedemptions: maxNumberOfRedemptions,
      rewardType: rewardType,
      rewardRewardTypeId: rewardRewardTypeId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reward &&
      id == other.id &&
      _description == other._description &&
      _name == other._name &&
      _rewardCredits == other._rewardCredits &&
      _maxNumberOfRedemptions == other._maxNumberOfRedemptions &&
      _rewardType == other._rewardType &&
      _rewardRewardTypeId == other._rewardRewardTypeId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Reward {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("rewardCredits=" + (_rewardCredits != null ? _rewardCredits!.toString() : "null") + ", ");
    buffer.write("maxNumberOfRedemptions=" + (_maxNumberOfRedemptions != null ? _maxNumberOfRedemptions!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("rewardRewardTypeId=" + "$_rewardRewardTypeId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Reward copyWith({String? id, String? description, String? name, int? rewardCredits, int? maxNumberOfRedemptions, RewardType? rewardType, String? rewardRewardTypeId}) {
    return Reward._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      name: name ?? this.name,
      rewardCredits: rewardCredits ?? this.rewardCredits,
      maxNumberOfRedemptions: maxNumberOfRedemptions ?? this.maxNumberOfRedemptions,
      rewardType: rewardType ?? this.rewardType,
      rewardRewardTypeId: rewardRewardTypeId ?? this.rewardRewardTypeId);
  }
  
  Reward copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? name,
    ModelFieldValue<int?>? rewardCredits,
    ModelFieldValue<int?>? maxNumberOfRedemptions,
    ModelFieldValue<RewardType?>? rewardType,
    ModelFieldValue<String?>? rewardRewardTypeId
  }) {
    return Reward._internal(
      id: id == null ? this.id : id.value,
      description: description == null ? this.description : description.value,
      name: name == null ? this.name : name.value,
      rewardCredits: rewardCredits == null ? this.rewardCredits : rewardCredits.value,
      maxNumberOfRedemptions: maxNumberOfRedemptions == null ? this.maxNumberOfRedemptions : maxNumberOfRedemptions.value,
      rewardType: rewardType == null ? this.rewardType : rewardType.value,
      rewardRewardTypeId: rewardRewardTypeId == null ? this.rewardRewardTypeId : rewardRewardTypeId.value
    );
  }
  
  Reward.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'],
      _name = json['name'],
      _rewardCredits = (json['rewardCredits'] as num?)?.toInt(),
      _maxNumberOfRedemptions = (json['maxNumberOfRedemptions'] as num?)?.toInt(),
      _rewardType = json['rewardType'] != null
        ? RewardType.fromJson(new Map<String, dynamic>.from(json['rewardType']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _rewardRewardTypeId = json['rewardRewardTypeId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description, 'name': _name, 'rewardCredits': _rewardCredits, 'maxNumberOfRedemptions': _maxNumberOfRedemptions, 'rewardType': _rewardType?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'rewardRewardTypeId': _rewardRewardTypeId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'description': _description,
    'name': _name,
    'rewardCredits': _rewardCredits,
    'maxNumberOfRedemptions': _maxNumberOfRedemptions,
    'rewardType': _rewardType,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'rewardRewardTypeId': _rewardRewardTypeId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final REWARDCREDITS = amplify_core.QueryField(fieldName: "rewardCredits");
  static final MAXNUMBEROFREDEMPTIONS = amplify_core.QueryField(fieldName: "maxNumberOfRedemptions");
  static final REWARDTYPE = amplify_core.QueryField(
    fieldName: "rewardType",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'RewardType'));
  static final REWARDREWARDTYPEID = amplify_core.QueryField(fieldName: "rewardRewardTypeId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Reward";
    modelSchemaDefinition.pluralName = "Rewards";
    
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
      key: Reward.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Reward.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Reward.REWARDCREDITS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Reward.MAXNUMBEROFREDEMPTIONS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Reward.REWARDTYPE,
      isRequired: false,
      ofModelName: 'RewardType',
      associatedKey: RewardType.ID
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Reward.REWARDREWARDTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _RewardModelType extends amplify_core.ModelType<Reward> {
  const _RewardModelType();
  
  @override
  Reward fromJson(Map<String, dynamic> jsonData) {
    return Reward.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Reward';
  }
}
