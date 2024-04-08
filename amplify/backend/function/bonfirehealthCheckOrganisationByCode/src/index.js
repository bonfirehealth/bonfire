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
import {default as fetch, Request} from 'node-fetch';

const {Sha256} = crypto;
const AWS_REGION = process.env.AWS_REGION || 'ap-southeast-1';
const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;

const query = /* GraphQL */ `
query CheckOrganisationByCode(
  $code: String = ""
  $token: String = ""
  $secretCode: String = ""
) {
  listOrganisations(
    filter: {
      or: [
        {code: {eq: $code}, and: {token: {eq: $token}}}
        {secretCode: {eq: $secretCode}}
      ]
    }
  ) {
    items {
      ... on Organisation {
        id
        code
        name
        logoURL
        logoBase64
        themeColor
        organisationType {
          id
          name
          description
          identifier
        }
      }
    }
  }
}
`;

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
    console.info("🔥 1 of 4: Retrieve request data from event body object.");
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
    const organisationCode = eventBody.organisation_code ?? '';
    const organisationToken = eventBody.organisation_token ?? '';
    const secretCode = eventBody.secret_code ?? '';

    console.info("🔥 2 of 4: Retrieve organisation document by either organisation code with token or secret code.");
    const variables = {
        "code": organisationCode,
        "token": organisationToken,
        "secretCode": secretCode,
    };
    const endpoint = new URL(GRAPHQL_ENDPOINT);
    const signer = new SignatureV4({
        credentials: defaultProvider(),
        region: AWS_REGION,
        service: 'appsync',
        sha256: Sha256
    });
    const requestToBeSigned = new HttpRequest({
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            host: endpoint.host
        },
        hostname: endpoint.host,
        body: JSON.stringify({query, variables}),
        path: endpoint.pathname
    });
    const signed = await signer.sign(requestToBeSigned);
    const request = new Request(endpoint, signed);
    let tempBody;
    let body;
    let response;

    try {
        response = await fetch(request);
        tempBody = await response.json();
        if (tempBody.errors) statusCode = 400;
    } catch (error) {
        statusCode = 400;
        tempBody = {
            errors: [
                {
                    status: response.status,
                    message: error.message,
                    stack: error.stack
                }
            ]
        };
    }

    console.info("🔥 3 of 4: Format the organisation document structure for response body.");
    const _items = tempBody.data.listOrganisations.items;
    let _item;
    if (_items.length > 0) {
        _item = _items[0];
        body = {
            id: _item.id,
            code: _item.code,
            name: _item.name,
            logoURL: _item.logoURL,
            logoBase64: _item.logoBase64,
            themeColor: _item.themeColor,
            organisationType: {
                id: _item.organisationType.id,
                name: _item.organisationType.name,
                description: _item.organisationType.description,
                identifier: _item.organisationType.identifier,
            }
        };
    } else {
        body = {};
    }

    console.info("🔥 4 of 4: Function completed.");
    return {
        statusCode,
        body: JSON.stringify(body)
    };
};
