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

/** This is an auto generated class representing the Suggestion type in your schema. */
class Suggestion extends amplify_core.Model {
  static const classType = const _SuggestionModelType();
  final String id;
  final String? _description;
  final String? _icon;
  final int? _index;
  final bool? _isHidden;
  final String? _name;
  final int? _numberOfClicks;
  final int? _numberOfViews;
  final String? _routePath;
  final String? _stressLevel;
  final String? _url;
  final String? _uri;
  final String? _organisationID;
  final Activity? _activity;
  final SuggestionType? _suggestionType;
  final SelfCare? _selfCare;
  final List<ProfileSuggestion>? _profiles;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _suggestionActivityId;
  final String? _suggestionSuggestionTypeId;
  final String? _suggestionSelfCareId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get description {
    return _description;
  }
  
  String? get icon {
    return _icon;
  }
  
  int? get index {
    return _index;
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
  
  int? get numberOfViews {
    return _numberOfViews;
  }
  
  String? get routePath {
    return _routePath;
  }
  
  String? get stressLevel {
    return _stressLevel;
  }
  
  String? get url {
    return _url;
  }
  
  String? get uri {
    return _uri;
  }
  
  String get organisationID {
    try {
      return _organisationID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Activity? get activity {
    return _activity;
  }
  
  SuggestionType? get suggestionType {
    return _suggestionType;
  }
  
  SelfCare? get selfCare {
    return _selfCare;
  }
  
  List<ProfileSuggestion>? get profiles {
    return _profiles;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get suggestionActivityId {
    return _suggestionActivityId;
  }
  
  String? get suggestionSuggestionTypeId {
    return _suggestionSuggestionTypeId;
  }
  
  String? get suggestionSelfCareId {
    return _suggestionSelfCareId;
  }
  
  const Suggestion._internal({required this.id, description, icon, index, isHidden, name, numberOfClicks, numberOfViews, routePath, stressLevel, url, uri, required organisationID, activity, suggestionType, selfCare, profiles, createdAt, updatedAt, suggestionActivityId, suggestionSuggestionTypeId, suggestionSelfCareId}): _description = description, _icon = icon, _index = index, _isHidden = isHidden, _name = name, _numberOfClicks = numberOfClicks, _numberOfViews = numberOfViews, _routePath = routePath, _stressLevel = stressLevel, _url = url, _uri = uri, _organisationID = organisationID, _activity = activity, _suggestionType = suggestionType, _selfCare = selfCare, _profiles = profiles, _createdAt = createdAt, _updatedAt = updatedAt, _suggestionActivityId = suggestionActivityId, _suggestionSuggestionTypeId = suggestionSuggestionTypeId, _suggestionSelfCareId = suggestionSelfCareId;
  
  factory Suggestion({String? id, String? description, String? icon, int? index, bool? isHidden, String? name, int? numberOfClicks, int? numberOfViews, String? routePath, String? stressLevel, String? url, String? uri, required String organisationID, Activity? activity, SuggestionType? suggestionType, SelfCare? selfCare, List<ProfileSuggestion>? profiles, String? suggestionActivityId, String? suggestionSuggestionTypeId, String? suggestionSelfCareId}) {
    return Suggestion._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      description: description,
      icon: icon,
      index: index,
      isHidden: isHidden,
      name: name,
      numberOfClicks: numberOfClicks,
      numberOfViews: numberOfViews,
      routePath: routePath,
      stressLevel: stressLevel,
      url: url,
      uri: uri,
      organisationID: organisationID,
      activity: activity,
      suggestionType: suggestionType,
      selfCare: selfCare,
      profiles: profiles != null ? List<ProfileSuggestion>.unmodifiable(profiles) : profiles,
      suggestionActivityId: suggestionActivityId,
      suggestionSuggestionTypeId: suggestionSuggestionTypeId,
      suggestionSelfCareId: suggestionSelfCareId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Suggestion &&
      id == other.id &&
      _description == other._description &&
      _icon == other._icon &&
      _index == other._index &&
      _isHidden == other._isHidden &&
      _name == other._name &&
      _numberOfClicks == other._numberOfClicks &&
      _numberOfViews == other._numberOfViews &&
      _routePath == other._routePath &&
      _stressLevel == other._stressLevel &&
      _url == other._url &&
      _uri == other._uri &&
      _organisationID == other._organisationID &&
      _activity == other._activity &&
      _suggestionType == other._suggestionType &&
      _selfCare == other._selfCare &&
      DeepCollectionEquality().equals(_profiles, other._profiles) &&
      _suggestionActivityId == other._suggestionActivityId &&
      _suggestionSuggestionTypeId == other._suggestionSuggestionTypeId &&
      _suggestionSelfCareId == other._suggestionSelfCareId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Suggestion {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("icon=" + "$_icon" + ", ");
    buffer.write("index=" + (_index != null ? _index!.toString() : "null") + ", ");
    buffer.write("isHidden=" + (_isHidden != null ? _isHidden!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("numberOfClicks=" + (_numberOfClicks != null ? _numberOfClicks!.toString() : "null") + ", ");
    buffer.write("numberOfViews=" + (_numberOfViews != null ? _numberOfViews!.toString() : "null") + ", ");
    buffer.write("routePath=" + "$_routePath" + ", ");
    buffer.write("stressLevel=" + "$_stressLevel" + ", ");
    buffer.write("url=" + "$_url" + ", ");
    buffer.write("uri=" + "$_uri" + ", ");
    buffer.write("organisationID=" + "$_organisationID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("suggestionActivityId=" + "$_suggestionActivityId" + ", ");
    buffer.write("suggestionSuggestionTypeId=" + "$_suggestionSuggestionTypeId" + ", ");
    buffer.write("suggestionSelfCareId=" + "$_suggestionSelfCareId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Suggestion copyWith({String? id, String? description, String? icon, int? index, bool? isHidden, String? name, int? numberOfClicks, int? numberOfViews, String? routePath, String? stressLevel, String? url, String? uri, String? organisationID, Activity? activity, SuggestionType? suggestionType, SelfCare? selfCare, List<ProfileSuggestion>? profiles, String? suggestionActivityId, String? suggestionSuggestionTypeId, String? suggestionSelfCareId}) {
    return Suggestion._internal(
      id: id ?? this.id,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      index: index ?? this.index,
      isHidden: isHidden ?? this.isHidden,
      name: name ?? this.name,
      numberOfClicks: numberOfClicks ?? this.numberOfClicks,
      numberOfViews: numberOfViews ?? this.numberOfViews,
      routePath: routePath ?? this.routePath,
      stressLevel: stressLevel ?? this.stressLevel,
      url: url ?? this.url,
      uri: uri ?? this.uri,
      organisationID: organisationID ?? this.organisationID,
      activity: activity ?? this.activity,
      suggestionType: suggestionType ?? this.suggestionType,
      selfCare: selfCare ?? this.selfCare,
      profiles: profiles ?? this.profiles,
      suggestionActivityId: suggestionActivityId ?? this.suggestionActivityId,
      suggestionSuggestionTypeId: suggestionSuggestionTypeId ?? this.suggestionSuggestionTypeId,
      suggestionSelfCareId: suggestionSelfCareId ?? this.suggestionSelfCareId);
  }
  
  Suggestion copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? icon,
    ModelFieldValue<int?>? index,
    ModelFieldValue<bool?>? isHidden,
    ModelFieldValue<String?>? name,
    ModelFieldValue<int?>? numberOfClicks,
    ModelFieldValue<int?>? numberOfViews,
    ModelFieldValue<String?>? routePath,
    ModelFieldValue<String?>? stressLevel,
    ModelFieldValue<String?>? url,
    ModelFieldValue<String?>? uri,
    ModelFieldValue<String>? organisationID,
    ModelFieldValue<Activity?>? activity,
    ModelFieldValue<SuggestionType?>? suggestionType,
    ModelFieldValue<SelfCare?>? selfCare,
    ModelFieldValue<List<ProfileSuggestion>?>? profiles,
    ModelFieldValue<String?>? suggestionActivityId,
    ModelFieldValue<String?>? suggestionSuggestionTypeId,
    ModelFieldValue<String?>? suggestionSelfCareId
  }) {
    return Suggestion._internal(
      id: id == null ? this.id : id.value,
      description: description == null ? this.description : description.value,
      icon: icon == null ? this.icon : icon.value,
      index: index == null ? this.index : index.value,
      isHidden: isHidden == null ? this.isHidden : isHidden.value,
      name: name == null ? this.name : name.value,
      numberOfClicks: numberOfClicks == null ? this.numberOfClicks : numberOfClicks.value,
      numberOfViews: numberOfViews == null ? this.numberOfViews : numberOfViews.value,
      routePath: routePath == null ? this.routePath : routePath.value,
      stressLevel: stressLevel == null ? this.stressLevel : stressLevel.value,
      url: url == null ? this.url : url.value,
      uri: uri == null ? this.uri : uri.value,
      organisationID: organisationID == null ? this.organisationID : organisationID.value,
      activity: activity == null ? this.activity : activity.value,
      suggestionType: suggestionType == null ? this.suggestionType : suggestionType.value,
      selfCare: selfCare == null ? this.selfCare : selfCare.value,
      profiles: profiles == null ? this.profiles : profiles.value,
      suggestionActivityId: suggestionActivityId == null ? this.suggestionActivityId : suggestionActivityId.value,
      suggestionSuggestionTypeId: suggestionSuggestionTypeId == null ? this.suggestionSuggestionTypeId : suggestionSuggestionTypeId.value,
      suggestionSelfCareId: suggestionSelfCareId == null ? this.suggestionSelfCareId : suggestionSelfCareId.value
    );
  }
  
  Suggestion.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _description = json['description'],
      _icon = json['icon'],
      _index = (json['index'] as num?)?.toInt(),
      _isHidden = json['isHidden'],
      _name = json['name'],
      _numberOfClicks = (json['numberOfClicks'] as num?)?.toInt(),
      _numberOfViews = (json['numberOfViews'] as num?)?.toInt(),
      _routePath = json['routePath'],
      _stressLevel = json['stressLevel'],
      _url = json['url'],
      _uri = json['uri'],
      _organisationID = json['organisationID'],
      _activity = json['activity'] != null
        ? Activity.fromJson(new Map<String, dynamic>.from(json['activity']))
        : null,
      _suggestionType = json['suggestionType'] != null
        ? SuggestionType.fromJson(new Map<String, dynamic>.from(json['suggestionType']))
        : null,
      _selfCare = json['selfCare'] != null
        ? SelfCare.fromJson(new Map<String, dynamic>.from(json['selfCare']))
        : null,
      _profiles = json['profiles']?['items'] is List
        ? (json['profiles']?['items'] as List)
          .where((e) => e != null)
          .map((e) => ProfileSuggestion.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _suggestionActivityId = json['suggestionActivityId'],
      _suggestionSuggestionTypeId = json['suggestionSuggestionTypeId'],
      _suggestionSelfCareId = json['suggestionSelfCareId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'description': _description, 'icon': _icon, 'index': _index, 'isHidden': _isHidden, 'name': _name, 'numberOfClicks': _numberOfClicks, 'numberOfViews': _numberOfViews, 'routePath': _routePath, 'stressLevel': _stressLevel, 'url': _url, 'uri': _uri, 'organisationID': _organisationID, 'activity': _activity?.toJson(), 'suggestionType': _suggestionType?.toJson(), 'selfCare': _selfCare?.toJson(), 'profiles': _profiles?.map((ProfileSuggestion? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'suggestionActivityId': _suggestionActivityId, 'suggestionSuggestionTypeId': _suggestionSuggestionTypeId, 'suggestionSelfCareId': _suggestionSelfCareId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'description': _description,
    'icon': _icon,
    'index': _index,
    'isHidden': _isHidden,
    'name': _name,
    'numberOfClicks': _numberOfClicks,
    'numberOfViews': _numberOfViews,
    'routePath': _routePath,
    'stressLevel': _stressLevel,
    'url': _url,
    'uri': _uri,
    'organisationID': _organisationID,
    'activity': _activity,
    'suggestionType': _suggestionType,
    'selfCare': _selfCare,
    'profiles': _profiles,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'suggestionActivityId': _suggestionActivityId,
    'suggestionSuggestionTypeId': _suggestionSuggestionTypeId,
    'suggestionSelfCareId': _suggestionSelfCareId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final ICON = amplify_core.QueryField(fieldName: "icon");
  static final INDEX = amplify_core.QueryField(fieldName: "index");
  static final ISHIDDEN = amplify_core.QueryField(fieldName: "isHidden");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final NUMBEROFCLICKS = amplify_core.QueryField(fieldName: "numberOfClicks");
  static final NUMBEROFVIEWS = amplify_core.QueryField(fieldName: "numberOfViews");
  static final ROUTEPATH = amplify_core.QueryField(fieldName: "routePath");
  static final STRESSLEVEL = amplify_core.QueryField(fieldName: "stressLevel");
  static final URL = amplify_core.QueryField(fieldName: "url");
  static final URI = amplify_core.QueryField(fieldName: "uri");
  static final ORGANISATIONID = amplify_core.QueryField(fieldName: "organisationID");
  static final ACTIVITY = amplify_core.QueryField(
    fieldName: "activity",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Activity'));
  static final SUGGESTIONTYPE = amplify_core.QueryField(
    fieldName: "suggestionType",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'SuggestionType'));
  static final SELFCARE = amplify_core.QueryField(
    fieldName: "selfCare",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'SelfCare'));
  static final PROFILES = amplify_core.QueryField(
    fieldName: "profiles",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ProfileSuggestion'));
  static final SUGGESTIONACTIVITYID = amplify_core.QueryField(fieldName: "suggestionActivityId");
  static final SUGGESTIONSUGGESTIONTYPEID = amplify_core.QueryField(fieldName: "suggestionSuggestionTypeId");
  static final SUGGESTIONSELFCAREID = amplify_core.QueryField(fieldName: "suggestionSelfCareId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Suggestion";
    modelSchemaDefinition.pluralName = "Suggestions";
    
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
      amplify_core.ModelIndex(fields: const ["organisationID", "index"], name: "byOrganisation")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.ICON,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.INDEX,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.ISHIDDEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.NUMBEROFCLICKS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.NUMBEROFVIEWS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.ROUTEPATH,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.STRESSLEVEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.URL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.URI,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.ORGANISATIONID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Suggestion.ACTIVITY,
      isRequired: false,
      ofModelName: 'Activity',
      associatedKey: Activity.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Suggestion.SUGGESTIONTYPE,
      isRequired: false,
      ofModelName: 'SuggestionType',
      associatedKey: SuggestionType.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Suggestion.SELFCARE,
      isRequired: false,
      ofModelName: 'SelfCare',
      associatedKey: SelfCare.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Suggestion.PROFILES,
      isRequired: false,
      ofModelName: 'ProfileSuggestion',
      associatedKey: ProfileSuggestion.SUGGESTION
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
      key: Suggestion.SUGGESTIONACTIVITYID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.SUGGESTIONSUGGESTIONTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Suggestion.SUGGESTIONSELFCAREID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _SuggestionModelType extends amplify_core.ModelType<Suggestion> {
  const _SuggestionModelType();
  
  @override
  Suggestion fromJson(Map<String, dynamic> jsonData) {
    return Suggestion.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Suggestion';
  }
}
