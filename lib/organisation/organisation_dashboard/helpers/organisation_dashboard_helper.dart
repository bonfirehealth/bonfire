// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/profile/family_plan/user_type_enum.dart';

class OrganisationDashboardHelper {
  OrganisationDashboardHelper._();

  static int calculateTotalNumberOfUsers(List<OrganisationUser>? organisationUsers,
      {UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    var count = 0;
    if (organisationUsers != null) {
      for (final organisationUser in organisationUsers) {
        if (organisationUser.user.userType != null) {
          if (organisationUser.user.userType?.identifier == userType.name) {
            if (organisationUser.user.profile != null) {
              count++;
            }
          }
        }
      }
    }
    return count;
  }

  static int calculateTotalNumberOfActiveUsers(List<OrganisationUser>? organisationUsers,
      {UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    var count = 0;
    if (organisationUsers != null) {
      for (final organisationUser in organisationUsers) {
        if (organisationUser.user.userType != null) {
          if (organisationUser.user.userType?.identifier == userType.name) {
            if (organisationUser.user.profile != null) {
              final daysDiff = daysBetween(
                DateTime.parse(
                  organisationUser.user.profile!.updatedAt.toString(),
                ),
                DateTime.now(),
              );
              if (daysDiff <= 7) {
                count++;
              }
            }
          }
        }
      }
    }
    return count;
  }

  static int calculateTotalNumberOfCompletedScreenings(List<OrganisationUser>? organisationUsers,
      {UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    var count = 0;
    if (organisationUsers != null) {
      for (final organisationUser in organisationUsers) {
        if (organisationUser.user.userType != null) {
          if (organisationUser.user.userType?.identifier == userType.name) {
            if (organisationUser.user.profile != null) {
              if (organisationUser.user.profile?.assessments != null) {
                final assessments = organisationUser.user.profile?.assessments ?? [];
                for (final assessment in assessments) {
                  if (assessment.heartRate != null) {
                    count++;
                  }
                }
              }
            }
          }
        }
      }
    }
    return count;
  }

  static int calculateTotalNumberOfIncompletedScreenings(List<OrganisationUser>? organisationUsers,
      {UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    var count = 0;
    if (organisationUsers != null) {
      for (final organisationUser in organisationUsers) {
        if (organisationUser.user.userType != null) {
          if (organisationUser.user.userType?.identifier == userType.name) {
            if (organisationUser.user.profile != null) {
              if (organisationUser.user.profile?.assessments != null) {
                final assessments = organisationUser.user.profile?.assessments ?? [];
                for (final assessment in assessments) {
                  if (assessment.heartRate == null) {
                    count++;
                  }
                }
              }
            }
          }
        }
      }
    }
    return count;
  }

  static int calculateTotalNumberOfSuggestionsClicked(
    List<Suggestion>? suggestions,
  ) {
    var count = 0;
    if (suggestions != null) {
      for (final suggestion in suggestions) {
        if (suggestion.numberOfClicks != null) {
          count += suggestion.numberOfClicks!;
        }
      }
    }
    return count;
  }

  static int calculateTotalNumberOfSuggestionsViewed(
    List<Suggestion>? suggestions,
  ) {
    var count = 0;
    if (suggestions != null) {
      for (final suggestion in suggestions) {
        if (suggestion.numberOfViews != null) {
          count += suggestion.numberOfViews!;
        }
      }
    }
    return count;
  }

  static int calculateTotalNumberOfEAPSuggestionsClicked(
    List<Suggestion>? suggestions,
  ) {
    var count = 0;
    if (suggestions != null) {
      for (final suggestion in suggestions) {
        if (suggestion.suggestionType != null) {
          if (suggestion.suggestionType?.identifier == 'employee_assistance_programme') {
            if (suggestion.numberOfClicks != null) {
              count += suggestion.numberOfClicks!;
            }
          }
        }
      }
    }
    return count;
  }
}
