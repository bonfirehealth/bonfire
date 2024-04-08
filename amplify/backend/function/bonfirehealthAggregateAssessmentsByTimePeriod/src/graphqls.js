function listAllAssessmentsQuery() {
  return /* GraphQL */ `
    query ListAllAssessmentsByProfileAndDates(
      $profileID: ID!
      $startDate: String
      $endDate: String
    ) {
      listAssessments: listAssessments(
        filter: {
          profileID: {eq: $profileID}
          and: {startDate: {gt: $startDate}, and: {endDate: {lt: $endDate}}}
        }
      ) {
        items {
          ... on Assessment {
            id
            createdAt
            updatedAt
            startDate
            endDate
            mood
            stressLevel
            stressIndex
            oxygenLevel
            oxygenSaturationLevel
            respiratoryRate
            systolicBloodPressure
            diastolicBloodPressure
            heartRate
            heartRateManual
            heartRateManualSource
            heartRateVariability
            sympatheticNervousSystemIndex
            score
            profileID
            _deleted
            _lastChangedAt
            _version
          }
        }
      }
    }
  `;
}

function listAllAggregateHourAssessmentsQuery() {
  return /* GraphQL */ `
    query ListAllAggregateHourAssessmentsByProfileAndDates(
      $profileID: ID!
      $startDate: String
      $endDate: String
    ) {
      listAggregateHourAssessments(
        filter: {
          profileID: {eq: $profileID}
          and: {startDate: {eq: $startDate}, and: {endDate: {eq: $endDate}}}
        }
      ) {
        items {
          ... on AggregateHourAssessment {
            id
            createdAt
            updatedAt
            startDate
            endDate
            latestMood
            latestStressLevel
            averageOxygenLevel
            averageOxygenSaturationLevel
            averageRespiratoryRate
            averageStressIndex
            averageSystolicBloodPressure
            averageDiastolicBloodPressure
            averageHeartRate
            averageHeartRateVariability
            averageSympatheticNervousSystemIndex
            averageScore
            profileID
            numberOfAssessments
            _deleted
            _lastChangedAt
            _version
          }
        }
      }
    }
  `;
}

function listAllAggregateDayAssessmentsQuery() {
  return /* GraphQL */ `
    query ListAllAggregateDayAssessmentsByProfileAndDates(
      $profileID: ID!
      $startDate: String
      $endDate: String
    ) {
      listAggregateDayAssessments(
        filter: {
          profileID: {eq: $profileID}
          and: {startDate: {eq: $startDate}, and: {endDate: {eq: $endDate}}}
        }
      ) {
        items {
          ... on AggregateDayAssessment {
            id
            createdAt
            updatedAt
            startDate
            endDate
            latestMood
            latestStressLevel
            averageOxygenLevel
            averageOxygenSaturationLevel
            averageRespiratoryRate
            averageStressIndex
            averageSystolicBloodPressure
            averageDiastolicBloodPressure
            averageHeartRate
            averageHeartRateVariability
            averageSympatheticNervousSystemIndex
            averageScore
            profileID
            numberOfAssessments
            _deleted
            _lastChangedAt
            _version
          }
        }
      }
    }
  `;
}

function listAllAggregateMonthAssessmentsQuery() {
  return /* GraphQL */ `
    query ListAllAggregateMonthAssessmentsByProfileAndDates(
      $profileID: ID!
      $startDate: String
      $endDate: String
    ) {
      listAggregateMonthAssessments(
        filter: {
          profileID: {eq: $profileID}
          and: {startDate: {eq: $startDate}, and: {endDate: {eq: $endDate}}}
        }
      ) {
        items {
          ... on AggregateMonthAssessment {
            id
            createdAt
            updatedAt
            startDate
            endDate
            latestMood
            latestStressLevel
            averageOxygenLevel
            averageOxygenSaturationLevel
            averageRespiratoryRate
            averageStressIndex
            averageSystolicBloodPressure
            averageDiastolicBloodPressure
            averageHeartRate
            averageHeartRateVariability
            averageSympatheticNervousSystemIndex
            averageScore
            profileID
            numberOfAssessments
            _deleted
            _lastChangedAt
            _version
          }
        }
      }
    }
  `;
}

function listAllAggregateYearAssessmentsQuery() {
  return /* GraphQL */ `
    query ListAllAggregateYearAssessmentsByProfileAndDates(
      $profileID: ID!
      $startDate: String
      $endDate: String
    ) {
      listAggregateYearAssessments(
        filter: {
          profileID: {eq: $profileID}
          and: {startDate: {eq: $startDate}, and: {endDate: {eq: $endDate}}}
        }
      ) {
        items {
          ... on AggregateYearAssessment {
            id
            createdAt
            updatedAt
            startDate
            endDate
            latestMood
            latestStressLevel
            averageOxygenLevel
            averageOxygenSaturationLevel
            averageRespiratoryRate
            averageStressIndex
            averageSystolicBloodPressure
            averageDiastolicBloodPressure
            averageHeartRate
            averageHeartRateVariability
            averageSympatheticNervousSystemIndex
            averageScore
            profileID
            numberOfAssessments
            _deleted
            _lastChangedAt
            _version
          }
        }
      }
    }
  `;
}

function createAggregateHourAssessmentQuery() {
  return /* GraphQL */ `
    mutation CreateAggregateHourAssessment(
      $input: CreateAggregateHourAssessmentInput!
    ) {
      createAggregateHourAssessment(input: $input) {
        ... on AggregateHourAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function updateAggregateHourAssessmentQuery() {
  return /* GraphQL */ `
    mutation UpdateAggregateHourAssessment(
      $input: UpdateAggregateHourAssessmentInput!
    ) {
      updateAggregateHourAssessment(input: $input) {
        ... on AggregateHourAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function createAggregateDayAssessmentQuery() {
  return /* GraphQL */ `
    mutation CreateAggregateDayAssessment(
      $input: CreateAggregateDayAssessmentInput!
    ) {
      createAggregateDayAssessment(input: $input) {
        ... on AggregateDayAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function updateAggregateDayAssessmentQuery() {
  return /* GraphQL */ `
    mutation UpdateAggregateDayAssessment(
      $input: UpdateAggregateDayAssessmentInput!
    ) {
      updateAggregateDayAssessment(input: $input) {
        ... on AggregateDayAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function createAggregateMonthAssessmentQuery() {
  return /* GraphQL */ `
    mutation CreateAggregateMonthAssessment(
      $input: CreateAggregateMonthAssessmentInput!
    ) {
      createAggregateMonthAssessment(input: $input) {
        ... on AggregateMonthAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function updateAggregateMonthAssessmentQuery() {
  return /* GraphQL */ `
    mutation UpdateAggregateMonthAssessment(
      $input: UpdateAggregateMonthAssessmentInput!
    ) {
      updateAggregateMonthAssessment(input: $input) {
        ... on AggregateMonthAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function createAggregateYearAssessmentQuery() {
  return /* GraphQL */ `
    mutation CreateAggregateYearAssessment(
      $input: CreateAggregateYearAssessmentInput!
    ) {
      createAggregateYearAssessment(input: $input) {
        ... on AggregateYearAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function updateAggregateYearAssessmentQuery() {
  return /* GraphQL */ `
    mutation UpdateAggregateYearAssessment(
      $input: UpdateAggregateYearAssessmentInput!
    ) {
      updateAggregateYearAssessment(input: $input) {
        ... on AggregateYearAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

export default {
  listAllAssessmentsQuery,
  listAllAggregateHourAssessmentsQuery,
  listAllAggregateDayAssessmentsQuery,
  listAllAggregateMonthAssessmentsQuery,
  listAllAggregateYearAssessmentsQuery,
  createAggregateHourAssessmentQuery,
  updateAggregateHourAssessmentQuery,
  createAggregateDayAssessmentQuery,
  updateAggregateDayAssessmentQuery,
  createAggregateMonthAssessmentQuery,
  updateAggregateMonthAssessmentQuery,
  createAggregateYearAssessmentQuery,
  updateAggregateYearAssessmentQuery,
};
