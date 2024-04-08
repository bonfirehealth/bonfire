// Dart imports:

// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AggregateHourAssessmentRepo {
  AggregateHourAssessmentRepo._();

  static Future<List<AggregateHourAssessment>?> getAllAggregateHourAssessmentsByProfileAndDates(
    DateTime startDate,
    DateTime endDate, {
    required String? profileId,
    String sortDirection = 'ASC',
  }) async {
    logInfo('getAllAggregateHourAssessmentsByProfileAndDates()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'aggregate_hour_assessments_by_profile_and_dates',
      'aggregateHourAssessmentsByEndDate',
      variables: <String, dynamic>{
        'profileID': profileId,
        'startDate': formatDateString(TemporalDateTime(startDate).toString()),
        'endDate': formatDateString(TemporalDateTime(endDate).toString()),
        'sortDirection': sortDirection,
      },
      fromJson: AggregateHourAssessment.fromJson,
    );
  }

  static Future<Tuple2<AggregateHourAssessment?, int?>?> getAggregateHourAssessment(
    String aggregateId,
  ) async {
    logInfo('getAggregateHourAssessment(): $aggregateId');
    await CoreRepo.init();
    return CoreRepo.getItem<AggregateHourAssessment>(
      'aggregate_hour_assessment',
      'getAggregateHourAssessment',
      variables: <String, dynamic>{
        'aggregateID': aggregateId,
      },
      fromJson: AggregateHourAssessment.fromJson,
    );
  }
}
