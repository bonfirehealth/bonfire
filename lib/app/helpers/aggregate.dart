// Project imports:
import 'package:bonfirehealth/app/models/model_provider.dart';

class AggregateHelper {
  AggregateHelper._();

  static Map<int, Map<String, dynamic>> aggregateOrganisationAssessmentsByHour(
    List<AggregateHourAssessment> items,
  ) {
    final itemsMapByHour = {
      0: <AggregateHourAssessment>[],
      1: <AggregateHourAssessment>[],
      2: <AggregateHourAssessment>[],
      3: <AggregateHourAssessment>[],
      4: <AggregateHourAssessment>[],
      5: <AggregateHourAssessment>[],
      6: <AggregateHourAssessment>[],
      7: <AggregateHourAssessment>[],
      8: <AggregateHourAssessment>[],
      9: <AggregateHourAssessment>[],
      10: <AggregateHourAssessment>[],
      11: <AggregateHourAssessment>[],
      12: <AggregateHourAssessment>[],
      13: <AggregateHourAssessment>[],
      14: <AggregateHourAssessment>[],
      15: <AggregateHourAssessment>[],
      16: <AggregateHourAssessment>[],
      17: <AggregateHourAssessment>[],
      18: <AggregateHourAssessment>[],
      19: <AggregateHourAssessment>[],
      20: <AggregateHourAssessment>[],
      21: <AggregateHourAssessment>[],
      22: <AggregateHourAssessment>[],
      23: <AggregateHourAssessment>[],
    };

    final aggregateMapByHour = {
      0: <String, dynamic>{},
      1: <String, dynamic>{},
      2: <String, dynamic>{},
      3: <String, dynamic>{},
      4: <String, dynamic>{},
      5: <String, dynamic>{},
      6: <String, dynamic>{},
      7: <String, dynamic>{},
      8: <String, dynamic>{},
      9: <String, dynamic>{},
      10: <String, dynamic>{},
      11: <String, dynamic>{},
      12: <String, dynamic>{},
      13: <String, dynamic>{},
      14: <String, dynamic>{},
      15: <String, dynamic>{},
      16: <String, dynamic>{},
      17: <String, dynamic>{},
      18: <String, dynamic>{},
      19: <String, dynamic>{},
      20: <String, dynamic>{},
      21: <String, dynamic>{},
      22: <String, dynamic>{},
      23: <String, dynamic>{},
    };

    for (var index = 0; index < items.length; index++) {
      final item = items[index];
      final hour = DateTime.parse(item.endDate.toString()).hour;
      itemsMapByHour[hour]?.add(item);
    }

    for (final entry in itemsMapByHour.entries) {
      final hour = entry.key;
      final list = entry.value;
      var listLength = 0.0;
      var avgSympatheticNervousSystemIndex = 0.0;
      var avgStressIndex = 0.0;
      var avgOxygenLevel = 0.0;
      var avgOxygenSaturationLevel = 0.0;
      var avgRespiratoryRate = 0.0;
      var avgSystolicBloodPressure = 0.0;
      var avgDiastolicBloodPressure = 0.0;
      var avgHeartRate = 0.0;
      var avgHeartRateVariability = 0.0;

      for (var index = 0; index < list.length; index++) {
        final item = list[index];
        if (item.averageSympatheticNervousSystemIndex != null &&
            item.averageSympatheticNervousSystemIndex != -9999) {
          avgSympatheticNervousSystemIndex +=
              item.averageSympatheticNervousSystemIndex!;
        } else {
          avgSympatheticNervousSystemIndex += item.averageStressIndex!;
        }

        if (item.averageStressIndex != null) {
          avgStressIndex += item.averageStressIndex!;
        }

        if (item.averageOxygenLevel != null) {
          avgOxygenLevel += item.averageOxygenLevel!;
        }

        if (item.averageOxygenSaturationLevel != null) {
          avgOxygenSaturationLevel += item.averageOxygenSaturationLevel!;
        }

        if (item.averageRespiratoryRate != null) {
          avgRespiratoryRate += item.averageRespiratoryRate!;
        }

        if (item.averageSystolicBloodPressure != null) {
          avgSystolicBloodPressure += item.averageSystolicBloodPressure!;
        }

        if (item.averageDiastolicBloodPressure != null) {
          avgDiastolicBloodPressure += item.averageDiastolicBloodPressure!;
        }

        if (item.averageHeartRate != null) {
          avgHeartRate += item.averageHeartRate!;
        }

        if (item.averageHeartRateVariability != null) {
          avgHeartRateVariability += item.averageHeartRateVariability!;
        }

        listLength++;
      }
      if (listLength > 0) {
        avgSympatheticNervousSystemIndex =
            avgSympatheticNervousSystemIndex / listLength;
        avgStressIndex = avgStressIndex / listLength;
        avgOxygenLevel = avgOxygenLevel / listLength;
        avgOxygenSaturationLevel = avgOxygenSaturationLevel / listLength;
        avgRespiratoryRate = avgRespiratoryRate / listLength;
        avgSystolicBloodPressure = avgSystolicBloodPressure / listLength;
        avgDiastolicBloodPressure = avgDiastolicBloodPressure / listLength;
        avgHeartRate = avgHeartRate / listLength;
        avgHeartRateVariability = avgHeartRateVariability / listLength;

        aggregateMapByHour[hour]?['averageSympatheticNervousSystemIndex'] =
            avgSympatheticNervousSystemIndex;
        aggregateMapByHour[hour]?['averageStressIndex'] = avgStressIndex;
        aggregateMapByHour[hour]?['averageOxygenLevel'] = avgOxygenLevel;
        aggregateMapByHour[hour]?['averageOxygenSaturationLevel'] =
            avgOxygenSaturationLevel;
        aggregateMapByHour[hour]?['averageRespiratoryRate'] =
            avgRespiratoryRate;
        aggregateMapByHour[hour]?['averageSystolicBloodPressure'] =
            avgSystolicBloodPressure;
        aggregateMapByHour[hour]?['averageDiastolicBloodPressure'] =
            avgDiastolicBloodPressure;
        aggregateMapByHour[hour]?['averageHeartRate'] = avgHeartRate;
        aggregateMapByHour[hour]?['averageHeartRateVariability'] =
            avgHeartRateVariability;
        aggregateMapByHour[hour]?['numberOfUsers'] = listLength;
      }
    }
    return aggregateMapByHour;
  }
}
