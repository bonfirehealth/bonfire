// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/helpers/helpers.dart';
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/models/model_provider.dart';
import 'package:bonfirehealth/organisation/organisation.dart';
import '../../../profile/family_plan/user_type_enum.dart';

class DataPointsHelper {
  DataPointsHelper._();

  static List<DateTimeChartDataPoint> generateLowStressLevelChartDataPoints(
    BuildContext context, {
    AggregateType aggregateType = AggregateType.day,
    required List<AggregateHourOrganisationAssessment> aggregateHourOrganisationAssessmentsByOneDay,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneWeek,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneMonth,
    required List<AggregateMonthOrganisationAssessment> aggregateMonthOrganisationAssessmentsByOneYear,
  }) {
    final l10n = context.l10n;
    switch (aggregateType) {
      case AggregateType.day:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateHourOrganisationAssessmentsByOneDay.length; index++) {
          final data = aggregateHourOrganisationAssessmentsByOneDay[index];
          if (data.numberOfProfilesLowRiskStressIndex != null) {
            final num = data.numberOfProfilesLowRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day, dt.hour),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.pinkFF6188,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.week:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneWeek.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneWeek[index];
          if (data.numberOfProfilesLowRiskStressIndex != null) {
            final num = data.numberOfProfilesLowRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.green0CF218,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.month:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneMonth.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneMonth[index];
          if (data.numberOfProfilesLowRiskStressIndex != null) {
            final num = data.numberOfProfilesLowRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.green0CF218,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.year:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateMonthOrganisationAssessmentsByOneYear.length; index++) {
          final data = aggregateMonthOrganisationAssessmentsByOneYear[index];
          if (data.numberOfProfilesLowRiskStressIndex != null) {
            final num = data.numberOfProfilesLowRiskStressIndex as double?;
            if (num != 0) {
              final dt = DateTime.parse(data.startDate.toString()).toLocal();
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.green0CF218,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.allTime:
        return [];
    }
  }

  static List<DateTimeChartDataPoint> generateMediumStressLevelChartDataPoints(
    BuildContext context, {
    AggregateType aggregateType = AggregateType.day,
    required List<AggregateHourOrganisationAssessment> aggregateHourOrganisationAssessmentsByOneDay,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneWeek,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneMonth,
    required List<AggregateMonthOrganisationAssessment> aggregateMonthOrganisationAssessmentsByOneYear,
  }) {
    final l10n = context.l10n;
    switch (aggregateType) {
      case AggregateType.day:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateHourOrganisationAssessmentsByOneDay.length; index++) {
          final data = aggregateHourOrganisationAssessmentsByOneDay[index];
          if (data.numberOfProfilesMediumRiskStressIndex != null) {
            final num = data.numberOfProfilesMediumRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day, dt.hour),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  Colors.amber,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.week:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneWeek.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneWeek[index];
          if (data.numberOfProfilesMediumRiskStressIndex != null) {
            final num = data.numberOfProfilesMediumRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  Colors.amber,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.month:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneMonth.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneMonth[index];
          if (data.numberOfProfilesMediumRiskStressIndex != null) {
            final num = data.numberOfProfilesMediumRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  Colors.amber,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.year:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateMonthOrganisationAssessmentsByOneYear.length; index++) {
          final data = aggregateMonthOrganisationAssessmentsByOneYear[index];
          if (data.numberOfProfilesMediumRiskStressIndex != null) {
            final num = data.numberOfProfilesMediumRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  Colors.amber,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.allTime:
        return [];
    }
  }

  static List<DateTimeChartDataPoint> generateHighStressLevelChartDataPoints(
    BuildContext context, {
    AggregateType aggregateType = AggregateType.day,
    required List<AggregateHourOrganisationAssessment> aggregateHourOrganisationAssessmentsByOneDay,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneWeek,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneMonth,
    required List<AggregateMonthOrganisationAssessment> aggregateMonthOrganisationAssessmentsByOneYear,
  }) {
    final l10n = context.l10n;
    switch (aggregateType) {
      case AggregateType.day:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateHourOrganisationAssessmentsByOneDay.length; index++) {
          final data = aggregateHourOrganisationAssessmentsByOneDay[index];
          if (data.numberOfProfilesHighRiskStressIndex != null) {
            final num = data.numberOfProfilesHighRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day, dt.hour),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.green0CF218,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.week:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneWeek.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneWeek[index];
          if (data.numberOfProfilesHighRiskStressIndex != null) {
            final num = data.numberOfProfilesHighRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.pinkFF6188,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.month:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneMonth.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneMonth[index];
          if (data.numberOfProfilesHighRiskStressIndex != null) {
            final num = data.numberOfProfilesHighRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.pinkFF6188,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.year:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateMonthOrganisationAssessmentsByOneYear.length; index++) {
          final data = aggregateMonthOrganisationAssessmentsByOneYear[index];
          if (data.numberOfProfilesHighRiskStressIndex != null) {
            final num = data.numberOfProfilesHighRiskStressIndex as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month),
                  num!,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.pinkFF6188,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.allTime:
        return [];
    }
  }
  // static List<DateTimeChartDataPoint> generateStressLevelForMaleChartDataPoints(
  //   BuildContext context, {
  //   AggregateType aggregateType = AggregateType.day,
  //   required List<AggregateHourOrganisationAssessment>
  //       aggregateHourOrganisationAssessmentsByOneDay,
  //   required List<AggregateDayOrganisationAssessment>
  //       aggregateDayOrganisationAssessmentsByOneWeek,
  //   required List<AggregateDayOrganisationAssessment>
  //       aggregateDayOrganisationAssessmentsByOneMonth,
  //   required List<AggregateMonthOrganisationAssessment>
  //       aggregateMonthOrganisationAssessmentsByOneYear,
  // }) {
  //   final l10n = context.l10n;
  //   switch (aggregateType) {
  //     case AggregateType.day:
  //       final list = <DateTimeChartDataPoint>[];
  //       for (var index = 0;
  //           index < aggregateHourOrganisationAssessmentsByOneDay.length;
  //           index++) {
  //         final data = aggregateHourOrganisationAssessmentsByOneDay[index];
  //         if (data.averageSympatheticNervousSystemIndexForMale != null) {
  //           list.add(
  //             DateTimeChartDataPoint(
  //               DateTime.parse(data.startDate.toString()),
  //               data.averageSympatheticNervousSystemIndexForMale ??
  //                   data.averageStressIndexForMale ??
  //                   0,
  //               '${data.numberOfProfiles} ${l10n.users}',
  //               Colors.amber,
  //             ),
  //           );
  //         }
  //       }
  //       return list;
  //     case AggregateType.week:
  //       final list = <DateTimeChartDataPoint>[];
  //       for (var index = 0;
  //           index < aggregateDayOrganisationAssessmentsByOneWeek.length;
  //           index++) {
  //         final data = aggregateDayOrganisationAssessmentsByOneWeek[index];
  //         if (data.averageSympatheticNervousSystemIndexForMale != null) {
  //           list.add(
  //             DateTimeChartDataPoint(
  //               DateTime.parse(data.startDate.toString()),
  //               data.averageSympatheticNervousSystemIndexForMale ??
  //                   data.averageStressIndexForMale ??
  //                   0,
  //               '${data.numberOfProfiles} ${l10n.users}',
  //               Colors.amber,
  //             ),
  //           );
  //         }
  //       }
  //       return list;
  //     case AggregateType.month:
  //       final list = <DateTimeChartDataPoint>[];
  //       for (var index = 0;
  //           index < aggregateDayOrganisationAssessmentsByOneMonth.length;
  //           index++) {
  //         final data = aggregateDayOrganisationAssessmentsByOneMonth[index];
  //         if (data.averageSympatheticNervousSystemIndexForMale != null) {
  //           list.add(
  //             DateTimeChartDataPoint(
  //               DateTime.parse(data.startDate.toString()),
  //               data.averageSympatheticNervousSystemIndexForMale ??
  //                   data.averageStressIndexForMale ??
  //                   0,
  //               '${data.numberOfProfiles} ${l10n.users}',
  //               Colors.amber,
  //             ),
  //           );
  //         }
  //       }
  //       return list;
  //     case AggregateType.year:
  //       final list = <DateTimeChartDataPoint>[];
  //       for (var index = 0;
  //           index < aggregateMonthOrganisationAssessmentsByOneYear.length;
  //           index++) {
  //         final data = aggregateMonthOrganisationAssessmentsByOneYear[index];
  //         if (data.averageSympatheticNervousSystemIndexForMale != null) {
  //           list.add(
  //             DateTimeChartDataPoint(
  //               DateTime.parse(data.startDate.toString()),
  //               data.averageSympatheticNervousSystemIndexForMale ??
  //                   data.averageStressIndexForMale ??
  //                   0,
  //               '${data.numberOfProfiles} ${l10n.users}',
  //               Colors.amber,
  //             ),
  //           );
  //         }
  //       }
  //       return list;
  //     case AggregateType.allTime:
  //       return [];
  //   }
  // }

  // static List<DateTimeChartDataPoint>
  //     generateStressLevelForFemaleChartDataPoints(
  //   BuildContext context, {
  //   AggregateType aggregateType = AggregateType.day,
  //   required List<AggregateHourOrganisationAssessment>
  //       aggregateHourOrganisationAssessmentsByOneDay,
  //   required List<AggregateDayOrganisationAssessment>
  //       aggregateDayOrganisationAssessmentsByOneWeek,
  //   required List<AggregateDayOrganisationAssessment>
  //       aggregateDayOrganisationAssessmentsByOneMonth,
  //   required List<AggregateMonthOrganisationAssessment>
  //       aggregateMonthOrganisationAssessmentsByOneYear,
  // }) {
  //   final l10n = context.l10n;
  //   switch (aggregateType) {
  //     case AggregateType.day:
  //       final list = <DateTimeChartDataPoint>[];
  //       for (var index = 0;
  //           index < aggregateHourOrganisationAssessmentsByOneDay.length;
  //           index++) {
  //         final data = aggregateHourOrganisationAssessmentsByOneDay[index];
  //         if (data.averageSympatheticNervousSystemIndexForFemale != null) {
  //           list.add(
  //             DateTimeChartDataPoint(
  //               DateTime.parse(data.startDate.toString()),
  //               data.averageSympatheticNervousSystemIndexForFemale ??
  //                   data.averageStressIndexForFemale ??
  //                   0,
  //               '${data.numberOfProfiles} ${l10n.users}',
  //               AppColourConstant.pinkFF6188,
  //             ),
  //           );
  //         }
  //       }
  //       return list;
  //     case AggregateType.week:
  //       final list = <DateTimeChartDataPoint>[];
  //       for (var index = 0;
  //           index < aggregateDayOrganisationAssessmentsByOneWeek.length;
  //           index++) {
  //         final data = aggregateDayOrganisationAssessmentsByOneWeek[index];
  //         if (data.averageSympatheticNervousSystemIndexForFemale != null) {
  //           list.add(
  //             DateTimeChartDataPoint(
  //               DateTime.parse(data.startDate.toString()),
  //               data.averageSympatheticNervousSystemIndexForFemale ??
  //                   data.averageStressIndexForFemale ??
  //                   0,
  //               '${data.numberOfProfiles} ${l10n.users}',
  //               AppColourConstant.pinkFF6188,
  //             ),
  //           );
  //         }
  //       }
  //       return list;
  //     case AggregateType.month:
  //       final list = <DateTimeChartDataPoint>[];
  //       for (var index = 0;
  //           index < aggregateDayOrganisationAssessmentsByOneMonth.length;
  //           index++) {
  //         final data = aggregateDayOrganisationAssessmentsByOneMonth[index];
  //         if (data.averageSympatheticNervousSystemIndexForFemale != null) {
  //           list.add(
  //             DateTimeChartDataPoint(
  //               DateTime.parse(data.startDate.toString()),
  //               data.averageSympatheticNervousSystemIndexForFemale ??
  //                   data.averageStressIndexForFemale ??
  //                   0,
  //               '${data.numberOfProfiles} ${l10n.users}',
  //               AppColourConstant.pinkFF6188,
  //             ),
  //           );
  //         }
  //       }
  //       return list;
  //     case AggregateType.year:
  //       final list = <DateTimeChartDataPoint>[];
  //       for (var index = 0;
  //           index < aggregateMonthOrganisationAssessmentsByOneYear.length;
  //           index++) {
  //         final data = aggregateMonthOrganisationAssessmentsByOneYear[index];
  //         if (data.averageSympatheticNervousSystemIndexForFemale != null) {
  //           list.add(
  //             DateTimeChartDataPoint(
  //               DateTime.parse(data.startDate.toString()),
  //               data.averageSympatheticNervousSystemIndexForFemale ??
  //                   data.averageStressIndexForFemale ??
  //                   0,
  //               '${data.numberOfProfiles} ${l10n.users}',
  //               AppColourConstant.pinkFF6188,
  //             ),
  //           );
  //         }
  //       }
  //       return list;
  //     case AggregateType.allTime:
  //       return [];
  //   }
  // }

  static List<DateTimeChartDataPoint> generateNormalBloodPressureChartDataPoints(
    BuildContext context, {
    AggregateType aggregateType = AggregateType.day,
    required List<AggregateHourOrganisationAssessment> aggregateHourOrganisationAssessmentsByOneDay,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneWeek,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneMonth,
    required List<AggregateMonthOrganisationAssessment> aggregateMonthOrganisationAssessmentsByOneYear,
  }) {
    final l10n = context.l10n;
    switch (aggregateType) {
      case AggregateType.day:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateHourOrganisationAssessmentsByOneDay.length; index++) {
          final data = aggregateHourOrganisationAssessmentsByOneDay[index];
          if (data.numberOfProfilesNormalRiskBloodPressure != null) {
            final num = data.numberOfProfilesNormalRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day, dt.hour),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.green0CF218,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.week:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneWeek.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneWeek[index];
          if (data.numberOfProfilesNormalRiskBloodPressure != null) {
            final num = data.numberOfProfilesNormalRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.green0CF218,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.month:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneMonth.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneMonth[index];
          if (data.numberOfProfilesNormalRiskBloodPressure != null) {
            final num = data.numberOfProfilesNormalRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.green0CF218,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.year:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateMonthOrganisationAssessmentsByOneYear.length; index++) {
          final data = aggregateMonthOrganisationAssessmentsByOneYear[index];
          if (data.numberOfProfilesNormalRiskBloodPressure != null) {
            final num = data.numberOfProfilesNormalRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.green0CF218,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.allTime:
        return [];
    }
  }

  static List<DateTimeChartDataPoint> generateElevatedBloodPressureChartDataPoints(
    BuildContext context, {
    AggregateType aggregateType = AggregateType.day,
    required List<AggregateHourOrganisationAssessment> aggregateHourOrganisationAssessmentsByOneDay,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneWeek,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneMonth,
    required List<AggregateMonthOrganisationAssessment> aggregateMonthOrganisationAssessmentsByOneYear,
  }) {
    final l10n = context.l10n;
    switch (aggregateType) {
      case AggregateType.day:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateHourOrganisationAssessmentsByOneDay.length; index++) {
          final data = aggregateHourOrganisationAssessmentsByOneDay[index];
          if (data.numberOfProfilesElevatedRiskBloodPressure != null) {
            final num = data.numberOfProfilesElevatedRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day, dt.hour),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  Colors.amber,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.week:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneWeek.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneWeek[index];
          if (data.numberOfProfilesElevatedRiskBloodPressure != null) {
            final num = data.numberOfProfilesElevatedRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  Colors.amber,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.month:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneMonth.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneMonth[index];
          if (data.numberOfProfilesElevatedRiskBloodPressure != null) {
            final num = data.numberOfProfilesElevatedRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  Colors.amber,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.year:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateMonthOrganisationAssessmentsByOneYear.length; index++) {
          final data = aggregateMonthOrganisationAssessmentsByOneYear[index];
          if (data.numberOfProfilesElevatedRiskBloodPressure != null) {
            final num = data.numberOfProfilesElevatedRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  Colors.amber,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.allTime:
        return [];
    }
  }

  static List<DateTimeChartDataPoint> generateHypertensiveBloodPressureChartDataPoints(
    BuildContext context, {
    AggregateType aggregateType = AggregateType.day,
    required List<AggregateHourOrganisationAssessment> aggregateHourOrganisationAssessmentsByOneDay,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneWeek,
    required List<AggregateDayOrganisationAssessment> aggregateDayOrganisationAssessmentsByOneMonth,
    required List<AggregateMonthOrganisationAssessment> aggregateMonthOrganisationAssessmentsByOneYear,
  }) {
    final l10n = context.l10n;
    switch (aggregateType) {
      case AggregateType.day:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateHourOrganisationAssessmentsByOneDay.length; index++) {
          final data = aggregateHourOrganisationAssessmentsByOneDay[index];
          if (data.numberOfProfilesHypertensiveRiskBloodPressure != null) {
            final num = data.numberOfProfilesHypertensiveRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day, dt.hour),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.pinkFF6188,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.week:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneWeek.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneWeek[index];
          if (data.numberOfProfilesHypertensiveRiskBloodPressure != null) {
            final num = data.numberOfProfilesHypertensiveRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.pinkFF6188,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.month:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateDayOrganisationAssessmentsByOneMonth.length; index++) {
          final data = aggregateDayOrganisationAssessmentsByOneMonth[index];
          if (data.numberOfProfilesHypertensiveRiskBloodPressure != null) {
            final num = data.numberOfProfilesHypertensiveRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month, dt.day),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.pinkFF6188,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.year:
        final list = <DateTimeChartDataPoint>[];
        for (var index = 0; index < aggregateMonthOrganisationAssessmentsByOneYear.length; index++) {
          final data = aggregateMonthOrganisationAssessmentsByOneYear[index];
          if (data.numberOfProfilesHypertensiveRiskBloodPressure != null) {
            final num = data.numberOfProfilesHypertensiveRiskBloodPressure as double?;
            final dt = DateTime.parse(data.startDate.toString()).toLocal();
            if (num != 0) {
              list.add(
                DateTimeChartDataPoint(
                  // DateTime.parse(data.startDate.toString()),
                  DateTime(dt.year, dt.month),
                  num ?? 0,
                  '${data.numberOfProfiles} ${l10n.users}',
                  AppColourConstant.pinkFF6188,
                ),
              );
            }
          }
        }
        return list;
      case AggregateType.allTime:
        return [];
    }
  }

  static List<StringChartDataPoint> generateTotalUsersGenderChartDataPoints(BuildContext context,
      {required List<OrganisationUser> organisationUsers, UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    final l10n = context.l10n;

    var totalCount = 0.0;
    var maleCount = 0.0;
    var femaleCount = 0.0;
    var unknownCount = 0.0;

    for (final organisationUser in organisationUsers) {
      if (organisationUser.user.userType != null) {
        if (organisationUser.user.userType?.identifier == userType.name) {
          if (organisationUser.user.profile != null) {
            if (organisationUser.user.profile?.gender == 'Male') {
              maleCount++;
            } else if (organisationUser.user.profile?.gender == 'Female') {
              femaleCount++;
            }
          } else {
            unknownCount++;
          }
          totalCount++;
        }
      }
    }

    final malePercent = (maleCount / totalCount) * 100.0;
    final femalePercent = (femaleCount / totalCount) * 100.0;
    final unknownPercent = (unknownCount / totalCount) * 100.0;

    return [
      StringChartDataPoint(
        l10n.male,
        maleCount,
        !malePercent.isNaN ? '${malePercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.greenA9D5BF,
      ),
      StringChartDataPoint(
        l10n.female,
        femaleCount,
        !femalePercent.isNaN ? '${femalePercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.greenDCFEEF,
      ),
      if (unknownPercent > 0)
        StringChartDataPoint(
          l10n.unknown,
          unknownCount,
          !unknownPercent.isNaN ? '${unknownPercent.toStringAsFixed(2)}%' : '',
          AppColourConstant.grey9A9A9A,
        ),
    ];
  }

  static List<StringChartDataPoint> generateTotalActiveUsersGenderChartDataPoints(BuildContext context,
      {required List<OrganisationUser> organisationUsers, UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    final l10n = context.l10n;

    var maleCount = 0.0;
    var femaleCount = 0.0;
    var unknownCount = 0.0;

    for (final organisationUser in organisationUsers) {
      if (organisationUser.user.userType != null) {
        if (organisationUser.user.userType?.identifier == userType.name) {
          if (organisationUser.user.profile != null) {
            final daysDiff = daysBetween(
              DateTime.parse(
                organisationUser.user.profile!.updatedAt.toString(),
              ),
              DateTime.now(),
            );
            if (daysDiff <= 7) {
              if (organisationUser.user.profile != null) {
                if (organisationUser.user.profile?.gender == 'Male') {
                  maleCount++;
                } else if (organisationUser.user.profile?.gender == 'Female') {
                  femaleCount++;
                }
              } else {
                unknownCount++;
              }
            }
          }
        }
      }
    }

    return [
      if (maleCount > 0)
        StringChartDataPoint(
          l10n.male,
          maleCount,
          '${l10n.male}: $maleCount',
          AppColourConstant.black1E1F2B,
        ),
      if (femaleCount > 0)
        StringChartDataPoint(
          l10n.female,
          femaleCount,
          '${l10n.female}: $femaleCount',
          AppColourConstant.black1E1F2B,
        ),
      if (unknownCount > 0)
        StringChartDataPoint(
          l10n.unknown,
          unknownCount,
          '${l10n.unknown}: $unknownCount',
          AppColourConstant.grey9A9A9A,
        ),
    ];
  }

  static List<StringChartDataPoint> generateTotalUsersAgeGroupChartDataPoints(BuildContext context,
      {required List<OrganisationUser> organisationUsers, UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    final l10n = context.l10n;

    var totalCount = 0.0;
    var childGroupCount = 0.0;
    var youngAdultGroupCount = 0.0;
    var middleAgedAdultGroupCount = 0.0;
    var oldAgedAdultGroupCount = 0.0;
    var unknownCount = 0.0;

    for (final organisationUser in organisationUsers) {
      if (organisationUser.user.userType != null) {
        if (organisationUser.user.userType?.identifier == userType.name) {
          if (organisationUser.user.profile != null) {
            final age = organisationUser.user.profile?.age;
            if (age != null) {
              if (age <= 16) {
                childGroupCount++;
              } else if (age >= 17 && age <= 30) {
                youngAdultGroupCount++;
              } else if (age >= 31 && age <= 45) {
                middleAgedAdultGroupCount++;
              } else if (age >= 46) {
                oldAgedAdultGroupCount++;
              } else {
                unknownCount++;
              }
            } else {
              unknownCount++;
            }
          } else {
            unknownCount++;
          }
          totalCount++;
        }
      }
    }

    final childGroupPercent = (childGroupCount / totalCount) * 100.0;
    final youngAdultGroupPercent = (youngAdultGroupCount / totalCount) * 100.0;
    final middleAgedAdultGroupPercent = (middleAgedAdultGroupCount / totalCount) * 100.0;
    final oldAgedAdultGroupPercent = (oldAgedAdultGroupCount / totalCount) * 100.0;
    final unknownPercent = (unknownCount / totalCount) * 100.0;

    return [
      StringChartDataPoint(
        l10n.childGroupRange,
        childGroupCount,
        !childGroupPercent.isNaN ? '${childGroupPercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.pinkE91E63,
      ),
      StringChartDataPoint(
        l10n.youngAdultGroupRange,
        youngAdultGroupCount,
        !youngAdultGroupPercent.isNaN ? '${youngAdultGroupPercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.pinkFF6188,
      ),
      StringChartDataPoint(
        l10n.middleAgedAdultGroupRange,
        middleAgedAdultGroupCount,
        !middleAgedAdultGroupPercent.isNaN ? '${middleAgedAdultGroupPercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.pinkD8C3CC,
      ),
      StringChartDataPoint(
        l10n.oldAgedAdultGroupRange,
        oldAgedAdultGroupCount,
        !oldAgedAdultGroupPercent.isNaN ? '${oldAgedAdultGroupPercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.pinkFBE7F0,
      ),
      if (unknownPercent > 0)
        StringChartDataPoint(
          l10n.unknown,
          unknownCount,
          '${unknownPercent.toStringAsFixed(2)}%',
          AppColourConstant.grey9A9A9A,
        ),
    ];
  }

  static List<StringChartDataPoint> generateTotalActiveUsersAgeGroupChartDataPoints(BuildContext context,
      {required List<OrganisationUser> organisationUsers, UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    final l10n = context.l10n;

    var childGroupCount = 0.0;
    var youngAdultGroupCount = 0.0;
    var middleAgedAdultGroupCount = 0.0;
    var oldAgedAdultGroupCount = 0.0;
    var unknownCount = 0.0;

    for (final organisationUser in organisationUsers) {
      if (organisationUser.user.userType != null) {
        if (organisationUser.user.userType?.identifier == userType.name) {
          if (organisationUser.user.profile != null) {
            final daysDiff = daysBetween(
              DateTime.parse(
                organisationUser.user.profile!.updatedAt.toString(),
              ),
              DateTime.now(),
            );
            if (daysDiff <= 7) {
              if (organisationUser.user.profile != null) {
                final age = organisationUser.user.profile?.age;
                if (age != null) {
                  if (age <= 16) {
                    childGroupCount++;
                  } else if (age >= 17 && age <= 30) {
                    youngAdultGroupCount++;
                  } else if (age >= 31 && age <= 45) {
                    middleAgedAdultGroupCount++;
                  } else if (age >= 46) {
                    oldAgedAdultGroupCount++;
                  } else {
                    unknownCount++;
                  }
                } else {
                  unknownCount++;
                }
              } else {
                unknownCount++;
              }
            }
          }
        }
      }
    }

    return [
      if (childGroupCount > 0)
        StringChartDataPoint(
          l10n.childGroup,
          childGroupCount,
          '${l10n.childGroupRange}: $childGroupCount',
          AppColourConstant.black1E1F2B,
        ),
      if (youngAdultGroupCount > 0)
        StringChartDataPoint(
          l10n.youngAdultGroup,
          youngAdultGroupCount,
          '${l10n.youngAdultGroupRange}: $youngAdultGroupCount',
          AppColourConstant.black1E1F2B,
        ),
      if (middleAgedAdultGroupCount > 0)
        StringChartDataPoint(
          l10n.middleAgedAdultGroup,
          middleAgedAdultGroupCount,
          '${l10n.middleAgedAdultGroupRange}: $middleAgedAdultGroupCount',
          AppColourConstant.black1E1F2B,
        ),
      if (oldAgedAdultGroupCount > 0)
        StringChartDataPoint(
          l10n.oldAgedAdultGroup,
          oldAgedAdultGroupCount,
          '${l10n.oldAgedAdultGroupRange}: $oldAgedAdultGroupCount',
          AppColourConstant.black1E1F2B,
        ),
      if (unknownCount > 0)
        StringChartDataPoint(
          l10n.unknown,
          unknownCount,
          '${l10n.unknown}: $unknownCount',
          AppColourConstant.grey9A9A9A,
        ),
    ];
  }

  static List<StringChartDataPoint> generateTotalUsersBodyMassIndexCategoryChartDataPoints(BuildContext context,
      {required List<OrganisationUser> organisationUsers, UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    final l10n = context.l10n;

    var totalCount = 0.0;
    var underWeightCount = 0.0;
    var normalWeightCount = 0.0;
    var overWeightCount = 0.0;
    var preObeseCount = 0.0;
    var obeseCount = 0.0;
    var unknownCount = 0.0;

    for (final organisationUser in organisationUsers) {
      if (organisationUser.user.userType != null) {
        if (organisationUser.user.userType?.identifier == userType.name) {
          if (organisationUser.user.profile != null) {
            var bodyMassIndex = organisationUser.user.profile?.bodyMassIndex;
            final weight = organisationUser.user.profile?.weight;
            final height = organisationUser.user.profile?.height;

            if (bodyMassIndex == null) {
              if (weight != null && height != null) {
                bodyMassIndex = LogicHelper.calculateBodyMassIndex(weight, height);
              } else {
                unknownCount++;
              }
            }

            if (bodyMassIndex != null) {
              if (bodyMassIndex < 18.5) {
                underWeightCount++;
              } else if (bodyMassIndex >= 18.5 && bodyMassIndex < 23) {
                normalWeightCount++;
              } else if (bodyMassIndex >= 23 && bodyMassIndex < 25) {
                overWeightCount++;
              } else if (bodyMassIndex >= 25 && bodyMassIndex < 30) {
                preObeseCount++;
              } else if (bodyMassIndex >= 30) {
                obeseCount++;
              } else {
                unknownCount++;
              }
            }
          } else {
            unknownCount++;
          }
          totalCount++;
        }
      }
    }

    final underWeightPercent = (underWeightCount / totalCount) * 100.0;
    final normalWeightPercent = (normalWeightCount / totalCount) * 100.0;
    final overWeightPercent = (overWeightCount / totalCount) * 100.0;
    final preObesePercent = (preObeseCount / totalCount) * 100.0;
    final obesePercent = (obeseCount / totalCount) * 100.0;
    final unknownPercent = (unknownCount / totalCount) * 100.0;

    return [
      StringChartDataPoint(
        l10n.underweight,
        underWeightCount,
        !underWeightPercent.isNaN ? '${underWeightPercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.yellowFFD700,
      ),
      StringChartDataPoint(
        l10n.normalweight,
        normalWeightCount,
        !normalWeightPercent.isNaN ? '${normalWeightPercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.yellowD5AC05,
      ),
      StringChartDataPoint(
        l10n.overweight,
        overWeightCount,
        !overWeightPercent.isNaN ? '${overWeightPercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.yellowFFEB98,
      ),
      StringChartDataPoint(
        l10n.preobese,
        preObeseCount,
        !preObesePercent.isNaN ? '${preObesePercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.yellowFCEAD0,
      ),
      StringChartDataPoint(
        l10n.obese,
        obeseCount,
        !obesePercent.isNaN ? '${obesePercent.toStringAsFixed(2)}%' : '',
        AppColourConstant.yellowE0C9A5,
      ),
      if (unknownPercent > 0)
        StringChartDataPoint(
          l10n.unknown,
          unknownCount,
          !unknownPercent.isNaN ? '${unknownPercent.toStringAsFixed(2)}%' : '',
          AppColourConstant.grey9A9A9A,
        ),
    ];
  }

  static List<StringChartDataPoint> generateTotalActiveUsersBodyMassIndexCategoryChartDataPoints(BuildContext context,
      {required List<OrganisationUser> organisationUsers, UserTypeEnum userType = UserTypeEnum.organisationEmployee}) {
    final l10n = context.l10n;

    var underWeightCount = 0.0;
    var normalWeightCount = 0.0;
    var overWeightCount = 0.0;
    var preObeseCount = 0.0;
    var obeseCount = 0.0;
    var unknownCount = 0.0;

    for (final organisationUser in organisationUsers) {
      if (organisationUser.user.userType != null) {
        if (organisationUser.user.userType?.identifier == userType.name) {
          if (organisationUser.user.profile != null) {
            final daysDiff = daysBetween(
              DateTime.parse(
                organisationUser.user.profile!.updatedAt.toString(),
              ),
              DateTime.now(),
            );
            if (daysDiff <= 7) {
              if (organisationUser.user.profile != null) {
                var bodyMassIndex = organisationUser.user.profile?.bodyMassIndex;
                final weight = organisationUser.user.profile?.weight;
                final height = organisationUser.user.profile?.height;

                if (bodyMassIndex == null) {
                  if (weight != null && height != null) {
                    bodyMassIndex = LogicHelper.calculateBodyMassIndex(weight, height);
                  } else {
                    unknownCount++;
                  }
                }

                if (bodyMassIndex != null) {
                  if (bodyMassIndex < 18.5) {
                    underWeightCount++;
                  } else if (bodyMassIndex >= 18.5 && bodyMassIndex < 23) {
                    normalWeightCount++;
                  } else if (bodyMassIndex >= 23 && bodyMassIndex < 25) {
                    overWeightCount++;
                  } else if (bodyMassIndex >= 25 && bodyMassIndex < 30) {
                    preObeseCount++;
                  } else if (bodyMassIndex >= 30) {
                    obeseCount++;
                  } else {
                    unknownCount++;
                  }
                }
              } else {
                unknownCount++;
              }
            }
          }
        }
      }
    }

    return [
      if (underWeightCount > 0)
        StringChartDataPoint(
          l10n.underweight,
          underWeightCount,
          '${l10n.underweight}: $underWeightCount',
          AppColourConstant.black1E1F2B,
        ),
      if (normalWeightCount > 0)
        StringChartDataPoint(
          l10n.normalweight,
          normalWeightCount,
          '${l10n.normalweight}: $normalWeightCount',
          AppColourConstant.black1E1F2B,
        ),
      if (overWeightCount > 0)
        StringChartDataPoint(
          l10n.overweight,
          overWeightCount,
          '${l10n.overweight}: $overWeightCount',
          AppColourConstant.black1E1F2B,
        ),
      if (preObeseCount > 0)
        StringChartDataPoint(
          l10n.preobese,
          preObeseCount,
          '${l10n.preobese}: $preObeseCount',
          AppColourConstant.black1E1F2B,
        ),
      if (obeseCount > 0)
        StringChartDataPoint(
          l10n.obese,
          obeseCount,
          '${l10n.obese}: $obeseCount',
          AppColourConstant.black1E1F2B,
        ),
      if (unknownCount > 0)
        StringChartDataPoint(
          l10n.unknown,
          unknownCount,
          '${l10n.unknown}: $unknownCount',
          AppColourConstant.grey9A9A9A,
        ),
    ];
  }
}
