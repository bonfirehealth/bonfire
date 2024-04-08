

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */
import pkg from "aws-sdk";
import { default as fetch, Request } from "node-fetch";
import nodemailer from "nodemailer";
import xlsxPopulate from "xlsx-populate";

const { SES } = pkg;
const GRAPHQL_ENDPOINT = process.env.API_BONFIREHEALTH_GRAPHQLAPIENDPOINTOUTPUT;
const GRAPHQL_API_KEY = process.env.API_BONFIREHEALTH_GRAPHQLAPIKEYOUTPUT;
const EMAIL_ADMIN = process.env.API_BONFIREHEALTH_EMAIL_ADMIN;
const ORGANISATIONID = process.env.API_BONFIREHEALTH_ORGANISATIONID;
const ses = new SES({ region: "us-east-1" });
const transporter = nodemailer.createTransport({ SES: ses });

const getListUsersByOrganisation = `query ListUsersByOrganisation(
    $organisationID: ID
    $dayStartDate: String
  ) {
    listOrganisationUsers(filter: {organisationID: {eq: $organisationID}}) {
      items {
        id
        user {
          profile {
            user {
              username
            }
            assessments(filter: {startDate: {gt: $dayStartDate}}, limit: 99999) {
              items {
                heartRate
                bodyTemperature
                systolicBloodPressure
                diastolicBloodPressure
                stressIndex
                heartRateVariability
                respiratoryRate
                oxygenLevel
              }
            }
          }
        }
      }
    }
  }
`;


export const handler = async (event) => {
  console.log(`EVENT: ${JSON.stringify(event)}`);
  console.info("🔥 1 of 5: Send report weekly to email address.");

  const today = new Date();
  // ✅ Get the last day of the current week (Sunday)
  const lastDay = new Date(today.setDate(today.getDate() - today.getDay()));

  // ✅ Get the first day of the current week (Saturday)
  const firstDay = new Date(today.setDate(today.getDate() - today.getDay() - 6));

  console.info(`🔥 1.2 of 5: Send report weekly to firstDay: ${firstDay.toUTCString()}`);
  console.info(`🔥 1.3 of 5: Send report weekly to lastDay: ${lastDay.toUTCString()}`);

  const variables = {
    organisationID: ORGANISATIONID,
    dayStartDate: firstDay.toISOString(),
    // dayEndDate: lastDay.toUTCString()
  };

  const options1 = {
    method: "POST",
    headers: {
      "x-api-key": GRAPHQL_API_KEY,
    },
    body: JSON.stringify({ query: getListUsersByOrganisation, variables: variables }),
  };

  const request1 = new Request(GRAPHQL_ENDPOINT, options1);


  let body1;
  let response1;
  let statusCode = 200;
  let organisationUsers = [];
  try {
    response1 = await fetch(request1);
    body1 = await response1.json();
    if (body1.errors) statusCode = 400;
    organisationUsers = body1.data.listOrganisationUsers.items;
    console.info("🔥 1.5 of 5: organisation data: ", JSON.stringify(organisationUsers));
  } catch (error) {
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

    console.info("🔥 1.5 of 5: organisation error: ", JSON.stringify(body1));
  }

  console.info(`🔥 2 of 5: Send report weekly to email address`);

  const subject = "Your Weekly Report with Checkup";
  const text =
    "Please refer to the attached report for this week's health scans. Drop us a message at 89017505 if you have any questions, thank you.\n- The Checkup Team";


  console.info(`🔥 3 of 5: Send report weekly to email address`);
  const header = ['Group', 'Worker FIN', 'Blood Pressure Reading (Systolic)', 'Blood Pressure Reading (Diastolic)', 'Body Temperature', 'Readiness Index', 'Heart Rate Variability', 'Respiratory Rate', 'Blood Oxygen', 'Heart Rate'];

  var dataArrays = [];

  var notNormalArrays = [];

  var row = 2;

  for (let index = 0; index < organisationUsers.length; index++) {
    const profileUser = organisationUsers[index];
    const assessments = profileUser.user.profile.assessments.items

    if (assessments.length > 0) {
      const username = profileUser.user.profile.user.username;
      console.info(`🔥 3.1 of 5: username: ${username}`);

      const filteredAssessments = assessments.filter(or => or.bodyTemperature);

      for (let index = 0; index < filteredAssessments.length; index++) {
        const assessment = filteredAssessments[index];
        console.info(`🔥 3.2 of 5: assessment: ${JSON.stringify(assessment)}`);

        const systolicBloodPressure = assessment.systolicBloodPressure?.toFixed(2);
        if (systolicBloodPressure < 80) {
          notNormalArrays.push([row, 3]);
        }

        const diastolicBloodPressure = assessment.diastolicBloodPressure?.toFixed(2);
        if (diastolicBloodPressure > 140) {
          notNormalArrays.push([row, 4]);
        }

        const bodyTemperature = assessment.bodyTemperature?.toFixed(2);
        if (bodyTemperature < 36.1 || bodyTemperature >= 37.2) {
          notNormalArrays.push([row, 5]);
        }

        const stressIndex = assessment.stressIndex?.toFixed(2);
        if (stressIndex < 50 || stressIndex > 100) {
          notNormalArrays.push([row, 6]);
        }

        const heartRateVariability = assessment.heartRateVariability?.toFixed(2);
        if (heartRateVariability < 20 || heartRateVariability > 200) {
          notNormalArrays.push([row, 7]);
        }

        const respiratoryRate = assessment.respiratoryRate?.toFixed(2);
        if (respiratoryRate < 12 || respiratoryRate > 16) {
          notNormalArrays.push([row, 8]);
        }

        const oxygenLevel = assessment.oxygenLevel?.toFixed(2);
        if (oxygenLevel < 95) {
          notNormalArrays.push([row, 9]);
        }

        const heartRate = assessment.heartRate?.toFixed(2);
        if (heartRate < 60 || heartRate > 101) {
          notNormalArrays.push([row, 10]);
        }

        let group = 'Hypertensive';
        if (systolicBloodPressure >= 80 && diastolicBloodPressure <= 140) {
          group = 'Non-hypertensive';
        } else {
          notNormalArrays.push([row, 1]);
        }

        dataArrays.push([group,
          username,
          systolicBloodPressure,
          diastolicBloodPressure,
          bodyTemperature,
          `${stressIndex}/100`,
          heartRateVariability,
          respiratoryRate,
          oxygenLevel,
          heartRate]);

        row = row + 1;
      }
    }
  }

  console.info(`🔥 4 of 5: Weekly report data: ${dataArrays}`);

  function getSheetData(data, header) {
    if (data.length > 0) {
      var fields = Object.keys(data[0]);
      var sheetData = data.map(function (row) {
        return fields.map(function (fieldName) {
          return row[fieldName] ? row[fieldName] : "";
        });
      });
      sheetData.unshift(header);
      return sheetData;
    } else {
      return header;
    }
  }

  var content;

  async function generateExcelFile() {
    await xlsxPopulate.fromBlankAsync().then(async (workbook) => {
      const sheet1 = workbook.sheet(0);
      const sheetData = getSheetData(dataArrays, header);
      const totalColumns = sheetData[0].length;

      sheet1.cell("A1").value(sheetData);
      const range = sheet1.usedRange();
      const endColumn = String.fromCharCode(64 + totalColumns);
      sheet1.row(1).style("bold", true);
      sheet1.range("A1:" + endColumn + "1").style("fill", "6aa84f");
      range.style({ "border": true, "horizontalAlignment": "center", "verticalAlignment": "center" });
      notNormalArrays.forEach((item) => {
        sheet1.row(item[0]).cell(item[1]).style("fill", "ff0000")
      });
      await workbook.outputAsync().then((res) => {
        content = res;
      });
    });
  }

  await generateExcelFile();

  console.info(`🔥 4.1 of 5: Emails: ${EMAIL_ADMIN}`);

  const result = await transporter.sendMail({
    from: '"Keith from Checkup" <keith@checkup.sg>',
    to: EMAIL_ADMIN,
    subject: subject,
    text: text,
    attachments: [
      {
        filename: "checkup.xlsx",
        content: content,
      },
    ],
  });

  console.info(`🔥 5 of 5: Send report weekly to email address completed`);

  return {
    statusCode: 200,
    body: JSON.stringify('Send report weekly to email address completed!'),
  };
};
