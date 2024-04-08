/* Amplify Params - DO NOT EDIT
    API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIIDOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT
    ENV
    REGION
Amplify Params - DO NOT EDIT */

import pkg from "aws-sdk";
import {default as fetch, Request} from "node-fetch";
import nodemailer from "nodemailer";
import os from "os";

const {SES} = pkg;
const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT;
const ses = new SES({region: "us-east-1"});
const transporter = nodemailer.createTransport({SES: ses});

const getUserQuery = /* GraphQL */ `
  query GetUser($userID: ID!) {
    getUser(id: $userID) {
      ... on User {
        id
        isSecretCredentialsSent
        _version
      }
    }
  }
`;

const updateUserQuery = /* GraphQL */ `
  mutation UpdateUser($input: UpdateUserInput!) {
    updateUser(input: $input) {
      ... on User {
        id
        isSecretCredentialsSent
      }
    }
  }
`;

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
  console.info("🔥 1 of 5: Retrieve request data from event body object .");
  let statusCode = 200;
  let isSent = false;
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
  console.info("🔥 1 of 5: Request data content type: ", contentType);
  const personalEmailAddress = eventBody.personal_email_address;
  const emailAddress = eventBody.email_address;
  const password = eventBody.password;
  const recoveryCodes = eventBody.recovery_codes;
  const userID = eventBody.user_id;
  let version = 1;

  console.info("🔥 2 of 5: Check the latest _version of the user data.");
  const variables1 = {
    userID: userID,
  };
  const options1 = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({query: getUserQuery, variables: variables1}),
  };

  const request1 = new Request(GRAPHQL_ENDPOINT, options1);

  let body1;
  let response1;
  try {
    response1 = await fetch(request1);
    body1 = await response1.json();
    if (body1.errors) statusCode = 400;
    if (
      body1.data.getUser._version !== null &&
      body1.data.getUser._version !== undefined
    ) {
      version = body1.data.getUser._version;
    }
    console.info("🔥 2 of 5: User data version: ", version);
  } catch (error) {
    isSent = false;
    statusCode = 400;
    body1 = {
      errors: [
        {
          status: response1.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.info("🔥 2 of 5: Error querying user data: ", body1);
  }

  console.info("🔥 3 of 5: Send secret credentials email to email address.");
  const secretCredentials = `
Email: ${emailAddress}
Password: ${password}
RecoveryCodes: ${os.EOL}${recoveryCodes.join(os.EOL)}
${
  os.EOL
}***Important*: Please save your secret credentials to a secure location.
    `;
  const subject = "Welcome to Checkup!";
  const text =
    "Hi there, please refer to the attached text file for your secret credentials.";
  const result = await transporter.sendMail({
    from: '"Alissa from Checkup" <alissa@bonfire.love>',
    to: personalEmailAddress,
    subject: subject,
    text: text,
    html: "<div>" + text + "</div>",
    attachments: [
      {
        filename: "credentials.txt",
        content: secretCredentials,
      },
    ],
  });
  isSent =
    result.messageId !== null &&
    result.messageId !== undefined &&
    result.messageId !== "";
  console.info("🔥 3 of 5: SES Email Message ID: ", result.messageId);

  console.info("🔥 4 of 5: Mark secret credentials as sent.");
  const variables2 = {
    input: {
      id: userID,
      isSecretCredentialsSent: true,
      _version: version,
    },
  };
  const options2 = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({query: updateUserQuery, variables: variables2}),
  };

  const request2 = new Request(GRAPHQL_ENDPOINT, options2);

  let body2;
  let response2;
  try {
    response2 = await fetch(request2);
    body2 = await response2.json();
    if (body2.errors) statusCode = 400;
    isSent = body2.data.updateUser.isSecretCredentialsSent;
    console.info("🔥 4 of 5: Email is sent: ", isSent);
  } catch (error) {
    statusCode = 400;
    body2 = {
      errors: [
        {
          status: response2.status,
          message: error.message,
          stack: error.stack,
        },
      ],
    };
    console.info("🔥 4 of 5: Error updating user data: ", body2);
  }

  const responseBody = {
    is_sent: isSent,
  };
  console.info("🔥 5 of 5: Function completed.");
  return {
    statusCode: statusCode,
    body: JSON.stringify(responseBody),
  };
};
