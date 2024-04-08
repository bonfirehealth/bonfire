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

/** This is an auto generated class representing the SelfCareUsage type in your schema. */
class SelfCareUsage extends amplify_core.Model {
  static const classType = const _SelfCareUsageModelType();
  final String id;
  final Profile? _profile;
  final SelfCare? _selfCare;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Profile get profile {
    try {
      return _profile!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  SelfCare get selfCare {
    try {
      return _selfCare!;
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
  
  const SelfCareUsage._internal({required this.id, required profile, required selfCare, createdAt, updatedAt}): _profile = profile, _selfCare = selfCare, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SelfCareUsage({String? id, required Profile profile, required SelfCare selfCare}) {
    return SelfCareUsage._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      profile: profile,
      selfCare: selfCare);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SelfCareUsage &&
      id == other.id &&
      _profile == other._profile &&
      _selfCare == other._selfCare;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SelfCareUsage {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("profile=" + (_profile != null ? _profile!.toString() : "null") + ", ");
    buffer.write("selfCare=" + (_selfCare != null ? _selfCare!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SelfCareUsage copyWith({String? id, Profile? profile, SelfCare? selfCare}) {
    return SelfCareUsage._internal(
      id: id ?? this.id,
      profile: profile ?? this.profile,
      selfCare: selfCare ?? this.selfCare);
  }
  
  SelfCareUsage copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<Profile>? profile,
    ModelFieldValue<SelfCare>? selfCare
  }) {
    return SelfCareUsage._internal(
      id: id == null ? this.id : id.value,
      profile: profile == null ? this.profile : profile.value,
      selfCare: selfCare == null ? this.selfCare : selfCare.value
    );
  }
  
  SelfCareUsage.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _profile = json['profile'] != null
        ? Profile.fromJson(new Map<String, dynamic>.from(json['profile']))
        : null,
      _selfCare = json['selfCare'] != null
        ? SelfCare.fromJson(new Map<String, dynamic>.from(json['selfCare']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'profile': _profile?.toJson(), 'selfCare': _selfCare?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'profile': _profile,
    'selfCare': _selfCare,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PROFILE = amplify_core.QueryField(
    fieldName: "profile",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Profile'));
  static final SELFCARE = amplify_core.QueryField(
    fieldName: "selfCare",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'SelfCare'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SelfCareUsage";
    modelSchemaDefinition.pluralName = "SelfCareUsages";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["profileID"], name: "byProfile"),
      amplify_core.ModelIndex(fields: const ["selfCareID"], name: "bySelfCare")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: SelfCareUsage.PROFILE,
      isRequired: true,
      targetName: 'profileID',
      ofModelName: 'Profile'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: SelfCareUsage.SELFCARE,
      isRequired: true,
      targetName: 'selfCareID',
      ofModelName: 'SelfCare'
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

class _SelfCareUsageModelType extends amplify_core.ModelType<SelfCareUsage> {
  const _SelfCareUsageModelType();
  
  @override
  SelfCareUsage fromJson(Map<String, dynamic> jsonData) {
    return SelfCareUsage.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'SelfCareUsage';
  }
}
