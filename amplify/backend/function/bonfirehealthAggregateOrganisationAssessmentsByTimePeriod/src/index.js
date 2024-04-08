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
  console.info(event);
  let statusCode = 200;
  let isSuccess = false;
  const contentType =
    event.headers["content-type"] ?? event.headers["Content-Type"];
  let eventBody;
  if (contentType.includes("text/plain")) {
    const encodedEventBody = event.body;
    const decodedEventBodyString = Buffer.from(encodedEventBody, "base64");
    eventBody = JSON.parse(decodedEventBodyString.toString());
  } else if (contentType.includes("other/lambda_invoke")) {
    eventBody = event.body;
  } else {
    // application/json
    eventBody = JSON.parse(event.body);
  }
  const organisationID = eventBody.organisation_id ?? "";
  const timezone = 'Africa/Ouagadougou';

  console.info("🔥 2 of 7: Get all user organisations within today.");
  const aggregateStartDateByOneDay = momentTimezone()
    .tz(timezone)
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0);
  const aggregateEndDateByOneDay = momentTimezone()
    .tz(timezone)
    .set("hour", 0)
    .set("minute", 0)
    .set("second", 0)
    .set("millisecond", 0)
    .add(1, "day");

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

  const organisationUsers =
    await services.queryAllOrganisationUsersByOrganisation(
      organisationID,
      aggregateStartDateByOneDay.toISOString(),
      aggregateEndDateByOneDay.toISOString(),
      "ASC",
      aggregateStartDateByDay.toISOString(),
      aggregateEndDateByDay.toISOString(),
      "ASC",
      aggregateStartDateByMonth.toISOString(),
      aggregateEndDateByMonth.toISOString(),
      "ASC",
      aggregateStartDateByYear.toISOString(),
      aggregateEndDateByYear.toISOString(),
      "ASC"
    );

  console.info("🔥 3 of 7: Aggregate organisation assessments by hour. ");
  const aggregateMapByHour = helpers.aggregateOrganisationAssessmentsByHour(
    organisationUsers,
    timezone
  );
  console.info(`🔥 3.2 of 7: Aggregate organisation assessments by update. ${JSON.stringify(aggregateMapByHour)}`);
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
        await services.queryAllAggregateHourOrganisationAssessments(
          organisationID,
          startDateByHour.toISOString(),
          endDateByHour.toISOString()
        );

      if (aggregate.averageSympatheticNervousSystemIndex !== undefined) {
        const input = {
          _version: 1,
          organisationID: organisationID,
          startDate: startDateByHour,
          endDate: endDateByHour,
          ...aggregate,
        };

        

        if (itemsAggregateByHour.length > 0) {
          console.info(`🔥 3.2 of 7: Aggregate organisation assessments by update. ${JSON.stringify(input)}`);
          // Update
          const itemHour = itemsAggregateByHour[0];
          input.id = itemHour.id;
          input._version = itemHour._version;
          await services.updateAggregateHourOrganisationAssessment(input);
          isSuccess = true;
        } else {
          // Create
          console.info(`🔥 3.2 of 7: Aggregate organisation assessments by Create. ${JSON.stringify(input)}`);
          await services.createAggregateHourOrganisationAssessment(input);
          isSuccess = true;
        }
      }
    }
  }

  console.info("🔥 4 of 7: Aggregate organisation assessments by day.");
  const aggregateOneDayMap =
    helpers.aggregateOrganisationAssessmentsByDay(organisationUsers);
  const itemsAggregateByDay =
    await services.queryAllAggregateDayOrganisationAssessments(
      organisationID,
      aggregateStartDateByDay.toISOString(),
      aggregateEndDateByDay.toISOString()
    );
  if (aggregateOneDayMap.averageSympatheticNervousSystemIndex !== undefined) {
    const input = {
      _version: 1,
      organisationID: organisationID,
      startDate: aggregateStartDateByDay,
      endDate: aggregateEndDateByDay,
      ...aggregateOneDayMap,
    };

    if (itemsAggregateByDay.length > 0) {
      // Update
      const itemDay = itemsAggregateByDay[0];
      input.id = itemDay.id;
      input._version = itemDay._version;
      await services.updateAggregateDayOrganisationAssessment(input);
      isSuccess = true;
    } else {
      // Create
      await services.createAggregateDayOrganisationAssessment(input);
      isSuccess = true;
    }
  }

  console.info("🔥 5 of 7: Aggregate organisation assessments by month.");
  const aggregateOneMonthMap =
    helpers.aggregateOrganisationAssessmentsByMonth(organisationUsers);
  const itemsAggregateByMonth =
    await services.queryAllAggregateMonthOrganisationAssessments(
      organisationID,
      aggregateStartDateByMonth.toISOString(),
      aggregateEndDateByMonth.toISOString()
    );
  if (aggregateOneMonthMap.averageSympatheticNervousSystemIndex !== undefined) {
    const input = {
      _version: 1,
      organisationID: organisationID,
      startDate: aggregateStartDateByMonth,
      endDate: aggregateEndDateByMonth,
      ...aggregateOneMonthMap,
    };

    if (itemsAggregateByMonth.length > 0) {
      // Update
      const itemMonth = itemsAggregateByMonth[0];
      input.id = itemMonth.id;
      input._version = itemMonth._version;
      await services.updateAggregateMonthOrganisationAssessment(input);
      isSuccess = true;
    } else {
      // Create
      await services.createAggregateMonthOrganisationAssessment(input);
      isSuccess = true;
    }
  }

  console.info("🔥 6 of 7: Aggregate organisation assessments by year.");
  const aggregateOneYearMap =
    helpers.aggregateOrganisationAssessmentsByMonth(organisationUsers);
  const itemsAggregateByYear =
    await services.queryAllAggregateYearOrganisationAssessments(
      organisationID,
      aggregateStartDateByYear.toISOString(),
      aggregateEndDateByYear.toISOString()
    );
  if (aggregateOneYearMap.averageSympatheticNervousSystemIndex !== undefined) {
    const input = {
      _version: 1,
      organisationID: organisationID,
      startDate: aggregateStartDateByYear,
      endDate: aggregateEndDateByYear,
      ...aggregateOneYearMap,
    };

    if (itemsAggregateByYear.length > 0) {
      // Update
      const itemYear = itemsAggregateByYear[0];
      input.id = itemYear.id;
      input._version = itemYear._version;
      await services.updateAggregateYearOrganisationAssessment(input);
      isSuccess = true;
    } else {
      // Create
      await services.createAggregateYearOrganisationAssessment(input);
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