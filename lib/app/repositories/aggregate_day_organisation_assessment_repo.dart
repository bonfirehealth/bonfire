// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AggregateDayOrganisationAssessmentRepo {
  AggregateDayOrganisationAssessmentRepo._();

  static Future<List<AggregateDayOrganisationAssessment>?>
      getAllAggregateDayOrganisationAssessmentsByOrganisationAndDates(
    DateTime startDate,
    DateTime endDate, {
    String sortDirection = 'ASC',
  }) async {
    logInfo(
      'getAllAggregateDayOrganisationAssessmentsByOrganisationAndDates()',
    );
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'aggregate_day_organisation_assessments_by_organisation_and_dates',
      'aggregateDayOrganisationAssessmentsByEndDate',
      variables: <String, dynamic>{
        'organisationID': CoreRepo.organisationId,
        'startDate': formatDateString(TemporalDateTime(startDate).toString()),
        'endDate': formatDateString(TemporalDateTime(endDate).toString()),
        'sortDirection': sortDirection,
      },
      fromJson: AggregateDayOrganisationAssessment.fromJson,
    );
  }

  static Future<Tuple2<AggregateDayOrganisationAssessment?, int?>?>
      getAggregateDayOrganisationAssessment(
    String aggregateId,
  ) async {
    logInfo('getAggregateDayOrganisationAssessment(): $aggregateId');
    await CoreRepo.init();
    return CoreRepo.getItem<AggregateDayOrganisationAssessment>(
      'aggregate_day_organisation_assessment',
      'getAggregateDayOrganisationAssessment',
      variables: <String, dynamic>{
        'aggregateID': aggregateId,
      },
      fromJson: AggregateDayOrganisationAssessment.fromJson,
    );
  }
}
