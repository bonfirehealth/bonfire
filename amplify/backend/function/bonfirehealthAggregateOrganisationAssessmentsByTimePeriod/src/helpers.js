import momentTimezone from "moment-timezone";

function aggregateOrganisationAssessmentsByHour(organisationUsers, timezone) {
  const items = [];
  const itemsMale = [];
  const itemsFemale = [];

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

  let itemsMapByHourMale = {
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

  let itemsMapByHourFemale = {
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

  let assessments = [];
  let assessmentsMapByHour = [];
  for (let i = 0; i < 24; ++i) {
    assessmentsMapByHour[i] = [];
  }

  for (let index = 0; index < organisationUsers.length; index++) {
    const organisationUser = organisationUsers[index];
    const profile = organisationUser.user.profile;
    if (profile !== undefined && profile !== null) {
      if (
        profile.aggregateHourAssessments !== undefined &&
        profile.aggregateHourAssessments !== null
      ) {
        items.push(...profile.aggregateHourAssessments.items);
        assessments.push(...profile.assessments.items);
        if (profile.gender !== undefined && profile.gender !== null) {
          if (profile.gender === "Male") {
            itemsMale.push(...profile.aggregateHourAssessments.items);
          } else if (profile.gender === "Female") {
            itemsFemale.push(...profile.aggregateHourAssessments.items);
          }
        }
      }
    }
  }

  console.info(
    `🔥 88.1 of 9 organisationUsers: ${JSON.stringify(organisationUsers)}`
  );

  console.info(
    `🔥 88.1 of 9 assessments: ${JSON.stringify(assessments)}`
  );

  console.info(
    `🔥 88.1 of 9 assessment items: ${JSON.stringify(items)}`
  );
  for (let index = 0; index < items.length; index++) {
    const item = items[index];
    console.info(
      `🔥 88 of 9 assessment stressIndex: ${JSON.stringify(item)}`
    );
    const hour = momentTimezone(item.endDate).tz(timezone).hour() - 1;
    console.info(
      `🔥 88 of 9 assessment hour: ${hour}`
    );
    if (itemsMapByHour[hour]) {
      itemsMapByHour[hour].push(item);
    }
    console.info(
      `🔥 888 of 9 assessment stressIndex: ${JSON.stringify(itemsMapByHour[hour])}`
    );
  }

  for (let index = 0; index < itemsMale.length; index++) {
    const item = itemsMale[index];
    const hour = momentTimezone(item.endDate).tz(timezone).hour() - 1;
    if (itemsMapByHourMale[hour]) {
      itemsMapByHourMale[hour].push(item);
    }
  }

  for (let index = 0; index < itemsFemale.length; index++) {
    const item = itemsFemale[index];
    const hour = momentTimezone(item.endDate).tz(timezone).hour() - 1;
    if (itemsMapByHourFemale[hour]) {
      itemsMapByHourFemale[hour].push(item);
    }
  }

  // Aggregate assessments by hour
  for (let index = 0; index < assessments.length; index++) {
    let assessment = assessments[index];
    const hour = momentTimezone(assessment.endDate).tz(timezone).hour();
    if (assessmentsMapByHour[hour]) {
      assessmentsMapByHour[hour].push(assessment);
    }
  }

  let usersCountRiskLevelMap = {};
  for (const hour in assessmentsMapByHour) {
    const list = assessmentsMapByHour[hour];
    var usersByRiskLevelByHour = {
      numberOfProfilesLowRiskStressIndex: [],
      numberOfProfilesMediumRiskStressIndex: [],
      numberOfProfilesHighRiskStressIndex: [],
      numberOfProfilesNormalRiskBloodPressure: [],
      numberOfProfilesElevatedRiskBloodPressure: [],
      numberOfProfilesHypertensiveRiskBloodPressure: [],
    };

    for (const assessment of list) {
      if (
        assessment.stressIndex !== undefined &&
        assessment.stressIndex !== null &&
        assessment.stressIndex !== -9999
      ) {

        const startDate = momentTimezone(assessment.startDate)
          .tz(timezone)
          .set("hour", 0)
          .set("minute", 0)
          .set("second", 0)
          .set("millisecond", 0);

        const currentDate = momentTimezone()
          .tz(timezone)
          .set("hour", 0)
          .set("minute", 0)
          .set("second", 0)
          .set("millisecond", 0);

          console.info(
            `🔥 8 of 9 startDate: ${JSON.stringify(startDate)}`
          );
          console.info(
            `🔥 8 of 9 currentDate: ${JSON.stringify(currentDate)}`
          );

        if (startDate.isSame(currentDate)) {
          console.info(
            `🔥 8 of 9 assessment stressIndex: ${JSON.stringify(assessment.stressIndex)}`
          );
          if (assessment.stressIndex > 0 && assessment.stressIndex < 50) {
            usersByRiskLevelByHour.numberOfProfilesLowRiskStressIndex.push(assessment.profileID);
            console.info(
              `🔥 8 of 9 assessment stressIndex: 0`
            );
          } else if (assessment.stressIndex >= 50 && assessment.stressIndex < 60) {
            console.info(
              `🔥 8 of 9 assessment stressIndex: 1`
            );
            usersByRiskLevelByHour.numberOfProfilesMediumRiskStressIndex.push(assessment.profileID);
          } else {
            console.info(
              `🔥 8 of 9 assessment stressIndex: 2`
            );
            usersByRiskLevelByHour.numberOfProfilesHighRiskStressIndex.push(assessment.profileID);
          }
          console.info(
            `🔥 8 of 9 assessment systolicBloodPressure: ${JSON.stringify(assessment.systolicBloodPressure)}`
          );
          console.info(
            `🔥 8 of 9 assessment diastolicBloodPressure: ${JSON.stringify(assessment.diastolicBloodPressure)}`
          );

          if (assessment.systolicBloodPressure < 120 && assessment.diastolicBloodPressure < 80) {
            usersByRiskLevelByHour.numberOfProfilesNormalRiskBloodPressure.push(assessment.profileID);
            console.info(
              `🔥 8 of 9 assessment diastolicBloodPressure: 0`
            );
          } else if (assessment.systolicBloodPressure < 120 && assessment.diastolicBloodPressure < 80) {
            console.info(
              `🔥 8 of 9 assessment diastolicBloodPressure: 1`
            );
            usersByRiskLevelByHour.numberOfProfilesElevatedRiskBloodPressure.push(assessment.profileID);
          } else if (assessment.diastolicBloodPressure >= 80) {
            console.info(
              `🔥 8 of 9 assessment diastolicBloodPressure: 1`
            );
            usersByRiskLevelByHour.numberOfProfilesHypertensiveRiskBloodPressure.push(assessment.profileID);
          }
        }
      }
    }

    let tmp = {};
    console.info(
      `🔥 8 of 9 usersByRiskLevelByHour: ${JSON.stringify(usersByRiskLevelByHour)}`
    );
    for (const vital in usersByRiskLevelByHour) {
      if (usersByRiskLevelByHour.hasOwnProperty(vital)) {
        console.info(
          `🔥 8 of 9 tmp: ${JSON.stringify(vital)} : ${JSON.stringify(usersByRiskLevelByHour[vital].length)}`
        );
        tmp[vital] = usersByRiskLevelByHour[vital].length;
      }
    }

    console.info(
      `🔥 8 of 9 usersCountRiskLevelMap: ${JSON.stringify(tmp)}`
    );

    usersCountRiskLevelMap[hour] = tmp;
    console.info(
      `🔥 8.1 of 9 - ${hour} usersCountRiskLevelMap: ${JSON.stringify(usersCountRiskLevelMap[hour])}`
    );
  }

  console.info(
    `🔥 8.1.2 of 9 - usersCountRiskLevelMap: ${JSON.stringify(usersCountRiskLevelMap)}`
  );

  console.info(
    `🔥 8.1.2 of 9 - itemsMapByHour: ${JSON.stringify(itemsMapByHour)}`
  );

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
      console.info(
        `🔥 8.2 of 9 - ${hour} usersCountRiskLevelMap: ${JSON.stringify(itemsMapByHour[hour])}`
      );
      console.info(
        `🔥 8.2 of 9 - ${hour} usersCountRiskLevelMap: ${JSON.stringify(list)}`
      );
      for (let index = 0; index < list.length; index++) {
        const item = list[index];
        if (
          item.averageSympatheticNervousSystemIndex !== undefined &&
          item.averageSympatheticNervousSystemIndex !== null &&
          item.averageSympatheticNervousSystemIndex !== -9999
        ) {
          avgSympatheticNervousSystemIndex +=
            item.averageSympatheticNervousSystemIndex;
        } else {
          avgSympatheticNervousSystemIndex += item.averageStressIndex;
        }

        if (
          item.averageStressIndex !== undefined &&
          item.averageStressIndex !== null
        ) {
          avgStressIndex += item.averageStressIndex;
        }

        if (
          item.averageOxygenLevel !== undefined &&
          item.averageOxygenLevel !== null
        ) {
          avgOxygenLevel += item.averageOxygenLevel;
        }

        if (
          item.averageOxygenSaturationLevel !== undefined &&
          item.averageOxygenSaturationLevel !== null
        ) {
          avgOxygenSaturationLevel += item.averageOxygenSaturationLevel;
        }

        if (
          item.averageRespiratoryRate !== undefined &&
          item.averageRespiratoryRate !== null
        ) {
          avgRespiratoryRate += item.averageRespiratoryRate;
        }

        if (
          item.averageSystolicBloodPressure !== undefined &&
          item.averageSystolicBloodPressure !== null
        ) {
          avgSystolicBloodPressure += item.averageSystolicBloodPressure;
        }

        if (
          item.averageDiastolicBloodPressure !== undefined &&
          item.averageDiastolicBloodPressure !== null
        ) {
          avgDiastolicBloodPressure += item.averageDiastolicBloodPressure;
        }

        if (
          item.averageHeartRate !== undefined &&
          item.averageHeartRate !== null
        ) {
          avgHeartRate += item.averageHeartRate;
        }

        if (
          item.averageHeartRateVariability !== undefined &&
          item.averageHeartRateVariability !== null
        ) {
          avgHeartRateVariability += item.averageHeartRateVariability;
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
        aggregateMapByHour[hour]["numberOfProfiles"] = listLength;
        //
        aggregateMapByHour[hour].numberOfProfilesLowRiskStressIndex = usersCountRiskLevelMap[hour].numberOfProfilesLowRiskStressIndex
        aggregateMapByHour[hour].numberOfProfilesMediumRiskStressIndex = usersCountRiskLevelMap[hour].numberOfProfilesMediumRiskStressIndex
        aggregateMapByHour[hour].numberOfProfilesHighRiskStressIndex = usersCountRiskLevelMap[hour].numberOfProfilesHighRiskStressIndex
        aggregateMapByHour[hour].numberOfProfilesNormalRiskBloodPressure = usersCountRiskLevelMap[hour].numberOfProfilesNormalRiskBloodPressure
        aggregateMapByHour[hour].numberOfProfilesElevatedRiskBloodPressure = usersCountRiskLevelMap[hour].numberOfProfilesElevatedRiskBloodPressure
        aggregateMapByHour[hour].numberOfProfilesHypertensiveRiskBloodPressure = usersCountRiskLevelMap[hour].numberOfProfilesHypertensiveRiskBloodPressure
        console.info(
          `🔥 8.2 of 10 - ${hour} usersCountRiskLevelMap: ${JSON.stringify( aggregateMapByHour[hour])}`
        );
      }
    }
  }

  for (const hour in itemsMapByHourMale) {
    if (Object.hasOwnProperty.call(itemsMapByHourMale, hour)) {
      const list = itemsMapByHourMale[hour];
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
          item.averageSympatheticNervousSystemIndex !== undefined &&
          item.averageSympatheticNervousSystemIndex !== null &&
          item.averageSympatheticNervousSystemIndex !== -9999
        ) {
          avgSympatheticNervousSystemIndex +=
            item.averageSympatheticNervousSystemIndex;
        } else {
          avgSympatheticNervousSystemIndex += item.averageStressIndex;
        }

        if (
          item.averageStressIndex !== undefined &&
          item.averageStressIndex !== null
        ) {
          avgStressIndex += item.averageStressIndex;
        }

        if (
          item.averageOxygenLevel !== undefined &&
          item.averageOxygenLevel !== null
        ) {
          avgOxygenLevel += item.averageOxygenLevel;
        }

        if (
          item.averageOxygenSaturationLevel !== undefined &&
          item.averageOxygenSaturationLevel !== null
        ) {
          avgOxygenSaturationLevel += item.averageOxygenSaturationLevel;
        }

        if (
          item.averageRespiratoryRate !== undefined &&
          item.averageRespiratoryRate !== null
        ) {
          avgRespiratoryRate += item.averageRespiratoryRate;
        }

        if (
          item.averageSystolicBloodPressure !== undefined &&
          item.averageSystolicBloodPressure !== null
        ) {
          avgSystolicBloodPressure += item.averageSystolicBloodPressure;
        }

        if (
          item.averageDiastolicBloodPressure !== undefined &&
          item.averageDiastolicBloodPressure !== null
        ) {
          avgDiastolicBloodPressure += item.averageDiastolicBloodPressure;
        }

        if (
          item.averageHeartRate !== undefined &&
          item.averageHeartRate !== null
        ) {
          avgHeartRate += item.averageHeartRate;
        }

        if (
          item.averageHeartRateVariability !== undefined &&
          item.averageHeartRateVariability !== null
        ) {
          avgHeartRateVariability += item.averageHeartRateVariability;
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

        aggregateMapByHour[hour][
          "averageSympatheticNervousSystemIndexForMale"
        ] = avgSympatheticNervousSystemIndex;
        aggregateMapByHour[hour]["averageStressIndexForMale"] = avgStressIndex;
        aggregateMapByHour[hour]["averageOxygenLevelForMale"] = avgOxygenLevel;
        aggregateMapByHour[hour]["averageOxygenSaturationLevelForMale"] =
          avgOxygenSaturationLevel;
        aggregateMapByHour[hour]["averageRespiratoryRateForMale"] =
          avgRespiratoryRate;
        aggregateMapByHour[hour]["averageSystolicBloodPressureForMale"] =
          avgSystolicBloodPressure;
        aggregateMapByHour[hour]["averageDiastolicBloodPressureForMale"] =
          avgDiastolicBloodPressure;
        aggregateMapByHour[hour]["averageHeartRateForMale"] = avgHeartRate;
        aggregateMapByHour[hour]["averageHeartRateVariabilityForMale"] =
          avgHeartRateVariability;
        aggregateMapByHour[hour]["numberOfMaleProfiles"] = listLength;
      }
    }
  }

  for (const hour in itemsMapByHourFemale) {
    if (Object.hasOwnProperty.call(itemsMapByHourFemale, hour)) {
      const list = itemsMapByHourFemale[hour];
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
          item.averageSympatheticNervousSystemIndex !== undefined &&
          item.averageSympatheticNervousSystemIndex !== null &&
          item.averageSympatheticNervousSystemIndex !== -9999
        ) {
          avgSympatheticNervousSystemIndex +=
            item.averageSympatheticNervousSystemIndex;
        } else {
          avgSympatheticNervousSystemIndex += item.averageStressIndex;
        }

        if (
          item.averageStressIndex !== undefined &&
          item.averageStressIndex !== null
        ) {
          avgStressIndex += item.averageStressIndex;
        }

        if (
          item.averageOxygenLevel !== undefined &&
          item.averageOxygenLevel !== null
        ) {
          avgOxygenLevel += item.averageOxygenLevel;
        }

        if (
          item.averageOxygenSaturationLevel !== undefined &&
          item.averageOxygenSaturationLevel !== null
        ) {
          avgOxygenSaturationLevel += item.averageOxygenSaturationLevel;
        }

        if (
          item.averageRespiratoryRate !== undefined &&
          item.averageRespiratoryRate !== null
        ) {
          avgRespiratoryRate += item.averageRespiratoryRate;
        }

        if (
          item.averageSystolicBloodPressure !== undefined &&
          item.averageSystolicBloodPressure !== null
        ) {
          avgSystolicBloodPressure += item.averageSystolicBloodPressure;
        }

        if (
          item.averageDiastolicBloodPressure !== undefined &&
          item.averageDiastolicBloodPressure !== null
        ) {
          avgDiastolicBloodPressure += item.averageDiastolicBloodPressure;
        }

        if (
          item.averageHeartRate !== undefined &&
          item.averageHeartRate !== null
        ) {
          avgHeartRate += item.averageHeartRate;
        }

        if (
          item.averageHeartRateVariability !== undefined &&
          item.averageHeartRateVariability !== null
        ) {
          avgHeartRateVariability += item.averageHeartRateVariability;
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

        aggregateMapByHour[hour][
          "averageSympatheticNervousSystemIndexForFemale"
        ] = avgSympatheticNervousSystemIndex;
        aggregateMapByHour[hour]["averageStressIndexForFemale"] =
          avgStressIndex;
        aggregateMapByHour[hour]["averageOxygenLevelForFemale"] =
          avgOxygenLevel;
        aggregateMapByHour[hour]["averageOxygenSaturationLevelForFemale"] =
          avgOxygenSaturationLevel;
        aggregateMapByHour[hour]["averageRespiratoryRateForFemale"] =
          avgRespiratoryRate;
        aggregateMapByHour[hour]["averageSystolicBloodPressureForFemale"] =
          avgSystolicBloodPressure;
        aggregateMapByHour[hour]["averageDiastolicBloodPressureForFemale"] =
          avgDiastolicBloodPressure;
        aggregateMapByHour[hour]["averageHeartRateForFemale"] = avgHeartRate;
        aggregateMapByHour[hour]["averageHeartRateVariabilityForFemale"] =
          avgHeartRateVariability;
        aggregateMapByHour[hour]["numberOfFemaleProfiles"] = listLength;
      }
    }
  }

  console.info(
    `🔥 8.1 of 9 usersCountRiskLevelMap final: ${JSON.stringify(aggregateMapByHour)}`
  );

  return aggregateMapByHour;
}

function aggregateOrganisationAssessmentsByDay(organisationUsers) {
  const items = [];
  const itemsMale = [];
  const itemsFemale = [];
  const aggregateOneDayMap = {};

  for (let index = 0; index < organisationUsers.length; index++) {
    const organisationUser = organisationUsers[index];
    const profile = organisationUser.user.profile;
    if (profile !== undefined && profile !== null) {
      if (
        profile.aggregateDayAssessments !== undefined &&
        profile.aggregateDayAssessments !== null
      ) {
        items.push(...profile.aggregateDayAssessments.items);
        if (profile.gender !== undefined && profile.gender !== null) {
          if (profile.gender === "Male") {
            itemsMale.push(...profile.aggregateDayAssessments.items);
          } else if (profile.gender === "Female") {
            itemsFemale.push(...profile.aggregateDayAssessments.items);
          }
        }
      }
    }
  }

  // Aggregate the number of users by vital category
  let tempMap = {
    numberOfProfilesLowRiskStressIndex: new Set(),
    numberOfProfilesMediumRiskStressIndex: new Set(),
    numberOfProfilesHighRiskStressIndex: new Set(),
    numberOfProfilesNormalRiskBloodPressure: new Set(),
    numberOfProfilesElevatedRiskBloodPressure: new Set(),
    numberOfProfilesHypertensiveRiskBloodPressure: new Set(),
  }
  for (let index = 0; index < items.length; index++) {
    const item = items[index];
    if (item.averageStressIndex != undefined &&
      item.averageStressIndex != null
    ) {
      if (item.stressIndex > 0 && item.stressIndex < 50) {
        tempMap.numberOfProfilesLowRiskStressIndex.add(item.profileID);
      } else if (item.stressIndex >= 50 && item.stressIndex < 60) {
        tempMap.numberOfProfilesMediumRiskStressIndex.add(item.profileID);
      } else {
        tempMap.numberOfProfilesHighRiskStressIndex.add(item.profileID);
      }
    }

    if (item.systolicBloodPressure != undefined &&
      item.systolicBloodPressure != null &&
      item.diastolicBloodPressure != undefined &&
      item.diastolicBloodPressure != null
    ) {
      if (item.systolicBloodPressure <= 120 && item.diastolicBloodPressure < 80) {
        tempMap.numberOfProfilesNormalRiskBloodPressure.add(item.profileID);
      } else if (item.systolicBloodPressure > 120 && item.systolicBloodPressure < 129 && item.diastolicBloodPressure < 80) {
        tempMap.numberOfProfilesElevatedRiskBloodPressure.add(item.profileID);
      } else {
        tempMap.numberOfProfilesHypertensiveRiskBloodPressure.add(item.profileID);
      }
    }
  }
  for (const key in tempMap) {
    if (tempMap.hasOwnProperty(key)) {
      aggregateOneDayMap[key] = tempMap[key].size;
    }
  }

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
      item.averageSympatheticNervousSystemIndex !== undefined &&
      item.averageSympatheticNervousSystemIndex !== null &&
      item.averageSympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndex +=
        item.averageSympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndex += item.averageStressIndex;
    }

    if (
      item.averageStressIndex !== undefined &&
      item.averageStressIndex !== null
    ) {
      avgStressIndex += item.averageStressIndex;
    }

    if (
      item.averageOxygenLevel !== undefined &&
      item.averageOxygenLevel !== null
    ) {
      avgOxygenLevel += item.averageOxygenLevel;
    }

    if (
      item.averageOxygenSaturationLevel !== undefined &&
      item.averageOxygenSaturationLevel !== null
    ) {
      avgOxygenSaturationLevel += item.averageOxygenSaturationLevel;
    }

    if (
      item.averageRespiratoryRate !== undefined &&
      item.averageRespiratoryRate !== null
    ) {
      avgRespiratoryRate += item.averageRespiratoryRate;
    }

    if (
      item.averageSystolicBloodPressure !== undefined &&
      item.averageSystolicBloodPressure !== null
    ) {
      avgSystolicBloodPressure += item.averageSystolicBloodPressure;
    }

    if (
      item.averageDiastolicBloodPressure !== undefined &&
      item.averageDiastolicBloodPressure !== null
    ) {
      avgDiastolicBloodPressure += item.averageDiastolicBloodPressure;
    }

    if (item.averageHeartRate !== undefined && item.averageHeartRate !== null) {
      avgHeartRate += item.averageHeartRate;
    }

    if (
      item.averageHeartRateVariability !== undefined &&
      item.averageHeartRateVariability !== null
    ) {
      avgHeartRateVariability += item.averageHeartRateVariability;
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
    aggregateOneDayMap["numberOfProfiles"] = listLength;
  }

  let listLengthMale = 0;
  let avgSympatheticNervousSystemIndexMale = 0;
  let avgStressIndexMale = 0;
  let avgOxygenLevelMale = 0;
  let avgOxygenSaturationLevelMale = 0;
  let avgRespiratoryRateMale = 0;
  let avgSystolicBloodPressureMale = 0;
  let avgDiastolicBloodPressureMale = 0;
  let avgHeartRateMale = 0;
  let avgHeartRateVariabilityMale = 0;

  for (let index = 0; index < itemsMale.length; index++) {
    const item = itemsMale[index];
    if (
      item.averageSympatheticNervousSystemIndex !== undefined &&
      item.averageSympatheticNervousSystemIndex !== null &&
      item.averageSympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndexMale +=
        item.averageSympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndexMale += item.averageStressIndex;
    }

    if (
      item.averageStressIndex !== undefined &&
      item.averageStressIndex !== null
    ) {
      avgStressIndexMale += item.averageStressIndex;
    }

    if (
      item.averageOxygenLevel !== undefined &&
      item.averageOxygenLevel !== null
    ) {
      avgOxygenLevelMale += item.averageOxygenLevel;
    }

    if (
      item.averageOxygenSaturationLevel !== undefined &&
      item.averageOxygenSaturationLevel !== null
    ) {
      avgOxygenSaturationLevelMale += item.averageOxygenSaturationLevel;
    }

    if (
      item.averageRespiratoryRate !== undefined &&
      item.averageRespiratoryRate !== null
    ) {
      avgRespiratoryRateMale += item.averageRespiratoryRate;
    }

    if (
      item.averageSystolicBloodPressure !== undefined &&
      item.averageSystolicBloodPressure !== null
    ) {
      avgSystolicBloodPressureMale += item.averageSystolicBloodPressure;
    }

    if (
      item.averageDiastolicBloodPressure !== undefined &&
      item.averageDiastolicBloodPressure !== null
    ) {
      avgDiastolicBloodPressureMale += item.averageDiastolicBloodPressure;
    }

    if (item.averageHeartRate !== undefined && item.averageHeartRate !== null) {
      avgHeartRateMale += item.averageHeartRate;
    }

    if (
      item.averageHeartRateVariability !== undefined &&
      item.averageHeartRateVariability !== null
    ) {
      avgHeartRateVariabilityMale += item.averageHeartRateVariability;
    }

    listLengthMale++;
  }

  if (listLengthMale > 0) {
    avgSympatheticNervousSystemIndexMale =
      avgSympatheticNervousSystemIndexMale / listLengthMale;
    avgStressIndexMale = avgStressIndexMale / listLengthMale;
    avgOxygenLevelMale = avgOxygenLevelMale / listLengthMale;
    avgOxygenSaturationLevelMale =
      avgOxygenSaturationLevelMale / listLengthMale;
    avgRespiratoryRateMale = avgRespiratoryRateMale / listLengthMale;
    avgSystolicBloodPressureMale =
      avgSystolicBloodPressureMale / listLengthMale;
    avgDiastolicBloodPressureMale =
      avgDiastolicBloodPressureMale / listLengthMale;
    avgHeartRateMale = avgHeartRateMale / listLengthMale;
    avgHeartRateVariabilityMale = avgHeartRateVariabilityMale / listLengthMale;

    aggregateOneDayMap["averageSympatheticNervousSystemIndexForMale"] =
      avgSympatheticNervousSystemIndexMale;
    aggregateOneDayMap["averageStressIndexForMale"] = avgStressIndexMale;
    aggregateOneDayMap["averageOxygenLevelForMale"] = avgOxygenLevelMale;
    aggregateOneDayMap["averageOxygenSaturationLevelForMale"] =
      avgOxygenSaturationLevelMale;
    aggregateOneDayMap["averageRespiratoryRateForMale"] =
      avgRespiratoryRateMale;
    aggregateOneDayMap["averageSystolicBloodPressureForMale"] =
      avgSystolicBloodPressureMale;
    aggregateOneDayMap["averageDiastolicBloodPressureForMale"] =
      avgDiastolicBloodPressureMale;
    aggregateOneDayMap["averageHeartRateForMale"] = avgHeartRateMale;
    aggregateOneDayMap["averageHeartRateVariabilityForMale"] =
      avgHeartRateVariabilityMale;
    aggregateOneDayMap["numberOfMaleProfiles"] = listLengthMale;
  }

  let listLengthFemale = 0;
  let avgSympatheticNervousSystemIndexFemale = 0;
  let avgStressIndexFemale = 0;
  let avgOxygenLevelFemale = 0;
  let avgOxygenSaturationLevelFemale = 0;
  let avgRespiratoryRateFemale = 0;
  let avgSystolicBloodPressureFemale = 0;
  let avgDiastolicBloodPressureFemale = 0;
  let avgHeartRateFemale = 0;
  let avgHeartRateVariabilityFemale = 0;

  for (let index = 0; index < itemsFemale.length; index++) {
    const item = itemsFemale[index];
    if (
      item.averageSympatheticNervousSystemIndex !== undefined &&
      item.averageSympatheticNervousSystemIndex !== null &&
      item.averageSympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndexFemale +=
        item.averageSympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndexFemale += item.averageStressIndex;
    }

    if (
      item.averageStressIndex !== undefined &&
      item.averageStressIndex !== null
    ) {
      avgStressIndexFemale += item.averageStressIndex;
    }

    if (
      item.averageOxygenLevel !== undefined &&
      item.averageOxygenLevel !== null
    ) {
      avgOxygenLevelFemale += item.averageOxygenLevel;
    }

    if (
      item.averageOxygenSaturationLevel !== undefined &&
      item.averageOxygenSaturationLevel !== null
    ) {
      avgOxygenSaturationLevelFemale += item.averageOxygenSaturationLevel;
    }

    if (
      item.averageRespiratoryRate !== undefined &&
      item.averageRespiratoryRate !== null
    ) {
      avgRespiratoryRateFemale += item.averageRespiratoryRate;
    }

    if (
      item.averageSystolicBloodPressure !== undefined &&
      item.averageSystolicBloodPressure !== null
    ) {
      avgSystolicBloodPressureFemale += item.averageSystolicBloodPressure;
    }

    if (
      item.averageDiastolicBloodPressure !== undefined &&
      item.averageDiastolicBloodPressure !== null
    ) {
      avgDiastolicBloodPressureFemale += item.averageDiastolicBloodPressure;
    }

    if (item.averageHeartRate !== undefined && item.averageHeartRate !== null) {
      avgHeartRateFemale += item.averageHeartRate;
    }

    if (
      item.averageHeartRateVariability !== undefined &&
      item.averageHeartRateVariability !== null
    ) {
      avgHeartRateVariabilityFemale += item.averageHeartRateVariability;
    }

    listLengthFemale++;
  }

  if (listLengthFemale > 0) {
    avgSympatheticNervousSystemIndexFemale =
      avgSympatheticNervousSystemIndexFemale / listLengthFemale;
    avgStressIndexFemale = avgStressIndexFemale / listLengthFemale;
    avgOxygenLevelFemale = avgOxygenLevelFemale / listLengthFemale;
    avgOxygenSaturationLevelFemale =
      avgOxygenSaturationLevelFemale / listLengthFemale;
    avgRespiratoryRateFemale = avgRespiratoryRateFemale / listLengthFemale;
    avgSystolicBloodPressureFemale =
      avgSystolicBloodPressureFemale / listLengthFemale;
    avgDiastolicBloodPressureFemale =
      avgDiastolicBloodPressureFemale / listLengthFemale;
    avgHeartRateFemale = avgHeartRateFemale / listLengthFemale;
    avgHeartRateVariabilityFemale =
      avgHeartRateVariabilityFemale / listLengthFemale;

    aggregateOneDayMap["averageSympatheticNervousSystemIndexForFemale"] =
      avgSympatheticNervousSystemIndexFemale;
    aggregateOneDayMap["averageStressIndexForFemale"] = avgStressIndexFemale;
    aggregateOneDayMap["averageOxygenLevelForFemale"] = avgOxygenLevelFemale;
    aggregateOneDayMap["averageOxygenSaturationLevelForFemale"] =
      avgOxygenSaturationLevelFemale;
    aggregateOneDayMap["averageRespiratoryRateForFemale"] =
      avgRespiratoryRateFemale;
    aggregateOneDayMap["averageSystolicBloodPressureForFemale"] =
      avgSystolicBloodPressureFemale;
    aggregateOneDayMap["averageDiastolicBloodPressureForFemale"] =
      avgDiastolicBloodPressureFemale;
    aggregateOneDayMap["averageHeartRateForFemale"] = avgHeartRateFemale;
    aggregateOneDayMap["averageHeartRateVariabilityForFemale"] =
      avgHeartRateVariabilityFemale;
    aggregateOneDayMap["numberOfFemaleProfiles"] = listLengthFemale;
  }

  return aggregateOneDayMap;
}

function aggregateOrganisationAssessmentsByMonth(organisationUsers) {
  const items = [];
  const itemsMale = [];
  const itemsFemale = [];
  const aggregateOneMonthMap = {};

  for (let index = 0; index < organisationUsers.length; index++) {
    const organisationUser = organisationUsers[index];
    const profile = organisationUser.user.profile;
    if (profile !== undefined && profile !== null) {
      if (
        profile.aggregateMonthAssessments !== undefined &&
        profile.aggregateMonthAssessments !== null
      ) {
        items.push(...profile.aggregateMonthAssessments.items);
        if (profile.gender !== undefined && profile.gender !== null) {
          if (profile.gender === "Male") {
            itemsMale.push(...profile.aggregateMonthAssessments.items);
          } else if (profile.gender === "Female") {
            itemsFemale.push(...profile.aggregateMonthAssessments.items);
          }
        }
      }
    }
  }

  // Aggregate the number of users by vital category
  let tempMap = {
    numberOfProfilesLowRiskStressIndex: new Set(),
    numberOfProfilesMediumRiskStressIndex: new Set(),
    numberOfProfilesHighRiskStressIndex: new Set(),
    numberOfProfilesNormalRiskBloodPressure: new Set(),
    numberOfProfilesElevatedRiskBloodPressure: new Set(),
    numberOfProfilesHypertensiveRiskBloodPressure: new Set(),
  }
  for (let index = 0; index < items.length; index++) {
    const item = items[index];
    if (item.averageStressIndex != undefined &&
      item.averageStressIndex != null
    ) {
      if (item.stressIndex > 0 && item.stressIndex < 50) {
        tempMap.numberOfProfilesLowRiskStressIndex.add(item.profileID);
      } else if (item.stressIndex >= 50 && item.stressIndex < 60) {
        tempMap.numberOfProfilesMediumRiskStressIndex.add(item.profileID);
      } else {
        tempMap.numberOfProfilesHighRiskStressIndex.add(item.profileID);
      }
    }

    if (item.systolicBloodPressure != undefined &&
      item.systolicBloodPressure != null &&
      item.diastolicBloodPressure != undefined &&
      item.diastolicBloodPressure != null
    ) {
      if (item.systolicBloodPressure < 120 && item.diastolicBloodPressure < 80) {
        tempMap.numberOfProfilesNormalRiskBloodPressure.add(item.profileID);
      } else if (item.systolicBloodPressure < 120 && item.diastolicBloodPressure < 80) {
        tempMap.numberOfProfilesElevatedRiskBloodPressure.add(item.profileID);
      } else if (item.diastolicBloodPressure >= 80) {
        tempMap.numberOfProfilesHypertensiveRiskBloodPressure.add(item.profileID);
      }
    }
  }
  for (const key in tempMap) {
    if (tempMap.hasOwnProperty(key)) {
      aggregateOneMonthMap[key] = tempMap[key].size;
    }
  }


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
      item.averageSympatheticNervousSystemIndex !== undefined &&
      item.averageSympatheticNervousSystemIndex !== null &&
      item.averageSympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndex +=
        item.averageSympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndex += item.averageStressIndex;
    }

    if (
      item.averageStressIndex !== undefined &&
      item.averageStressIndex !== null
    ) {
      avgStressIndex += item.averageStressIndex;
    }

    if (
      item.averageOxygenLevel !== undefined &&
      item.averageOxygenLevel !== null
    ) {
      avgOxygenLevel += item.averageOxygenLevel;
    }

    if (
      item.averageOxygenSaturationLevel !== undefined &&
      item.averageOxygenSaturationLevel !== null
    ) {
      avgOxygenSaturationLevel += item.averageOxygenSaturationLevel;
    }

    if (
      item.averageRespiratoryRate !== undefined &&
      item.averageRespiratoryRate !== null
    ) {
      avgRespiratoryRate += item.averageRespiratoryRate;
    }

    if (
      item.averageSystolicBloodPressure !== undefined &&
      item.averageSystolicBloodPressure !== null
    ) {
      avgSystolicBloodPressure += item.averageSystolicBloodPressure;
    }

    if (
      item.averageDiastolicBloodPressure !== undefined &&
      item.averageDiastolicBloodPressure !== null
    ) {
      avgDiastolicBloodPressure += item.averageDiastolicBloodPressure;
    }

    if (item.averageHeartRate !== undefined && item.averageHeartRate !== null) {
      avgHeartRate += item.averageHeartRate;
    }

    if (
      item.averageHeartRateVariability !== undefined &&
      item.averageHeartRateVariability !== null
    ) {
      avgHeartRateVariability += item.averageHeartRateVariability;
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
    aggregateOneMonthMap["numberOfProfiles"] = listLength;
  }

  let listLengthMale = 0;
  let avgSympatheticNervousSystemIndexMale = 0;
  let avgStressIndexMale = 0;
  let avgOxygenLevelMale = 0;
  let avgOxygenSaturationLevelMale = 0;
  let avgRespiratoryRateMale = 0;
  let avgSystolicBloodPressureMale = 0;
  let avgDiastolicBloodPressureMale = 0;
  let avgHeartRateMale = 0;
  let avgHeartRateVariabilityMale = 0;

  for (let index = 0; index < itemsMale.length; index++) {
    const item = itemsMale[index];
    if (
      item.averageSympatheticNervousSystemIndex !== undefined &&
      item.averageSympatheticNervousSystemIndex !== null &&
      item.averageSympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndexMale +=
        item.averageSympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndexMale += item.averageStressIndex;
    }

    if (
      item.averageStressIndex !== undefined &&
      item.averageStressIndex !== null
    ) {
      avgStressIndexMale += item.averageStressIndex;
    }

    if (
      item.averageOxygenLevel !== undefined &&
      item.averageOxygenLevel !== null
    ) {
      avgOxygenLevelMale += item.averageOxygenLevel;
    }

    if (
      item.averageOxygenSaturationLevel !== undefined &&
      item.averageOxygenSaturationLevel !== null
    ) {
      avgOxygenSaturationLevelMale += item.averageOxygenSaturationLevel;
    }

    if (
      item.averageRespiratoryRate !== undefined &&
      item.averageRespiratoryRate !== null
    ) {
      avgRespiratoryRateMale += item.averageRespiratoryRate;
    }

    if (
      item.averageSystolicBloodPressure !== undefined &&
      item.averageSystolicBloodPressure !== null
    ) {
      avgSystolicBloodPressureMale += item.averageSystolicBloodPressure;
    }

    if (
      item.averageDiastolicBloodPressure !== undefined &&
      item.averageDiastolicBloodPressure !== null
    ) {
      avgDiastolicBloodPressureMale += item.averageDiastolicBloodPressure;
    }

    if (item.averageHeartRate !== undefined && item.averageHeartRate !== null) {
      avgHeartRateMale += item.averageHeartRate;
    }

    if (
      item.averageHeartRateVariability !== undefined &&
      item.averageHeartRateVariability !== null
    ) {
      avgHeartRateVariabilityMale += item.averageHeartRateVariability;
    }

    listLengthMale++;
  }

  if (listLengthMale > 0) {
    avgSympatheticNervousSystemIndexMale =
      avgSympatheticNervousSystemIndexMale / listLengthMale;
    avgStressIndexMale = avgStressIndexMale / listLengthMale;
    avgOxygenLevelMale = avgOxygenLevelMale / listLengthMale;
    avgOxygenSaturationLevelMale =
      avgOxygenSaturationLevelMale / listLengthMale;
    avgRespiratoryRateMale = avgRespiratoryRateMale / listLengthMale;
    avgSystolicBloodPressureMale =
      avgSystolicBloodPressureMale / listLengthMale;
    avgDiastolicBloodPressureMale =
      avgDiastolicBloodPressureMale / listLengthMale;
    avgHeartRateMale = avgHeartRateMale / listLengthMale;
    avgHeartRateVariabilityMale = avgHeartRateVariabilityMale / listLengthMale;

    aggregateOneMonthMap["averageSympatheticNervousSystemIndexForMale"] =
      avgSympatheticNervousSystemIndexMale;
    aggregateOneMonthMap["averageStressIndexForMale"] = avgStressIndexMale;
    aggregateOneMonthMap["averageOxygenLevelForMale"] = avgOxygenLevelMale;
    aggregateOneMonthMap["averageOxygenSaturationLevelForMale"] =
      avgOxygenSaturationLevelMale;
    aggregateOneMonthMap["averageRespiratoryRateForMale"] =
      avgRespiratoryRateMale;
    aggregateOneMonthMap["averageSystolicBloodPressureForMale"] =
      avgSystolicBloodPressureMale;
    aggregateOneMonthMap["averageDiastolicBloodPressureForMale"] =
      avgDiastolicBloodPressureMale;
    aggregateOneMonthMap["averageHeartRateForMale"] = avgHeartRateMale;
    aggregateOneMonthMap["averageHeartRateVariabilityForMale"] =
      avgHeartRateVariabilityMale;
    aggregateOneMonthMap["numberOfMaleProfiles"] = listLengthMale;
  }

  let listLengthFemale = 0;
  let avgSympatheticNervousSystemIndexFemale = 0;
  let avgStressIndexFemale = 0;
  let avgOxygenLevelFemale = 0;
  let avgOxygenSaturationLevelFemale = 0;
  let avgRespiratoryRateFemale = 0;
  let avgSystolicBloodPressureFemale = 0;
  let avgDiastolicBloodPressureFemale = 0;
  let avgHeartRateFemale = 0;
  let avgHeartRateVariabilityFemale = 0;

  for (let index = 0; index < itemsFemale.length; index++) {
    const item = itemsFemale[index];
    if (
      item.averageSympatheticNervousSystemIndex !== undefined &&
      item.averageSympatheticNervousSystemIndex !== null &&
      item.averageSympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndexFemale +=
        item.averageSympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndexFemale += item.averageStressIndex;
    }

    if (
      item.averageStressIndex !== undefined &&
      item.averageStressIndex !== null
    ) {
      avgStressIndexFemale += item.averageStressIndex;
    }

    if (
      item.averageOxygenLevel !== undefined &&
      item.averageOxygenLevel !== null
    ) {
      avgOxygenLevelFemale += item.averageOxygenLevel;
    }

    if (
      item.averageOxygenSaturationLevel !== undefined &&
      item.averageOxygenSaturationLevel !== null
    ) {
      avgOxygenSaturationLevelFemale += item.averageOxygenSaturationLevel;
    }

    if (
      item.averageRespiratoryRate !== undefined &&
      item.averageRespiratoryRate !== null
    ) {
      avgRespiratoryRateFemale += item.averageRespiratoryRate;
    }

    if (
      item.averageSystolicBloodPressure !== undefined &&
      item.averageSystolicBloodPressure !== null
    ) {
      avgSystolicBloodPressureFemale += item.averageSystolicBloodPressure;
    }

    if (
      item.averageDiastolicBloodPressure !== undefined &&
      item.averageDiastolicBloodPressure !== null
    ) {
      avgDiastolicBloodPressureFemale += item.averageDiastolicBloodPressure;
    }

    if (item.averageHeartRate !== undefined && item.averageHeartRate !== null) {
      avgHeartRateFemale += item.averageHeartRate;
    }

    if (
      item.averageHeartRateVariability !== undefined &&
      item.averageHeartRateVariability !== null
    ) {
      avgHeartRateVariabilityFemale += item.averageHeartRateVariability;
    }

    listLengthFemale++;
  }

  if (listLengthFemale > 0) {
    avgSympatheticNervousSystemIndexFemale =
      avgSympatheticNervousSystemIndexFemale / listLengthFemale;
    avgStressIndexFemale = avgStressIndexFemale / listLengthFemale;
    avgOxygenLevelFemale = avgOxygenLevelFemale / listLengthFemale;
    avgOxygenSaturationLevelFemale =
      avgOxygenSaturationLevelFemale / listLengthFemale;
    avgRespiratoryRateFemale = avgRespiratoryRateFemale / listLengthFemale;
    avgSystolicBloodPressureFemale =
      avgSystolicBloodPressureFemale / listLengthFemale;
    avgDiastolicBloodPressureFemale =
      avgDiastolicBloodPressureFemale / listLengthFemale;
    avgHeartRateFemale = avgHeartRateFemale / listLengthFemale;
    avgHeartRateVariabilityFemale =
      avgHeartRateVariabilityFemale / listLengthFemale;

    aggregateOneMonthMap["averageSympatheticNervousSystemIndexForFemale"] =
      avgSympatheticNervousSystemIndexFemale;
    aggregateOneMonthMap["averageStressIndexForFemale"] = avgStressIndexFemale;
    aggregateOneMonthMap["averageOxygenLevelForFemale"] = avgOxygenLevelFemale;
    aggregateOneMonthMap["averageOxygenSaturationLevelForFemale"] =
      avgOxygenSaturationLevelFemale;
    aggregateOneMonthMap["averageRespiratoryRateForFemale"] =
      avgRespiratoryRateFemale;
    aggregateOneMonthMap["averageSystolicBloodPressureForFemale"] =
      avgSystolicBloodPressureFemale;
    aggregateOneMonthMap["averageDiastolicBloodPressureForFemale"] =
      avgDiastolicBloodPressureFemale;
    aggregateOneMonthMap["averageHeartRateForFemale"] = avgHeartRateFemale;
    aggregateOneMonthMap["averageHeartRateVariabilityForFemale"] =
      avgHeartRateVariabilityFemale;
    aggregateOneMonthMap["numberOfFemaleProfiles"] = listLengthFemale;
  }

  return aggregateOneMonthMap;
}

function aggregateOrganisationAssessmentsByYear(organisationUsers) {
  const items = [];
  const itemsMale = [];
  const itemsFemale = [];
  const aggregateOneYearMap = {};

  for (let index = 0; index < organisationUsers.length; index++) {
    const organisationUser = organisationUsers[index];
    const profile = organisationUser.user.profile;
    if (profile !== undefined && profile !== null) {
      if (
        profile.aggregateYearAssessments !== undefined &&
        profile.aggregateYearAssessments !== null
      ) {
        items.push(...profile.aggregateYearAssessments.items);
        if (profile.gender !== undefined && profile.gender !== null) {
          if (profile.gender === "Male") {
            itemsMale.push(...profile.aggregateYearAssessments.items);
          } else if (profile.gender === "Female") {
            itemsFemale.push(...profile.aggregateYearAssessments.items);
          }
        }
      }
    }
  }
  // Aggregate the number of users by vital category
  let tempMap = {
    numberOfProfilesLowRiskStressIndex: new Set(),
    numberOfProfilesMediumRiskStressIndex: new Set(),
    numberOfProfilesHighRiskStressIndex: new Set(),
    numberOfProfilesNormalRiskBloodPressure: new Set(),
    numberOfProfilesElevatedRiskBloodPressure: new Set(),
    numberOfProfilesHypertensiveRiskBloodPressure: new Set(),
  }
  for (let index = 0; index < items.length; index++) {
    const item = items[index];
    if (item.averageStressIndex != undefined &&
      item.averageStressIndex != null
    ) {
      if (item.stressIndex > 0 && item.stressIndex < 50) {
        tempMap.numberOfProfilesLowRiskStressIndex.add(item.profileID);
      } else if (item.stressIndex >= 50 && item.stressIndex < 60) {
        tempMap.numberOfProfilesMediumRiskStressIndex.add(item.profileID);
      } else {
        tempMap.numberOfProfilesHighRiskStressIndex.add(item.profileID);
      }
    }

    if (item.systolicBloodPressure != undefined &&
      item.systolicBloodPressure != null &&
      item.diastolicBloodPressure != undefined &&
      item.diastolicBloodPressure != null
    ) {
      if (item.systolicBloodPressure < 120 && item.diastolicBloodPressure < 80) {
        tempMap.numberOfProfilesNormalRiskBloodPressure.add(item.profileID);
      } else if (item.systolicBloodPressure < 120 && item.diastolicBloodPressure < 80) {
        tempMap.numberOfProfilesElevatedRiskBloodPressure.add(item.profileID);
      } else if (item.diastolicBloodPressure >= 80) {
        tempMap.numberOfProfilesHypertensiveRiskBloodPressure.add(item.profileID);
      }
    }
  }
  for (const key in tempMap) {
    if (tempMap.hasOwnProperty(key)) {
      aggregateOneYearMap[key] = tempMap[key].size;
    }
  }

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
      item.averageSympatheticNervousSystemIndex !== undefined &&
      item.averageSympatheticNervousSystemIndex !== null &&
      item.averageSympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndex +=
        item.averageSympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndex += item.averageStressIndex;
    }

    if (
      item.averageStressIndex !== undefined &&
      item.averageStressIndex !== null
    ) {
      avgStressIndex += item.averageStressIndex;
    }

    if (
      item.averageOxygenLevel !== undefined &&
      item.averageOxygenLevel !== null
    ) {
      avgOxygenLevel += item.averageOxygenLevel;
    }

    if (
      item.averageOxygenSaturationLevel !== undefined &&
      item.averageOxygenSaturationLevel !== null
    ) {
      avgOxygenSaturationLevel += item.averageOxygenSaturationLevel;
    }

    if (
      item.averageRespiratoryRate !== undefined &&
      item.averageRespiratoryRate !== null
    ) {
      avgRespiratoryRate += item.averageRespiratoryRate;
    }

    if (
      item.averageSystolicBloodPressure !== undefined &&
      item.averageSystolicBloodPressure !== null
    ) {
      avgSystolicBloodPressure += item.averageSystolicBloodPressure;
    }

    if (
      item.averageDiastolicBloodPressure !== undefined &&
      item.averageDiastolicBloodPressure !== null
    ) {
      avgDiastolicBloodPressure += item.averageDiastolicBloodPressure;
    }

    if (item.averageHeartRate !== undefined && item.averageHeartRate !== null) {
      avgHeartRate += item.averageHeartRate;
    }

    if (
      item.averageHeartRateVariability !== undefined &&
      item.averageHeartRateVariability !== null
    ) {
      avgHeartRateVariability += item.averageHeartRateVariability;
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
    aggregateOneYearMap["numberOfProfiles"] = listLength;
  }

  let listLengthMale = 0;
  let avgSympatheticNervousSystemIndexMale = 0;
  let avgStressIndexMale = 0;
  let avgOxygenLevelMale = 0;
  let avgOxygenSaturationLevelMale = 0;
  let avgRespiratoryRateMale = 0;
  let avgSystolicBloodPressureMale = 0;
  let avgDiastolicBloodPressureMale = 0;
  let avgHeartRateMale = 0;
  let avgHeartRateVariabilityMale = 0;

  for (let index = 0; index < itemsMale.length; index++) {
    const item = itemsMale[index];
    if (
      item.averageSympatheticNervousSystemIndex !== undefined &&
      item.averageSympatheticNervousSystemIndex !== null &&
      item.averageSympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndexMale +=
        item.averageSympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndexMale += item.averageStressIndex;
    }

    if (
      item.averageStressIndex !== undefined &&
      item.averageStressIndex !== null
    ) {
      avgStressIndexMale += item.averageStressIndex;
    }

    if (
      item.averageOxygenLevel !== undefined &&
      item.averageOxygenLevel !== null
    ) {
      avgOxygenLevelMale += item.averageOxygenLevel;
    }

    if (
      item.averageOxygenSaturationLevel !== undefined &&
      item.averageOxygenSaturationLevel !== null
    ) {
      avgOxygenSaturationLevelMale += item.averageOxygenSaturationLevel;
    }

    if (
      item.averageRespiratoryRate !== undefined &&
      item.averageRespiratoryRate !== null
    ) {
      avgRespiratoryRateMale += item.averageRespiratoryRate;
    }

    if (
      item.averageSystolicBloodPressure !== undefined &&
      item.averageSystolicBloodPressure !== null
    ) {
      avgSystolicBloodPressureMale += item.averageSystolicBloodPressure;
    }

    if (
      item.averageDiastolicBloodPressure !== undefined &&
      item.averageDiastolicBloodPressure !== null
    ) {
      avgDiastolicBloodPressureMale += item.averageDiastolicBloodPressure;
    }

    if (item.averageHeartRate !== undefined && item.averageHeartRate !== null) {
      avgHeartRateMale += item.averageHeartRate;
    }

    if (
      item.averageHeartRateVariability !== undefined &&
      item.averageHeartRateVariability !== null
    ) {
      avgHeartRateVariabilityMale += item.averageHeartRateVariability;
    }

    listLengthMale++;
  }

  if (listLengthMale > 0) {
    avgSympatheticNervousSystemIndexMale =
      avgSympatheticNervousSystemIndexMale / listLengthMale;
    avgStressIndexMale = avgStressIndexMale / listLengthMale;
    avgOxygenLevelMale = avgOxygenLevelMale / listLengthMale;
    avgOxygenSaturationLevelMale =
      avgOxygenSaturationLevelMale / listLengthMale;
    avgRespiratoryRateMale = avgRespiratoryRateMale / listLengthMale;
    avgSystolicBloodPressureMale =
      avgSystolicBloodPressureMale / listLengthMale;
    avgDiastolicBloodPressureMale =
      avgDiastolicBloodPressureMale / listLengthMale;
    avgHeartRateMale = avgHeartRateMale / listLengthMale;
    avgHeartRateVariabilityMale = avgHeartRateVariabilityMale / listLengthMale;

    aggregateOneYearMap["averageSympatheticNervousSystemIndexForMale"] =
      avgSympatheticNervousSystemIndexMale;
    aggregateOneYearMap["averageStressIndexForMale"] = avgStressIndexMale;
    aggregateOneYearMap["averageOxygenLevelForMale"] = avgOxygenLevelMale;
    aggregateOneYearMap["averageOxygenSaturationLevelForMale"] =
      avgOxygenSaturationLevelMale;
    aggregateOneYearMap["averageRespiratoryRateForMale"] =
      avgRespiratoryRateMale;
    aggregateOneYearMap["averageSystolicBloodPressureForMale"] =
      avgSystolicBloodPressureMale;
    aggregateOneYearMap["averageDiastolicBloodPressureForMale"] =
      avgDiastolicBloodPressureMale;
    aggregateOneYearMap["averageHeartRateForMale"] = avgHeartRateMale;
    aggregateOneYearMap["averageHeartRateVariabilityForMale"] =
      avgHeartRateVariabilityMale;
    aggregateOneYearMap["numberOfMaleProfiles"] = listLengthMale;
  }

  let listLengthFemale = 0;
  let avgSympatheticNervousSystemIndexFemale = 0;
  let avgStressIndexFemale = 0;
  let avgOxygenLevelFemale = 0;
  let avgOxygenSaturationLevelFemale = 0;
  let avgRespiratoryRateFemale = 0;
  let avgSystolicBloodPressureFemale = 0;
  let avgDiastolicBloodPressureFemale = 0;
  let avgHeartRateFemale = 0;
  let avgHeartRateVariabilityFemale = 0;

  for (let index = 0; index < itemsFemale.length; index++) {
    const item = itemsFemale[index];
    if (
      item.averageSympatheticNervousSystemIndex !== undefined &&
      item.averageSympatheticNervousSystemIndex !== null &&
      item.averageSympatheticNervousSystemIndex !== -9999
    ) {
      avgSympatheticNervousSystemIndexFemale +=
        item.averageSympatheticNervousSystemIndex;
    } else {
      avgSympatheticNervousSystemIndexFemale += item.averageStressIndex;
    }

    if (
      item.averageStressIndex !== undefined &&
      item.averageStressIndex !== null
    ) {
      avgStressIndexFemale += item.averageStressIndex;
    }

    if (
      item.averageOxygenLevel !== undefined &&
      item.averageOxygenLevel !== null
    ) {
      avgOxygenLevelFemale += item.averageOxygenLevel;
    }

    if (
      item.averageOxygenSaturationLevel !== undefined &&
      item.averageOxygenSaturationLevel !== null
    ) {
      avgOxygenSaturationLevelFemale += item.averageOxygenSaturationLevel;
    }

    if (
      item.averageRespiratoryRate !== undefined &&
      item.averageRespiratoryRate !== null
    ) {
      avgRespiratoryRateFemale += item.averageRespiratoryRate;
    }

    if (
      item.averageSystolicBloodPressure !== undefined &&
      item.averageSystolicBloodPressure !== null
    ) {
      avgSystolicBloodPressureFemale += item.averageSystolicBloodPressure;
    }

    if (
      item.averageDiastolicBloodPressure !== undefined &&
      item.averageDiastolicBloodPressure !== null
    ) {
      avgDiastolicBloodPressureFemale += item.averageDiastolicBloodPressure;
    }

    if (item.averageHeartRate !== undefined && item.averageHeartRate !== null) {
      avgHeartRateFemale += item.averageHeartRate;
    }

    if (
      item.averageHeartRateVariability !== undefined &&
      item.averageHeartRateVariability !== null
    ) {
      avgHeartRateVariabilityFemale += item.averageHeartRateVariability;
    }

    listLengthFemale++;
  }

  if (listLengthFemale > 0) {
    avgSympatheticNervousSystemIndexFemale =
      avgSympatheticNervousSystemIndexFemale / listLengthFemale;
    avgStressIndexFemale = avgStressIndexFemale / listLengthFemale;
    avgOxygenLevelFemale = avgOxygenLevelFemale / listLengthFemale;
    avgOxygenSaturationLevelFemale =
      avgOxygenSaturationLevelFemale / listLengthFemale;
    avgRespiratoryRateFemale = avgRespiratoryRateFemale / listLengthFemale;
    avgSystolicBloodPressureFemale =
      avgSystolicBloodPressureFemale / listLengthFemale;
    avgDiastolicBloodPressureFemale =
      avgDiastolicBloodPressureFemale / listLengthFemale;
    avgHeartRateFemale = avgHeartRateFemale / listLengthFemale;
    avgHeartRateVariabilityFemale =
      avgHeartRateVariabilityFemale / listLengthFemale;

    aggregateOneYearMap["averageSympatheticNervousSystemIndexForFemale"] =
      avgSympatheticNervousSystemIndexFemale;
    aggregateOneYearMap["averageStressIndexForFemale"] = avgStressIndexFemale;
    aggregateOneYearMap["averageOxygenLevelForFemale"] = avgOxygenLevelFemale;
    aggregateOneYearMap["averageOxygenSaturationLevelForFemale"] =
      avgOxygenSaturationLevelFemale;
    aggregateOneYearMap["averageRespiratoryRateForFemale"] =
      avgRespiratoryRateFemale;
    aggregateOneYearMap["averageSystolicBloodPressureForFemale"] =
      avgSystolicBloodPressureFemale;
    aggregateOneYearMap["averageDiastolicBloodPressureForFemale"] =
      avgDiastolicBloodPressureFemale;
    aggregateOneYearMap["averageHeartRateForFemale"] = avgHeartRateFemale;
    aggregateOneYearMap["averageHeartRateVariabilityForFemale"] =
      avgHeartRateVariabilityFemale;
    aggregateOneYearMap["numberOfFemaleProfiles"] = listLengthFemale;
  }

  return aggregateOneYearMap;
}

export default {
  aggregateOrganisationAssessmentsByHour,
  aggregateOrganisationAssessmentsByDay,
  aggregateOrganisationAssessmentsByMonth,
  aggregateOrganisationAssessmentsByYear,
};