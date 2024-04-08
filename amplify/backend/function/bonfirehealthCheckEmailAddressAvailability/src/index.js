/* Amplify Params - DO NOT EDIT
    AUTH_BONFIREHEALTH_USERPOOLID
    ENV
    REGION
Amplify Params - DO NOT EDIT */

import pkg from 'aws-sdk';
const {CognitoIdentityServiceProvider} = pkg;

const cognitoidentityserviceprovider = new CognitoIdentityServiceProvider({
    apiVersion: '2016-04-18',
});

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
    console.info("🔥 1 of 4: Retrieve request data from event body object.");
    let statusCode = 200;
    const userPoolID = process.env.AUTH_BONFIREHEALTH_USERPOOLID;
    let isEmailAddressAvailable = false;
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
    console.info("🔥 1 of 4: Request data content type: ", contentType);
    const emailAddress = eventBody.email_address;
    const getUserParams = {
        UserPoolId: userPoolID,
        Username: emailAddress,
    };

    try {
        await cognitoidentityserviceprovider.adminGetUser(getUserParams).promise();
        isEmailAddressAvailable = false;
        console.info("🔥 2 of 4: Email address exists.");
    } catch (error) {
        console.info("🔥 2 of 4: Email address available.");
        console.log(error);
        isEmailAddressAvailable = true;
    }

    console.info("🔥 3 of 4: Check if the email address is not part of the exception list.");
    const exceptionUsernames = [
        "alissa",
        "alissa_bonfire",
        "bonfire_alissa",
        "bonfirealissa",
        "bonfire",
        "bonfirehealth",
        "bonfire_health",
        "healthbonfire",
        "health_bonfire",
    ];
    const username = emailAddress.split("@")[0];
    isEmailAddressAvailable = !exceptionUsernames.includes(username.toLowerCase());

    const responseBody = {
        is_email_address_available: isEmailAddressAvailable,
    };

    console.info("🔥 4 of 4: Function completed.");
    return {
        statusCode: statusCode,
        body: JSON.stringify(responseBody),
    };
};
