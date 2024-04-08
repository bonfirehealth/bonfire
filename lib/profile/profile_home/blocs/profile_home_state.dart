part of 'profile_home_bloc.dart';

class ProfileHomeState {
  const ProfileHomeState({
    this.isLoading = true,
    this.startDate,
    this.endDate,
    this.photoBase64,
    this.profile,
    this.user,
    this.currentAggregateType = AggregateType.day,
    this.currentXAxisIntervalType = DateTimeIntervalType.hours,
    this.assessments,
    this.aggregateHourAssessmentsByOneDay,
    this.aggregateDayAssessmentsByOneWeek,
    this.aggregateDayAssessmentsByOneMonth,
    this.aggregateMonthAssessmentsByOneYear,
    this.aggregateYearAssessmentsByOneDecade,
    this.comparedAggregateHourAssessmentsByOneDay,
    this.comparedAggregateDayAssessmentsByOneWeek,
    this.comparedAggregateDayAssessmentsByOneMonth,
    this.comparedAggregateMonthAssessmentsByOneYear,
    this.suggestions,
    this.comparedMember,
  });

  final bool isLoading;
  final String? photoBase64;
  final Profile? profile;
  final DateTime? startDate;
  final DateTime? endDate;
  final User? user;
  final AggregateType currentAggregateType;
  final DateTimeIntervalType currentXAxisIntervalType;
  final List<Assessment>? assessments;
  final List<AggregateHourAssessment>? aggregateHourAssessmentsByOneDay;
  final List<AggregateDayAssessment>? aggregateDayAssessmentsByOneWeek;
  final List<AggregateDayAssessment>? aggregateDayAssessmentsByOneMonth;
  final List<AggregateMonthAssessment>? aggregateMonthAssessmentsByOneYear;
  final List<AggregateYearAssessment>? aggregateYearAssessmentsByOneDecade;
  final List<AggregateHourAssessment>? comparedAggregateHourAssessmentsByOneDay;
  final List<AggregateDayAssessment>? comparedAggregateDayAssessmentsByOneWeek;
  final List<AggregateDayAssessment>? comparedAggregateDayAssessmentsByOneMonth;
  final List<AggregateMonthAssessment>? comparedAggregateMonthAssessmentsByOneYear;
  final List<Suggestion>? suggestions;
  final User? comparedMember;

  ProfileHomeState copyWith({
    bool? isLoading,
    DateTime? startDate,
    DateTime? endDate,
    String? photoBase64,
    Profile? profile,
    User? user,
    AggregateType? currentAggregateType,
    DateTimeIntervalType? currentXAxisIntervalType,
    List<Assessment>? assessments,
    List<AggregateHourAssessment>? aggregateHourAssessmentsByOneDay,
    List<AggregateDayAssessment>? aggregateDayAssessmentsByOneWeek,
    List<AggregateDayAssessment>? aggregateDayAssessmentsByOneMonth,
    List<AggregateMonthAssessment>? aggregateMonthAssessmentsByOneYear,
    List<AggregateYearAssessment>? aggregateYearAssessmentsByOneDecade,
    List<AggregateHourAssessment>? comparedAggregateHourAssessmentsByOneDay,
    List<AggregateDayAssessment>? comparedAggregateDayAssessmentsByOneWeek,
    List<AggregateDayAssessment>? comparedAggregateDayAssessmentsByOneMonth,
    List<AggregateMonthAssessment>? comparedAggregateMonthAssessmentsByOneYear,
    List<Suggestion>? suggestions,
    User? comparedMember,
  }) {
    return ProfileHomeState(
      isLoading: isLoading ?? this.isLoading,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      photoBase64: photoBase64 ?? this.photoBase64,
      profile: profile ?? this.profile,
      user: user ?? this.user,
      currentAggregateType: currentAggregateType ?? this.currentAggregateType,
      currentXAxisIntervalType: currentXAxisIntervalType ?? this.currentXAxisIntervalType,
      assessments: assessments ?? this.assessments,
      aggregateHourAssessmentsByOneDay: aggregateHourAssessmentsByOneDay ?? this.aggregateHourAssessmentsByOneDay,
      aggregateDayAssessmentsByOneWeek: aggregateDayAssessmentsByOneWeek ?? this.aggregateDayAssessmentsByOneWeek,
      aggregateDayAssessmentsByOneMonth: aggregateDayAssessmentsByOneMonth ?? this.aggregateDayAssessmentsByOneMonth,
      aggregateMonthAssessmentsByOneYear: aggregateMonthAssessmentsByOneYear ?? this.aggregateMonthAssessmentsByOneYear,
      aggregateYearAssessmentsByOneDecade:
          aggregateYearAssessmentsByOneDecade ?? this.aggregateYearAssessmentsByOneDecade,
      comparedAggregateHourAssessmentsByOneDay:
          comparedAggregateHourAssessmentsByOneDay ?? this.comparedAggregateHourAssessmentsByOneDay,
      comparedAggregateDayAssessmentsByOneWeek:
          comparedAggregateDayAssessmentsByOneWeek ?? this.comparedAggregateDayAssessmentsByOneWeek,
      comparedAggregateDayAssessmentsByOneMonth:
          comparedAggregateDayAssessmentsByOneMonth ?? this.comparedAggregateDayAssessmentsByOneMonth,
      comparedAggregateMonthAssessmentsByOneYear:
          comparedAggregateMonthAssessmentsByOneYear ?? this.comparedAggregateMonthAssessmentsByOneYear,
      suggestions: suggestions ?? this.suggestions,
      comparedMember: comparedMember ?? this.comparedMember,
    );
  }

  ProfileHomeState resetComparedUserData() {
    return ProfileHomeState(
      isLoading: isLoading,
      startDate: startDate,
      endDate: endDate,
      photoBase64: photoBase64,
      profile: profile,
      user: user,
      currentAggregateType: currentAggregateType,
      currentXAxisIntervalType: currentXAxisIntervalType,
      assessments: assessments,
      aggregateHourAssessmentsByOneDay: aggregateHourAssessmentsByOneDay,
      aggregateDayAssessmentsByOneWeek: aggregateDayAssessmentsByOneWeek,
      aggregateDayAssessmentsByOneMonth: aggregateDayAssessmentsByOneMonth,
      aggregateMonthAssessmentsByOneYear: aggregateMonthAssessmentsByOneYear,
      aggregateYearAssessmentsByOneDecade: aggregateYearAssessmentsByOneDecade,
      comparedAggregateHourAssessmentsByOneDay: null,
      comparedAggregateDayAssessmentsByOneWeek: null,
      comparedAggregateDayAssessmentsByOneMonth: null,
      comparedAggregateMonthAssessmentsByOneYear: null,
      suggestions: suggestions,
      comparedMember: null,
    );
  }
}
