/* Amplify Params - DO NOT EDIT
    API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIIDOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT
    AUTH_BONFIREHEALTH_USERPOOLID
    ENV
    REGION
Amplify Params - DO NOT EDIT */
import pkg from 'aws-sdk';
import CryptoJS from 'crypto-js';
import {default as fetch, Request} from 'node-fetch';

const {CognitoIdentityServiceProvider} = pkg;
const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT;
const cognitoidentityserviceprovider = new CognitoIdentityServiceProvider({
    apiVersion: '2016-04-18',
});

const query = /* GraphQL */ `
query CheckRecoveryCodeValidity($hashedCode: String!, $userID: ID!) {
  listRecoveryCodes(filter: {hashedCode: {eq: $hashedCode}, and: {userID: {eq: $userID}, and: {code: {attributeExists: false}}}}, limit: 999999999) {
    items {
      ... on RecoveryCode {
        id
        isUsed
        userID
      }
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
    let isValid = false;
    let userSubID = '';
    let userID = '';
    let hashedCode = '';
    let recoveryCodeID = '';
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
    const recoveryCode = eventBody.recovery_code;

    console.info("🔥 2 of 5: Check if recovery code and email address are valid.");
    const getUserParams = {
        UserPoolId: userPoolID,
        Username: emailAddress,
    };

    try {
        const user = await cognitoidentityserviceprovider.adminGetUser(getUserParams).promise();
        const userAttributes = user.UserAttributes;
        const userSubAttribute = userAttributes.find(element => element.Name == "sub");
        const userIDAttribute = userAttributes.find(element => element.Name == "custom:user_id");
        userSubID = userSubAttribute.Value;
        userID = userIDAttribute.Value;
        const algo = CryptoJS.algo.SHA256.create();
        algo.update(recoveryCode, 'utf-8');
        algo.update(CryptoJS.SHA256(userSubID), 'utf-8');
        hashedCode = algo.finalize().toString(CryptoJS.enc.Base64);
        console.info("🔥 2 of 5: Email address exists.");
    } catch (error) {
        console.info("🔥 2 of 5: Email address not exists.");
        console.log(error);
        isValid = false;
    }

    if (userSubID !== undefined && userID !== undefined && hashedCode !== "") {
        console.info("🔥 3 of 5: Check if recovery hashed code is valid.");
        const variables = {
            "hashedCode": hashedCode,
            "userID": userID,
        };
        console.log(variables);
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
            const _items = body.data.listRecoveryCodes.items;
            let _item;
            if (_items.length > 0) {
                _item = _items[0];
                isValid = !_item.isUsed;
                recoveryCodeID = _item.id;
                console.info("🔥 4 of 5: Recovery code is valid.", isValid);
            }
        } catch (error) {
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
    }

    const responseBody = {
        is_valid: isValid,
        recovery_code_id: recoveryCodeID,
    };
    console.info("🔥 5 of 5: Function completed.");
    return {
        statusCode: statusCode,
        body: JSON.stringify(responseBody),
    };
};
