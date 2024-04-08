// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class OrganisationRepo {
  OrganisationRepo._();

  static Future<List<OrganisationUser>?> getAllOrganisationUsersByOrganisation(
    String organisationId, {
    required DateTime hourStartDate,
    required DateTime hourEndDate,
    required DateTime dayStartDate,
    required DateTime dayEndDate,
    required DateTime monthStartDate,
    required DateTime monthEndDate,
    required DateTime yearStartDate,
    required DateTime yearEndDate,
    String hourSortDirection = 'ASC',
    String daySortDirection = 'ASC',
    String monthSortDirection = 'ASC',
    String yearSortDirection = 'ASC',
  }) async {
    logInfo('getAllOrganisationUsersByOrganisation()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'organisation_users_by_organisation',
      'listOrganisationUsers',
      variables: <String, dynamic>{
        'organisationID': organisationId,
        'hourStartDate': TemporalDateTime(hourStartDate).toString(),
        'hourEndDate': TemporalDateTime(hourEndDate).toString(),
        'hourSortDirection': hourSortDirection,
        'dayStartDate': TemporalDateTime(dayStartDate).toString(),
        'dayEndDate': TemporalDateTime(dayEndDate).toString(),
        'daySortDirection': daySortDirection,
        'monthStartDate': TemporalDateTime(monthStartDate).toString(),
        'monthEndDate': TemporalDateTime(monthEndDate).toString(),
        'monthSortDirection': monthSortDirection,
        'yearStartDate': TemporalDateTime(yearStartDate).toString(),
        'yearEndDate': TemporalDateTime(yearEndDate).toString(),
        'yearSortDirection': yearSortDirection,
      },
      fromJson: OrganisationUser.fromJson,
    );
  }

  static Future<Tuple2<OrganisationUser?, int?>?> getOrganisationUser(
    String organisationUserID, {
    required DateTime hourStartDate,
    required DateTime hourEndDate,
    required DateTime dayStartDate,
    required DateTime dayEndDate,
    required DateTime monthStartDate,
    required DateTime monthEndDate,
    required DateTime yearStartDate,
    required DateTime yearEndDate,
    String hourSortDirection = 'ASC',
    String daySortDirection = 'ASC',
    String monthSortDirection = 'ASC',
    String yearSortDirection = 'ASC',
  }) async {
    logInfo('getOrganisationUser(): $organisationUserID');
    await CoreRepo.init();
    return CoreRepo.getItem<OrganisationUser>(
      'organisation_user',
      'getOrganisationUser',
      variables: <String, dynamic>{
        'organisationUserID': organisationUserID,
        'hourStartDate': TemporalDateTime(hourStartDate).toString(),
        'hourEndDate': TemporalDateTime(hourEndDate).toString(),
        'hourSortDirection': hourSortDirection,
        'dayStartDate': TemporalDateTime(dayStartDate).toString(),
        'dayEndDate': TemporalDateTime(dayEndDate).toString(),
        'daySortDirection': daySortDirection,
        'monthStartDate': TemporalDateTime(monthStartDate).toString(),
        'monthEndDate': TemporalDateTime(monthEndDate).toString(),
        'monthSortDirection': monthSortDirection,
        'yearStartDate': TemporalDateTime(yearStartDate).toString(),
        'yearEndDate': TemporalDateTime(yearEndDate).toString(),
        'yearSortDirection': yearSortDirection,
      },
      fromJson: OrganisationUser.fromJson,
    );
  }

  static Future<Tuple2<Organisation?, int?>?> updateOrganisation({
    String? organisationId,
    int? totalNumberOfActiveUsers,
    int? totalNumberOfUsers,
    int? totalNumberOfCompletedScreenings,
    int? totalNumberOfIncompletedScreenings,
    int? totalNumberOfSuggestionsClicked,
    int? totalNumberOfSuggestionsViewed,
    int? version = 1,
  }) async {
    logInfo('updateOrganisation()');
    await CoreRepo.init();

    return CoreRepo.updateItem<Organisation>(
      'organisation_update',
      'updateOrganisation',
      variables: <String, dynamic>{
        'input': {
          'id': organisationId,
          'totalNumberOfActiveUsers': totalNumberOfActiveUsers,
          'totalNumberOfUsers': totalNumberOfUsers,
          'totalNumberOfCompletedScreenings': totalNumberOfCompletedScreenings,
          'totalNumberOfIncompletedScreenings':
              totalNumberOfIncompletedScreenings,
          'totalNumberOfSuggestionsClicked': totalNumberOfSuggestionsClicked,
          'totalNumberOfSuggestionsViewed': totalNumberOfSuggestionsViewed,
          '_version': version,
        },
      },
      fromJson: Organisation.fromJson,
    );
  }
}
