// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AggregateMonthOrganisationAssessmentRepo {
  AggregateMonthOrganisationAssessmentRepo._();

  static Future<List<AggregateMonthOrganisationAssessment>?>
      getAllAggregateMonthOrganisationAssessmentsByOrganisationAndDates(
    DateTime startDate,
    DateTime endDate, {
    String sortDirection = 'ASC',
  }) async {
    logInfo(
      'getAllAggregateMonthOrganisationAssessmentsByOrganisationAndDates()',
    );
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'aggregate_month_organisation_assessments_by_organisation_and_dates',
      'aggregateMonthOrganisationAssessmentsByEndDate',
      variables: <String, dynamic>{
        'organisationID': CoreRepo.organisationId,
        'startDate': formatDateString(TemporalDateTime(startDate).toString()),
        'endDate': formatDateString(TemporalDateTime(endDate).toString()),
        'sortDirection': sortDirection,
      },
      fromJson: AggregateMonthOrganisationAssessment.fromJson,
    );
  }

  static Future<Tuple2<AggregateMonthOrganisationAssessment?, int?>?>
      getAggregateMonthOrganisationAssessment(
    String aggregateId,
  ) async {
    logInfo('getAggregateMonthOrganisationAssessment(): $aggregateId');
    await CoreRepo.init();
    return CoreRepo.getItem<AggregateMonthOrganisationAssessment>(
      'aggregate_month_organisation_assessment',
      'getAggregateMonthOrganisationAssessment',
      variables: <String, dynamic>{
        'aggregateID': aggregateId,
      },
      fromJson: AggregateMonthOrganisationAssessment.fromJson,
    );
  }
}
