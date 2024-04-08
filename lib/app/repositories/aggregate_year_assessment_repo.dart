// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AggregateYearAssessmentRepo {
  AggregateYearAssessmentRepo._();

  static Future<List<AggregateYearAssessment>?>
      getAllAggregateYearAssessmentsByProfileAndDates(
    DateTime startDate,
    DateTime endDate, {
    String sortDirection = 'ASC',
  }) async {
    logInfo('getAllAggregateYearAssessmentsByProfileAndDates()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'aggregate_year_assessments_by_profile_and_dates',
      'aggregateYearAssessmentsByEndDate',
      variables: <String, dynamic>{
        'profileID': CoreRepo.profileId,
        'startDate': formatDateString(TemporalDateTime(startDate).toString()),
        'endDate': formatDateString(TemporalDateTime(endDate).toString()),
        'sortDirection': sortDirection,
      },
      fromJson: AggregateYearAssessment.fromJson,
    );
  }

  static Future<Tuple2<AggregateYearAssessment?, int?>?>
      getAggregateYearAssessment(
    String aggregateId,
  ) async {
    logInfo('getAggregateYearAssessment(): $aggregateId');
    await CoreRepo.init();
    return CoreRepo.getItem<AggregateYearAssessment>(
      'aggregate_year_assessment',
      'getAggregateYearAssessment',
      variables: <String, dynamic>{
        'aggregateID': aggregateId,
      },
      fromJson: AggregateYearAssessment.fromJson,
    );
  }
}
