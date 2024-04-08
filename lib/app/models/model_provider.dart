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
import 'activity.dart';
import 'activity_type.dart';
import 'aggregate_day_assessment.dart';
import 'aggregate_day_organisation_assessment.dart';
import 'aggregate_hour_assessment.dart';
import 'aggregate_hour_organisation_assessment.dart';
import 'aggregate_month_assessment.dart';
import 'aggregate_month_organisation_assessment.dart';
import 'aggregate_year_assessment.dart';
import 'aggregate_year_organisation_assessment.dart';
import 'answer.dart';
import 'answer_file.dart';
import 'answer_vote.dart';
import 'assessment.dart';
import 'comment.dart';
import 'comment_file.dart';
import 'comment_vote.dart';
import 'country.dart';
import 'feedback.dart';
import 'group.dart';
import 'group_file.dart';
import 'group_tag.dart';
import 'group_tag_group.dart';
import 'group_type.dart';
import 'group_vote.dart';
import 'notification.dart';
import 'notification_action.dart';
import 'notification_channel.dart';
import 'notification_type.dart';
import 'organisation.dart';
import 'organisation_type.dart';
import 'organisation_user.dart';
import 'preference.dart';
import 'professional.dart';
import 'profile.dart';
import 'profile_activity.dart';
import 'profile_preference.dart';
import 'profile_suggestion.dart';
import 'provider.dart';
import 'question.dart';
import 'question_file.dart';
import 'question_save.dart';
import 'question_vote.dart';
import 'recovery_code.dart';
import 'reported_user.dart';
import 'reward.dart';
import 'reward_type.dart';
import 'self_care.dart';
import 'self_care_type.dart';
import 'self_care_usage.dart';
import 'suggestion.dart';
import 'suggestion_type.dart';
import 'user.dart';
import 'user_group.dart';
import 'user_type.dart';

export 'activity.dart';
export 'activity_type.dart';
export 'aggregate_day_assessment.dart';
export 'aggregate_day_organisation_assessment.dart';
export 'aggregate_hour_assessment.dart';
export 'aggregate_hour_organisation_assessment.dart';
export 'aggregate_month_assessment.dart';
export 'aggregate_month_organisation_assessment.dart';
export 'aggregate_year_assessment.dart';
export 'aggregate_year_organisation_assessment.dart';
export 'answer.dart';
export 'answer_file.dart';
export 'answer_vote.dart';
export 'assessment.dart';
export 'comment.dart';
export 'comment_file.dart';
export 'comment_vote.dart';
export 'country.dart';
export 'feedback.dart';
export 'group.dart';
export 'group_file.dart';
export 'group_tag.dart';
export 'group_tag_group.dart';
export 'group_type.dart';
export 'group_vote.dart';
export 'notification.dart';
export 'notification_action.dart';
export 'notification_channel.dart';
export 'notification_type.dart';
export 'organisation.dart';
export 'organisation_type.dart';
export 'organisation_user.dart';
export 'preference.dart';
export 'professional.dart';
export 'profile.dart';
export 'profile_activity.dart';
export 'profile_preference.dart';
export 'profile_suggestion.dart';
export 'provider.dart';
export 'question.dart';
export 'question_file.dart';
export 'question_save.dart';
export 'question_vote.dart';
export 'recovery_code.dart';
export 'reported_user.dart';
export 'reward.dart';
export 'reward_type.dart';
export 'self_care.dart';
export 'self_care_type.dart';
export 'self_care_usage.dart';
export 'suggestion.dart';
export 'suggestion_type.dart';
export 'user.dart';
export 'user_group.dart';
export 'user_type.dart';

class ModelProvider implements amplify_core.ModelProviderInterface {
  @override
  String version = "ed7976b707ba389201f60454357df824";
  @override
  List<amplify_core.ModelSchema> modelSchemas = [Activity.schema, ActivityType.schema, AggregateDayAssessment.schema, AggregateDayOrganisationAssessment.schema, AggregateHourAssessment.schema, AggregateHourOrganisationAssessment.schema, AggregateMonthAssessment.schema, AggregateMonthOrganisationAssessment.schema, AggregateYearAssessment.schema, AggregateYearOrganisationAssessment.schema, Answer.schema, AnswerFile.schema, AnswerVote.schema, Assessment.schema, Comment.schema, CommentFile.schema, CommentVote.schema, Country.schema, Feedback.schema, Group.schema, GroupFile.schema, GroupTag.schema, GroupTagGroup.schema, GroupType.schema, GroupVote.schema, Notification.schema, NotificationAction.schema, NotificationChannel.schema, NotificationType.schema, Organisation.schema, OrganisationType.schema, OrganisationUser.schema, Preference.schema, Professional.schema, Profile.schema, ProfileActivity.schema, ProfilePreference.schema, ProfileSuggestion.schema, Provider.schema, Question.schema, QuestionFile.schema, QuestionSave.schema, QuestionVote.schema, RecoveryCode.schema, ReportedUser.schema, Reward.schema, RewardType.schema, SelfCare.schema, SelfCareType.schema, SelfCareUsage.schema, Suggestion.schema, SuggestionType.schema, User.schema, UserGroup.schema, UserType.schema];
  @override
  List<amplify_core.ModelSchema> customTypeSchemas = [];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  amplify_core.ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "Activity":
        return Activity.classType;
      case "ActivityType":
        return ActivityType.classType;
      case "AggregateDayAssessment":
        return AggregateDayAssessment.classType;
      case "AggregateDayOrganisationAssessment":
        return AggregateDayOrganisationAssessment.classType;
      case "AggregateHourAssessment":
        return AggregateHourAssessment.classType;
      case "AggregateHourOrganisationAssessment":
        return AggregateHourOrganisationAssessment.classType;
      case "AggregateMonthAssessment":
        return AggregateMonthAssessment.classType;
      case "AggregateMonthOrganisationAssessment":
        return AggregateMonthOrganisationAssessment.classType;
      case "AggregateYearAssessment":
        return AggregateYearAssessment.classType;
      case "AggregateYearOrganisationAssessment":
        return AggregateYearOrganisationAssessment.classType;
      case "Answer":
        return Answer.classType;
      case "AnswerFile":
        return AnswerFile.classType;
      case "AnswerVote":
        return AnswerVote.classType;
      case "Assessment":
        return Assessment.classType;
      case "Comment":
        return Comment.classType;
      case "CommentFile":
        return CommentFile.classType;
      case "CommentVote":
        return CommentVote.classType;
      case "Country":
        return Country.classType;
      case "Feedback":
        return Feedback.classType;
      case "Group":
        return Group.classType;
      case "GroupFile":
        return GroupFile.classType;
      case "GroupTag":
        return GroupTag.classType;
      case "GroupTagGroup":
        return GroupTagGroup.classType;
      case "GroupType":
        return GroupType.classType;
      case "GroupVote":
        return GroupVote.classType;
      case "Notification":
        return Notification.classType;
      case "NotificationAction":
        return NotificationAction.classType;
      case "NotificationChannel":
        return NotificationChannel.classType;
      case "NotificationType":
        return NotificationType.classType;
      case "Organisation":
        return Organisation.classType;
      case "OrganisationType":
        return OrganisationType.classType;
      case "OrganisationUser":
        return OrganisationUser.classType;
      case "Preference":
        return Preference.classType;
      case "Professional":
        return Professional.classType;
      case "Profile":
        return Profile.classType;
      case "ProfileActivity":
        return ProfileActivity.classType;
      case "ProfilePreference":
        return ProfilePreference.classType;
      case "ProfileSuggestion":
        return ProfileSuggestion.classType;
      case "Provider":
        return Provider.classType;
      case "Question":
        return Question.classType;
      case "QuestionFile":
        return QuestionFile.classType;
      case "QuestionSave":
        return QuestionSave.classType;
      case "QuestionVote":
        return QuestionVote.classType;
      case "RecoveryCode":
        return RecoveryCode.classType;
      case "ReportedUser":
        return ReportedUser.classType;
      case "Reward":
        return Reward.classType;
      case "RewardType":
        return RewardType.classType;
      case "SelfCare":
        return SelfCare.classType;
      case "SelfCareType":
        return SelfCareType.classType;
      case "SelfCareUsage":
        return SelfCareUsage.classType;
      case "Suggestion":
        return Suggestion.classType;
      case "SuggestionType":
        return SuggestionType.classType;
      case "User":
        return User.classType;
      case "UserGroup":
        return UserGroup.classType;
      case "UserType":
        return UserType.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}


class ModelFieldValue<T> {
  const ModelFieldValue.value(this.value);

  final T value;
}
