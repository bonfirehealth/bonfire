part of 'organisation_dashboard_bloc.dart';

class OrganisationDashboardState {
  const OrganisationDashboardState({
    this.isLoading = false,
    this.startDate,
    this.endDate,
    this.totalNumberOfActiveUsers = 0,
    this.totalNumberOfUsers = 0,
    this.totalNumberOfCompletedScreenings = 0,
    this.totalNumberOfIncompletedScreenings = 0,
    this.totalNumberOfSuggestionsClicked = 0,
    this.totalNumberOfSuggestionsViewed = 0,
    this.totalNumberOfEAPSuggestionsClicked = 0,
    this.totalNumberOfCompletedScreeningUsers = 0,
    this.aggregateHourOrganisationAssessmentsByOneDay,
    this.aggregateDayOrganisationAssessmentsByOneWeek,
    this.aggregateDayOrganisationAssessmentsByOneMonth,
    this.aggregateMonthOrganisationAssessmentsByOneYear,
    this.aggregateYearOrganisationAssessmentsByOneDecade,
    this.currentAggregateType = AggregateType.day,
    this.currentXAxisIntervalType = DateTimeIntervalType.hours,
    this.currentVitalSign = VitalSign.readinessIndex,
    this.organisationUsers,
    this.suggestions,
  });

  final bool isLoading;
  final DateTime? startDate;
  final DateTime? endDate;
  final int totalNumberOfActiveUsers;
  final int totalNumberOfUsers;
  final int totalNumberOfCompletedScreenings;
  final int totalNumberOfIncompletedScreenings;
  final int totalNumberOfSuggestionsClicked;
  final int totalNumberOfSuggestionsViewed;
  final int totalNumberOfEAPSuggestionsClicked;
  final int totalNumberOfCompletedScreeningUsers;
  final List<AggregateHourOrganisationAssessment>?
      aggregateHourOrganisationAssessmentsByOneDay;
  final List<AggregateDayOrganisationAssessment>?
      aggregateDayOrganisationAssessmentsByOneWeek;
  final List<AggregateDayOrganisationAssessment>?
      aggregateDayOrganisationAssessmentsByOneMonth;
  final List<AggregateMonthOrganisationAssessment>?
      aggregateMonthOrganisationAssessmentsByOneYear;
  final List<AggregateYearOrganisationAssessment>?
      aggregateYearOrganisationAssessmentsByOneDecade;
  final AggregateType currentAggregateType;
  final DateTimeIntervalType currentXAxisIntervalType;
  final VitalSign currentVitalSign;
  final List<OrganisationUser>? organisationUsers;
  final List<Suggestion>? suggestions;

  OrganisationDashboardState copyWith({
    bool? isLoading,
    DateTime? startDate,
    DateTime? endDate,
    int? totalNumberOfActiveUsers,
    int? totalNumberOfUsers,
    int? totalNumberOfCompletedScreenings,
    int? totalNumberOfIncompletedScreenings,
    int? totalNumberOfSuggestionsClicked,
    int? totalNumberOfSuggestionsViewed,
    int? totalNumberOfCompletedScreeningUsers,
    int? totalNumberOfEAPSuggestionsClicked,
    List<AggregateHourOrganisationAssessment>?
        aggregateHourOrganisationAssessmentsByOneDay,
    List<AggregateDayOrganisationAssessment>?
        aggregateDayOrganisationAssessmentsByOneWeek,
    List<AggregateDayOrganisationAssessment>?
        aggregateDayOrganisationAssessmentsByOneMonth,
    List<AggregateMonthOrganisationAssessment>?
        aggregateMonthOrganisationAssessmentsByOneYear,
    List<AggregateYearOrganisationAssessment>?
        aggregateYearOrganisationAssessmentsByOneDecade,
    AggregateType? currentAggregateType,
    DateTimeIntervalType? currentXAxisIntervalType,
    List<OrganisationUser>? organisationUsers,
    VitalSign? currentVitalSign,
    List<Suggestion>? suggestions,
  }) {
    return OrganisationDashboardState(
      isLoading: isLoading ?? this.isLoading,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalNumberOfActiveUsers:
          totalNumberOfActiveUsers ?? this.totalNumberOfActiveUsers,
      totalNumberOfUsers: totalNumberOfUsers ?? this.totalNumberOfUsers,
      totalNumberOfCompletedScreenings: totalNumberOfCompletedScreenings ??
          this.totalNumberOfCompletedScreenings,
      totalNumberOfIncompletedScreenings: totalNumberOfIncompletedScreenings ??
          this.totalNumberOfIncompletedScreenings,
      totalNumberOfSuggestionsClicked: totalNumberOfSuggestionsClicked ??
          this.totalNumberOfSuggestionsClicked,
      totalNumberOfSuggestionsViewed:
          totalNumberOfSuggestionsViewed ?? this.totalNumberOfSuggestionsViewed,
      totalNumberOfEAPSuggestionsClicked: totalNumberOfEAPSuggestionsClicked ??
          this.totalNumberOfEAPSuggestionsClicked,
      totalNumberOfCompletedScreeningUsers:
          totalNumberOfCompletedScreeningUsers ??
              this.totalNumberOfCompletedScreeningUsers,
      aggregateHourOrganisationAssessmentsByOneDay:
          aggregateHourOrganisationAssessmentsByOneDay ??
              this.aggregateHourOrganisationAssessmentsByOneDay,
      aggregateDayOrganisationAssessmentsByOneWeek:
          aggregateDayOrganisationAssessmentsByOneWeek ??
              this.aggregateDayOrganisationAssessmentsByOneWeek,
      aggregateDayOrganisationAssessmentsByOneMonth:
          aggregateDayOrganisationAssessmentsByOneMonth ??
              this.aggregateDayOrganisationAssessmentsByOneMonth,
      aggregateMonthOrganisationAssessmentsByOneYear:
          aggregateMonthOrganisationAssessmentsByOneYear ??
              this.aggregateMonthOrganisationAssessmentsByOneYear,
      aggregateYearOrganisationAssessmentsByOneDecade:
          aggregateYearOrganisationAssessmentsByOneDecade ??
              this.aggregateYearOrganisationAssessmentsByOneDecade,
      currentAggregateType: currentAggregateType ?? this.currentAggregateType,
      currentXAxisIntervalType:
          currentXAxisIntervalType ?? this.currentXAxisIntervalType,
      currentVitalSign: currentVitalSign ?? this.currentVitalSign,
      organisationUsers: organisationUsers ?? this.organisationUsers,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}
