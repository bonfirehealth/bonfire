// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AggregateMonthAssessmentRepo {
  AggregateMonthAssessmentRepo._();

  static Future<List<AggregateMonthAssessment>?>
      getAllAggregateMonthAssessmentsByProfileAndDates(
    DateTime startDate,
    DateTime endDate, {
    required String? profileId,
    String sortDirection = 'ASC',
  }) async {
    logInfo('getAllAggregateMonthAssessmentsByProfileAndDates()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'aggregate_month_assessments_by_profile_and_dates',
      'aggregateMonthAssessmentsByEndDate',
      variables: <String, dynamic>{
        'profileID': profileId,
        'startDate': TemporalDateTime(startDate).toString(),
        'endDate': TemporalDateTime(endDate).toString(),
        'sortDirection': sortDirection,
      },
      fromJson: AggregateMonthAssessment.fromJson,
    );
  }

  static Future<Tuple2<AggregateMonthAssessment?, int?>?>
      getAggregateMonthAssessment(
    String aggregateId,
  ) async {
    logInfo('getAggregateMonthAssessment(): $aggregateId');
    await CoreRepo.init();
    return CoreRepo.getItem<AggregateMonthAssessment>(
      'aggregate_month_assessment',
      'getAggregateMonthAssessment',
      variables: <String, dynamic>{
        'aggregateID': aggregateId,
      },
      fromJson: AggregateMonthAssessment.fromJson,
    );
  }
}
