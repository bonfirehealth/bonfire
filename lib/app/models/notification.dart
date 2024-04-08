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

/** This is an auto generated class representing the Notification type in your schema. */
class Notification extends amplify_core.Model {
  static const classType = const _NotificationModelType();
  final String id;
  final NotificationAction? _notificationAction;
  final NotificationChannel? _notificationChannel;
  final String? _clickAction;
  final String? _colour;
  final amplify_core.TemporalDateTime? _date;
  final String? _description;
  final String? _token;
  final String? _imageURL;
  final bool? _isHidden;
  final bool? _isProcessing;
  final bool? _isRepeat;
  final bool? _isSent;
  final bool? _isSticky;
  final String? _name;
  final String? _priority;
  final String? _routePath;
  final String? _sound;
  final String? _timezone;
  final String? _title;
  final NotificationType? _notificationType;
  final Suggestion? _suggestion;
  final SelfCare? _selfCare;
  final Activity? _activity;
  final String? _profileID;
  final String? _userID;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _notificationNotificationActionId;
  final String? _notificationNotificationChannelId;
  final String? _notificationNotificationTypeId;
  final String? _notificationSuggestionId;
  final String? _notificationSelfCareId;
  final String? _notificationActivityId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  NotificationAction? get notificationAction {
    return _notificationAction;
  }
  
  NotificationChannel? get notificationChannel {
    return _notificationChannel;
  }
  
  String? get clickAction {
    return _clickAction;
  }
  
  String? get colour {
    return _colour;
  }
  
  amplify_core.TemporalDateTime? get date {
    return _date;
  }
  
  String? get description {
    return _description;
  }
  
  String? get token {
    return _token;
  }
  
  String? get imageURL {
    return _imageURL;
  }
  
  bool? get isHidden {
    return _isHidden;
  }
  
  bool? get isProcessing {
    return _isProcessing;
  }
  
  bool? get isRepeat {
    return _isRepeat;
  }
  
  bool? get isSent {
    return _isSent;
  }
  
  bool? get isSticky {
    return _isSticky;
  }
  
  String? get name {
    return _name;
  }
  
  String? get priority {
    return _priority;
  }
  
  String? get routePath {
    return _routePath;
  }
  
  String? get sound {
    return _sound;
  }
  
  String? get timezone {
    return _timezone;
  }
  
  String? get title {
    return _title;
  }
  
  NotificationType? get notificationType {
    return _notificationType;
  }
  
  Suggestion? get suggestion {
    return _suggestion;
  }
  
  SelfCare? get selfCare {
    return _selfCare;
  }
  
  Activity? get activity {
    return _activity;
  }
  
  String get profileID {
    try {
      return _profileID!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get notificationNotificationActionId {
    return _notificationNotificationActionId;
  }
  
  String? get notificationNotificationChannelId {
    return _notificationNotificationChannelId;
  }
  
  String? get notificationNotificationTypeId {
    return _notificationNotificationTypeId;
  }
  
  String? get notificationSuggestionId {
    return _notificationSuggestionId;
  }
  
  String? get notificationSelfCareId {
    return _notificationSelfCareId;
  }
  
  String? get notificationActivityId {
    return _notificationActivityId;
  }
  
  const Notification._internal({required this.id, notificationAction, notificationChannel, clickAction, colour, date, description, token, imageURL, isHidden, isProcessing, isRepeat, isSent, isSticky, name, priority, routePath, sound, timezone, title, notificationType, suggestion, selfCare, activity, required profileID, required userID, createdAt, updatedAt, notificationNotificationActionId, notificationNotificationChannelId, notificationNotificationTypeId, notificationSuggestionId, notificationSelfCareId, notificationActivityId}): _notificationAction = notificationAction, _notificationChannel = notificationChannel, _clickAction = clickAction, _colour = colour, _date = date, _description = description, _token = token, _imageURL = imageURL, _isHidden = isHidden, _isProcessing = isProcessing, _isRepeat = isRepeat, _isSent = isSent, _isSticky = isSticky, _name = name, _priority = priority, _routePath = routePath, _sound = sound, _timezone = timezone, _title = title, _notificationType = notificationType, _suggestion = suggestion, _selfCare = selfCare, _activity = activity, _profileID = profileID, _userID = userID, _createdAt = createdAt, _updatedAt = updatedAt, _notificationNotificationActionId = notificationNotificationActionId, _notificationNotificationChannelId = notificationNotificationChannelId, _notificationNotificationTypeId = notificationNotificationTypeId, _notificationSuggestionId = notificationSuggestionId, _notificationSelfCareId = notificationSelfCareId, _notificationActivityId = notificationActivityId;
  
  factory Notification({String? id, NotificationAction? notificationAction, NotificationChannel? notificationChannel, String? clickAction, String? colour, amplify_core.TemporalDateTime? date, String? description, String? token, String? imageURL, bool? isHidden, bool? isProcessing, bool? isRepeat, bool? isSent, bool? isSticky, String? name, String? priority, String? routePath, String? sound, String? timezone, String? title, NotificationType? notificationType, Suggestion? suggestion, SelfCare? selfCare, Activity? activity, required String profileID, required String userID, String? notificationNotificationActionId, String? notificationNotificationChannelId, String? notificationNotificationTypeId, String? notificationSuggestionId, String? notificationSelfCareId, String? notificationActivityId}) {
    return Notification._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      notificationAction: notificationAction,
      notificationChannel: notificationChannel,
      clickAction: clickAction,
      colour: colour,
      date: date,
      description: description,
      token: token,
      imageURL: imageURL,
      isHidden: isHidden,
      isProcessing: isProcessing,
      isRepeat: isRepeat,
      isSent: isSent,
      isSticky: isSticky,
      name: name,
      priority: priority,
      routePath: routePath,
      sound: sound,
      timezone: timezone,
      title: title,
      notificationType: notificationType,
      suggestion: suggestion,
      selfCare: selfCare,
      activity: activity,
      profileID: profileID,
      userID: userID,
      notificationNotificationActionId: notificationNotificationActionId,
      notificationNotificationChannelId: notificationNotificationChannelId,
      notificationNotificationTypeId: notificationNotificationTypeId,
      notificationSuggestionId: notificationSuggestionId,
      notificationSelfCareId: notificationSelfCareId,
      notificationActivityId: notificationActivityId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Notification &&
      id == other.id &&
      _notificationAction == other._notificationAction &&
      _notificationChannel == other._notificationChannel &&
      _clickAction == other._clickAction &&
      _colour == other._colour &&
      _date == other._date &&
      _description == other._description &&
      _token == other._token &&
      _imageURL == other._imageURL &&
      _isHidden == other._isHidden &&
      _isProcessing == other._isProcessing &&
      _isRepeat == other._isRepeat &&
      _isSent == other._isSent &&
      _isSticky == other._isSticky &&
      _name == other._name &&
      _priority == other._priority &&
      _routePath == other._routePath &&
      _sound == other._sound &&
      _timezone == other._timezone &&
      _title == other._title &&
      _notificationType == other._notificationType &&
      _suggestion == other._suggestion &&
      _selfCare == other._selfCare &&
      _activity == other._activity &&
      _profileID == other._profileID &&
      _userID == other._userID &&
      _notificationNotificationActionId == other._notificationNotificationActionId &&
      _notificationNotificationChannelId == other._notificationNotificationChannelId &&
      _notificationNotificationTypeId == other._notificationNotificationTypeId &&
      _notificationSuggestionId == other._notificationSuggestionId &&
      _notificationSelfCareId == other._notificationSelfCareId &&
      _notificationActivityId == other._notificationActivityId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Notification {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("clickAction=" + "$_clickAction" + ", ");
    buffer.write("colour=" + "$_colour" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("token=" + "$_token" + ", ");
    buffer.write("imageURL=" + "$_imageURL" + ", ");
    buffer.write("isHidden=" + (_isHidden != null ? _isHidden!.toString() : "null") + ", ");
    buffer.write("isProcessing=" + (_isProcessing != null ? _isProcessing!.toString() : "null") + ", ");
    buffer.write("isRepeat=" + (_isRepeat != null ? _isRepeat!.toString() : "null") + ", ");
    buffer.write("isSent=" + (_isSent != null ? _isSent!.toString() : "null") + ", ");
    buffer.write("isSticky=" + (_isSticky != null ? _isSticky!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("priority=" + "$_priority" + ", ");
    buffer.write("routePath=" + "$_routePath" + ", ");
    buffer.write("sound=" + "$_sound" + ", ");
    buffer.write("timezone=" + "$_timezone" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("profileID=" + "$_profileID" + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("notificationNotificationActionId=" + "$_notificationNotificationActionId" + ", ");
    buffer.write("notificationNotificationChannelId=" + "$_notificationNotificationChannelId" + ", ");
    buffer.write("notificationNotificationTypeId=" + "$_notificationNotificationTypeId" + ", ");
    buffer.write("notificationSuggestionId=" + "$_notificationSuggestionId" + ", ");
    buffer.write("notificationSelfCareId=" + "$_notificationSelfCareId" + ", ");
    buffer.write("notificationActivityId=" + "$_notificationActivityId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Notification copyWith({String? id, NotificationAction? notificationAction, NotificationChannel? notificationChannel, String? clickAction, String? colour, amplify_core.TemporalDateTime? date, String? description, String? token, String? imageURL, bool? isHidden, bool? isProcessing, bool? isRepeat, bool? isSent, bool? isSticky, String? name, String? priority, String? routePath, String? sound, String? timezone, String? title, NotificationType? notificationType, Suggestion? suggestion, SelfCare? selfCare, Activity? activity, String? profileID, String? userID, String? notificationNotificationActionId, String? notificationNotificationChannelId, String? notificationNotificationTypeId, String? notificationSuggestionId, String? notificationSelfCareId, String? notificationActivityId}) {
    return Notification._internal(
      id: id ?? this.id,
      notificationAction: notificationAction ?? this.notificationAction,
      notificationChannel: notificationChannel ?? this.notificationChannel,
      clickAction: clickAction ?? this.clickAction,
      colour: colour ?? this.colour,
      date: date ?? this.date,
      description: description ?? this.description,
      token: token ?? this.token,
      imageURL: imageURL ?? this.imageURL,
      isHidden: isHidden ?? this.isHidden,
      isProcessing: isProcessing ?? this.isProcessing,
      isRepeat: isRepeat ?? this.isRepeat,
      isSent: isSent ?? this.isSent,
      isSticky: isSticky ?? this.isSticky,
      name: name ?? this.name,
      priority: priority ?? this.priority,
      routePath: routePath ?? this.routePath,
      sound: sound ?? this.sound,
      timezone: timezone ?? this.timezone,
      title: title ?? this.title,
      notificationType: notificationType ?? this.notificationType,
      suggestion: suggestion ?? this.suggestion,
      selfCare: selfCare ?? this.selfCare,
      activity: activity ?? this.activity,
      profileID: profileID ?? this.profileID,
      userID: userID ?? this.userID,
      notificationNotificationActionId: notificationNotificationActionId ?? this.notificationNotificationActionId,
      notificationNotificationChannelId: notificationNotificationChannelId ?? this.notificationNotificationChannelId,
      notificationNotificationTypeId: notificationNotificationTypeId ?? this.notificationNotificationTypeId,
      notificationSuggestionId: notificationSuggestionId ?? this.notificationSuggestionId,
      notificationSelfCareId: notificationSelfCareId ?? this.notificationSelfCareId,
      notificationActivityId: notificationActivityId ?? this.notificationActivityId);
  }
  
  Notification copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<NotificationAction?>? notificationAction,
    ModelFieldValue<NotificationChannel?>? notificationChannel,
    ModelFieldValue<String?>? clickAction,
    ModelFieldValue<String?>? colour,
    ModelFieldValue<amplify_core.TemporalDateTime?>? date,
    ModelFieldValue<String?>? description,
    ModelFieldValue<String?>? token,
    ModelFieldValue<String?>? imageURL,
    ModelFieldValue<bool?>? isHidden,
    ModelFieldValue<bool?>? isProcessing,
    ModelFieldValue<bool?>? isRepeat,
    ModelFieldValue<bool?>? isSent,
    ModelFieldValue<bool?>? isSticky,
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? priority,
    ModelFieldValue<String?>? routePath,
    ModelFieldValue<String?>? sound,
    ModelFieldValue<String?>? timezone,
    ModelFieldValue<String?>? title,
    ModelFieldValue<NotificationType?>? notificationType,
    ModelFieldValue<Suggestion?>? suggestion,
    ModelFieldValue<SelfCare?>? selfCare,
    ModelFieldValue<Activity?>? activity,
    ModelFieldValue<String>? profileID,
    ModelFieldValue<String>? userID,
    ModelFieldValue<String?>? notificationNotificationActionId,
    ModelFieldValue<String?>? notificationNotificationChannelId,
    ModelFieldValue<String?>? notificationNotificationTypeId,
    ModelFieldValue<String?>? notificationSuggestionId,
    ModelFieldValue<String?>? notificationSelfCareId,
    ModelFieldValue<String?>? notificationActivityId
  }) {
    return Notification._internal(
      id: id == null ? this.id : id.value,
      notificationAction: notificationAction == null ? this.notificationAction : notificationAction.value,
      notificationChannel: notificationChannel == null ? this.notificationChannel : notificationChannel.value,
      clickAction: clickAction == null ? this.clickAction : clickAction.value,
      colour: colour == null ? this.colour : colour.value,
      date: date == null ? this.date : date.value,
      description: description == null ? this.description : description.value,
      token: token == null ? this.token : token.value,
      imageURL: imageURL == null ? this.imageURL : imageURL.value,
      isHidden: isHidden == null ? this.isHidden : isHidden.value,
      isProcessing: isProcessing == null ? this.isProcessing : isProcessing.value,
      isRepeat: isRepeat == null ? this.isRepeat : isRepeat.value,
      isSent: isSent == null ? this.isSent : isSent.value,
      isSticky: isSticky == null ? this.isSticky : isSticky.value,
      name: name == null ? this.name : name.value,
      priority: priority == null ? this.priority : priority.value,
      routePath: routePath == null ? this.routePath : routePath.value,
      sound: sound == null ? this.sound : sound.value,
      timezone: timezone == null ? this.timezone : timezone.value,
      title: title == null ? this.title : title.value,
      notificationType: notificationType == null ? this.notificationType : notificationType.value,
      suggestion: suggestion == null ? this.suggestion : suggestion.value,
      selfCare: selfCare == null ? this.selfCare : selfCare.value,
      activity: activity == null ? this.activity : activity.value,
      profileID: profileID == null ? this.profileID : profileID.value,
      userID: userID == null ? this.userID : userID.value,
      notificationNotificationActionId: notificationNotificationActionId == null ? this.notificationNotificationActionId : notificationNotificationActionId.value,
      notificationNotificationChannelId: notificationNotificationChannelId == null ? this.notificationNotificationChannelId : notificationNotificationChannelId.value,
      notificationNotificationTypeId: notificationNotificationTypeId == null ? this.notificationNotificationTypeId : notificationNotificationTypeId.value,
      notificationSuggestionId: notificationSuggestionId == null ? this.notificationSuggestionId : notificationSuggestionId.value,
      notificationSelfCareId: notificationSelfCareId == null ? this.notificationSelfCareId : notificationSelfCareId.value,
      notificationActivityId: notificationActivityId == null ? this.notificationActivityId : notificationActivityId.value
    );
  }
  
  Notification.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _notificationAction = json['notificationAction'] != null
        ? NotificationAction.fromJson(new Map<String, dynamic>.from(json['notificationAction']))
        : null,
      _notificationChannel = json['notificationChannel'] != null
        ? NotificationChannel.fromJson(new Map<String, dynamic>.from(json['notificationChannel']))
        : null,
      _clickAction = json['clickAction'],
      _colour = json['colour'],
      _date = json['date'] != null ? amplify_core.TemporalDateTime.fromString(json['date']) : null,
      _description = json['description'],
      _token = json['token'],
      _imageURL = json['imageURL'],
      _isHidden = json['isHidden'],
      _isProcessing = json['isProcessing'],
      _isRepeat = json['isRepeat'],
      _isSent = json['isSent'],
      _isSticky = json['isSticky'],
      _name = json['name'],
      _priority = json['priority'],
      _routePath = json['routePath'],
      _sound = json['sound'],
      _timezone = json['timezone'],
      _title = json['title'],
      _notificationType = json['notificationType'] != null
        ? NotificationType.fromJson(new Map<String, dynamic>.from(json['notificationType']))
        : null,
      _suggestion = json['suggestion'] != null
        ? Suggestion.fromJson(new Map<String, dynamic>.from(json['suggestion']))
        : null,
      _selfCare = json['selfCare'] != null
        ? SelfCare.fromJson(new Map<String, dynamic>.from(json['selfCare']))
        : null,
      _activity = json['activity'] != null
        ? Activity.fromJson(new Map<String, dynamic>.from(json['activity']))
        : null,
      _profileID = json['profileID'],
      _userID = json['userID'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _notificationNotificationActionId = json['notificationNotificationActionId'],
      _notificationNotificationChannelId = json['notificationNotificationChannelId'],
      _notificationNotificationTypeId = json['notificationNotificationTypeId'],
      _notificationSuggestionId = json['notificationSuggestionId'],
      _notificationSelfCareId = json['notificationSelfCareId'],
      _notificationActivityId = json['notificationActivityId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'notificationAction': _notificationAction?.toJson(), 'notificationChannel': _notificationChannel?.toJson(), 'clickAction': _clickAction, 'colour': _colour, 'date': _date?.format(), 'description': _description, 'token': _token, 'imageURL': _imageURL, 'isHidden': _isHidden, 'isProcessing': _isProcessing, 'isRepeat': _isRepeat, 'isSent': _isSent, 'isSticky': _isSticky, 'name': _name, 'priority': _priority, 'routePath': _routePath, 'sound': _sound, 'timezone': _timezone, 'title': _title, 'notificationType': _notificationType?.toJson(), 'suggestion': _suggestion?.toJson(), 'selfCare': _selfCare?.toJson(), 'activity': _activity?.toJson(), 'profileID': _profileID, 'userID': _userID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'notificationNotificationActionId': _notificationNotificationActionId, 'notificationNotificationChannelId': _notificationNotificationChannelId, 'notificationNotificationTypeId': _notificationNotificationTypeId, 'notificationSuggestionId': _notificationSuggestionId, 'notificationSelfCareId': _notificationSelfCareId, 'notificationActivityId': _notificationActivityId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'notificationAction': _notificationAction,
    'notificationChannel': _notificationChannel,
    'clickAction': _clickAction,
    'colour': _colour,
    'date': _date,
    'description': _description,
    'token': _token,
    'imageURL': _imageURL,
    'isHidden': _isHidden,
    'isProcessing': _isProcessing,
    'isRepeat': _isRepeat,
    'isSent': _isSent,
    'isSticky': _isSticky,
    'name': _name,
    'priority': _priority,
    'routePath': _routePath,
    'sound': _sound,
    'timezone': _timezone,
    'title': _title,
    'notificationType': _notificationType,
    'suggestion': _suggestion,
    'selfCare': _selfCare,
    'activity': _activity,
    'profileID': _profileID,
    'userID': _userID,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'notificationNotificationActionId': _notificationNotificationActionId,
    'notificationNotificationChannelId': _notificationNotificationChannelId,
    'notificationNotificationTypeId': _notificationNotificationTypeId,
    'notificationSuggestionId': _notificationSuggestionId,
    'notificationSelfCareId': _notificationSelfCareId,
    'notificationActivityId': _notificationActivityId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NOTIFICATIONACTION = amplify_core.QueryField(
    fieldName: "notificationAction",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'NotificationAction'));
  static final NOTIFICATIONCHANNEL = amplify_core.QueryField(
    fieldName: "notificationChannel",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'NotificationChannel'));
  static final CLICKACTION = amplify_core.QueryField(fieldName: "clickAction");
  static final COLOUR = amplify_core.QueryField(fieldName: "colour");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final TOKEN = amplify_core.QueryField(fieldName: "token");
  static final IMAGEURL = amplify_core.QueryField(fieldName: "imageURL");
  static final ISHIDDEN = amplify_core.QueryField(fieldName: "isHidden");
  static final ISPROCESSING = amplify_core.QueryField(fieldName: "isProcessing");
  static final ISREPEAT = amplify_core.QueryField(fieldName: "isRepeat");
  static final ISSENT = amplify_core.QueryField(fieldName: "isSent");
  static final ISSTICKY = amplify_core.QueryField(fieldName: "isSticky");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final PRIORITY = amplify_core.QueryField(fieldName: "priority");
  static final ROUTEPATH = amplify_core.QueryField(fieldName: "routePath");
  static final SOUND = amplify_core.QueryField(fieldName: "sound");
  static final TIMEZONE = amplify_core.QueryField(fieldName: "timezone");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final NOTIFICATIONTYPE = amplify_core.QueryField(
    fieldName: "notificationType",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'NotificationType'));
  static final SUGGESTION = amplify_core.QueryField(
    fieldName: "suggestion",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Suggestion'));
  static final SELFCARE = amplify_core.QueryField(
    fieldName: "selfCare",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'SelfCare'));
  static final ACTIVITY = amplify_core.QueryField(
    fieldName: "activity",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Activity'));
  static final PROFILEID = amplify_core.QueryField(fieldName: "profileID");
  static final USERID = amplify_core.QueryField(fieldName: "userID");
  static final NOTIFICATIONNOTIFICATIONACTIONID = amplify_core.QueryField(fieldName: "notificationNotificationActionId");
  static final NOTIFICATIONNOTIFICATIONCHANNELID = amplify_core.QueryField(fieldName: "notificationNotificationChannelId");
  static final NOTIFICATIONNOTIFICATIONTYPEID = amplify_core.QueryField(fieldName: "notificationNotificationTypeId");
  static final NOTIFICATIONSUGGESTIONID = amplify_core.QueryField(fieldName: "notificationSuggestionId");
  static final NOTIFICATIONSELFCAREID = amplify_core.QueryField(fieldName: "notificationSelfCareId");
  static final NOTIFICATIONACTIVITYID = amplify_core.QueryField(fieldName: "notificationActivityId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Notification";
    modelSchemaDefinition.pluralName = "Notifications";
    
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
      amplify_core.ModelIndex(fields: const ["profileID"], name: "byProfile"),
      amplify_core.ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Notification.NOTIFICATIONACTION,
      isRequired: false,
      ofModelName: 'NotificationAction',
      associatedKey: NotificationAction.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Notification.NOTIFICATIONCHANNEL,
      isRequired: false,
      ofModelName: 'NotificationChannel',
      associatedKey: NotificationChannel.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.CLICKACTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.COLOUR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.DATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.TOKEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.IMAGEURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.ISHIDDEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.ISPROCESSING,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.ISREPEAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.ISSENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.ISSTICKY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.PRIORITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.ROUTEPATH,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.SOUND,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.TIMEZONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.TITLE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Notification.NOTIFICATIONTYPE,
      isRequired: false,
      ofModelName: 'NotificationType',
      associatedKey: NotificationType.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Notification.SUGGESTION,
      isRequired: false,
      ofModelName: 'Suggestion',
      associatedKey: Suggestion.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Notification.SELFCARE,
      isRequired: false,
      ofModelName: 'SelfCare',
      associatedKey: SelfCare.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Notification.ACTIVITY,
      isRequired: false,
      ofModelName: 'Activity',
      associatedKey: Activity.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.PROFILEID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.USERID,
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
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.NOTIFICATIONNOTIFICATIONACTIONID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.NOTIFICATIONNOTIFICATIONCHANNELID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.NOTIFICATIONNOTIFICATIONTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.NOTIFICATIONSUGGESTIONID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.NOTIFICATIONSELFCAREID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Notification.NOTIFICATIONACTIVITYID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _NotificationModelType extends amplify_core.ModelType<Notification> {
  const _NotificationModelType();
  
  @override
  Notification fromJson(Map<String, dynamic> jsonData) {
    return Notification.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Notification';
  }
}
