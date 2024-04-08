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

/** This is an auto generated class representing the User type in your schema. */
class User extends amplify_core.Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _externalUserID;
  final String? _photoURL;
  final UserType? _userType;
  final Profile? _profile;
  final String? _emailAddress;
  final String? _firstName;
  final String? _lastName;
  final String? _parentId;
  final String? _uniqueLinkValue;
  final String? _telegramId;
  final String? _telegramChatId;
  final amplify_core.TemporalDateTime? _deletedAt;
  final String? _avatar;
  final String? _fullMobileNumber;
  final String? _ipAddress;
  final bool? _isEmailAddressVerified;
  final bool? _isMobileNumberVerified;
  final bool? _isLoggedOut;
  final bool? _isSecretCredentialsSent;
  final String? _photoBase64;
  final String? _username;
  final String? _webPushNotificationToken;
  final String? _mobilePushNotificationToken;
  final String? _straitsxProfileID;
  final String? _straitsxProfileHash;
  final String? _straitsxRegistrationIDHash;
  final List<Feedback>? _feedbacks;
  final List<UserGroup>? _groups;
  final List<GroupFile>? _groupFiles;
  final List<GroupVote>? _groupVotes;
  final List<Group>? _suggestedGroups;
  final List<Notification>? _notifications;
  final List<OrganisationUser>? _organisations;
  final List<Question>? _questions;
  final List<QuestionFile>? _questionFiles;
  final List<QuestionSave>? _questionSaves;
  final List<QuestionVote>? _questionVotes;
  final List<Answer>? _answers;
  final List<AnswerFile>? _answerFiles;
  final List<AnswerVote>? _answerVotes;
  final List<Comment>? _comments;
  final List<CommentFile>? _commentFiles;
  final List<CommentVote>? _commentVotes;
  final List<RecoveryCode>? _recoveryCodes;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _userUserTypeId;
  final String? _userProfileId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get externalUserID {
    return _externalUserID;
  }
  
  String? get photoURL {
    return _photoURL;
  }
  
  UserType? get userType {
    return _userType;
  }
  
  Profile? get profile {
    return _profile;
  }
  
  String? get emailAddress {
    return _emailAddress;
  }
  
  String? get firstName {
    return _firstName;
  }
  
  String? get lastName {
    return _lastName;
  }
  
  String? get parentId {
    return _parentId;
  }
  
  String? get uniqueLinkValue {
    return _uniqueLinkValue;
  }
  
  String? get telegramId {
    return _telegramId;
  }
  
  String? get telegramChatId {
    return _telegramChatId;
  }
  
  amplify_core.TemporalDateTime? get deletedAt {
    return _deletedAt;
  }
  
  String? get avatar {
    return _avatar;
  }
  
  String? get fullMobileNumber {
    return _fullMobileNumber;
  }
  
  String? get ipAddress {
    return _ipAddress;
  }
  
  bool? get isEmailAddressVerified {
    return _isEmailAddressVerified;
  }
  
  bool? get isMobileNumberVerified {
    return _isMobileNumberVerified;
  }
  
  bool? get isLoggedOut {
    return _isLoggedOut;
  }
  
  bool? get isSecretCredentialsSent {
    return _isSecretCredentialsSent;
  }
  
  String? get photoBase64 {
    return _photoBase64;
  }
  
  String? get username {
    return _username;
  }
  
  String? get webPushNotificationToken {
    return _webPushNotificationToken;
  }
  
  String? get mobilePushNotificationToken {
    return _mobilePushNotificationToken;
  }
  
  String? get straitsxProfileID {
    return _straitsxProfileID;
  }
  
  String? get straitsxProfileHash {
    return _straitsxProfileHash;
  }
  
  String? get straitsxRegistrationIDHash {
    return _straitsxRegistrationIDHash;
  }
  
  List<Feedback>? get feedbacks {
    return _feedbacks;
  }
  
  List<UserGroup>? get groups {
    return _groups;
  }
  
  List<GroupFile>? get groupFiles {
    return _groupFiles;
  }
  
  List<GroupVote>? get groupVotes {
    return _groupVotes;
  }
  
  List<Group>? get suggestedGroups {
    return _suggestedGroups;
  }
  
  List<Notification>? get notifications {
    return _notifications;
  }
  
  List<OrganisationUser>? get organisations {
    return _organisations;
  }
  
  List<Question>? get questions {
    return _questions;
  }
  
  List<QuestionFile>? get questionFiles {
    return _questionFiles;
  }
  
  List<QuestionSave>? get questionSaves {
    return _questionSaves;
  }
  
  List<QuestionVote>? get questionVotes {
    return _questionVotes;
  }
  
  List<Answer>? get answers {
    return _answers;
  }
  
  List<AnswerFile>? get answerFiles {
    return _answerFiles;
  }
  
  List<AnswerVote>? get answerVotes {
    return _answerVotes;
  }
  
  List<Comment>? get comments {
    return _comments;
  }
  
  List<CommentFile>? get commentFiles {
    return _commentFiles;
  }
  
  List<CommentVote>? get commentVotes {
    return _commentVotes;
  }
  
  List<RecoveryCode>? get recoveryCodes {
    return _recoveryCodes;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get userUserTypeId {
    return _userUserTypeId;
  }
  
  String? get userProfileId {
    return _userProfileId;
  }
  
  const User._internal({required this.id, externalUserID, photoURL, userType, profile, emailAddress, firstName, lastName, parentId, uniqueLinkValue, telegramId, telegramChatId, deletedAt, avatar, fullMobileNumber, ipAddress, isEmailAddressVerified, isMobileNumberVerified, isLoggedOut, isSecretCredentialsSent, photoBase64, username, webPushNotificationToken, mobilePushNotificationToken, straitsxProfileID, straitsxProfileHash, straitsxRegistrationIDHash, feedbacks, groups, groupFiles, groupVotes, suggestedGroups, notifications, organisations, questions, questionFiles, questionSaves, questionVotes, answers, answerFiles, answerVotes, comments, commentFiles, commentVotes, recoveryCodes, createdAt, updatedAt, userUserTypeId, userProfileId}): _externalUserID = externalUserID, _photoURL = photoURL, _userType = userType, _profile = profile, _emailAddress = emailAddress, _firstName = firstName, _lastName = lastName, _parentId = parentId, _uniqueLinkValue = uniqueLinkValue, _telegramId = telegramId, _telegramChatId = telegramChatId, _deletedAt = deletedAt, _avatar = avatar, _fullMobileNumber = fullMobileNumber, _ipAddress = ipAddress, _isEmailAddressVerified = isEmailAddressVerified, _isMobileNumberVerified = isMobileNumberVerified, _isLoggedOut = isLoggedOut, _isSecretCredentialsSent = isSecretCredentialsSent, _photoBase64 = photoBase64, _username = username, _webPushNotificationToken = webPushNotificationToken, _mobilePushNotificationToken = mobilePushNotificationToken, _straitsxProfileID = straitsxProfileID, _straitsxProfileHash = straitsxProfileHash, _straitsxRegistrationIDHash = straitsxRegistrationIDHash, _feedbacks = feedbacks, _groups = groups, _groupFiles = groupFiles, _groupVotes = groupVotes, _suggestedGroups = suggestedGroups, _notifications = notifications, _organisations = organisations, _questions = questions, _questionFiles = questionFiles, _questionSaves = questionSaves, _questionVotes = questionVotes, _answers = answers, _answerFiles = answerFiles, _answerVotes = answerVotes, _comments = comments, _commentFiles = commentFiles, _commentVotes = commentVotes, _recoveryCodes = recoveryCodes, _createdAt = createdAt, _updatedAt = updatedAt, _userUserTypeId = userUserTypeId, _userProfileId = userProfileId;
  
  factory User({String? id, String? externalUserID, String? photoURL, UserType? userType, Profile? profile, String? emailAddress, String? firstName, String? lastName, String? parentId, String? uniqueLinkValue, String? telegramId, String? telegramChatId, amplify_core.TemporalDateTime? deletedAt, String? avatar, String? fullMobileNumber, String? ipAddress, bool? isEmailAddressVerified, bool? isMobileNumberVerified, bool? isLoggedOut, bool? isSecretCredentialsSent, String? photoBase64, String? username, String? webPushNotificationToken, String? mobilePushNotificationToken, String? straitsxProfileID, String? straitsxProfileHash, String? straitsxRegistrationIDHash, List<Feedback>? feedbacks, List<UserGroup>? groups, List<GroupFile>? groupFiles, List<GroupVote>? groupVotes, List<Group>? suggestedGroups, List<Notification>? notifications, List<OrganisationUser>? organisations, List<Question>? questions, List<QuestionFile>? questionFiles, List<QuestionSave>? questionSaves, List<QuestionVote>? questionVotes, List<Answer>? answers, List<AnswerFile>? answerFiles, List<AnswerVote>? answerVotes, List<Comment>? comments, List<CommentFile>? commentFiles, List<CommentVote>? commentVotes, List<RecoveryCode>? recoveryCodes, String? userUserTypeId, String? userProfileId}) {
    return User._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      externalUserID: externalUserID,
      photoURL: photoURL,
      userType: userType,
      profile: profile,
      emailAddress: emailAddress,
      firstName: firstName,
      lastName: lastName,
      parentId: parentId,
      uniqueLinkValue: uniqueLinkValue,
      telegramId: telegramId,
      telegramChatId: telegramChatId,
      deletedAt: deletedAt,
      avatar: avatar,
      fullMobileNumber: fullMobileNumber,
      ipAddress: ipAddress,
      isEmailAddressVerified: isEmailAddressVerified,
      isMobileNumberVerified: isMobileNumberVerified,
      isLoggedOut: isLoggedOut,
      isSecretCredentialsSent: isSecretCredentialsSent,
      photoBase64: photoBase64,
      username: username,
      webPushNotificationToken: webPushNotificationToken,
      mobilePushNotificationToken: mobilePushNotificationToken,
      straitsxProfileID: straitsxProfileID,
      straitsxProfileHash: straitsxProfileHash,
      straitsxRegistrationIDHash: straitsxRegistrationIDHash,
      feedbacks: feedbacks != null ? List<Feedback>.unmodifiable(feedbacks) : feedbacks,
      groups: groups != null ? List<UserGroup>.unmodifiable(groups) : groups,
      groupFiles: groupFiles != null ? List<GroupFile>.unmodifiable(groupFiles) : groupFiles,
      groupVotes: groupVotes != null ? List<GroupVote>.unmodifiable(groupVotes) : groupVotes,
      suggestedGroups: suggestedGroups != null ? List<Group>.unmodifiable(suggestedGroups) : suggestedGroups,
      notifications: notifications != null ? List<Notification>.unmodifiable(notifications) : notifications,
      organisations: organisations != null ? List<OrganisationUser>.unmodifiable(organisations) : organisations,
      questions: questions != null ? List<Question>.unmodifiable(questions) : questions,
      questionFiles: questionFiles != null ? List<QuestionFile>.unmodifiable(questionFiles) : questionFiles,
      questionSaves: questionSaves != null ? List<QuestionSave>.unmodifiable(questionSaves) : questionSaves,
      questionVotes: questionVotes != null ? List<QuestionVote>.unmodifiable(questionVotes) : questionVotes,
      answers: answers != null ? List<Answer>.unmodifiable(answers) : answers,
      answerFiles: answerFiles != null ? List<AnswerFile>.unmodifiable(answerFiles) : answerFiles,
      answerVotes: answerVotes != null ? List<AnswerVote>.unmodifiable(answerVotes) : answerVotes,
      comments: comments != null ? List<Comment>.unmodifiable(comments) : comments,
      commentFiles: commentFiles != null ? List<CommentFile>.unmodifiable(commentFiles) : commentFiles,
      commentVotes: commentVotes != null ? List<CommentVote>.unmodifiable(commentVotes) : commentVotes,
      recoveryCodes: recoveryCodes != null ? List<RecoveryCode>.unmodifiable(recoveryCodes) : recoveryCodes,
      userUserTypeId: userUserTypeId,
      userProfileId: userProfileId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _externalUserID == other._externalUserID &&
      _photoURL == other._photoURL &&
      _userType == other._userType &&
      _profile == other._profile &&
      _emailAddress == other._emailAddress &&
      _firstName == other._firstName &&
      _lastName == other._lastName &&
      _parentId == other._parentId &&
      _uniqueLinkValue == other._uniqueLinkValue &&
      _telegramId == other._telegramId &&
      _telegramChatId == other._telegramChatId &&
      _deletedAt == other._deletedAt &&
      _avatar == other._avatar &&
      _fullMobileNumber == other._fullMobileNumber &&
      _ipAddress == other._ipAddress &&
      _isEmailAddressVerified == other._isEmailAddressVerified &&
      _isMobileNumberVerified == other._isMobileNumberVerified &&
      _isLoggedOut == other._isLoggedOut &&
      _isSecretCredentialsSent == other._isSecretCredentialsSent &&
      _photoBase64 == other._photoBase64 &&
      _username == other._username &&
      _webPushNotificationToken == other._webPushNotificationToken &&
      _mobilePushNotificationToken == other._mobilePushNotificationToken &&
      _straitsxProfileID == other._straitsxProfileID &&
      _straitsxProfileHash == other._straitsxProfileHash &&
      _straitsxRegistrationIDHash == other._straitsxRegistrationIDHash &&
      DeepCollectionEquality().equals(_feedbacks, other._feedbacks) &&
      DeepCollectionEquality().equals(_groups, other._groups) &&
      DeepCollectionEquality().equals(_groupFiles, other._groupFiles) &&
      DeepCollectionEquality().equals(_groupVotes, other._groupVotes) &&
      DeepCollectionEquality().equals(_suggestedGroups, other._suggestedGroups) &&
      DeepCollectionEquality().equals(_notifications, other._notifications) &&
      DeepCollectionEquality().equals(_organisations, other._organisations) &&
      DeepCollectionEquality().equals(_questions, other._questions) &&
      DeepCollectionEquality().equals(_questionFiles, other._questionFiles) &&
      DeepCollectionEquality().equals(_questionSaves, other._questionSaves) &&
      DeepCollectionEquality().equals(_questionVotes, other._questionVotes) &&
      DeepCollectionEquality().equals(_answers, other._answers) &&
      DeepCollectionEquality().equals(_answerFiles, other._answerFiles) &&
      DeepCollectionEquality().equals(_answerVotes, other._answerVotes) &&
      DeepCollectionEquality().equals(_comments, other._comments) &&
      DeepCollectionEquality().equals(_commentFiles, other._commentFiles) &&
      DeepCollectionEquality().equals(_commentVotes, other._commentVotes) &&
      DeepCollectionEquality().equals(_recoveryCodes, other._recoveryCodes) &&
      _userUserTypeId == other._userUserTypeId &&
      _userProfileId == other._userProfileId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("externalUserID=" + "$_externalUserID" + ", ");
    buffer.write("photoURL=" + "$_photoURL" + ", ");
    buffer.write("emailAddress=" + "$_emailAddress" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("parentId=" + "$_parentId" + ", ");
    buffer.write("uniqueLinkValue=" + "$_uniqueLinkValue" + ", ");
    buffer.write("telegramId=" + "$_telegramId" + ", ");
    buffer.write("telegramChatId=" + "$_telegramChatId" + ", ");
    buffer.write("deletedAt=" + (_deletedAt != null ? _deletedAt!.format() : "null") + ", ");
    buffer.write("avatar=" + "$_avatar" + ", ");
    buffer.write("fullMobileNumber=" + "$_fullMobileNumber" + ", ");
    buffer.write("ipAddress=" + "$_ipAddress" + ", ");
    buffer.write("isEmailAddressVerified=" + (_isEmailAddressVerified != null ? _isEmailAddressVerified!.toString() : "null") + ", ");
    buffer.write("isMobileNumberVerified=" + (_isMobileNumberVerified != null ? _isMobileNumberVerified!.toString() : "null") + ", ");
    buffer.write("isLoggedOut=" + (_isLoggedOut != null ? _isLoggedOut!.toString() : "null") + ", ");
    buffer.write("isSecretCredentialsSent=" + (_isSecretCredentialsSent != null ? _isSecretCredentialsSent!.toString() : "null") + ", ");
    buffer.write("photoBase64=" + "$_photoBase64" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("webPushNotificationToken=" + "$_webPushNotificationToken" + ", ");
    buffer.write("mobilePushNotificationToken=" + "$_mobilePushNotificationToken" + ", ");
    buffer.write("straitsxProfileID=" + "$_straitsxProfileID" + ", ");
    buffer.write("straitsxProfileHash=" + "$_straitsxProfileHash" + ", ");
    buffer.write("straitsxRegistrationIDHash=" + "$_straitsxRegistrationIDHash" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("userUserTypeId=" + "$_userUserTypeId" + ", ");
    buffer.write("userProfileId=" + "$_userProfileId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? externalUserID, String? photoURL, UserType? userType, Profile? profile, String? emailAddress, String? firstName, String? lastName, String? parentId, String? uniqueLinkValue, String? telegramId, String? telegramChatId, amplify_core.TemporalDateTime? deletedAt, String? avatar, String? fullMobileNumber, String? ipAddress, bool? isEmailAddressVerified, bool? isMobileNumberVerified, bool? isLoggedOut, bool? isSecretCredentialsSent, String? photoBase64, String? username, String? webPushNotificationToken, String? mobilePushNotificationToken, String? straitsxProfileID, String? straitsxProfileHash, String? straitsxRegistrationIDHash, List<Feedback>? feedbacks, List<UserGroup>? groups, List<GroupFile>? groupFiles, List<GroupVote>? groupVotes, List<Group>? suggestedGroups, List<Notification>? notifications, List<OrganisationUser>? organisations, List<Question>? questions, List<QuestionFile>? questionFiles, List<QuestionSave>? questionSaves, List<QuestionVote>? questionVotes, List<Answer>? answers, List<AnswerFile>? answerFiles, List<AnswerVote>? answerVotes, List<Comment>? comments, List<CommentFile>? commentFiles, List<CommentVote>? commentVotes, List<RecoveryCode>? recoveryCodes, String? userUserTypeId, String? userProfileId}) {
    return User._internal(
      id: id ?? this.id,
      externalUserID: externalUserID ?? this.externalUserID,
      photoURL: photoURL ?? this.photoURL,
      userType: userType ?? this.userType,
      profile: profile ?? this.profile,
      emailAddress: emailAddress ?? this.emailAddress,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      parentId: parentId ?? this.parentId,
      uniqueLinkValue: uniqueLinkValue ?? this.uniqueLinkValue,
      telegramId: telegramId ?? this.telegramId,
      telegramChatId: telegramChatId ?? this.telegramChatId,
      deletedAt: deletedAt ?? this.deletedAt,
      avatar: avatar ?? this.avatar,
      fullMobileNumber: fullMobileNumber ?? this.fullMobileNumber,
      ipAddress: ipAddress ?? this.ipAddress,
      isEmailAddressVerified: isEmailAddressVerified ?? this.isEmailAddressVerified,
      isMobileNumberVerified: isMobileNumberVerified ?? this.isMobileNumberVerified,
      isLoggedOut: isLoggedOut ?? this.isLoggedOut,
      isSecretCredentialsSent: isSecretCredentialsSent ?? this.isSecretCredentialsSent,
      photoBase64: photoBase64 ?? this.photoBase64,
      username: username ?? this.username,
      webPushNotificationToken: webPushNotificationToken ?? this.webPushNotificationToken,
      mobilePushNotificationToken: mobilePushNotificationToken ?? this.mobilePushNotificationToken,
      straitsxProfileID: straitsxProfileID ?? this.straitsxProfileID,
      straitsxProfileHash: straitsxProfileHash ?? this.straitsxProfileHash,
      straitsxRegistrationIDHash: straitsxRegistrationIDHash ?? this.straitsxRegistrationIDHash,
      feedbacks: feedbacks ?? this.feedbacks,
      groups: groups ?? this.groups,
      groupFiles: groupFiles ?? this.groupFiles,
      groupVotes: groupVotes ?? this.groupVotes,
      suggestedGroups: suggestedGroups ?? this.suggestedGroups,
      notifications: notifications ?? this.notifications,
      organisations: organisations ?? this.organisations,
      questions: questions ?? this.questions,
      questionFiles: questionFiles ?? this.questionFiles,
      questionSaves: questionSaves ?? this.questionSaves,
      questionVotes: questionVotes ?? this.questionVotes,
      answers: answers ?? this.answers,
      answerFiles: answerFiles ?? this.answerFiles,
      answerVotes: answerVotes ?? this.answerVotes,
      comments: comments ?? this.comments,
      commentFiles: commentFiles ?? this.commentFiles,
      commentVotes: commentVotes ?? this.commentVotes,
      recoveryCodes: recoveryCodes ?? this.recoveryCodes,
      userUserTypeId: userUserTypeId ?? this.userUserTypeId,
      userProfileId: userProfileId ?? this.userProfileId);
  }
  
  User copyWithModelFieldValues({
    ModelFieldValue<String>? id,
    ModelFieldValue<String?>? externalUserID,
    ModelFieldValue<String?>? photoURL,
    ModelFieldValue<UserType?>? userType,
    ModelFieldValue<Profile?>? profile,
    ModelFieldValue<String?>? emailAddress,
    ModelFieldValue<String?>? firstName,
    ModelFieldValue<String?>? lastName,
    ModelFieldValue<String?>? parentId,
    ModelFieldValue<String?>? uniqueLinkValue,
    ModelFieldValue<String?>? telegramId,
    ModelFieldValue<String?>? telegramChatId,
    ModelFieldValue<amplify_core.TemporalDateTime?>? deletedAt,
    ModelFieldValue<String?>? avatar,
    ModelFieldValue<String?>? fullMobileNumber,
    ModelFieldValue<String?>? ipAddress,
    ModelFieldValue<bool?>? isEmailAddressVerified,
    ModelFieldValue<bool?>? isMobileNumberVerified,
    ModelFieldValue<bool?>? isLoggedOut,
    ModelFieldValue<bool?>? isSecretCredentialsSent,
    ModelFieldValue<String?>? photoBase64,
    ModelFieldValue<String?>? username,
    ModelFieldValue<String?>? webPushNotificationToken,
    ModelFieldValue<String?>? mobilePushNotificationToken,
    ModelFieldValue<String?>? straitsxProfileID,
    ModelFieldValue<String?>? straitsxProfileHash,
    ModelFieldValue<String?>? straitsxRegistrationIDHash,
    ModelFieldValue<List<Feedback>?>? feedbacks,
    ModelFieldValue<List<UserGroup>?>? groups,
    ModelFieldValue<List<GroupFile>?>? groupFiles,
    ModelFieldValue<List<GroupVote>?>? groupVotes,
    ModelFieldValue<List<Group>?>? suggestedGroups,
    ModelFieldValue<List<Notification>?>? notifications,
    ModelFieldValue<List<OrganisationUser>?>? organisations,
    ModelFieldValue<List<Question>?>? questions,
    ModelFieldValue<List<QuestionFile>?>? questionFiles,
    ModelFieldValue<List<QuestionSave>?>? questionSaves,
    ModelFieldValue<List<QuestionVote>?>? questionVotes,
    ModelFieldValue<List<Answer>?>? answers,
    ModelFieldValue<List<AnswerFile>?>? answerFiles,
    ModelFieldValue<List<AnswerVote>?>? answerVotes,
    ModelFieldValue<List<Comment>?>? comments,
    ModelFieldValue<List<CommentFile>?>? commentFiles,
    ModelFieldValue<List<CommentVote>?>? commentVotes,
    ModelFieldValue<List<RecoveryCode>?>? recoveryCodes,
    ModelFieldValue<String?>? userUserTypeId,
    ModelFieldValue<String?>? userProfileId
  }) {
    return User._internal(
      id: id == null ? this.id : id.value,
      externalUserID: externalUserID == null ? this.externalUserID : externalUserID.value,
      photoURL: photoURL == null ? this.photoURL : photoURL.value,
      userType: userType == null ? this.userType : userType.value,
      profile: profile == null ? this.profile : profile.value,
      emailAddress: emailAddress == null ? this.emailAddress : emailAddress.value,
      firstName: firstName == null ? this.firstName : firstName.value,
      lastName: lastName == null ? this.lastName : lastName.value,
      parentId: parentId == null ? this.parentId : parentId.value,
      uniqueLinkValue: uniqueLinkValue == null ? this.uniqueLinkValue : uniqueLinkValue.value,
      telegramId: telegramId == null ? this.telegramId : telegramId.value,
      telegramChatId: telegramChatId == null ? this.telegramChatId : telegramChatId.value,
      deletedAt: deletedAt == null ? this.deletedAt : deletedAt.value,
      avatar: avatar == null ? this.avatar : avatar.value,
      fullMobileNumber: fullMobileNumber == null ? this.fullMobileNumber : fullMobileNumber.value,
      ipAddress: ipAddress == null ? this.ipAddress : ipAddress.value,
      isEmailAddressVerified: isEmailAddressVerified == null ? this.isEmailAddressVerified : isEmailAddressVerified.value,
      isMobileNumberVerified: isMobileNumberVerified == null ? this.isMobileNumberVerified : isMobileNumberVerified.value,
      isLoggedOut: isLoggedOut == null ? this.isLoggedOut : isLoggedOut.value,
      isSecretCredentialsSent: isSecretCredentialsSent == null ? this.isSecretCredentialsSent : isSecretCredentialsSent.value,
      photoBase64: photoBase64 == null ? this.photoBase64 : photoBase64.value,
      username: username == null ? this.username : username.value,
      webPushNotificationToken: webPushNotificationToken == null ? this.webPushNotificationToken : webPushNotificationToken.value,
      mobilePushNotificationToken: mobilePushNotificationToken == null ? this.mobilePushNotificationToken : mobilePushNotificationToken.value,
      straitsxProfileID: straitsxProfileID == null ? this.straitsxProfileID : straitsxProfileID.value,
      straitsxProfileHash: straitsxProfileHash == null ? this.straitsxProfileHash : straitsxProfileHash.value,
      straitsxRegistrationIDHash: straitsxRegistrationIDHash == null ? this.straitsxRegistrationIDHash : straitsxRegistrationIDHash.value,
      feedbacks: feedbacks == null ? this.feedbacks : feedbacks.value,
      groups: groups == null ? this.groups : groups.value,
      groupFiles: groupFiles == null ? this.groupFiles : groupFiles.value,
      groupVotes: groupVotes == null ? this.groupVotes : groupVotes.value,
      suggestedGroups: suggestedGroups == null ? this.suggestedGroups : suggestedGroups.value,
      notifications: notifications == null ? this.notifications : notifications.value,
      organisations: organisations == null ? this.organisations : organisations.value,
      questions: questions == null ? this.questions : questions.value,
      questionFiles: questionFiles == null ? this.questionFiles : questionFiles.value,
      questionSaves: questionSaves == null ? this.questionSaves : questionSaves.value,
      questionVotes: questionVotes == null ? this.questionVotes : questionVotes.value,
      answers: answers == null ? this.answers : answers.value,
      answerFiles: answerFiles == null ? this.answerFiles : answerFiles.value,
      answerVotes: answerVotes == null ? this.answerVotes : answerVotes.value,
      comments: comments == null ? this.comments : comments.value,
      commentFiles: commentFiles == null ? this.commentFiles : commentFiles.value,
      commentVotes: commentVotes == null ? this.commentVotes : commentVotes.value,
      recoveryCodes: recoveryCodes == null ? this.recoveryCodes : recoveryCodes.value,
      userUserTypeId: userUserTypeId == null ? this.userUserTypeId : userUserTypeId.value,
      userProfileId: userProfileId == null ? this.userProfileId : userProfileId.value
    );
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _externalUserID = json['externalUserID'],
      _photoURL = json['photoURL'],
      _userType = json['userType'] != null
        ? UserType.fromJson(new Map<String, dynamic>.from(json['userType']))
        : null,
      _profile = json['profile'] != null
        ? Profile.fromJson(new Map<String, dynamic>.from(json['profile']))
        : null,
      _emailAddress = json['emailAddress'],
      _firstName = json['firstName'],
      _lastName = json['lastName'],
      _parentId = json['parentId'],
      _uniqueLinkValue = json['uniqueLinkValue'],
      _telegramId = json['telegramId'],
      _telegramChatId = json['telegramChatId'],
      _deletedAt = json['deletedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['deletedAt']) : null,
      _avatar = json['avatar'],
      _fullMobileNumber = json['fullMobileNumber'],
      _ipAddress = json['ipAddress'],
      _isEmailAddressVerified = json['isEmailAddressVerified'],
      _isMobileNumberVerified = json['isMobileNumberVerified'],
      _isLoggedOut = json['isLoggedOut'],
      _isSecretCredentialsSent = json['isSecretCredentialsSent'],
      _photoBase64 = json['photoBase64'],
      _username = json['username'],
      _webPushNotificationToken = json['webPushNotificationToken'],
      _mobilePushNotificationToken = json['mobilePushNotificationToken'],
      _straitsxProfileID = json['straitsxProfileID'],
      _straitsxProfileHash = json['straitsxProfileHash'],
      _straitsxRegistrationIDHash = json['straitsxRegistrationIDHash'],
      _feedbacks = json['feedbacks']?['items'] is List
        ? (json['feedbacks']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Feedback.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _groups = json['groups']?['items'] is List
        ? (json['groups']?['items'] as List)
          .where((e) => e != null)
          .map((e) => UserGroup.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _groupFiles = json['groupFiles']?['items'] is List
        ? (json['groupFiles']?['items'] as List)
          .where((e) => e != null)
          .map((e) => GroupFile.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _groupVotes = json['groupVotes']?['items'] is List
        ? (json['groupVotes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => GroupVote.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _suggestedGroups = json['suggestedGroups']?['items'] is List
        ? (json['suggestedGroups']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Group.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _notifications = json['notifications']?['items'] is List
        ? (json['notifications']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Notification.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _organisations = json['organisations']?['items'] is List
        ? (json['organisations']?['items'] as List)
          .where((e) => e != null)
          .map((e) => OrganisationUser.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _questions = json['questions']?['items'] is List
        ? (json['questions']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Question.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _questionFiles = json['questionFiles']?['items'] is List
        ? (json['questionFiles']?['items'] as List)
          .where((e) => e != null)
          .map((e) => QuestionFile.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _questionSaves = json['questionSaves']?['items'] is List
        ? (json['questionSaves']?['items'] as List)
          .where((e) => e != null)
          .map((e) => QuestionSave.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _questionVotes = json['questionVotes']?['items'] is List
        ? (json['questionVotes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => QuestionVote.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _answers = json['answers']?['items'] is List
        ? (json['answers']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Answer.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _answerFiles = json['answerFiles']?['items'] is List
        ? (json['answerFiles']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AnswerFile.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _answerVotes = json['answerVotes']?['items'] is List
        ? (json['answerVotes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => AnswerVote.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _comments = json['comments']?['items'] is List
        ? (json['comments']?['items'] as List)
          .where((e) => e != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _commentFiles = json['commentFiles']?['items'] is List
        ? (json['commentFiles']?['items'] as List)
          .where((e) => e != null)
          .map((e) => CommentFile.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _commentVotes = json['commentVotes']?['items'] is List
        ? (json['commentVotes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => CommentVote.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _recoveryCodes = json['recoveryCodes']?['items'] is List
        ? (json['recoveryCodes']?['items'] as List)
          .where((e) => e != null)
          .map((e) => RecoveryCode.fromJson(new Map<String, dynamic>.from(e)))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _userUserTypeId = json['userUserTypeId'],
      _userProfileId = json['userProfileId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'externalUserID': _externalUserID, 'photoURL': _photoURL, 'userType': _userType?.toJson(), 'profile': _profile?.toJson(), 'emailAddress': _emailAddress, 'firstName': _firstName, 'lastName': _lastName, 'parentId': _parentId, 'uniqueLinkValue': _uniqueLinkValue, 'telegramId': _telegramId, 'telegramChatId': _telegramChatId, 'deletedAt': _deletedAt?.format(), 'avatar': _avatar, 'fullMobileNumber': _fullMobileNumber, 'ipAddress': _ipAddress, 'isEmailAddressVerified': _isEmailAddressVerified, 'isMobileNumberVerified': _isMobileNumberVerified, 'isLoggedOut': _isLoggedOut, 'isSecretCredentialsSent': _isSecretCredentialsSent, 'photoBase64': _photoBase64, 'username': _username, 'webPushNotificationToken': _webPushNotificationToken, 'mobilePushNotificationToken': _mobilePushNotificationToken, 'straitsxProfileID': _straitsxProfileID, 'straitsxProfileHash': _straitsxProfileHash, 'straitsxRegistrationIDHash': _straitsxRegistrationIDHash, 'feedbacks': _feedbacks?.map((Feedback? e) => e?.toJson()).toList(), 'groups': _groups?.map((UserGroup? e) => e?.toJson()).toList(), 'groupFiles': _groupFiles?.map((GroupFile? e) => e?.toJson()).toList(), 'groupVotes': _groupVotes?.map((GroupVote? e) => e?.toJson()).toList(), 'suggestedGroups': _suggestedGroups?.map((Group? e) => e?.toJson()).toList(), 'notifications': _notifications?.map((Notification? e) => e?.toJson()).toList(), 'organisations': _organisations?.map((OrganisationUser? e) => e?.toJson()).toList(), 'questions': _questions?.map((Question? e) => e?.toJson()).toList(), 'questionFiles': _questionFiles?.map((QuestionFile? e) => e?.toJson()).toList(), 'questionSaves': _questionSaves?.map((QuestionSave? e) => e?.toJson()).toList(), 'questionVotes': _questionVotes?.map((QuestionVote? e) => e?.toJson()).toList(), 'answers': _answers?.map((Answer? e) => e?.toJson()).toList(), 'answerFiles': _answerFiles?.map((AnswerFile? e) => e?.toJson()).toList(), 'answerVotes': _answerVotes?.map((AnswerVote? e) => e?.toJson()).toList(), 'comments': _comments?.map((Comment? e) => e?.toJson()).toList(), 'commentFiles': _commentFiles?.map((CommentFile? e) => e?.toJson()).toList(), 'commentVotes': _commentVotes?.map((CommentVote? e) => e?.toJson()).toList(), 'recoveryCodes': _recoveryCodes?.map((RecoveryCode? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'userUserTypeId': _userUserTypeId, 'userProfileId': _userProfileId
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'externalUserID': _externalUserID,
    'photoURL': _photoURL,
    'userType': _userType,
    'profile': _profile,
    'emailAddress': _emailAddress,
    'firstName': _firstName,
    'lastName': _lastName,
    'parentId': _parentId,
    'uniqueLinkValue': _uniqueLinkValue,
    'telegramId': _telegramId,
    'telegramChatId': _telegramChatId,
    'deletedAt': _deletedAt,
    'avatar': _avatar,
    'fullMobileNumber': _fullMobileNumber,
    'ipAddress': _ipAddress,
    'isEmailAddressVerified': _isEmailAddressVerified,
    'isMobileNumberVerified': _isMobileNumberVerified,
    'isLoggedOut': _isLoggedOut,
    'isSecretCredentialsSent': _isSecretCredentialsSent,
    'photoBase64': _photoBase64,
    'username': _username,
    'webPushNotificationToken': _webPushNotificationToken,
    'mobilePushNotificationToken': _mobilePushNotificationToken,
    'straitsxProfileID': _straitsxProfileID,
    'straitsxProfileHash': _straitsxProfileHash,
    'straitsxRegistrationIDHash': _straitsxRegistrationIDHash,
    'feedbacks': _feedbacks,
    'groups': _groups,
    'groupFiles': _groupFiles,
    'groupVotes': _groupVotes,
    'suggestedGroups': _suggestedGroups,
    'notifications': _notifications,
    'organisations': _organisations,
    'questions': _questions,
    'questionFiles': _questionFiles,
    'questionSaves': _questionSaves,
    'questionVotes': _questionVotes,
    'answers': _answers,
    'answerFiles': _answerFiles,
    'answerVotes': _answerVotes,
    'comments': _comments,
    'commentFiles': _commentFiles,
    'commentVotes': _commentVotes,
    'recoveryCodes': _recoveryCodes,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'userUserTypeId': _userUserTypeId,
    'userProfileId': _userProfileId
  };

  static final ID = amplify_core.QueryField(fieldName: "id");
  static final EXTERNALUSERID = amplify_core.QueryField(fieldName: "externalUserID");
  static final PHOTOURL = amplify_core.QueryField(fieldName: "photoURL");
  static final USERTYPE = amplify_core.QueryField(
    fieldName: "userType",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserType'));
  static final PROFILE = amplify_core.QueryField(
    fieldName: "profile",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Profile'));
  static final EMAILADDRESS = amplify_core.QueryField(fieldName: "emailAddress");
  static final FIRSTNAME = amplify_core.QueryField(fieldName: "firstName");
  static final LASTNAME = amplify_core.QueryField(fieldName: "lastName");
  static final PARENTID = amplify_core.QueryField(fieldName: "parentId");
  static final UNIQUELINKVALUE = amplify_core.QueryField(fieldName: "uniqueLinkValue");
  static final TELEGRAMID = amplify_core.QueryField(fieldName: "telegramId");
  static final TELEGRAMCHATID = amplify_core.QueryField(fieldName: "telegramChatId");
  static final DELETEDAT = amplify_core.QueryField(fieldName: "deletedAt");
  static final AVATAR = amplify_core.QueryField(fieldName: "avatar");
  static final FULLMOBILENUMBER = amplify_core.QueryField(fieldName: "fullMobileNumber");
  static final IPADDRESS = amplify_core.QueryField(fieldName: "ipAddress");
  static final ISEMAILADDRESSVERIFIED = amplify_core.QueryField(fieldName: "isEmailAddressVerified");
  static final ISMOBILENUMBERVERIFIED = amplify_core.QueryField(fieldName: "isMobileNumberVerified");
  static final ISLOGGEDOUT = amplify_core.QueryField(fieldName: "isLoggedOut");
  static final ISSECRETCREDENTIALSSENT = amplify_core.QueryField(fieldName: "isSecretCredentialsSent");
  static final PHOTOBASE64 = amplify_core.QueryField(fieldName: "photoBase64");
  static final USERNAME = amplify_core.QueryField(fieldName: "username");
  static final WEBPUSHNOTIFICATIONTOKEN = amplify_core.QueryField(fieldName: "webPushNotificationToken");
  static final MOBILEPUSHNOTIFICATIONTOKEN = amplify_core.QueryField(fieldName: "mobilePushNotificationToken");
  static final STRAITSXPROFILEID = amplify_core.QueryField(fieldName: "straitsxProfileID");
  static final STRAITSXPROFILEHASH = amplify_core.QueryField(fieldName: "straitsxProfileHash");
  static final STRAITSXREGISTRATIONIDHASH = amplify_core.QueryField(fieldName: "straitsxRegistrationIDHash");
  static final FEEDBACKS = amplify_core.QueryField(
    fieldName: "feedbacks",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Feedback'));
  static final GROUPS = amplify_core.QueryField(
    fieldName: "groups",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserGroup'));
  static final GROUPFILES = amplify_core.QueryField(
    fieldName: "groupFiles",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupFile'));
  static final GROUPVOTES = amplify_core.QueryField(
    fieldName: "groupVotes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'GroupVote'));
  static final SUGGESTEDGROUPS = amplify_core.QueryField(
    fieldName: "suggestedGroups",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Group'));
  static final NOTIFICATIONS = amplify_core.QueryField(
    fieldName: "notifications",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Notification'));
  static final ORGANISATIONS = amplify_core.QueryField(
    fieldName: "organisations",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'OrganisationUser'));
  static final QUESTIONS = amplify_core.QueryField(
    fieldName: "questions",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Question'));
  static final QUESTIONFILES = amplify_core.QueryField(
    fieldName: "questionFiles",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'QuestionFile'));
  static final QUESTIONSAVES = amplify_core.QueryField(
    fieldName: "questionSaves",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'QuestionSave'));
  static final QUESTIONVOTES = amplify_core.QueryField(
    fieldName: "questionVotes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'QuestionVote'));
  static final ANSWERS = amplify_core.QueryField(
    fieldName: "answers",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Answer'));
  static final ANSWERFILES = amplify_core.QueryField(
    fieldName: "answerFiles",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AnswerFile'));
  static final ANSWERVOTES = amplify_core.QueryField(
    fieldName: "answerVotes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'AnswerVote'));
  static final COMMENTS = amplify_core.QueryField(
    fieldName: "comments",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Comment'));
  static final COMMENTFILES = amplify_core.QueryField(
    fieldName: "commentFiles",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CommentFile'));
  static final COMMENTVOTES = amplify_core.QueryField(
    fieldName: "commentVotes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'CommentVote'));
  static final RECOVERYCODES = amplify_core.QueryField(
    fieldName: "recoveryCodes",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'RecoveryCode'));
  static final USERUSERTYPEID = amplify_core.QueryField(fieldName: "userUserTypeId");
  static final USERPROFILEID = amplify_core.QueryField(fieldName: "userProfileId");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ]),
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
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
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
      key: User.EXTERNALUSERID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PHOTOURL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: User.USERTYPE,
      isRequired: false,
      ofModelName: 'UserType',
      associatedKey: UserType.ID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: User.PROFILE,
      isRequired: false,
      ofModelName: 'Profile',
      associatedKey: Profile.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.EMAILADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.FIRSTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.LASTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PARENTID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.UNIQUELINKVALUE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.TELEGRAMID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.TELEGRAMCHATID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.DELETEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.AVATAR,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.FULLMOBILENUMBER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.IPADDRESS,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.ISEMAILADDRESSVERIFIED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.ISMOBILENUMBERVERIFIED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.ISLOGGEDOUT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.ISSECRETCREDENTIALSSENT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PHOTOBASE64,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.USERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.WEBPUSHNOTIFICATIONTOKEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.MOBILEPUSHNOTIFICATIONTOKEN,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.STRAITSXPROFILEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.STRAITSXPROFILEHASH,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.STRAITSXREGISTRATIONIDHASH,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.FEEDBACKS,
      isRequired: false,
      ofModelName: 'Feedback',
      associatedKey: Feedback.USERID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.GROUPS,
      isRequired: false,
      ofModelName: 'UserGroup',
      associatedKey: UserGroup.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.GROUPFILES,
      isRequired: false,
      ofModelName: 'GroupFile',
      associatedKey: GroupFile.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.GROUPVOTES,
      isRequired: false,
      ofModelName: 'GroupVote',
      associatedKey: GroupVote.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.SUGGESTEDGROUPS,
      isRequired: false,
      ofModelName: 'Group',
      associatedKey: Group.SUGGESTER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.NOTIFICATIONS,
      isRequired: false,
      ofModelName: 'Notification',
      associatedKey: Notification.USERID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.ORGANISATIONS,
      isRequired: false,
      ofModelName: 'OrganisationUser',
      associatedKey: OrganisationUser.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.QUESTIONS,
      isRequired: false,
      ofModelName: 'Question',
      associatedKey: Question.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.QUESTIONFILES,
      isRequired: false,
      ofModelName: 'QuestionFile',
      associatedKey: QuestionFile.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.QUESTIONSAVES,
      isRequired: false,
      ofModelName: 'QuestionSave',
      associatedKey: QuestionSave.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.QUESTIONVOTES,
      isRequired: false,
      ofModelName: 'QuestionVote',
      associatedKey: QuestionVote.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.ANSWERS,
      isRequired: false,
      ofModelName: 'Answer',
      associatedKey: Answer.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.ANSWERFILES,
      isRequired: false,
      ofModelName: 'AnswerFile',
      associatedKey: AnswerFile.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.ANSWERVOTES,
      isRequired: false,
      ofModelName: 'AnswerVote',
      associatedKey: AnswerVote.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.COMMENTS,
      isRequired: false,
      ofModelName: 'Comment',
      associatedKey: Comment.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.COMMENTFILES,
      isRequired: false,
      ofModelName: 'CommentFile',
      associatedKey: CommentFile.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.COMMENTVOTES,
      isRequired: false,
      ofModelName: 'CommentVote',
      associatedKey: CommentVote.USER
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.RECOVERYCODES,
      isRequired: false,
      ofModelName: 'RecoveryCode',
      associatedKey: RecoveryCode.USERID
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
      key: User.USERUSERTYPEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.USERPROFILEID,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _UserModelType extends amplify_core.ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'User';
  }
}
