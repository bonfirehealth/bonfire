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

/** This is an auto generated class representing the ProfileSuggestion type in your schema. */
class ProfileSuggestion extends amplify_core.Model {
  static const classType = const _ProfileSuggestionModelType();
  final String id;
  final Suggestion? _suggestion;
  final Profile? _profile;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Suggestion get suggestion {
    try {
      return _suggestion!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const ProfileSuggestion._internal({required this.id, required suggestion, required profile, createdAt, updatedAt}): _suggestion = suggestion, _profile = profile, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ProfileSuggestion({String? id, required Suggestion suggestion, required Profile profile}) {
    return ProfileSuggestion._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      suggestion: suggestion,
      profile: profile);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileSuggestion &&
      id == other.id &&
      _suggestion == other._suggestion &&
      _profile == other._profile;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProfileSuggestion {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("suggestion=" + (_suggestion != null ? _suggestion!.toString() : "null") + ", ");
    buffer.write("profile=" + (_profile != null ? _profile!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProfileSuggestion copyWith({String? id, Suggestion? suggestion, Profile? profile}) {
    return ProfileSuggestion._internal(
      id: id ?? this.id,
      suggestion: suggestion ?? this.suggestion,
      profile: profile ?? this.profile);
  }
  
  ProfileSuggestion copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<Suggestion>? suggestion,
    ModelFieldValue<Profile>? profile
  }) {
    return ProfileSuggestion._internal(
      id: id == null ? this.id : id.value,
      suggestion: suggestion == null ? this.suggestion : suggestion.value,
      profile: profile == null ? this.profile : profile.value
    );
  }
  
  ProfileSuggestion.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _suggestion = json['suggestion'] != null
        ? Suggestion.fromJson(new Map<String, dynamic>.from(json['suggestion']))
        : null,
      _profile = json['profile'] != null
        ? Profile.fromJson(new Map<String, dynamic>.from(json['profile']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'suggestion': _suggestion?.toJson(), 'profile': _profile?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'suggestion': _suggestion,
    'profile': _profile,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final SUGGESTION = amplify_core.QueryField(
    fieldName: "suggestion",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Suggestion'));
  static final PROFILE = amplify_core.QueryField(
    fieldName: "profile",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Profile'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProfileSuggestion";
    modelSchemaDefinition.pluralName = "ProfileSuggestions";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["suggestionID"], name: "bySuggestion"),
      amplify_core.ModelIndex(fields: const ["profileID"], name: "byProfile")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: ProfileSuggestion.SUGGESTION,
      isRequired: true,
      targetName: 'suggestionID',
      ofModelName: 'Suggestion'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: ProfileSuggestion.PROFILE,
      isRequired: true,
      targetName: 'profileID',
      ofModelName: 'Profile'
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

class _ProfileSuggestionModelType extends amplify_core.ModelType<ProfileSuggestion> {
  const _ProfileSuggestionModelType();
  
  @override
  ProfileSuggestion fromJson(Map<String, dynamic> jsonData) {
    return ProfileSuggestion.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProfileSuggestion';
  }
}
