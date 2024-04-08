import momentTimezone from "moment-timezone";

function aggregateAssessmentsByHour(items, timezone) {
  let itemsMapByHour = {
    0: [],
    1: [],
    2: [],
    3: [],
    4: [],
    5: [],
    6: [],
    7: [],
    8: [],
    9: [],
    10: [],
    11: [],
    12: [],
    13: [],
    14: [],
    15: [],
    16: [],
    17: [],
    18: [],
    19: [],
    20: [],
    21: [],
    22: [],
    23: [],
  };

  let aggregateMapByHour = {
    0: {},
    1: {},
    2: {},
    3: {},
    4: {},
    5: {},
    6: {},
    7: {},
    8: {},
    9: {},
    10: {},
    11: {},
    12: {},
    13: {},
    14: {},
    15: {},
    16: {},
    17: {},
    18: {},
    19: {},
    20: {},
    21: {},
    22: {},
    23: {},
  };

  for (let index = 0; index < items.length; index++) {
    const item = items[index];
    const hour = momentTimezone(item.endDate).tz(timezone).hour();
    itemsMapByHour[hour].push(item);
  }

  for (const hour in itemsMapByHour) {
    if (Object.hasOwnProperty.call(itemsMapByHour, hour)) {
      const list = itemsMapByHour[hour];
      let listLength = 0;
      let avgSympatheticNervousSystemIndex = 0;
      let avgStressIndex = 0;
      let avgOxygenLevel = 0;
      let avgOxygenSaturationLevel = 0;
      let avgRespiratoryRate = 0;
      let avgSystolicBloodPressure = 0;
      let avgDiastolicBloodPressure = 0;
      let avgHeartRate = 0;
      let avgHeartRateVariability = 0;
      for (let index = 0; index < list.length; index++) {
        const item = list[index];
        if (
          item.sympatheticNervousSystemIndex !== undefined &&
          item.sympatheticNervousSystemIndex !== -9999
        ) {
          avgSympatheticNervousSystemIndex +=
            item.sympatheticNervousSystemIndex;
        } else {
          avgSympatheticNervousSystemIndex += item.stressIndex;
        }

        if (item.stressIndex !== undefined) {
          avgStressIndex += item.stressIndex;
        }

        if (item.oxygenLevel !== undefined) {
          avgOxygenLevel += item.oxygenLevel;
        }

        if (item.oxygenSaturationLevel !== undefined) {
          avgOxygenSaturationLevel += item.oxygenSaturationLevel;
        }

        if (item.respiratoryRate !== undefined) {
          avgRespiratoryRate += item.respiratoryRate;
        }

        if (item.systolicBloodPressure !== undefined) {
          avgSystolicBloodPressure += item.systolicBloodPressure;
        }

        if (item.diastolicBloodPressure !== undefined) {
          avgDiastolicBloodPressure += item.diastolicBloodPressure;
        }

        if (item.heartRate !== undefined) {
          avgHeartRate += item.heartRate;
        }

        if (item.heartRateVariability !== undefined) {
          avgHeartRateVariability += item.heartRateVariability;
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

        aggregateMapByHour[hour]["averageSympatheticNervousSystemIndex"] =
          avgSympatheticNervousSystemIndex;
        aggregateMapByHour[hour]["averageStressIndex"] = avgStressIndex;
        aggregateMapByHour[hour]["averageOxygenLevel"] = avgOxygenLevel;
        aggregateMapByHour[hour]["averageOxygenSaturationLevel"] =
          avgOxygenSaturationLevel;
        aggregateMapByHour[hour]["averageRespiratoryRate"] = avgRespiratoryRate;
        aggregateMapByHour[hour]["averageSystolicBloodPressure"] =
          avgSystolicBloodPressure;
        aggregateMapByHour[hour]["averageDiastolicBloodPressure"] =
          avgDiastolicBloodPressure;
        aggregateMapByHour[hour]["averageHeartRate"] = avgHeartRate;
        aggregateMapByHour[hour]["averageHeartRateVariability"] =
          avgHeartRateVariability;
        aggregateMapByHour[hour]["numberOfAssessments"] = listLength;
      }
    }
  }

  return aggregateMapByHour;
}

function aggregateAssessmentsByDay(items) {
  const aggregateOneDayMap = {};
  let listLength = 0;
  let avgSympatheticNervousSystemIndex = 0;
  let avgStressIndex = 0;
  let avgOxygenLevel = 0;
  let avgOxygenSaturationLevel = 0;
  let avgRespiratoryRate = 0;
  let avgSystolicBloodPressure = 0;
  let avgDiastolicBloodPressure = 0;
  let avgHeartRate = 0;
  let avgHeartRateVariability = 0;
  for (let index = 0; index < items.length; index++) {
    const item = items[index];
    if (
      item.sympatheticNervousSystemIndex !== undefined &&
      item.sympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndex += item.sympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndex += item.stressIndex;
    }

    if (item.stressIndex !== undefined) {
      avgStressIndex += item.stressIndex;
    }

    if (item.oxygenLevel !== undefined) {
      avgOxygenLevel += item.oxygenLevel;
    }

    if (item.oxygenSaturationLevel !== undefined) {
      avgOxygenSaturationLevel += item.oxygenSaturationLevel;
    }

    if (item.respiratoryRate !== undefined) {
      avgRespiratoryRate += item.respiratoryRate;
    }

    if (item.systolicBloodPressure !== undefined) {
      avgSystolicBloodPressure += item.systolicBloodPressure;
    }

    if (item.diastolicBloodPressure !== undefined) {
      avgDiastolicBloodPressure += item.diastolicBloodPressure;
    }

    if (item.heartRate !== undefined) {
      avgHeartRate += item.heartRate;
    }

    if (item.heartRateVariability !== undefined) {
      avgHeartRateVariability += item.heartRateVariability;
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

    aggregateOneDayMap["averageSympatheticNervousSystemIndex"] =
      avgSympatheticNervousSystemIndex;
    aggregateOneDayMap["averageStressIndex"] = avgStressIndex;
    aggregateOneDayMap["averageOxygenLevel"] = avgOxygenLevel;
    aggregateOneDayMap["averageOxygenSaturationLevel"] =
      avgOxygenSaturationLevel;
    aggregateOneDayMap["averageRespiratoryRate"] = avgRespiratoryRate;
    aggregateOneDayMap["averageSystolicBloodPressure"] =
      avgSystolicBloodPressure;
    aggregateOneDayMap["averageDiastolicBloodPressure"] =
      avgDiastolicBloodPressure;
    aggregateOneDayMap["averageHeartRate"] = avgHeartRate;
    aggregateOneDayMap["averageHeartRateVariability"] = avgHeartRateVariability;
    aggregateOneDayMap["numberOfAssessments"] = listLength;
  }

  return aggregateOneDayMap;
}

function aggregateAssessmentsByMonth(items) {
  const aggregateOneMonthMap = {};
  let listLength = 0;
  let avgSympatheticNervousSystemIndex = 0;
  let avgStressIndex = 0;
  let avgOxygenLevel = 0;
  let avgOxygenSaturationLevel = 0;
  let avgRespiratoryRate = 0;
  let avgSystolicBloodPressure = 0;
  let avgDiastolicBloodPressure = 0;
  let avgHeartRate = 0;
  let avgHeartRateVariability = 0;
  for (let index = 0; index < items.length; index++) {
    const item = items[index];
    if (
      item.sympatheticNervousSystemIndex !== undefined &&
      item.sympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndex += item.sympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndex += item.stressIndex;
    }

    if (item.stressIndex !== undefined) {
      avgStressIndex += item.stressIndex;
    }

    if (item.oxygenLevel !== undefined) {
      avgOxygenLevel += item.oxygenLevel;
    }

    if (item.oxygenSaturationLevel !== undefined) {
      avgOxygenSaturationLevel += item.oxygenSaturationLevel;
    }

    if (item.respiratoryRate !== undefined) {
      avgRespiratoryRate += item.respiratoryRate;
    }

    if (item.systolicBloodPressure !== undefined) {
      avgSystolicBloodPressure += item.systolicBloodPressure;
    }

    if (item.diastolicBloodPressure !== undefined) {
      avgDiastolicBloodPressure += item.diastolicBloodPressure;
    }

    if (item.heartRate !== undefined) {
      avgHeartRate += item.heartRate;
    }

    if (item.heartRateVariability !== undefined) {
      avgHeartRateVariability += item.heartRateVariability;
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

    aggregateOneMonthMap["averageSympatheticNervousSystemIndex"] =
      avgSympatheticNervousSystemIndex;
    aggregateOneMonthMap["averageStressIndex"] = avgStressIndex;
    aggregateOneMonthMap["averageOxygenLevel"] = avgOxygenLevel;
    aggregateOneMonthMap["averageOxygenSaturationLevel"] =
      avgOxygenSaturationLevel;
    aggregateOneMonthMap["averageRespiratoryRate"] = avgRespiratoryRate;
    aggregateOneMonthMap["averageSystolicBloodPressure"] =
      avgSystolicBloodPressure;
    aggregateOneMonthMap["averageDiastolicBloodPressure"] =
      avgDiastolicBloodPressure;
    aggregateOneMonthMap["averageHeartRate"] = avgHeartRate;
    aggregateOneMonthMap["averageHeartRateVariability"] =
      avgHeartRateVariability;
    aggregateOneMonthMap["numberOfAssessments"] = listLength;
  }

  return aggregateOneMonthMap;
}

function aggregateAssessmentsByYear(items) {
  const aggregateOneYearMap = {};
  let listLength = 0;
  let avgSympatheticNervousSystemIndex = 0;
  let avgStressIndex = 0;
  let avgOxygenLevel = 0;
  let avgOxygenSaturationLevel = 0;
  let avgRespiratoryRate = 0;
  let avgSystolicBloodPressure = 0;
  let avgDiastolicBloodPressure = 0;
  let avgHeartRate = 0;
  let avgHeartRateVariability = 0;
  for (let index = 0; index < items.length; index++) {
    const item = items[index];
    if (
      item.sympatheticNervousSystemIndex !== undefined &&
      item.sympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndex += item.sympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndex += item.stressIndex;
    }

    if (item.stressIndex !== undefined) {
      avgStressIndex += item.stressIndex;
    }

    if (item.oxygenLevel !== undefined) {
      avgOxygenLevel += item.oxygenLevel;
    }

    if (item.oxygenSaturationLevel !== undefined) {
      avgOxygenSaturationLevel += item.oxygenSaturationLevel;
    }

    if (item.respiratoryRate !== undefined) {
      avgRespiratoryRate += item.respiratoryRate;
    }

    if (item.systolicBloodPressure !== undefined) {
      avgSystolicBloodPressure += item.systolicBloodPressure;
    }

    if (item.diastolicBloodPressure !== undefined) {
      avgDiastolicBloodPressure += item.diastolicBloodPressure;
    }

    if (item.heartRate !== undefined) {
      avgHeartRate += item.heartRate;
    }

    if (item.heartRateVariability !== undefined) {
      avgHeartRateVariability += item.heartRateVariability;
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

    aggregateOneYearMap["averageSympatheticNervousSystemIndex"] =
      avgSympatheticNervousSystemIndex;
    aggregateOneYearMap["averageStressIndex"] = avgStressIndex;
    aggregateOneYearMap["averageOxygenLevel"] = avgOxygenLevel;
    aggregateOneYearMap["averageOxygenSaturationLevel"] =
      avgOxygenSaturationLevel;
    aggregateOneYearMap["averageRespiratoryRate"] = avgRespiratoryRate;
    aggregateOneYearMap["averageSystolicBloodPressure"] =
      avgSystolicBloodPressure;
    aggregateOneYearMap["averageDiastolicBloodPressure"] =
      avgDiastolicBloodPressure;
    aggregateOneYearMap["averageHeartRate"] = avgHeartRate;
    aggregateOneYearMap["averageHeartRateVariability"] =
      avgHeartRateVariability;
    aggregateOneYearMap["numberOfAssessments"] = listLength;
  }

  return aggregateOneYearMap;
}

export default {
  aggregateAssessmentsByHour,
  aggregateAssessmentsByDay,
  aggregateAssessmentsByMonth,
  aggregateAssessmentsByYear,
};
