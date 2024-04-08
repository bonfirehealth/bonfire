/* Amplify Params - DO NOT EDIT
    API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIIDOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT
    ENV
    REGION
Amplify Params - DO NOT EDIT */


import crypto from '@aws-crypto/sha256-js';
import {defaultProvider} from '@aws-sdk/credential-provider-node';
import {HttpRequest} from '@aws-sdk/protocol-http';
import {SignatureV4} from '@aws-sdk/signature-v4';
import CryptoJS from 'crypto-js';
import {default as fetch, Request} from 'node-fetch';
import secureRandomPassword from 'secure-random-password';

const {Sha256} = crypto;
const AWS_REGION = process.env.AWS_REGION || 'ap-southeast-1';
const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;

const createRecoveryCodeQuery = /* GraphQL */ `
mutation createRecoveryCode($input1: CreateRecoveryCodeInput!, $input2: CreateRecoveryCodeInput!, $input3: CreateRecoveryCodeInput!,
    $input4: CreateRecoveryCodeInput!, $input5: CreateRecoveryCodeInput!, $input6: CreateRecoveryCodeInput!, $input7: CreateRecoveryCodeInput!,
    $input8: CreateRecoveryCodeInput!, $input9: CreateRecoveryCodeInput!, $input10: CreateRecoveryCodeInput!) {
    recoveryCode1: createRecoveryCode(input: $input1) {
        ... on RecoveryCode {
            id
        }
    }
    recoveryCode2: createRecoveryCode(input: $input2) {
        ... on RecoveryCode {
            id
        }
    }
    recoveryCode3: createRecoveryCode(input: $input3) {
        ... on RecoveryCode {
            id
        }
    }
    recoveryCode4: createRecoveryCode(input: $input4) {
        ... on RecoveryCode {
            id
        }
    }
    recoveryCode5: createRecoveryCode(input: $input5) {
        ... on RecoveryCode {
            id
        }
    }
    recoveryCode6: createRecoveryCode(input: $input6) {
        ... on RecoveryCode {
            id
        }
    }
    recoveryCode7: createRecoveryCode(input: $input7) {
        ... on RecoveryCode {
            id
        }
    }
    recoveryCode8: createRecoveryCode(input: $input8) {
        ... on RecoveryCode {
            id
        }
    }
    recoveryCode9: createRecoveryCode(input: $input9) {
        ... on RecoveryCode {
            id
        }
    }
    recoveryCode10: createRecoveryCode(input: $input10) {
        ... on RecoveryCode {
            id
        }
    }
}
`;

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
    console.info("🔥 1 of 3: Retrieve request data from event body object.");
    let statusCode = 200;
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
    const numberOfRecoveryCodes = eventBody.number_of_recovery_codes ?? 10;
    const userID = eventBody.user_id;
    const userSubID = eventBody.user_sub_id;
    const recoveryCodes = [];
    const recoveryHashedCodes = [];
    const endpoint = new URL(GRAPHQL_ENDPOINT);
    const signer = new SignatureV4({
        credentials: defaultProvider(),
        region: AWS_REGION,
        service: 'appsync',
        sha256: Sha256
    });

    let createRecoveryCodeVariables = {};

    console.info(`🔥 2 of 3: Create ${numberOfRecoveryCodes} recovery code documents.`);
    for (let index = 0; index < numberOfRecoveryCodes; index++) {
        const code = secureRandomPassword.randomPassword({length: 32});
        const algo = CryptoJS.algo.SHA256.create();
        algo.update(code, 'utf-8');
        algo.update(CryptoJS.SHA256(userSubID), 'utf-8');
        const hashedCode = algo.finalize().toString(CryptoJS.enc.Base64);

        createRecoveryCodeVariables[`input${index + 1}`] = {
            "hashedCode": hashedCode,
            "isUsed": false,
            "userID": userID,
        };
        recoveryCodes.push(code);
        recoveryHashedCodes.push(hashedCode);
    }

    const requestToBeSigned = new HttpRequest({
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            host: endpoint.host
        },
        hostname: endpoint.host,
        body: JSON.stringify({query: createRecoveryCodeQuery, variables: createRecoveryCodeVariables}),
        path: endpoint.pathname
    });
    const signed = await signer.sign(requestToBeSigned);
    const request = new Request(endpoint, signed);

    let responseBody;
    let response;
    let recoveryCodeID = '';

    try {
        response = await fetch(request);
        responseBody = await response.json();
        if (responseBody.errors) statusCode = 400;
        if (responseBody !== undefined && responseBody !== null) {
            for (let index = 0; index < numberOfRecoveryCodes; index++) {
                recoveryCodeID = responseBody.data[`recoveryCode${index + 1}`].id;
                console.info(`🔥 2 of 3: Recovery code document ${index + 1} created: ${recoveryCodeID}`);
            }
        }
    } catch (error) {
        console.log(error);
        statusCode = 500;
    }

    const body = {
        recovery_codes: recoveryCodes,
        is_completed: true,
    };

    console.info("🔥 3 of 3: Function completed.");
    return {
        statusCode: statusCode,
        body: JSON.stringify(body),
    };
};
