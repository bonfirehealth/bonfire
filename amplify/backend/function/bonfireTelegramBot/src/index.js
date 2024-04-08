/* Amplify Params - DO NOT EDIT
	API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT
	API_BONFIREHEALTH_GRAPHQLAPIIDOUTPUT
	API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT
	ENV
	REGION
Amplify Params - DO NOT EDIT *//* Amplify Params - DO NOT EDIT
  ENV
  REGION
  apiToken
Amplify Params - DO NOT EDIT */


const fetch = require('node-fetch');
const axios = require('axios');

const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT;


const updateUserTelegramChatId = /* GraphQL */ `
  mutation UpdateUser($input: UpdateUserInput!) {
    updateUser(input: $input) {
      ... on User {
        id
        telegramChatId
      }
    }
  }
`;

const getListUsersByTelegramId = `query ListUsersByTelegramId(
    $telegramId: String
  ) {
    listUsers(filter: {telegramId: {eq: $telegramId}},limit: 99999) {
      items {
        id
      }
    }
  }
`;

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */

exports.handler = async (event) => {
  console.log(`EVENT: ${JSON.stringify(event)}`);
  let statusCode = 200
  let eventBody = JSON.parse(event.body);
  let responseMessage

  if (!eventBody.message?.text) {
    return {
      statusCode: statusCode,
      body: JSON.stringify('Type /start to initiate a connection.')
    }
  }

  let username = eventBody.message.chat.username;
  let chatId = eventBody.message.chat.id


  if(eventBody.message.text.startsWith('/start')){
    console.info("/start initiated");
    let message = 'Integration successful.'
    const variables = {
     telegramId  : username
    };

    const options1 = {
      method: "POST",
      headers: {
        "x-api-key": GRAPHQL_API_KEY,
      },
      body: JSON.stringify({ query: getListUsersByTelegramId, variables: variables }),
    };

    let response1
    let statusCode
    try {
      response1 = await fetch(GRAPHQL_ENDPOINT, options1)
      let body1 = await response1.json()
      if(body1.errors) {
        statusCode = 400
        responseMessage = body1.errors
      }
      else {
        console.info(`🔥Fetched user. ${JSON.stringify(body1.data)}`);
        let userId = body1.data.listUsers.items[0].id

        const variables2 = {
         input: {
           id  : userId,
           telegramChatId : chatId
         }
        };

        const options2 = {
          method: "POST",
          headers: {
            "x-api-key": GRAPHQL_API_KEY,
          },
          body: JSON.stringify({ query: updateUserTelegramChatId, variables: variables2 }),
        };


        let response2 = await fetch(GRAPHQL_ENDPOINT, options2)
        let body2 = await response2.json()
        if(body2.errors) {
          statusCode = 400
          responseMessage = body2.errors
        }
        else {
          statusCode = 200
          responseMessage = "Message sent successfully"
        }
      }

    }
    catch (e) {
      statusCode = 400
      return {
        statusCode,
        message: e.toString()
      }
    }

    try {
      let response = await axios.get(`https://api.telegram.org/bot${process.env.apiToken}/sendMessage?chat_id=${chatId}&text=${encodeURI(message)}`);
      statusCode = response.status;
      responseMessage = 'Message sent successfully'
    }
    catch (e) {
      statusCode = 400
      responseMessage = e
    }

  }

  else {
    statusCode = 200
    responseMessage = "Message sent successfully"
    await axios.get(`https://api.telegram.org/bot${process.env.apiToken}/sendMessage?chat_id=${chatId}&text=${encodeURI(eventBody.message.text)}`);
  }


  return {
    statusCode : statusCode,
    //  Uncomment below to enable CORS requests
    // headers: {
    //   "Access-Control-Allow-Origin": "*",
    //   "Access-Control-Allow-Headers": "*"
    // }, 
    body: JSON.stringify(responseMessage)
  };
};