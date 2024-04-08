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

/** This is an auto generated class representing the ProfilePreference type in your schema. */
class ProfilePreference extends amplify_core.Model {
  static const classType = const _ProfilePreferenceModelType();
  final String id;
  final Preference? _preference;
  final Profile? _profile;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Preference get preference {
    try {
      return _preference!;
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
  
  const ProfilePreference._internal({required this.id, required preference, required profile, createdAt, updatedAt}): _preference = preference, _profile = profile, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ProfilePreference({String? id, required Preference preference, required Profile profile}) {
    return ProfilePreference._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      preference: preference,
      profile: profile);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfilePreference &&
      id == other.id &&
      _preference == other._preference &&
      _profile == other._profile;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProfilePreference {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("preference=" + (_preference != null ? _preference!.toString() : "null") + ", ");
    buffer.write("profile=" + (_profile != null ? _profile!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProfilePreference copyWith({String? id, Preference? preference, Profile? profile}) {
    return ProfilePreference._internal(
      id: id ?? this.id,
      preference: preference ?? this.preference,
      profile: profile ?? this.profile);
  }
  
  ProfilePreference copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<Preference>? preference,
    ModelFieldValue<Profile>? profile
  }) {
    return ProfilePreference._internal(
      id: id == null ? this.id : id.value,
      preference: preference == null ? this.preference : preference.value,
      profile: profile == null ? this.profile : profile.value
    );
  }
  
  ProfilePreference.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _preference = json['preference'] != null
        ? Preference.fromJson(new Map<String, dynamic>.from(json['preference']))
        : null,
      _profile = json['profile'] != null
        ? Profile.fromJson(new Map<String, dynamic>.from(json['profile']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'preference': _preference?.toJson(), 'profile': _profile?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'preference': _preference,
    'profile': _profile,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PREFERENCE = amplify_core.QueryField(
    fieldName: "preference",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Preference'));
  static final PROFILE = amplify_core.QueryField(
    fieldName: "profile",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Profile'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProfilePreference";
    modelSchemaDefinition.pluralName = "ProfilePreferences";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["preferenceID"], name: "byPreference"),
      amplify_core.ModelIndex(fields: const ["profileID"], name: "byProfile")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: ProfilePreference.PREFERENCE,
      isRequired: true,
      targetName: 'preferenceID',
      ofModelName: 'Preference'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: ProfilePreference.PROFILE,
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

class _ProfilePreferenceModelType extends amplify_core.ModelType<ProfilePreference> {
  const _ProfilePreferenceModelType();
  
  @override
  ProfilePreference fromJson(Map<String, dynamic> jsonData) {
    return ProfilePreference.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProfilePreference';
  }
}
