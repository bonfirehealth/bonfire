import {default as fetch, Request} from "node-fetch";
import graphql from "./graphqls.js";

const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT;

async function queryAllAssessments(profileID, startDate, endDate) {
  let statusCode = 200;
  const variables = {
    profileID: profileID,
    startDate: startDate,
    endDate: endDate,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllAssessmentsQuery(),
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
    items = body.data.listAssessments.items;
    console.info("🌟 queryAllAssessments: items length - ", items.length);
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
    console.error("🌟 queryAllAssessments: Error querying data: ", body);
    return [];
  }
}

async function queryAllAggregateHourAssessments(profileID, startDate, endDate) {
  let statusCode = 200;
  const variables = {
    profileID: profileID,
    startDate: startDate,
    endDate: endDate,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllAggregateHourAssessmentsQuery(),
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
    items = body.data.listAggregateHourAssessments.items;
    console.info(
      "🌟 queryAllAggregateHourAssessments: Items length - ",
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
      "🌟 queryAllAggregateHourAssessments: Error querying data: ",
      body
    );
    return [];
  }
}

async function queryAllAggregateDayAssessments(profileID, startDate, endDate) {
  let statusCode = 200;
  const variables = {
    profileID: profileID,
    startDate: startDate,
    endDate: endDate,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllAggregateDayAssessmentsQuery(),
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
    items = body.data.listAggregateDayAssessments.items;
    console.info(
      "🌟 queryAllAggregateDayAssessments: Items length - ",
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
      "🌟 queryAllAggregateDayAssessments: Error querying data: ",
      body
    );
    return [];
  }
}

async function queryAllAggregateMonthAssessments(
  profileID,
  startDate,
  endDate
) {
  let statusCode = 200;
  const variables = {
    profileID: profileID,
    startDate: startDate,
    endDate: endDate,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllAggregateMonthAssessmentsQuery(),
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
    items = body.data.listAggregateMonthAssessments.items;
    console.info(
      "🌟 queryAllAggregateMonthAssessments: Items length - ",
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
      "🌟 queryAllAggregateMonthAssessments: Error querying data: ",
      body
    );
    return [];
  }
}

async function queryAllAggregateYearAssessments(profileID, startDate, endDate) {
  let statusCode = 200;
  const variables = {
    profileID: profileID,
    startDate: startDate,
    endDate: endDate,
  };
  const options = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({
      query: graphql.listAllAggregateYearAssessmentsQuery(),
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
    items = body.data.listAggregateYearAssessments.items;
    console.info(
      "🌟 queryAllAggregateYearAssessments: items length - ",
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
      "🌟 queryAllAggregateYearAssessments: Error querying data: ",
      body
    );
    return [];
  }
}

async function createAggregateHourAssessment(input) {
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
      query: graphql.createAggregateHourAssessmentQuery(),
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
    item = body.data.createAggregateHourAssessment;
    console.info("🌟 createAggregateHourAssessment: item - ", item);
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
      "🌟 createAggregateHourAssessment: Error creating aggregate data: ",
      body
    );
    return item;
  }
}

async function updateAggregateHourAssessment(input) {
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
      query: graphql.updateAggregateHourAssessmentQuery(),
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
    item = body.data.updateAggregateHourAssessment;
    console.info("🌟 updateAggregateHourAssessment: item - ", item);
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
      "🌟 updateAggregateHourAssessment: Error updating aggregate data: ",
      body
    );
    return item;
  }
}

async function createAggregateDayAssessment(input) {
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
      query: graphql.createAggregateDayAssessmentQuery(),
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
    item = body.data.createAggregateDayAssessment;
    console.info("🌟 createAggregateDayAssessment: item - ", item);
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
      "🌟 createAggregateDayAssessment: Error creating aggregate data: ",
      body
    );
    return item;
  }
}

async function updateAggregateDayAssessment(input) {
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
      query: graphql.updateAggregateDayAssessmentQuery(),
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
    item = body.data.updateAggregateDayAssessment;
    console.info("🌟 updateAggregateDayAssessment: item - ", item);
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
      "🌟 updateAggregateDayAssessment: Error updating aggregate data: ",
      body
    );
    return item;
  }
}

async function createAggregateMonthAssessment(input) {
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
      query: graphql.createAggregateMonthAssessmentQuery(),
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
    item = body.data.createAggregateMonthAssessment;
    console.info("🌟 createAggregateMonthAssessment: item - ", item);
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
      "🌟 createAggregateMonthAssessment: Error creating aggregate data: ",
      body
    );
    return item;
  }
}

async function updateAggregateMonthAssessment(input) {
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
      query: graphql.updateAggregateMonthAssessmentQuery(),
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
    item = body.data.updateAggregateMonthAssessment;
    console.info("🌟 updateAggregateMonthAssessment: item - ", item);
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
      "🌟 updateAggregateMonthAssessment: Error updating aggregate data: ",
      body
    );
    return item;
  }
}

async function createAggregateYearAssessment(input) {
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
      query: graphql.createAggregateYearAssessmentQuery(),
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
    item = body.data.createAggregateYearAssessment;
    console.info("🌟 createAggregateYearAssessment: item - ", item);
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
      "🌟 createAggregateYearAssessment: Error creating aggregate data: ",
      body
    );
    return item;
  }
}

async function updateAggregateYearAssessment(input) {
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
      query: graphql.updateAggregateYearAssessmentQuery(),
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
    item = body.data.updateAggregateYearAssessment;
    console.info("🌟 updateAggregateYearAssessment: item - ", item);
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
      "🌟 updateAggregateYearAssessment: Error updating aggregate data: ",
      body
    );
    return item;
  }
}

export default {
  queryAllAssessments,
  queryAllAggregateHourAssessments,
  queryAllAggregateDayAssessments,
  queryAllAggregateMonthAssessments,
  queryAllAggregateYearAssessments,
  createAggregateHourAssessment,
  updateAggregateHourAssessment,
  createAggregateDayAssessment,
  updateAggregateDayAssessment,
  createAggregateMonthAssessment,
  updateAggregateMonthAssessment,
  createAggregateYearAssessment,
  updateAggregateYearAssessment,
};
