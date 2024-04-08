/* Amplify Params - DO NOT EDIT
    API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIIDOUTPUT
    API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT
    AUTH_BONFIREHEALTH_USERPOOLID
    ENV
    REGION
Amplify Params - DO NOT EDIT */
import crypto from "@aws-crypto/sha256-js";
import {defaultProvider} from "@aws-sdk/credential-provider-node";
import {HttpRequest} from "@aws-sdk/protocol-http";
import {SignatureV4} from "@aws-sdk/signature-v4";
import pkg from "aws-sdk";
import {default as fetch, Request} from "node-fetch";
const {CognitoIdentityServiceProvider} = pkg;

const {Sha256} = crypto;
const AWS_REGION = process.env.AWS_REGION || "ap-southeast-1";
const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;

const cognitoidentityserviceprovider = new CognitoIdentityServiceProvider({
  apiVersion: "2016-04-18",
});

const createUserQuery = /* GraphQL */ `
  mutation createUser($input: CreateUserInput!) {
    createUser(input: $input) {
      ... on User {
        id
      }
    }
  }
`;

const createProfileQuery = /* GraphQL */ `
  mutation createProfile($input: CreateProfileInput!) {
    createProfile(input: $input) {
      ... on Profile {
        id
        gender
        weight
        height
        user {
          ... on User {
            id
          }
        }
      }
    }
  }
`;

const updateUserQuery = /* GraphQL */ `
  mutation updateUser($input: UpdateUserInput!) {
    updateUser(input: $input) {
      ... on User {
        id
      }
    }
  }
`;

const createOrganisationUserQuery = /* GraphQL */ `
  mutation createOrganisationUser($input: CreateOrganisationUserInput!) {
    createOrganisationUser(input: $input) {
      ... on OrganisationUser {
        id
      }
    }
  }
`;

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
  console.info("🔥 1 of 7: Retrieve request data from event body object.");
  let isCompleted = false;
  let statusCode = 200;
  const userPoolID = process.env.AUTH_BONFIREHEALTH_USERPOOLID;
  const isEmailVerified = "true";
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
  const username = eventBody.username;
  const emailAddress = eventBody.email_address;
  const groupName = eventBody.group_name;
  const organisationID = eventBody.organisation_id;
  const userTypeID = eventBody.user_type_id;
  const firstName = eventBody.first_name;
  const lastName = eventBody.last_name;
  const parentId = eventBody.parent_id;
  const uniqueLinkValue = eventBody.unique_link_value;
  const avatar = eventBody.avatar;

  if (emailAddress === null) {
    console.info("🔥 5 of 7: Function completed with errors.");
    statusCode = 500;
    return {
      statusCode: statusCode,
      body: {
        is_completed: isCompleted,
        user_id: "",
      },
    };
  }

  console.info("🔥 2 of 7: Create user document.");
  const createUserVariables = {
    input: {
      username: username,
      emailAddress: emailAddress,
      userUserTypeId: userTypeID,
      firstName: firstName,
      lastName: lastName,
      parentId: parentId,
      uniqueLinkValue: uniqueLinkValue,
      avatar: avatar
    },
  };
  const endpoint = new URL(GRAPHQL_ENDPOINT);
  const signer = new SignatureV4({
    credentials: defaultProvider(),
    region: AWS_REGION,
    service: "appsync",
    sha256: Sha256,
  });
  const requestToBeSigned = new HttpRequest({
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      host: endpoint.host,
    },
    hostname: endpoint.host,
    body: JSON.stringify({
      query: createUserQuery,
      variables: createUserVariables,
    }),
    path: endpoint.pathname,
  });
  const signed = await signer.sign(requestToBeSigned);
  const request = new Request(endpoint, signed);

  let responseBody;
  let response;
  let userID = "";

  try {
    response = await fetch(request);
    responseBody = await response.json();
    if (responseBody.errors) statusCode = 400;
    if (responseBody !== undefined) {
      userID = responseBody.data.createUser.id;
    }
  } catch (error) {
    console.log(error);
  }

  console.info("🔥 3 of 7: Create profile document.");
  const createProfileVariables = {
    input: {
      userID: userID,
    },
  };
  const requestToBeSigned2 = new HttpRequest({
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      host: endpoint.host,
    },
    hostname: endpoint.host,
    body: JSON.stringify({
      query: createProfileQuery,
      variables: createProfileVariables,
    }),
    path: endpoint.pathname,
  });
  const signed2 = await signer.sign(requestToBeSigned2);
  const request2 = new Request(endpoint, signed2);

  let profileID = "";

  try {
    response = await fetch(request2);
    responseBody = await response.json();
    if (responseBody.errors) statusCode = 400;
    if (responseBody !== undefined) {
      profileID = responseBody.data.createProfile.id;
    }
  } catch (error) {
    console.log(error);
  }

  console.info("🔥 4 of 7: Create organisation user document.");
  const createOrganisationUserVariables = {
    input: {
      userID: userID,
      organisationID: organisationID,
    },
  };

  const requestToBeSigned3 = new HttpRequest({
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      host: endpoint.host,
    },
    hostname: endpoint.host,
    body: JSON.stringify({
      query: createOrganisationUserQuery,
      variables: createOrganisationUserVariables,
    }),
    path: endpoint.pathname,
  });

  const signed3 = await signer.sign(requestToBeSigned3);
  const request3 = new Request(endpoint, signed3);

  let organisationUserID = "";

  try {
    response = await fetch(request3);
    responseBody = await response.json();
    if (responseBody.errors) statusCode = 400;
    if (responseBody !== undefined) {
      organisationUserID = responseBody.data.createOrganisationUser.id;
    }
  } catch (error) {
    console.log(error);
  }

  console.info("🔥 5 of 7: Update user document.");
  const updateUserVariables = {
    input: {
      id: userID,
      userProfileId: profileID,
    },
  };
  const requestToBeSigned4 = new HttpRequest({
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      host: endpoint.host,
    },
    hostname: endpoint.host,
    body: JSON.stringify({
      query: updateUserQuery,
      variables: updateUserVariables,
    }),
    path: endpoint.pathname,
  });
  const signed4 = await signer.sign(requestToBeSigned4);
  const request4 = new Request(endpoint, signed4);

  try {
    response = await fetch(request4);
    responseBody = await response.json();
    if (responseBody.errors) statusCode = 400;
    if (responseBody !== undefined) {
      if (userID == responseBody.data.updateUser.id) {
        console.info("🔥 5 of 7: User document updated.");
      }
    }
  } catch (error) {
    console.log(error);
  }

  console.info("🔥 6 of 7: Add and confirm cognito user to the cognito group.");
  try {
    const attributes = {
      UserAttributes: [
        {
          Name: "email_verified",
          Value: isEmailVerified,
        },
        {
          Name: "custom:organisation_id",
          Value: organisationID,
        },
        {
          Name: "custom:user_id",
          Value: userID,
        },
      ],
      Username: emailAddress,
      UserPoolId: userPoolID,
    };

    const data = await cognitoidentityserviceprovider
      .adminUpdateUserAttributes(attributes)
      .promise();

    const groupParams = {
      GroupName: groupName,
      UserPoolId: userPoolID,
    };
    const addUserParams = {
      GroupName: groupName,
      UserPoolId: userPoolID,
      Username: emailAddress,
    };

    var confirmParams = {
      UserPoolId: userPoolID,
      Username: emailAddress,
    };

    try {
      await cognitoidentityserviceprovider.getGroup(groupParams).promise();
    } catch (e) {
      await cognitoidentityserviceprovider.createGroup(groupParams).promise();
    }

    await cognitoidentityserviceprovider
      .adminAddUserToGroup(addUserParams)
      .promise();
    await cognitoidentityserviceprovider
      .adminConfirmSignUp(confirmParams)
      .promise();
    console.log("success");
    isCompleted = true;
  } catch (error) {
    console.error("error", error);
  }

  console.info("🔥 7 of 7: Function completed.");
  const _responseBody = {
    is_completed: isCompleted,
    user_id: userID,
    profile_id: profileID,
    organisation_user_id: organisationUserID,
  };
  return {
    statusCode: statusCode,
    body: JSON.stringify(_responseBody),
  };
};
