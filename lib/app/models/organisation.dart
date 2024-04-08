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

/** This is an auto generated class representing the Organisation type in your schema. */
class Organisation extends amplify_core.Model {
  static const classType = const _OrganisationModelType();
  final String id;
  final String? _code;
  final OrganisationType? _organisationType;
  final List<OrganisationUser>? _users;
  final String? _name;
  final int? _totalNumberOfActiveUsers;
  final int? _totalNumberOfUsers;
  final int? _totalNumberOfCompletedScreenings;
  final int? _totalNumberOfIncompletedScreenings;
  final int? _totalNumberOfSuggestionsClicked;
  final int? _totalNumberOfSuggestionsViewed;
  final String? _logoURL;
  final String? _logoBase64;
  final String? _themeColor;
  final String? _token;
  final String? _secretCode;
  final String? _telegramId;
  final List<AggregateHourOrganisationAssessment>? _aggregateHourOrganisationAssessments;
  final List<AggregateDayOrganisationAssessment>? _aggregateDayOrganisationAssessments;
  final List<AggregateMonthOrganisationAssessment>? _aggregateMonthOrganisationAssessments;
  final List<AggregateYearOrganisationAssessment>? _aggregateYearOrganisationAssessments;
  final List<Group>? _groups;
  final List<GroupTag>? _groupTags;
  final List<GroupType>? _groupTypes;
  final List<Suggestion>? _suggestions;
  final List<ReportedUser>? _reportedUsers;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _organisationOrganisationTypeId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get code {
    try {
      return _code!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  OrganisationType? get organisationType {
    return _organisationType;
  }
  
  List<OrganisationUser>? get users {
    return _users;
  }
  
  String? get name {
    return _name;
  }
  
  int? get totalNumberOfActiveUsers {
    return _totalNumberOfActiveUsers;
  }
  
  int? get totalNumberOfUsers {
    return _totalNumberOfUsers;
  }
  
  int? get totalNumberOfCompletedScreenings {
    return _totalNumberOfCompletedScreenings;
  }
  
  int? get totalNumberOfIncompletedScreenings {
    return _totalNumberOfIncompletedScreenings;
  }
  
  int? get totalNumberOfSuggestionsClicked {
    return _totalNumberOfSuggestionsClicked;
  }
  
  int? get totalNumberOfSuggestionsViewed {
    return _totalNumberOfSuggestionsViewed;
  }
  
  String? get logoURL {
    return _logoURL;
  }
  
  String? get logoBase64 {
    return _logoBase64;
  }
  
  String? get themeColor {
    return _themeColor;
  }
  
  String? get token {
    return _token;
  }
  
  String? get secretCode {
    return _secretCode;
  }
  
  String? get telegramId {
    return _telegramId;
  }
  
  List<AggregateHourOrganisationAssessment>? get aggregateHourOrganisationAssessments {
    return _aggregateHourOrganisationAssessments;
  }
  
  List<AggregateDayOrganisationAssessment>? get aggregateDayOrganisationAssessments {
    return _aggregateDayOrganisationAssessments;
  }
  
  List<AggregateMonthOrganisationAssessment>? get aggregateMonthOrganisationAssessments {
    return _aggregateMonthOrganisationAssessments;
  }
  
  List<AggregateYearOrganisationAssessment>? get aggregateYearOrganisationAssessments {
    return _aggregateYearOrganisationAssessments;
  }
  
  List<Group>? get groups {
    return _groups;
  }
  
  List<GroupTag>? get groupTags {
    return _groupTags;
  }
  
  List<GroupType>? get groupTypes {
    return _groupTypes;
  }
  
  List<Suggestion>? get suggestions {
    return _suggestions;
  }
  
  List<ReportedUser>? get reportedUsers {
    return _reportedUsers;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get organisationOrganisationTypeId {
    return _organisationOrganisationTypeId;
  }
  
  const Organisation._internal({required this.id, required code, organisationType, users, name, totalNumberOfActiveUsers, totalNumberOfUsers, totalNumberOfCompletedScreenings, totalNumberOfIncompletedScreenings, totalNumberOfSuggestionsClicked, totalNumberOfSuggestionsViewed, logoURL, logoBase64, themeColor, token, secretCode, telegramId, aggregateHourOrganisationAssessments, aggregateDayOrganisationAssessments, aggregateMonthOrganisationAssessments, aggregateYearOrganisationAssessments, groups, groupTags, groupTypes, suggestions, reportedUsers, createdAt, updatedAt, organisationOrganisationTypeId}): _code = code, _organisationType = organisationType, _users = users, _name = name, _totalNumberOfActiveUsers = totalNumberOfActiveUsers, _totalNumberOfUsers = totalNumberOfUsers, _totalNumberOfCompletedScreenings = totalNumberOfCompletedScreenings, _totalNumberOfIncompletedScreenings = totalNumberOfIncompletedScreenings, _totalNumberOfSuggestionsClicked = totalNumberOfSuggestionsClicked, _totalNumberOfSuggestionsViewed = totalNumberOfSuggestionsViewed, _logoURL = logoURL, _logoBase64 = logoBase64, _themeColor = themeColor, _token = token, _secretCode = secretCode, _telegramId = telegramId, _aggregateHourOrganisationAssessments = aggregateHourOrganisationAssessments, _aggregateDayOrganisationAssessments = aggregateDayOrganisationAssessments, _aggregateMonthOrganisationAssessments = aggregateMonthOrganisationAssessments, _aggregateYearOrganisationAssessments = aggregateYearOrganisationAssessments, _groups = groups, _groupTags = groupTags, _groupTypes = groupTypes, _suggestions = suggestions, _reportedUsers = reportedUsers, _createdAt = createdAt, _updatedAt = updatedAt, _organisationOrganisationTypeId = organisationOrganisationTypeId;
  
  factory Organisation({String? id, required String code, OrganisationType? organisationType, List<OrganisationUser>? users, String? name, int? totalNumberOfActiveUsers, int? totalNumberOfUsers, int? totalNumberOfCompletedScreenings, int? totalNumberOfIncompletedScreenings, int? totalNumberOfSuggestionsClicked, int? totalNumberOfSuggestionsViewed, String? logoURL, String? logoBase64, String? themeColor, String? token, String? secretCode, String? telegramId, List<AggregateHourOrganisationAssessment>? aggregateHourOrganisationAssessments, List<AggregateDayOrganisationAssessment>? aggregateDayOrganisationAssessments, List<AggregateMonthOrganisationAssessment>? aggregateMonthOrganisationAssessments, List<AggregateYearOrganisationAssessment>? aggregateYearOrganisationAssessments, List<Group>? groups, List<GroupTag>? groupTags, List<GroupType>? groupTypes, List<Suggestion>? suggestions, List<ReportedUser>? reportedUsers, String? organisationOrganisationTypeId}) {
    return Organisation._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      code: code,
      organisationType: organisationType,
      users: users != null ? List<OrganisationUser>.unmodifiable(users) : users,
      name: name,
      totalNumberOfActiveUsers: totalNumberOfActiveUsers,
      totalNumberOfUsers: totalNumberOfUsers,
      totalNumberOfCompletedScreenings: totalNumberOfCompletedScreenings,
      totalNumberOfIncompletedScreenings: totalNumberOfIncompletedScreenings,
      totalNumberOfSuggestionsClicked: totalNumberOfSuggestionsClicked,
      totalNumberOfSuggestionsViewed: totalNumberOfSuggestionsViewed,
      logoURL: logoURL,
      logoBase64: logoBase64,
      themeColor: themeColor,
      token: token,
      secretCode: secretCode,
      telegramId: telegramId,
      aggregateHourOrganisationAssessments: aggregateHourOrganisationAssessments != null ? List<AggregateHourOrganisationAssessment>.unmodifiable(aggregateHourOrganisationAssessments) : aggregateHourOrganisationAssessments,
      aggregateDayOrganisationAssessments: aggregateDayOrganisationAssessments != null ? List<AggregateDayOrganisationAssessment>.unmodifiable(aggregateDayOrganisationAssessments) : aggregateDayOrganisationAssessments,
      aggregateMonthOrganisationAssessments: aggregateMonthOrganisationAssessments != null ? List<AggregateMonthOrganisationAssessment>.unmodifiable(aggregateMonthOrganisationAssessments) : aggregateMonthOrganisationAssessments,
      aggregateYearOrganisationAssessments: aggregateYearOrganisationAssessments != null ? List<AggregateYearOrganisationAssessment>.unmodifiable(aggregateYearOrganisationAssessments) : aggregateYearOrganisationAssessments,
      groups: groups != null ? List<Group>.unmodifiable(groups) : groups,
      groupTags: groupTags != null ? List<GroupTag>.unmodifiable(groupTags) : groupTags,
      groupTypes: groupTypes != null ? List<GroupType>.unmodifiable(groupTypes) : groupTypes,
      suggestions: suggestions != null ? List<Suggestion>.unmodifiable(suggestions) : suggestions,
      reportedUsers: reportedUsers != null ? List<ReportedUser>.unmodifiable(reportedUsers) : reportedUsers,
      organisationOrganisationTypeId: organisationOrganisationTypeId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Organisation &&
      id == other.id &&
      _code == other._code &&
      _organisationType == other._organisationType &&
      DeepCollectionEquality().equals(_users, other._users) &&
      _name == other._name &&
      _totalNumberOfActiveUsers == other._totalNumberOfActiveUsers &&
      _totalNumberOfUsers == other._totalNumberOfUsers &&
      _totalNumberOfCompletedScreenings == other._totalNumberOfCompletedScreenings &&
      _totalNumberOfIncompletedScreenings == other._totalNumberOfIncompletedScreenings &&
      _totalNumberOfSuggestionsClicked == other._totalNumberOfSuggestionsClicked &&
      _totalNumberOfSuggestionsViewed == other._totalNumberOfSuggestionsViewed &&
      _logoURL == other._logoURL &&
      _logoBase64 == other._logoBase64 &&
      _themeColor == other._themeColor &&
      _token == other._token &&
      _secretCode == other._secretCode &&
      _telegramId == other._telegramId &&
      DeepCollectionEquality().equals(_aggregateHourOrganisationAssessments, other._aggregateHourOrganisationAssessments) &&
      DeepCollectionEquality().equals(_aggregateDayOrganisationAssessments, other._aggregateDayOrganisationAssessments) &&
      DeepCollectionEquality().equals(_aggregateMonthOrganisationAssessments, other._aggregateMonthOrganisationAssessments) &&
      DeepCollectionEquality().equals(_aggregateYearOrganisationAssessments, other._aggregateYearOrganisationAssessments) &&
      DeepCollectionEquality().equals(_groups, other._groups) &&
      DeepCollectionEquality().equals(_groupTags, other._groupTags) &&
      DeepCollectionEquality().equals(_groupTypes, other._groupTypes) &&
      DeepCollectionEquality().equals(_suggestions, other._suggestions) &&
      DeepCollectionEquality().equals(_reportedUsers, other._reportedUsers) &&
      _organisationOrganisationTypeId == other._organisationOrganisationTypeId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Organisation {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("code=" + "$_code" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("totalNumberOfActiveUsers=" + (_totalNumberOfActiveUsers != null ? _totalNumberOfActiveUsers!.toString() : "null") + ", ");
    buffer.write("totalNumberOfUsers=" + (_totalNumberOfUsers != null ? _totalNumberOfUsers!.toString() : "null") + ", ");
    buffer.write("totalNumberOfCompletedScreenings=" + (_totalNumberOfCompletedScreenings != null ? _totalNumberOfCompletedScreenings!.toString() : "null") + ", ");
    buffer.write("totalNumberOfIncompletedScreenings=" + (_totalNumberOfIncompletedScreenings != null ? _totalNumberOfIncompletedScreenings!.toString() : "null") + ", ");
    buffer.write("totalNumberOfSuggestionsClicked=" + (_totalNumberOfSuggestionsClicked != null ? _totalNumberOfSuggestionsClicked!.toString() : "null") + ", ");
    buffer.write("totalNumberOfSuggestionsViewed=" + (_totalNumberOfSuggestionsViewed != null ? _totalNumberOfSuggestionsViewed!.toString() : "null") + ", ");
    buffer.write("logoURL=" + "$_logoURL" + ", ");
    buffer.write("logoBase64=" + "$_logoBase64" + ", ");
    buffer.write("themeColor=" + "$_themeColor" + ", ");
    buffer.write("token=" + "$_token" + ", ");
    buffer.write("secretCode=" + "$_secretCode" + ", ");
    buffer.write("telegramId=" + "$_telegramId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("organisationOrganisationTypeId=" + "$_organisationOrganisationTypeId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Organisation copyWith({String? id, String? code, OrganisationType? organisationType, List<OrganisationUser>? users, String? name, int? totalNumberOfActiveUsers, int? totalNumberOfUsers, int? totalNumberOfCompletedScreenings, int? totalNumberOfIncompletedScreenings, int? totalNumberOfSuggestionsClicked, int? totalNumberOfSuggestionsViewed, String? logoURL, String? logoBase64, String? themeColor, String? token, String? secretCode, String? telegramId, List<AggregateHourOrganisationAssessment>? aggregateHourOrganisationAssessments, List<AggregateDayOrganisationAssessment>? aggregateDayOrganisationAssessments, List<AggregateMonthOrganisationAssessment>? aggregateMonthOrganisationAssessments, List<AggregateYearOrganisationAssessment>? aggregateYearOrganisationAssessments, List<Group>? groups, List<GroupTag>? groupTags, List<GroupType>? groupTypes, List<Suggestion>? suggestions, List<ReportedUser>? reportedUsers, String? organisationOrganisationTypeId}) {
    return Organisation._internal(
      id: id ?? this.id,
      code: code ?? this.code,
      organisationType: organisationType ?? this.organisationType,
      users: users ?? this.users,
      name: name ?? this.name,
      totalNumberOfActiveUsers: totalNumberOfActiveUsers ?? this.totalNumberOfActiveUsers,
      totalNumberOfUsers: totalNumberOfUsers ?? this.totalNumberOfUsers,
      totalNumberOfCompletedScreenings: totalNumberOfCompletedScreenings ?? this.totalNumberOfCompletedScreenings,
      totalNumberOfIncompletedScreenings: totalNumberOfIncompletedScreenings ?? this.totalNumberOfIncompletedScreenings,
      totalNumberOfSuggestionsClicked: totalNumberOfSuggestionsClicked ?? this.totalNumberOfSuggestionsClicked,
      totalNumberOfSuggestionsViewed: totalNumberOfSuggestionsViewed ?? this.totalNumberOfSuggestionsViewed,
      logoURL: logoURL ?? this.logoURL,
      logoBase64: logoBase64 ?? this.logoBase64,
      themeColor: themeColor ?? this.themeColor,
      token: token ?? this.token,
      secretCode: secretCode ?? this.secretCode,
      telegramId: telegramId ?? this.telegramId,
      aggregateHourOrganisationAssessments: aggregateHourOrganisationAssessments ?? this.aggregateHourOrganisationAssessments,
      aggregateDayOrganisationAssessments: aggregateDayOrganisationAssessments ?? this.aggregateDayOrganisationAssessments,
      aggregateMonthOrganisationAssessments: aggregateMonthOrganisationAssessments ?? this.aggregateMonthOrganisationAssessments,
      aggregateYearOrganisationAssessments: aggregateYearOrganisationAssessments ?? this.aggregateYearOrganisationAssessments,
      groups: groups ?? this.groups,
      groupTags: groupTags ?? this.groupTags,
      groupTypes: groupTypes ?? this.groupTypes,
      suggestions: suggestions ?? this.suggestions,
      reportedUsers: reportedUsers ?? this.reportedUsers,
      organisationOrganisationTypeId: organisationOrganisationTypeId ?? this.organisationOrganisationTypeId);
  }
  
  Organisation copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String>? code,
    ModelFieldValue<OrganisationType?>? organisationType,
    ModelFieldValue<List<OrganisationUser>?>? users,
    ModelFieldValue<String?>? name,
    ModelFieldValue<int?>? totalNumberOfActiveUsers,
    ModelFieldValue<int?>? totalNumberOfUsers,
    ModelFieldValue<int?>? totalNumberOfCompletedScreenings,
    ModelFieldValue<int?>? totalNumberOfIncompletedScreenings,
    ModelFieldValue<int?>? totalNumberOfSuggestionsClicked,
    ModelFieldValue<int?>? totalNumberOfSuggestionsViewed,
    ModelFieldValue<String?>? logoURL,
    ModelFieldValue<String?>? logoBase64,
    ModelFieldValue<String?>? themeColor,
    ModelFieldValue<String?>? token,
    ModelFieldValue<String?>? secretCode,
    ModelFieldValue<String?>? telegramId,
    ModelFieldValue<List<AggregateHourOrganisationAssessment>?>? aggregateHourOrganisationAssessments,
    ModelFieldValue<List<AggregateDayOrganisationAssessment>?>? aggregateDayOrganisationAssessments,
    ModelFieldValue<List<AggregateMonthOrganisationAssessment>?>? aggregateMonthOrganisationAssessments,
    ModelFieldValue<List<AggregateYearOrganisationAssessment>?>? aggregateYearOrganisationAssessments,
    ModelFieldValue<List<Group>?>? groups,
    ModelFieldValue<List<GroupTag>?>? groupTags,
    ModelFieldValue<List<GroupType>?>? groupTypes,
    ModelFieldValue<List<Suggestion>?>? suggestions,
    ModelFieldValue<List<ReportedUser>?>? reportedUsers,
    ModelFieldValue<String?>? organisationOrganisationTypeId
  }) {
    return Organisation._internal(
      id: id == null ? this.id : id.value,
      code: code == null ? this.code : code.value,
      organisationType: organisationType == null ? this.organisationType : organisationType.value,
      users: users == null ? this.users : users.value,
      name: name == null ? this.name : name.value,
      totalNumberOfActiveUsers: totalNumberOfActiveUsers == null ? this.totalNumberOfActiveUsers : totalNumberOfActiveUsers.value,
      totalNumberOfUsers: totalNumberOfUsers == null ? this.totalNumberOfUsers : totalNumberOfUsers.value,
      totalNumberOfCompletedScreenings: totalNumberOfCompletedScreenings == null ? this.totalNumberOfCompletedScreenings : totalNumberOfCompletedScreenings.value,
      totalNumberOfIncompletedScreenings: totalNumberOfIncompletedScreenings == null ? this.totalNumberOfIncompletedScreenings : totalNumberOfIncompletedScreenings.value,
      totalNumberOfSuggestionsClicked: totalNumberOfSuggestionsClicked == null ? this.totalNumberOfSuggestionsClicked : totalNumberOfSuggestionsClicked.value,
      totalNumberOfSuggestionsViewed: totalNumberOfSuggestionsViewed == null ? this.totalNumberOfSuggestionsViewed : totalNumberOfSuggestionsViewed.value,
      logoURL: logoURL == null ? this.logoURL : logoURL.value,
      logoBase64: logoBase64 == null ? this.logoBase64 : logoBase64.value,
      themeColor: themeColor == null ? this.themeColor : themeColor.value,
      token: token == null ? this.token : token.value,
      secretCode: secretCode == null ? this.secretCode : secretCode.value,
      telegramId: telegramId == null ? this.telegramId : telegramId.value,
      aggregateHourOrganisationAssessments: aggregateHourOrganisationAssessments == null ? this.aggregateHourOrganisationAssessments : aggregateHourOrganisationAssessments.value,
      aggregateDayOrganisationAssessments: aggregateDayOrganisationAssessments == null ? this.aggregateDayOrganisationAssessments : aggregateDayOrganisationAssessments.value,
      aggregateMonthOrganisationAssessments: aggregateMonthOrganisationAssessments == null ? this.aggregateMonthOrganisationAssessments : aggregateMonthOrganisationAssessments.value,
      aggregateYearOrganisationAssessments: aggregateYearOrganisationAssessments == null ? this.aggregateYearOrganisationAssessments : aggregateYearOrganisationAssessments.value,
      groups: groups == null ? this.groups : groups.value,
      groupTags: groupTags == null ? this.groupTags : groupTags.value,
      groupTypes: groupTypes == null ? this.groupTypes : groupTypes.value,
      suggestions: suggestions == null ? this.suggestions : suggestions.value,
      reportedUsers: reportedUsers == null ? this.reportedUsers : reportedUsers.value,
      organisationOrganisationTypeId: organisationOrganisationTypeId == null ? this.organisationOrganisationTypeId : organisationOrganisationTypeId.value
    );
  }
  
  Organisation.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _code = json['code'],
      _organisationType = json['organisationType'] != null
        ? OrganisationType.fromJson(new Map<String, dynamic>.from(json['organisationType']))
        : null,
      _users = json['users']?['items'] is List
        ? (json['users']?['items'] as List)
          .where((e) => e != null)
          .map((e) => OrganisationUser.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _name = json['name'],
      _totalNumberOfActiveUsers = (json['totalNumberOfActiveUsers'] as num?)?.toInt(),
      _totalNumberOfUsers = (json['totalNumberOfUsers'] as num?)?.toInt(),
      _totalNumberOfCompletedScreenings = (json['totalNumberOfCompletedScreenings'] as num?)?.toInt(),
      _totalNumberOfIncompletedScreenings = (json['totalNumberOfIncompletedScreenings'] as num?)?.toInt(),
      _totalNumberOfSuggestionsClicked = (json['totalNumberOfSuggestionsClicked'] as num?)?.toInt(),
      _totalNumberOfSuggestionsViewed = (json['totalNumberOfSuggestionsViewed'] as num?)?.toInt(),
      _logoURL = json['logoURL'],
      _logoBase64 = json['logoBase64'],
      _themeColor = json['themeColor'],
      _token = json['token'],
      _secretCode = json['secretCode'],
      _telegramId = json['telegramId'],
      _aggregateHourOrganisationAssessments = json['aggregateHourOrganisationAssessments']?['items'] is List
        ? (json['aggregateHourOrganisationAssessments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AggregateHourOrganisationAssessment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _aggregateDayOrganisationAssessments = json['aggregateDayOrganisationAssessments']?['items'] is List
        ? (json['aggregateDayOrganisationAssessments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AggregateDayOrganisationAssessment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _aggregateMonthOrganisationAssessments = json['aggregateMonthOrganisationAssessments']?['items'] is List
        ? (json['aggregateMonthOrganisationAssessments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AggregateMonthOrganisationAssessment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _aggregateYearOrganisationAssessments = json['aggregateYearOrganisationAssessments']?['items'] is List
        ? (json['aggregateYearOrganisationAssessments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AggregateYearOrganisationAssessment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _groups = json['groups']?['items'] is List
        ? (json['groups']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Group.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _groupTags = json['groupTags']?['items'] is List
        ? (json['groupTags']?['items'] as List)
          .where((e) => e != null)
          .map((e) => GroupTag.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _groupTypes = json['groupTypes']?['items'] is List
        ? (json['groupTypes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => GroupType.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _suggestions = json['suggestions']?['items'] is List
        ? (json['suggestions']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Suggestion.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _reportedUsers = json['reportedUsers']?['items'] is List
        ? (json['reportedUsers']?['items'] as List)
          .where((e) => e != null)
          .map((e) => ReportedUser.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _organisationOrganisationTypeId = json['organisationOrganisationTypeId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'code': _code, 'organisationType': _organisationType?.toJson(), 'users': _users?.map((OrganisationUser? e) => e?.toJson()).toList(), 'name': _name, 'totalNumberOfActiveUsers': _totalNumberOfActiveUsers, 'totalNumberOfUsers': _totalNumberOfUsers, 'totalNumberOfCompletedScreenings': _totalNumberOfCompletedScreenings, 'totalNumberOfIncompletedScreenings': _totalNumberOfIncompletedScreenings, 'totalNumberOfSuggestionsClicked': _totalNumberOfSuggestionsClicked, 'totalNumberOfSuggestionsViewed': _totalNumberOfSuggestionsViewed, 'logoURL': _logoURL, 'logoBase64': _logoBase64, 'themeColor': _themeColor, 'token': _token, 'secretCode': _secretCode, 'telegramId': _telegramId, 'aggregateHourOrganisationAssessments': _aggregateHourOrganisationAssessments?.map((AggregateHourOrganisationAssessment? e) => e?.toJson()).toList(), 'aggregateDayOrganisationAssessments': _aggregateDayOrganisationAssessments?.map((AggregateDayOrganisationAssessment? e) => e?.toJson()).toList(), 'aggregateMonthOrganisationAssessments': _aggregateMonthOrganisationAssessments?.map((AggregateMonthOrganisationAssessment? e) => e?.toJson()).toList(), 'aggregateYearOrganisationAssessments': _aggregateYearOrganisationAssessments?.map((AggregateYearOrganisationAssessment? e) => e?.toJson()).toList(), 'groups': _groups?.map((Group? e) => e?.toJson()).toList(), 'groupTags': _groupTags?.map((GroupTag? e) => e?.toJson()).toList(), 'groupTypes': _groupTypes?.map((GroupType? e) => e?.toJson()).toList(), 'suggestions': _suggestions?.map((Suggestion? e) => e?.toJson()).toList(), 'reportedUsers': _reportedUsers?.map((ReportedUser? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'organisationOrganisationTypeId': _organisationOrganisationTypeId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'code': _code,
    'organisationType': _organisationType,
    'users': _users,
    'name': _name,
    'totalNumberOfActiveUsers': _totalNumberOfActiveUsers,
    'totalNumberOfUsers': _totalNumberOfUsers,
    'totalNumberOfCompletedScreenings': _totalNumberOfCompletedScreenings,
    'totalNumberOfIncompletedScreenings': _totalNumberOfIncompletedScreenings,
    'totalNumberOfSuggestionsClicked': _totalNumberOfSuggestionsClicked,
    'totalNumberOfSuggestionsViewed': _totalNumberOfSuggestionsViewed,
    'logoURL': _logoURL,
    'logoBase64': _logoBase64,
    'themeColor': _themeColor,
    'token': _token,
    'secretCode': _secretCode,
    'telegramId': _telegramId,
    'aggregateHourOrganisationAssessments': _aggregateHourOrganisationAssessments,
    'aggregateDayOrganisationAssessments': _aggregateDayOrganisationAssessments,
    'aggregateMonthOrganisationAssessments': _aggregateMonthOrganisationAssessments,
    'aggregateYearOrganisationAssessments': _aggregateYearOrganisationAssessments,
    'groups': _groups,
    'groupTags': _groupTags,
    'groupTypes': _groupTypes,
    'suggestions': _suggestions,
    'reportedUsers': _reportedUsers,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'organisationOrganisationTypeId': _organisationOrganisationTypeId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final CODE = amplify_core.QueryField(fieldName: "code");
  static final ORGANISATIONTYPE = amplify_core.QueryField(
    fieldName: "organisationType",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'OrganisationType'));
  static final USERS = amplify_core.QueryField(
    fieldName: "users",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'OrganisationUser'));
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final TOTALNUMBEROFACTIVEUSERS = amplify_core.QueryField(fieldName: "totalNumberOfActiveUsers");
  static final TOTALNUMBEROFUSERS = amplify_core.QueryField(fieldName: "totalNumberOfUsers");
  static final TOTALNUMBEROFCOMPLETEDSCREENINGS = amplify_core.QueryField(fieldName: "totalNumberOfCompletedScreenings");
  static final TOTALNUMBEROFINCOMPLETEDSCREENINGS = amplify_core.QueryField(fieldName: "totalNumberOfIncompletedScreenings");
  static final TOTALNUMBEROFSUGGESTIONSCLICKED = amplify_core.QueryField(fieldName: "totalNumberOfSuggestionsClicked");
  static final TOTALNUMBEROFSUGGESTIONSVIEWED = amplify_core.QueryField(fieldName: "totalNumberOfSuggestionsViewed");
  static final LOGOURL = amplify_core.QueryField(fieldName: "logoURL");
  static final LOGOBASE64 = amplify_core.QueryField(fieldName: "logoBase64");
  static final THEMECOLOR = amplify_core.QueryField(fieldName: "themeColor");
  static final TOKEN = amplify_core.QueryField(fieldName: "token");
  static final SECRETCODE = amplify_core.QueryField(fieldName: "secretCode");
  static final TELEGRAMID = amplify_core.QueryField(fieldName: "telegramId");
  static final AGGREGATEHOURORGANISATIONASSESSMENTS = amplify_core.QueryField(
    fieldName: "aggregateHourOrganisationAssessments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AggregateHourOrganisationAssessment'));
  static final AGGREGATEDAYORGANISATIONASSESSMENTS = amplify_core.QueryField(
    fieldName: "aggregateDayOrganisationAssessments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AggregateDayOrganisationAssessment'));
  static final AGGREGATEMONTHORGANISATIONASSESSMENTS = amplify_core.QueryField(
    fieldName: "aggregateMonthOrganisationAssessments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AggregateMonthOrganisationAssessment'));
  static final AGGREGATEYEARORGANISATIONASSESSMENTS = amplify_core.QueryField(
    fieldName: "aggregateYearOrganisationAssessments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AggregateYearOrganisationAssessment'));
  static final GROUPS = amplify_core.QueryField(
    fieldName: "groups",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Group'));
  static final GROUPTAGS = amplify_core.QueryField(
    fieldName: "groupTags",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupTag'));
  static final GROUPTYPES = amplify_core.QueryField(
    fieldName: "groupTypes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupType'));
  static final SUGGESTIONS = amplify_core.QueryField(
    fieldName: "suggestions",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Suggestion'));
  static final REPORTEDUSERS = amplify_core.QueryField(
    fieldName: "reportedUsers",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'ReportedUser'));
  static final ORGANISATIONORGANISATIONTYPEID = amplify_core.QueryField(fieldName: "organisationOrganisationTypeId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Organisation";
    modelSchemaDefinition.pluralName = "Organisations";
    
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
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.READ,
          amplify_core.ModelOperation.UPDATE
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
      key: Organisation.CODE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Organisation.ORGANISATIONTYPE,
      isRequired: false,
      ofModelName: 'OrganisationType',
      associatedKey: OrganisationType.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.USERS,
      isRequired: false,
      ofModelName: 'OrganisationUser',
      associatedKey: OrganisationUser.ORGANISATION
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.TOTALNUMBEROFACTIVEUSERS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.TOTALNUMBEROFUSERS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.TOTALNUMBEROFCOMPLETEDSCREENINGS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.TOTALNUMBEROFINCOMPLETEDSCREENINGS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.TOTALNUMBEROFSUGGESTIONSCLICKED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.TOTALNUMBEROFSUGGESTIONSVIEWED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.LOGOURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.LOGOBASE64,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.THEMECOLOR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.TOKEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.SECRETCODE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Organisation.TELEGRAMID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.AGGREGATEHOURORGANISATIONASSESSMENTS,
      isRequired: false,
      ofModelName: 'AggregateHourOrganisationAssessment',
      associatedKey: AggregateHourOrganisationAssessment.ORGANISATIONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.AGGREGATEDAYORGANISATIONASSESSMENTS,
      isRequired: false,
      ofModelName: 'AggregateDayOrganisationAssessment',
      associatedKey: AggregateDayOrganisationAssessment.ORGANISATIONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.AGGREGATEMONTHORGANISATIONASSESSMENTS,
      isRequired: false,
      ofModelName: 'AggregateMonthOrganisationAssessment',
      associatedKey: AggregateMonthOrganisationAssessment.ORGANISATIONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.AGGREGATEYEARORGANISATIONASSESSMENTS,
      isRequired: false,
      ofModelName: 'AggregateYearOrganisationAssessment',
      associatedKey: AggregateYearOrganisationAssessment.ORGANISATIONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.GROUPS,
      isRequired: false,
      ofModelName: 'Group',
      associatedKey: Group.ORGANISATION
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.GROUPTAGS,
      isRequired: false,
      ofModelName: 'GroupTag',
      associatedKey: GroupTag.ORGANISATIONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.GROUPTYPES,
      isRequired: false,
      ofModelName: 'GroupType',
      associatedKey: GroupType.ORGANISATIONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.SUGGESTIONS,
      isRequired: false,
      ofModelName: 'Suggestion',
      associatedKey: Suggestion.ORGANISATIONID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Organisation.REPORTEDUSERS,
      isRequired: false,
      ofModelName: 'ReportedUser',
      associatedKey: ReportedUser.ORGANISATION
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
      key: Organisation.ORGANISATIONORGANISATIONTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _OrganisationModelType extends amplify_core.ModelType<Organisation> {
  const _OrganisationModelType();
  
  @override
  Organisation fromJson(Map<String, dynamic> jsonData) {
    return Organisation.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Organisation';
  }
}
