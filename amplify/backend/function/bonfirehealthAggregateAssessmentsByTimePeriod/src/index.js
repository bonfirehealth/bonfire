/* Amplify Params - DO NOT EDIT
    API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIIDOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT
    ENV
    REGION
Amplify Params - DO NOT EDIT */
import momentTimezone from "moment-timezone";
import helpers from "./helpers.js";
import services from "./services.js";

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
  console.info("🔥 1 of 7: Retrieve request data from event body object.");
  let statusCode = 200;
  let isSuccess = false;
  const contentType =
    event.headers["content-type"] ?? event.headers["Content-Type"];
  let eventBody;
  if (contentType.includes("text/plain")) {
    const encodedEventBody = event.body;
    const decodedEventBodyString = Buffer.from(encodedEventBody, "base64");
    eventBody = JSON.parse(decodedEventBodyString.toString());
  } else {
    // application/json
    eventBody = JSON.parse(event.body);
  }
  const profileID = eventBody.profile_id ?? "";
  const timezone = "Africa/Ouagadougou";

  console.info("🔥 2 of 7: Get all assessments within today.");
  const startDateByOneDay = momentTimezone()
    .tz(timezone)
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0);
  const endDateByOneDay = momentTimezone()
    .tz(timezone)
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0)
    .add(1, "day");
  const itemsByOneDay = await services.queryAllAssessments(
    profileID,
    startDateByOneDay.toISOString(),
    endDateByOneDay.toISOString()
  );

  console.info("🔥 3 of 7: Aggregate assessments by hour.");
  const aggregateMapByHour = helpers.aggregateAssessmentsByHour(
    itemsByOneDay,
    timezone
  );
  for (const hour in aggregateMapByHour) {
    if (Object.hasOwnProperty.call(aggregateMapByHour, hour)) {
      const aggregate = aggregateMapByHour[hour];
      const startDateByHour = momentTimezone()
        .tz(timezone)
        .set("hour", hour)
        .set("minute", 0)
        .set("second", 0)
        .set("millisecond", 0);
      const endDateByHour = momentTimezone()
        .tz(timezone)
        .set("hour", hour)
        .set("minute", 0)
        .set("second", 0)
        .set("millisecond", 0)
        .add(1, "hour");
      const itemsAggregateByHour =
        await services.queryAllAggregateHourAssessments(
          profileID,
          startDateByHour.toISOString(),
          endDateByHour.toISOString()
        );

      if (aggregate.averageSympatheticNervousSystemIndex !== undefined) {
        const input = {
          _version: 1,
          profileID: profileID,
          startDate: startDateByHour,
          endDate: endDateByHour,
          ...aggregate,
        };

        if (itemsAggregateByHour.length > 0) {
          // Update
          const itemHour = itemsAggregateByHour[0];
          input.id = itemHour.id;
          input._version = itemHour._version;
          await services.updateAggregateHourAssessment(input);
          isSuccess = true;
        } else {
          // Create
          await services.createAggregateHourAssessment(input);
          isSuccess = true;
        }
      }
    }
  }

  console.info("🔥 4 of 7: Aggregate assessments by day.");
  const aggregateStartDateByDay = momentTimezone()
    .tz(timezone)
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0);
  const aggregateEndDateByDay = momentTimezone()
    .tz(timezone)
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0)
    .add(1, "day");
  const aggregateOneDayMap = helpers.aggregateAssessmentsByDay(itemsByOneDay);
  const itemsAggregateByDay = await services.queryAllAggregateDayAssessments(
    profileID,
    aggregateStartDateByDay.toISOString(),
    aggregateEndDateByDay.toISOString()
  );
  if (aggregateOneDayMap.averageSympatheticNervousSystemIndex !== undefined) {
    const input = {
      _version: 1,
      profileID: profileID,
      startDate: aggregateStartDateByDay,
      endDate: aggregateEndDateByDay,
      ...aggregateOneDayMap,
    };

    if (itemsAggregateByDay.length > 0) {
      // Update
      const itemDay = itemsAggregateByDay[0];
      input.id = itemDay.id;
      input._version = itemDay._version;
      await services.updateAggregateDayAssessment(input);
      isSuccess = true;
    } else {
      // Create
      await services.createAggregateDayAssessment(input);
      isSuccess = true;
    }
  }

  console.info("🔥 5 of 7: Aggregate assessments by month.");
  const aggregateStartDateByMonth = momentTimezone()
    .tz(timezone)
    .startOf("month")
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0);
  const aggregateEndDateByMonth = momentTimezone()
    .tz(timezone)
    .startOf("month")
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0)
    .add(1, "month");
  const itemsByOneMonth = await services.queryAllAssessments(
    profileID,
    aggregateStartDateByMonth.toISOString(),
    aggregateEndDateByMonth.toISOString()
  );
  const aggregateOneMonthMap =
    helpers.aggregateAssessmentsByMonth(itemsByOneMonth);
  const itemsAggregateByMonth =
    await services.queryAllAggregateMonthAssessments(
      profileID,
      aggregateStartDateByMonth.toISOString(),
      aggregateEndDateByMonth.toISOString()
    );
  if (aggregateOneMonthMap.averageSympatheticNervousSystemIndex !== undefined) {
    const input = {
      _version: 1,
      profileID: profileID,
      startDate: aggregateStartDateByMonth,
      endDate: aggregateEndDateByMonth,
      ...aggregateOneMonthMap,
    };

    if (itemsAggregateByMonth.length > 0) {
      // Update
      const itemMonth = itemsAggregateByMonth[0];
      input.id = itemMonth.id;
      input._version = itemMonth._version;
      await services.updateAggregateMonthAssessment(input);
      isSuccess = true;
    } else {
      // Create
      await services.createAggregateMonthAssessment(input);
      isSuccess = true;
    }
  }

  console.info("🔥 6 of 7: Aggregate assessments by year.");
  const aggregateStartDateByYear = momentTimezone()
    .tz(timezone)
    .set("date", 1)
    .set("month", 0)
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0);
  const aggregateEndDateByYear = momentTimezone()
    .tz(timezone)
    .set("date", 31)
    .set("month", 11)
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0)
    .add(1, "day");
  const itemsByOneYear = await services.queryAllAssessments(
    profileID,
    aggregateStartDateByYear.toISOString(),
    aggregateEndDateByYear.toISOString()
  );
  const aggregateOneYearMap =
    helpers.aggregateAssessmentsByMonth(itemsByOneYear);
  const itemsAggregateByYear = await services.queryAllAggregateYearAssessments(
    profileID,
    aggregateStartDateByYear.toISOString(),
    aggregateEndDateByYear.toISOString()
  );
  if (aggregateOneYearMap.averageSympatheticNervousSystemIndex !== undefined) {
    const input = {
      _version: 1,
      profileID: profileID,
      startDate: aggregateStartDateByYear,
      endDate: aggregateEndDateByYear,
      ...aggregateOneYearMap,
    };

    if (itemsAggregateByYear.length > 0) {
      // Update
      const itemYear = itemsAggregateByYear[0];
      input.id = itemYear.id;
      input._version = itemYear._version;
      await services.updateAggregateYearAssessment(input);
      isSuccess = true;
    } else {
      // Create
      await services.createAggregateYearAssessment(input);
      isSuccess = true;
    }
  }

  const responseBody = {
    is_success: isSuccess,
  };
  console.info("🔥 7 of 7: Function completed.");
  return {
    statusCode: statusCode,
    body: JSON.stringify(responseBody),
  };
};
