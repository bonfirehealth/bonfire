// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AggregateDayAssessmentRepo {
  AggregateDayAssessmentRepo._();

  static Future<List<AggregateDayAssessment>?>
      getAllAggregateDayAssessmentsByProfileAndDates(
    DateTime startDate,
    DateTime endDate, {
    required String? profileId,
    String sortDirection = 'ASC',
  }) async {
    logInfo('getAllAggregateDayAssessmentsByProfileAndDates()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'aggregate_day_assessments_by_profile_and_dates',
      'aggregateDayAssessmentsByEndDate',
      variables: <String, dynamic>{
        'profileID': profileId,
        'startDate': formatDateString(TemporalDateTime(startDate).toString()),
        'endDate': formatDateString(TemporalDateTime(endDate).toString()),
        'sortDirection': sortDirection,
      },
      fromJson: AggregateDayAssessment.fromJson,
    );
  }

  static Future<Tuple2<AggregateDayAssessment?, int?>?>
      getAggregateDayAssessment(
    String aggregateId,
  ) async {
    logInfo('getAggregateDayAssessment(): $aggregateId');
    await CoreRepo.init();
    return CoreRepo.getItem<AggregateDayAssessment>(
      'aggregate_day_assessment',
      'getAggregateDayAssessment',
      variables: <String, dynamic>{
        'aggregateID': aggregateId,
      },
      fromJson: AggregateDayAssessment.fromJson,
    );
  }
}
