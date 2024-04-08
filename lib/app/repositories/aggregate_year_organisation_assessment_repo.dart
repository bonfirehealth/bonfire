// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AggregateYearOrganisationAssessmentRepo {
  AggregateYearOrganisationAssessmentRepo._();

  static Future<List<AggregateYearOrganisationAssessment>?>
      getAllAggregateYearOrganisationAssessmentsByOrganisationAndDates(
    DateTime startDate,
    DateTime endDate, {
    String sortDirection = 'ASC',
  }) async {
    logInfo(
      'getAllAggregateYearOrganisationAssessmentsByOrganisationAndDates()',
    );
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'aggregate_year_organisation_assessments_by_organisation_and_dates',
      'aggregateYearOrganisationAssessmentsByEndDate',
      variables: <String, dynamic>{
        'organisationID': CoreRepo.organisationId,
        'startDate': formatDateString(TemporalDateTime(startDate).toString()),
        'endDate': formatDateString(TemporalDateTime(endDate).toString()),
        'sortDirection': sortDirection,
      },
      fromJson: AggregateYearOrganisationAssessment.fromJson,
    );
  }

  static Future<Tuple2<AggregateYearOrganisationAssessment?, int?>?>
      getAggregateYearOrganisationAssessment(
    String aggregateId,
  ) async {
    logInfo('getAggregateYearOrganisationAssessment(): $aggregateId');
    await CoreRepo.init();
    return CoreRepo.getItem<AggregateYearOrganisationAssessment>(
      'aggregate_year_organisation_assessment',
      'getAggregateYearOrganisationAssessment',
      variables: <String, dynamic>{
        'aggregateID': aggregateId,
      },
      fromJson: AggregateYearOrganisationAssessment.fromJson,
    );
  }
}
