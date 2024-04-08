/* Amplify Params - DO NOT EDIT
    API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIIDOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT
    AUTH_BONFIREHEALTH_USERPOOLID
    ENV
    REGION
Amplify Params - DO NOT EDIT */

import pkg from 'aws-sdk';
import {default as fetch, Request} from 'node-fetch';

const {CognitoIdentityServiceProvider} = pkg;
const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT;
const cognitoidentityserviceprovider = new CognitoIdentityServiceProvider({
    apiVersion: '2016-04-18',
});

const query = /* GraphQL */ `
mutation UpdateRecoveryCode($input: UpdateRecoveryCodeInput!) {
  updateRecoveryCode(input: $input, condition: {code: {attributeExists: false}}) {
    ... on RecoveryCode {
      id
      isUsed
      userID
      code
    }
  }
}
`;

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
    console.info("🔥 1 of 5: Retrieve request data from event body object.");
    const userPoolID = process.env.AUTH_BONFIREHEALTH_USERPOOLID;
    let statusCode = 200;
    let isReset = false;
    let isUsed = false;
    const contentType = event.headers['content-type'] ?? event.headers['Content-Type'];
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
    const emailAddress = eventBody.email_address;
    const password = eventBody.password;
    const recoveryCodeID = eventBody.recovery_code_id;
    const recoveryCode = eventBody.recovery_code;

    console.info("🔥 2 of 5: Mark recovery code as used.");
    const variables = {
        "input": {
            "id": recoveryCodeID,
            "isUsed": true,
            "code": recoveryCode,
        }
    };
    const options = {
        method: 'POST',
        headers: {
            'x-api-key': GRAPHQL_API_KEY
        },
        body: JSON.stringify({query, variables})
    };

    const request = new Request(GRAPHQL_ENDPOINT, options);

    let body;
    let response;
    try {
        response = await fetch(request);
        body = await response.json();
        if (body.errors) statusCode = 400;
        isUsed = body.data.updateRecoveryCode.code === recoveryCode;
        console.info("🔥 3 of 5: Recovery code is marked as used.", isUsed);
        isReset = isUsed;
    } catch (error) {
        isReset = false;
        statusCode = 400;
        body = {
            errors: [
                {
                    status: response.status,
                    message: error.message,
                    stack: error.stack
                }
            ]
        };
    }

    if (isReset) {
        console.info("🔥 4 of 5: Set password.");
        const setUserPasswordParams = {
            UserPoolId: userPoolID,
            Username: emailAddress,
            Password: password,
            Permanent: true,
        };

        try {
            await cognitoidentityserviceprovider.adminSetUserPassword(setUserPasswordParams).promise();
            console.info("🔥 4 of 5: Password set successfully.");
        } catch (error) {
            console.info("🔥 4 of 5: Password set failed.");
            console.log(error);
            isReset = false;
        }
    }

    const responseBody = {
        is_reset: isReset,
        is_used: isUsed,
    };
    console.info("🔥 5 of 5: Function completed.");
    return {
        statusCode: statusCode,
        body: JSON.stringify(responseBody),
    };
};
