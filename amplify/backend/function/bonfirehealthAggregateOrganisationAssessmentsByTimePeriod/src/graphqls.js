function listAllOrganisationUsersByOrganisationQuery() {
  return /* GraphQL */ `
    query ListUsersByOrganisation(
      $organisationID: ID
      $hourStartDate: String
      $hourEndDate: String
      $hourSortDirection: ModelSortDirection
      $dayStartDate: String
      $dayEndDate: String
      $daySortDirection: ModelSortDirection
      $monthStartDate: String
      $monthEndDate: String
      $monthSortDirection: ModelSortDirection
      $yearStartDate: String
      $yearEndDate: String
      $yearSortDirection: ModelSortDirection
    ) {
      listOrganisationUsers(
        filter: {organisationID: {eq: $organisationID}}
        limit: 999999999
      ) {
        items {
          ... on OrganisationUser {
            id
            createdAt
            updatedAt
            organisation {
              ... on Organisation {
                id
                name
                totalNumberOfActiveUsers
                totalNumberOfUsers
                totalNumberOfCompletedScreenings
                totalNumberOfIncompletedScreenings
                totalNumberOfSuggestionsClicked
                totalNumberOfSuggestionsViewed
                logoURL
                themeColor
                organisationType {
                  ... on OrganisationType {
                    id
                    description
                    name
                    identifier
                  }
                }
              }
            }
            user {
              ... on User {
                id
                createdAt
                updatedAt
                externalUserID
                emailAddress
                username
                userType {
                  ... on UserType {
                    id
                    description
                    name
                    identifier
                  }
                }
                photoBase64
                photoURL
                profile {
                  ... on Profile {
                    id
                    createdAt
                    updatedAt
                    age
                    gender
                    weight
                    weightUnit
                    weightUnitName
                    height
                    heightUnit
                    heightUnitName
                    bodyMassIndex
                    mood
                    stressLevel
                    stressIndex
                    oxygenLevel
                    oxygenSaturationLevel
                    respiratoryRate
                    systolicBloodPressure
                    diastolicBloodPressure
                    heartRate
                    heartRateVariability
                    sympatheticNervousSystemIndex
                    timezone
                    assessments(limit: 999999999) {
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
                          assessmentSelfCareId
                          selfCare {
                            ... on SelfCare {
                              id
                              createdAt
                              updatedAt
                              description
                              name
                              icon
                              index
                              numberOfAvailableSlots
                              numberOfTotalSlots
                              routePath
                              selfCareActivityId
                              activity {
                                ... on Activity {
                                  id
                                  createdAt
                                  updatedAt
                                  description
                                  duration
                                  name
                                  activityActivityTypeId
                                  activityType {
                                    ... on ActivityType {
                                      id
                                      createdAt
                                      updatedAt
                                      description
                                      identifier
                                      name
                                    }
                                  }
                                  reward {
                                    ... on Reward {
                                      id
                                      createdAt
                                      updatedAt
                                      description
                                      name
                                      rewardCredits
                                      maxNumberOfRedemptions
                                      rewardType {
                                        ... on RewardType {
                                          id
                                          createdAt
                                          updatedAt
                                          description
                                          identifier
                                          name
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                              selfCareSelfCareTypeId
                              selfCareType {
                                ... on SelfCareType {
                                  id
                                  createdAt
                                  updatedAt
                                  description
                                  identifier
                                  name
                                }
                              }
                              url
                            }
                          }
                          _version
                          _deleted
                        }
                      }
                    }
                    aggregateHourAssessments(
                      filter: {startDate: {gt: $hourStartDate}}
                      endDate: {lt: $hourEndDate}
                      sortDirection: $hourSortDirection
                      limit: 999999999
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
                    aggregateDayAssessments(
                      filter: {startDate: {eq: $dayStartDate}}
                      endDate: {eq: $dayEndDate}
                      sortDirection: $daySortDirection
                      limit: 999999999
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
                    aggregateMonthAssessments(
                      filter: {startDate: {eq: $monthStartDate}}
                      endDate: {eq: $monthEndDate}
                      sortDirection: $monthSortDirection
                      limit: 999999999
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
                    aggregateYearAssessments(
                      filter: {startDate: {eq: $yearStartDate}}
                      endDate: {eq: $yearEndDate}
                      sortDirection: $yearSortDirection
                      limit: 999999999
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
                    selfCareUsages {
                      items {
                        ... on SelfCareUsage {
                          id
                        }
                      }
                    }
                    _version
                    _deleted
                  }
                }
                organisations {
                  items {
                    ... on OrganisationUser {
                      id
                      organisation {
                        id
                        name
                        logoURL
                        themeColor
                      }
                    }
                  }
                }
                _deleted
                _lastChangedAt
                _version
              }
            }
          }
        }
      }
    }
  `;
}

function listAllAggregateHourOrganisationAssessmentsQuery() {
  return /* GraphQL */ `
    query ListAllAggregateHourOrganisationAssessmentsByProfileAndDates(
      $organisationID: ID!
      $startDate: String
      $endDate: String
    ) {
      listAggregateHourOrganisationAssessments(
        filter: {
          organisationID: {eq: $organisationID}
          and: {startDate: {eq: $startDate}, and: {endDate: {eq: $endDate}}}
        }
      ) {
        items {
          ... on AggregateHourOrganisationAssessment {
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
            averageOxygenLevelForMale
            averageOxygenSaturationLevelForMale
            averageRespiratoryRateForMale
            averageStressIndexForMale
            averageSystolicBloodPressureForMale
            averageDiastolicBloodPressureForMale
            averageHeartRateForMale
            averageHeartRateVariabilityForMale
            averageSympatheticNervousSystemIndexForMale
            averageScoreForMale
            averageOxygenLevelForFemale
            averageOxygenSaturationLevelForFemale
            averageRespiratoryRateForFemale
            averageStressIndexForFemale
            averageSystolicBloodPressureForFemale
            averageDiastolicBloodPressureForFemale
            averageHeartRateForFemale
            averageHeartRateVariabilityForFemale
            averageSympatheticNervousSystemIndexForFemale
            averageScoreForFemale
            organisationID
            numberOfProfiles
            numberOfMaleProfiles
            numberOfFemaleProfiles
            numberOfProfilesLowRiskStressIndex
            numberOfProfilesMediumRiskStressIndex
            numberOfProfilesHighRiskStressIndex
            numberOfProfilesNormalRiskBloodPressure
            numberOfProfilesElevatedRiskBloodPressure
            numberOfProfilesHypertensiveRiskBloodPressure
            _deleted
            _lastChangedAt
            _version
          }
        }
      }
    }
  `;
}

function listAllAggregateDayOrganisationAssessmentsQuery() {
  return /* GraphQL */ `
    query ListAllAggregateDayOrganisationAssessmentsByProfileAndDates(
      $organisationID: ID!
      $startDate: String
      $endDate: String
    ) {
      listAggregateDayOrganisationAssessments(
        filter: {
          organisationID: {eq: $organisationID}
          and: {startDate: {eq: $startDate}, and: {endDate: {eq: $endDate}}}
        }
      ) {
        items {
          ... on AggregateDayOrganisationAssessment {
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
            averageOxygenLevelForMale
            averageOxygenSaturationLevelForMale
            averageRespiratoryRateForMale
            averageStressIndexForMale
            averageSystolicBloodPressureForMale
            averageDiastolicBloodPressureForMale
            averageHeartRateForMale
            averageHeartRateVariabilityForMale
            averageSympatheticNervousSystemIndexForMale
            averageScoreForMale
            averageOxygenLevelForFemale
            averageOxygenSaturationLevelForFemale
            averageRespiratoryRateForFemale
            averageStressIndexForFemale
            averageSystolicBloodPressureForFemale
            averageDiastolicBloodPressureForFemale
            averageHeartRateForFemale
            averageHeartRateVariabilityForFemale
            averageSympatheticNervousSystemIndexForFemale
            averageScoreForFemale
            organisationID
            numberOfProfiles
            numberOfMaleProfiles
            numberOfFemaleProfiles
            numberOfProfilesLowRiskStressIndex
            numberOfProfilesMediumRiskStressIndex
            numberOfProfilesHighRiskStressIndex
            numberOfProfilesNormalRiskBloodPressure
            numberOfProfilesElevatedRiskBloodPressure
            numberOfProfilesHypertensiveRiskBloodPressure
            _deleted
            _lastChangedAt
            _version
          }
        }
      }
    }
  `;
}

function listAllAggregateMonthOrganisationAssessmentsQuery() {
  return /* GraphQL */ `
    query ListAllAggregateMonthOrganisationAssessmentsByProfileAndDates(
      $organisationID: ID!
      $startDate: String
      $endDate: String
    ) {
      listAggregateMonthOrganisationAssessments(
        filter: {
          organisationID: {eq: $organisationID}
          and: {startDate: {eq: $startDate}, and: {endDate: {eq: $endDate}}}
        }
      ) {
        items {
          ... on AggregateMonthOrganisationAssessment {
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
            averageOxygenLevelForMale
            averageOxygenSaturationLevelForMale
            averageRespiratoryRateForMale
            averageStressIndexForMale
            averageSystolicBloodPressureForMale
            averageDiastolicBloodPressureForMale
            averageHeartRateForMale
            averageHeartRateVariabilityForMale
            averageSympatheticNervousSystemIndexForMale
            averageScoreForMale
            averageOxygenLevelForFemale
            averageOxygenSaturationLevelForFemale
            averageRespiratoryRateForFemale
            averageStressIndexForFemale
            averageSystolicBloodPressureForFemale
            averageDiastolicBloodPressureForFemale
            averageHeartRateForFemale
            averageHeartRateVariabilityForFemale
            averageSympatheticNervousSystemIndexForFemale
            averageScoreForFemale
            organisationID
            numberOfProfiles
            numberOfMaleProfiles
            numberOfFemaleProfiles
            numberOfProfilesLowRiskStressIndex
            numberOfProfilesMediumRiskStressIndex
            numberOfProfilesHighRiskStressIndex
            numberOfProfilesNormalRiskBloodPressure
            numberOfProfilesElevatedRiskBloodPressure
            numberOfProfilesHypertensiveRiskBloodPressure
            _deleted
            _lastChangedAt
            _version
          }
        }
      }
    }
  `;
}

function listAllAggregateYearOrganisationAssessmentsQuery() {
  return /* GraphQL */ `
    query ListAllAggregateYearOrganisationAssessmentsByProfileAndDates(
      $organisationID: ID!
      $startDate: String
      $endDate: String
    ) {
      listAggregateYearOrganisationAssessments(
        filter: {
          organisationID: {eq: $organisationID}
          and: {startDate: {eq: $startDate}, and: {endDate: {eq: $endDate}}}
        }
      ) {
        items {
          ... on AggregateYearOrganisationAssessment {
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
            averageOxygenLevelForMale
            averageOxygenSaturationLevelForMale
            averageRespiratoryRateForMale
            averageStressIndexForMale
            averageSystolicBloodPressureForMale
            averageDiastolicBloodPressureForMale
            averageHeartRateForMale
            averageHeartRateVariabilityForMale
            averageSympatheticNervousSystemIndexForMale
            averageScoreForMale
            averageOxygenLevelForFemale
            averageOxygenSaturationLevelForFemale
            averageRespiratoryRateForFemale
            averageStressIndexForFemale
            averageSystolicBloodPressureForFemale
            averageDiastolicBloodPressureForFemale
            averageHeartRateForFemale
            averageHeartRateVariabilityForFemale
            averageSympatheticNervousSystemIndexForFemale
            averageScoreForFemale
            organisationID
            numberOfProfiles
            numberOfMaleProfiles
            numberOfFemaleProfiles
            numberOfProfilesLowRiskStressIndex
            numberOfProfilesMediumRiskStressIndex
            numberOfProfilesHighRiskStressIndex
            numberOfProfilesNormalRiskBloodPressure
            numberOfProfilesElevatedRiskBloodPressure
            numberOfProfilesHypertensiveRiskBloodPressure
            _deleted
            _lastChangedAt
            _version
          }
        }
      }
    }
  `;
}

function createAggregateHourOrganisationAssessmentQuery() {
  return /* GraphQL */ `
    mutation CreateAggregateHourOrganisationAssessment(
      $input: CreateAggregateHourOrganisationAssessmentInput!
    ) {
      createAggregateHourOrganisationAssessment(input: $input) {
        ... on AggregateHourOrganisationAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function updateAggregateHourOrganisationAssessmentQuery() {
  return /* GraphQL */ `
    mutation UpdateAggregateHourOrganisationAssessment(
      $input: UpdateAggregateHourOrganisationAssessmentInput!
    ) {
      updateAggregateHourOrganisationAssessment(input: $input) {
        ... on AggregateHourOrganisationAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function createAggregateDayOrganisationAssessmentQuery() {
  return /* GraphQL */ `
    mutation CreateAggregateDayOrganisationAssessment(
      $input: CreateAggregateDayOrganisationAssessmentInput!
    ) {
      createAggregateDayOrganisationAssessment(input: $input) {
        ... on AggregateDayOrganisationAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function updateAggregateDayOrganisationAssessmentQuery() {
  return /* GraphQL */ `
    mutation UpdateAggregateDayOrganisationAssessment(
      $input: UpdateAggregateDayOrganisationAssessmentInput!
    ) {
      updateAggregateDayOrganisationAssessment(input: $input) {
        ... on AggregateDayOrganisationAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function createAggregateMonthOrganisationAssessmentQuery() {
  return /* GraphQL */ `
    mutation CreateAggregateMonthOrganisationAssessment(
      $input: CreateAggregateMonthOrganisationAssessmentInput!
    ) {
      createAggregateMonthOrganisationAssessment(input: $input) {
        ... on AggregateMonthOrganisationAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function updateAggregateMonthOrganisationAssessmentQuery() {
  return /* GraphQL */ `
    mutation UpdateAggregateMonthOrganisationAssessment(
      $input: UpdateAggregateMonthOrganisationAssessmentInput!
    ) {
      updateAggregateMonthOrganisationAssessment(input: $input) {
        ... on AggregateMonthOrganisationAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function createAggregateYearOrganisationAssessmentQuery() {
  return /* GraphQL */ `
    mutation CreateAggregateYearOrganisationAssessment(
      $input: CreateAggregateYearOrganisationAssessmentInput!
    ) {
      createAggregateYearOrganisationAssessment(input: $input) {
        ... on AggregateYearOrganisationAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

function updateAggregateYearOrganisationAssessmentQuery() {
  return /* GraphQL */ `
    mutation UpdateAggregateYearOrganisationAssessment(
      $input: UpdateAggregateYearOrganisationAssessmentInput!
    ) {
      updateAggregateYearOrganisationAssessment(input: $input) {
        ... on AggregateYearOrganisationAssessment {
          id
          startDate
          endDate
        }
      }
    }
  `;
}

export default {
  listAllOrganisationUsersByOrganisationQuery,
  listAllAggregateHourOrganisationAssessmentsQuery,
  listAllAggregateDayOrganisationAssessmentsQuery,
  listAllAggregateMonthOrganisationAssessmentsQuery,
  listAllAggregateYearOrganisationAssessmentsQuery,
  createAggregateHourOrganisationAssessmentQuery,
  updateAggregateHourOrganisationAssessmentQuery,
  createAggregateDayOrganisationAssessmentQuery,
  updateAggregateDayOrganisationAssessmentQuery,
  createAggregateMonthOrganisationAssessmentQuery,
  updateAggregateMonthOrganisationAssessmentQuery,
  createAggregateYearOrganisationAssessmentQuery,
  updateAggregateYearOrganisationAssessmentQuery,
};