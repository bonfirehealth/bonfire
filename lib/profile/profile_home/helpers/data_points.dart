// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:jiffy/jiffy.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/profile/profile.dart';

class DataPointsHelper {
  DataPointsHelper._();

  static String generateDateTitle({AggregateType aggregateType = AggregateType.day, DateTime? date}) {
    final now = DateTime.now();
    switch (aggregateType) {
      case AggregateType.day:
        return Jiffy(date ?? now).format('do MMM yyyy');

      case AggregateType.week:
        return '${Jiffy(
          LogicHelper.findFirstDateOfTheWeek(now),
        ).format('do MMM yyyy')} - ${Jiffy(
          LogicHelper.findLastDateOfTheWeek(
            now,
          ),
        ).format('do MMM yyyy')}';
      case AggregateType.month:
        return Jiffy().format('MMM yyyy');
      case AggregateType.year:
        return Jiffy().format('yyyy');
      case AggregateType.allTime:
        return '';
    }
  }

  static List<DateTimeChartDataPoint> generateStressLevelChartDataPoints(
    BuildContext context, {
    AggregateType aggregateType = AggregateType.day,
    ChartMode mode = ChartMode.readliness,
    Color color = AppColourConstant.yellowFFD700,
    required List<AggregateHourAssessment> aggregateHourAssessmentsByOneDay,
    required List<AggregateDayAssessment> aggregateDayAssessmentsByOneWeek,
    required List<AggregateDayAssessment> aggregateDayAssessmentsByOneMonth,
    required List<AggregateMonthAssessment> aggregateMonthAssessmentsByOneYear,
  }) {
    final l10n = context.l10n;
    switch (aggregateType) {
      case AggregateType.day:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateHourAssessmentsByOneDay.length; index++) {
          final data = aggregateHourAssessmentsByOneDay[index];
          if (mode == ChartMode.readliness && data.averageStressIndex != null) {
            list.add(
              DateTimeChartDataPoint(
                DateTime.parse(data.startDate.toString()),
                data.averageStressIndex ?? data.averageStressIndex ?? 0,
                '${data.numberOfAssessments} ${l10n.assessments}',
                color,
              ),
            );
          } else if (mode == ChartMode.bloodPressure && data.averageSystolicBloodPressure != null) {
            list.add(
              DateTimeChartDataPoint(
                DateTime.parse(data.startDate.toString()),
                data.averageSystolicBloodPressure ?? data.averageSystolicBloodPressure ?? 0,
                '${data.numberOfAssessments} ${l10n.assessments}',
                color,
              ),
            );
          }
        }
        return list;
      case AggregateType.week:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayAssessmentsByOneWeek.length; index++) {
          final data = aggregateDayAssessmentsByOneWeek[index];
          if (mode == ChartMode.readliness && data.averageStressIndex != null) {
            list.add(
              DateTimeChartDataPoint(
                DateTime.parse(data.startDate.toString()),
                data.averageStressIndex ?? data.averageStressIndex ?? 0,
                '${data.numberOfAssessments} ${l10n.assessments}',
                color,
              ),
            );
          } else if (mode == ChartMode.bloodPressure && data.averageSystolicBloodPressure != null) {
            list.add(
              DateTimeChartDataPoint(
                DateTime.parse(data.startDate.toString()),
                data.averageSystolicBloodPressure ?? data.averageSystolicBloodPressure ?? 0,
                '${data.numberOfAssessments} ${l10n.assessments}',
                color,
              ),
            );
          }
        }
        return list;
      case AggregateType.month:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayAssessmentsByOneMonth.length; index++) {
          final data = aggregateDayAssessmentsByOneMonth[index];
          if (mode == ChartMode.readliness && data.averageStressIndex != null) {
            list.add(
              DateTimeChartDataPoint(
                DateTime.parse(data.startDate.toString()),
                data.averageStressIndex ?? data.averageStressIndex ?? 0,
                '${data.numberOfAssessments} ${l10n.users}',
                color,
              ),
            );
          } else if (mode == ChartMode.bloodPressure && data.averageSystolicBloodPressure != null) {
            list.add(
              DateTimeChartDataPoint(
                DateTime.parse(data.startDate.toString()),
                data.averageSystolicBloodPressure ?? data.averageSystolicBloodPressure ?? 0,
                '${data.numberOfAssessments} ${l10n.users}',
                color,
              ),
            );
          }
        }
        return list;
      case AggregateType.year:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateMonthAssessmentsByOneYear.length; index++) {
          final data = aggregateMonthAssessmentsByOneYear[index];
          if (mode == ChartMode.readliness && data.averageStressIndex != null) {
            list.add(
              DateTimeChartDataPoint(
                DateTime.parse(data.startDate.toString()),
                data.averageStressIndex ?? data.averageStressIndex ?? 0,
                '${data.numberOfAssessments} ${l10n.users}',
                color,
              ),
            );
          } else if (mode == ChartMode.bloodPressure && data.averageSystolicBloodPressure != null) {
            list.add(
              DateTimeChartDataPoint(
                DateTime.parse(data.startDate.toString()),
                data.averageSystolicBloodPressure ?? data.averageSystolicBloodPressure ?? 0,
                '${data.numberOfAssessments} ${l10n.users}',
                color,
              ),
            );
          }
        }
        return list;
      case AggregateType.allTime:
        return [];
    }
  }
}
