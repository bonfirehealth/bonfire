// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AggregateHourOrganisationAssessmentRepo {
  AggregateHourOrganisationAssessmentRepo._();

  static Future<List<AggregateHourOrganisationAssessment>?>
      getAllAggregateHourOrganisationAssessmentsByOrganisationAndDates(
    DateTime startDate,
    DateTime endDate, {
    String sortDirection = 'ASC',
  }) async {
    logInfo(
      'getAllAggregateHourOrganisationAssessmentsByOrganisationAndDates()',
    );
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'aggregate_hour_organisation_assessments_by_organisation_and_dates',
      'aggregateHourOrganisationAssessmentsByEndDate',
      variables: <String, dynamic>{
        'organisationID': CoreRepo.organisationId,
        'startDate': formatDateString(TemporalDateTime(startDate).toString()),
        'endDate': formatDateString(TemporalDateTime(endDate).toString()),
        'sortDirection': sortDirection,
      },
      fromJson: AggregateHourOrganisationAssessment.fromJson,
    );
  }

  static Future<Tuple2<AggregateHourOrganisationAssessment?, int?>?>
      getAggregateHourOrganisationAssessment(
    String aggregateId,
  ) async {
    logInfo('getAggregateHourOrganisationAssessment(): $aggregateId');
    await CoreRepo.init();
    return CoreRepo.getItem<AggregateHourOrganisationAssessment>(
      'aggregate_hour_organisation_assessment',
      'getAggregateHourOrganisationAssessment',
      variables: <String, dynamic>{
        'aggregateID': aggregateId,
      },
      fromJson: AggregateHourOrganisationAssessment.fromJson,
    );
  }
}
