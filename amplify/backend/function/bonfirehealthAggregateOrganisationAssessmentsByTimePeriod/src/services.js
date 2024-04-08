import { default as fetch, Request } from "node-fetch";
import graphql from "./graphqls.js";

const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT;

async function queryAllOrganisationUsersByOrganisation(
  organisationID,
  hourStartDate,
  hourEndDate,
  hourSortDirection,
  dayStartDate,
  dayEndDate,
  daySortDirection,
  monthStartDate,
  monthEndDate,
  monthSortDirection,
  yearStartDate,
  yearEndDate,
  yearSortDirection
) {
  let statusCode = 200;
  const variables = {
    organisationID,
    hourStartDate,
    hourEndDate,
    hourSortDirection,
    dayStartDate,
    dayEndDate,
    daySortDirection,
    monthStartDate,
    monthEndDate,
    monthSortDirection,
    yearStartDate,
    yearEndDate,
    yearSortDirection,
  };
  console.log(variables);
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllOrganisationUsersByOrganisationQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let items;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    items = body.data.listOrganisationUsers.items;
    console.info(
      "🌟 listAllOrganisationUsersByOrganisationQuery: items length - ",
      items.length
    );
    return items;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 listAllOrganisationUsersByOrganisationQuery: Error querying data: ",
      body
    );
    return [];
  }
}

async function queryAllAggregateHourOrganisationAssessments(
  organisationID,
  startDate,
  endDate
) {
  let statusCode = 200;
  const variables = {
    organisationID: organisationID,
    startDate: startDate,
    endDate: endDate,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllAggregateHourOrganisationAssessmentsQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let items;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    items = body.data.listAggregateHourOrganisationAssessments.items;
    console.info(
      "🌟 queryAllAggregateHourOrganisationAssessments: Items length - ",
      items.length
    );
    return items;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 queryAllAggregateHourOrganisationAssessments: Error querying data: ",
      body
    );
    return [];
  }
}

async function queryAllAggregateDayOrganisationAssessments(
  organisationID,
  startDate,
  endDate
) {
  let statusCode = 200;
  const variables = {
    organisationID: organisationID,
    startDate: startDate,
    endDate: endDate,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllAggregateDayOrganisationAssessmentsQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let items;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    items = body.data.listAggregateDayOrganisationAssessments.items;
    console.info(
      "🌟 queryAllAggregateDayOrganisationAssessments: Items length - ",
      items.length
    );
    return items;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 queryAllAggregateDayOrganisationAssessments: Error querying data: ",
      body
    );
    return [];
  }
}

async function queryAllAggregateMonthOrganisationAssessments(
  organisationID,
  startDate,
  endDate
) {
  let statusCode = 200;
  const variables = {
    organisationID: organisationID,
    startDate: startDate,
    endDate: endDate,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllAggregateMonthOrganisationAssessmentsQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let items;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    items = body.data.listAggregateMonthOrganisationAssessments.items;
    console.info(
      "🌟 queryAllAggregateMonthOrganisationAssessments: Items length - ",
      items.length
    );
    return items;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 queryAllAggregateMonthOrganisationAssessments: Error querying data: ",
      body
    );
    return [];
  }
}

async function queryAllAggregateYearOrganisationAssessments(
  organisationID,
  startDate,
  endDate
) {
  let statusCode = 200;
  const variables = {
    organisationID: organisationID,
    startDate: startDate,
    endDate: endDate,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllAggregateYearOrganisationAssessmentsQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let items;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    items = body.data.listAggregateYearOrganisationAssessments.items;
    console.info(
      "🌟 queryAllAggregateYearOrganisationAssessments: items length - ",
      items.length
    );
    return items;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 queryAllAggregateYearOrganisationAssessments: Error querying data: ",
      body
    );
    return [];
  }
}

async function createAggregateHourOrganisationAssessment(input) {
  let statusCode = 200;
  const variables = {
    input: input,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.createAggregateHourOrganisationAssessmentQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let item;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    console.log(body);
    item = body.data.createAggregateHourOrganisationAssessment;
    console.info("🌟 createAggregateHourOrganisationAssessment: item - ", item);
    return item;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 createAggregateHourOrganisationAssessment: Error creating aggregate data: ",
      body
    );
    return item;
  }
}

async function updateAggregateHourOrganisationAssessment(input) {
  let statusCode = 200;
  const variables = {
    input: input,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.updateAggregateHourOrganisationAssessmentQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let item;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    item = body.data.updateAggregateHourOrganisationAssessment;
    console.info("🌟 updateAggregateHourOrganisationAssessment: item - ", item);
    return item;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 updateAggregateHourOrganisationAssessment: Error updating aggregate data: ",
      body
    );
    return item;
  }
}

async function createAggregateDayOrganisationAssessment(input) {
  let statusCode = 200;
  const variables = {
    input: input,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.createAggregateDayOrganisationAssessmentQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let item;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    console.log(body);
    item = body.data.createAggregateDayOrganisationAssessment;
    console.info("🌟 createAggregateDayOrganisationAssessment: item - ", item);
    return item;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 createAggregateDayOrganisationAssessment: Error creating aggregate data: ",
      body
    );
    return item;
  }
}

async function updateAggregateDayOrganisationAssessment(input) {
  let statusCode = 200;
  const variables = {
    input: input,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.updateAggregateDayOrganisationAssessmentQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let item;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    item = body.data.updateAggregateDayOrganisationAssessment;
    console.info("🌟 updateAggregateDayOrganisationAssessment: item - ", item);
    return item;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 updateAggregateDayOrganisationAssessment: Error updating aggregate data: ",
      body
    );
    return item;
  }
}

async function createAggregateMonthOrganisationAssessment(input) {
  let statusCode = 200;
  const variables = {
    input: input,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.createAggregateMonthOrganisationAssessmentQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let item;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    console.log(body);
    item = body.data.createAggregateMonthOrganisationAssessment;
    console.info(
      "🌟 createAggregateMonthOrganisationAssessment: item - ",
      item
    );
    return item;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 createAggregateMonthOrganisationAssessment: Error creating aggregate data: ",
      body
    );
    return item;
  }
}

async function updateAggregateMonthOrganisationAssessment(input) {
  let statusCode = 200;
  const variables = {
    input: input,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.updateAggregateMonthOrganisationAssessmentQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let item;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    item = body.data.updateAggregateMonthOrganisationAssessment;
    console.info(
      "🌟 updateAggregateMonthOrganisationAssessment: item - ",
      item
    );
    return item;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 updateAggregateMonthOrganisationAssessment: Error updating aggregate data: ",
      body
    );
    return item;
  }
}

async function createAggregateYearOrganisationAssessment(input) {
  let statusCode = 200;
  const variables = {
    input: input,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.createAggregateYearOrganisationAssessmentQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let item;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    console.log(body);
    item = body.data.createAggregateYearOrganisationAssessment;
    console.info("🌟 createAggregateYearOrganisationAssessment: item - ", item);
    return item;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 createAggregateYearOrganisationAssessment: Error creating aggregate data: ",
      body
    );
    return item;
  }
}

async function updateAggregateYearOrganisationAssessment(input) {
  let statusCode = 200;
  const variables = {
    input: input,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.updateAggregateYearOrganisationAssessmentQuery(),
      variables: variables,
    }),
  };

  const request = new Request(GRAPHQL_ENDPOINT, options);

  let body;
  let response;
  let item;
  try {
    response = await fetch(request);
    body = await response.json();
    if (body.errors) statusCode = 400;
    item = body.data.updateAggregateYearOrganisationAssessment;
    console.info("🌟 updateAggregateYearOrganisationAssessment: item - ", item);
    return item;
  } catch (error) {
    statusCode = 400;
    body = {
      errors: [
        {
          status: response.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.error(
      "🌟 updateAggregateYearOrganisationAssessment: Error updating aggregate data: ",
      body
    );
    return item;
  }
}

export default {
  queryAllOrganisationUsersByOrganisation,
  queryAllAggregateHourOrganisationAssessments,
  queryAllAggregateDayOrganisationAssessments,
  queryAllAggregateMonthOrganisationAssessments,
  queryAllAggregateYearOrganisationAssessments,
  createAggregateHourOrganisationAssessment,
  updateAggregateHourOrganisationAssessment,
  createAggregateDayOrganisationAssessment,
  updateAggregateDayOrganisationAssessment,
  createAggregateMonthOrganisationAssessment,
  updateAggregateMonthOrganisationAssessment,
  createAggregateYearOrganisationAssessment,
  updateAggregateYearOrganisationAssessment,
};