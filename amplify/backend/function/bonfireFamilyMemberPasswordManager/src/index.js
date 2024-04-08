/* Amplify Params - DO NOT EDIT
  ENV
  REGION
  ENCRYPTION_KEY
Amplify Params - DO NOT EDIT */


import { defaultProvider } from '@aws-sdk/credential-provider-node';
import { SignatureV4 } from '@aws-sdk/signature-v4';
import { HttpRequest } from '@aws-sdk/protocol-http';
import { default as fetch, Request } from 'node-fetch';
import crypto from 'crypto';

const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;
const AWS_REGION = process.env.AWS_REGION || 'us-east-1';


const encryptPw = (password) => {
  let cipher = crypto.createCipheriv('aes-256-cbc', Buffer.from(process.env.ENCRYPTION_KEY ?? 'bonfire_1689017700000000_checkup'), Buffer.from(process.env.IV ?? 'b16a2e8c5d93f0a7'));
  let encrypted = (Buffer.concat([
    cipher.update(password),
    cipher.final()
  ])).toString('hex');
  return encrypted;
}

const decryptPw = (message) => {
  let decipher = crypto.createDecipheriv(
    'aes-256-cbc',
    Buffer.from(process.env.ENCRYPTION_KEY ?? 'bonfire_1689017700000000_checkup'),
    Buffer.from(process.env.IV ?? 'b16a2e8c5d93f0a7')
  );
  return (Buffer.concat([
    decipher.update(Buffer.from(message, 'hex')),
    decipher.final()
  ])).toString('utf8');
}


/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
export const handler = async (event) => {
  console.log(`EVENT: ${JSON.stringify(event)}`);

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

  const action = eventBody.action ?? "";
  const value = eventBody.value ?? "";

  if (action == '' || value == '') {
    return {
      statusCode: 400,
      body: JSON.stringify({
        message: "Invalid arguments",
        success: false
      })
    }
  }

  return {
    statusCode: 200,
    body: JSON.stringify({
      payload: action == 'encrypt' ? encryptPw(value) : decryptPw(value),
      success: true
    })
  }
};