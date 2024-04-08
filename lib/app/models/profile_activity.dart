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

/** This is an auto generated class representing the ProfileActivity type in your schema. */
class ProfileActivity extends amplify_core.Model {
  static const classType = const _ProfileActivityModelType();
  final String id;
  final Profile? _profile;
  final Activity? _activity;
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
  
  Activity get activity {
    try {
      return _activity!;
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
  
  const ProfileActivity._internal({required this.id, required profile, required activity, createdAt, updatedAt}): _profile = profile, _activity = activity, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory ProfileActivity({String? id, required Profile profile, required Activity activity}) {
    return ProfileActivity._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      profile: profile,
      activity: activity);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileActivity &&
      id == other.id &&
      _profile == other._profile &&
      _activity == other._activity;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ProfileActivity {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("profile=" + (_profile != null ? _profile!.toString() : "null") + ", ");
    buffer.write("activity=" + (_activity != null ? _activity!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ProfileActivity copyWith({String? id, Profile? profile, Activity? activity}) {
    return ProfileActivity._internal(
      id: id ?? this.id,
      profile: profile ?? this.profile,
      activity: activity ?? this.activity);
  }
  
  ProfileActivity copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<Profile>? profile,
    ModelFieldValue<Activity>? activity
  }) {
    return ProfileActivity._internal(
      id: id == null ? this.id : id.value,
      profile: profile == null ? this.profile : profile.value,
      activity: activity == null ? this.activity : activity.value
    );
  }
  
  ProfileActivity.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _profile = json['profile'] != null
        ? Profile.fromJson(new Map<String, dynamic>.from(json['profile']))
        : null,
      _activity = json['activity'] != null
        ? Activity.fromJson(new Map<String, dynamic>.from(json['activity']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'profile': _profile?.toJson(), 'activity': _activity?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'profile': _profile,
    'activity': _activity,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final PROFILE = amplify_core.QueryField(
    fieldName: "profile",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Profile'));
  static final ACTIVITY = amplify_core.QueryField(
    fieldName: "activity",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Activity'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ProfileActivity";
    modelSchemaDefinition.pluralName = "ProfileActivities";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["profileID"], name: "byProfile"),
      amplify_core.ModelIndex(fields: const ["activityID"], name: "byActivity")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: ProfileActivity.PROFILE,
      isRequired: true,
      targetName: 'profileID',
      ofModelName: 'Profile'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: ProfileActivity.ACTIVITY,
      isRequired: true,
      targetName: 'activityID',
      ofModelName: 'Activity'
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

class _ProfileActivityModelType extends amplify_core.ModelType<ProfileActivity> {
  const _ProfileActivityModelType();
  
  @override
  ProfileActivity fromJson(Map<String, dynamic> jsonData) {
    return ProfileActivity.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'ProfileActivity';
  }
}
