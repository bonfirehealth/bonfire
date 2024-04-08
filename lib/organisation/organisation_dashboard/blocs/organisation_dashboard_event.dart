part of 'organisation_dashboard_bloc.dart';

@immutable
abstract class OrganisationDashboardEvent {
  const OrganisationDashboardEvent();
}

class OrganisationDashboardInitSet extends OrganisationDashboardEvent {
  const OrganisationDashboardInitSet();

  @override
  String toString() => 'OrganisationDashboardInitSet {}';
}

class OrganisationDashboardIsLoadingSet extends OrganisationDashboardEvent {
  const OrganisationDashboardIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'OrganisationDashboardIsLoadingSet {}';
}

class OrganisationDashboardAggregateTypeSet extends OrganisationDashboardEvent {
  const OrganisationDashboardAggregateTypeSet({
    this.aggregateType = AggregateType.day,
  });

  final AggregateType aggregateType;

  @override
  String toString() => 'OrganisationDashboardAggregateTypeSet {}';
}

class OrganisationDashboardXAxisIntervalTypeSet
    extends OrganisationDashboardEvent {
  const OrganisationDashboardXAxisIntervalTypeSet({
    this.currentXAxisIntervalType = DateTimeIntervalType.hours,
  });

  final DateTimeIntervalType currentXAxisIntervalType;

  @override
  String toString() => 'OrganisationDashboardXAxisIntervalTypeSet {}';
}

class OrganisationDashboardVitalSignSet extends OrganisationDashboardEvent {
  const OrganisationDashboardVitalSignSet({
    this.currentVitalSign = VitalSign.stressLevel,
  });

  final VitalSign currentVitalSign;

  @override
  String toString() => 'OrganisationDashboardVitalSignSet {}';
}

class OrganisationDashboardStartDateSet extends OrganisationDashboardEvent {
  const OrganisationDashboardStartDateSet(this.startDate);

  final DateTime startDate;

  @override
  String toString() => 'OrganisationDashboardStartDateSet {}';
}

class OrganisationDashboardEndDateSet extends OrganisationDashboardEvent {
  const OrganisationDashboardEndDateSet(this.endDate);

  final DateTime endDate;

  @override
  String toString() => 'OrganisationDashboardEndDateSet {}';
}

class OrganisationDashboardAllOrganisationUsersByOrganisationGet
    extends OrganisationDashboardEvent {
  const OrganisationDashboardAllOrganisationUsersByOrganisationGet(
    this.context,
  );

  final BuildContext context;

  @override
  String toString() =>
      'OrganisationDashboardAllOrganisationUsersByOrganisationGet {}';
}

class OrganisationDashboardAllSuggestionsByOrganisationGet
    extends OrganisationDashboardEvent {
  const OrganisationDashboardAllSuggestionsByOrganisationGet(this.context);

  final BuildContext context;

  @override
  String toString() =>
      'OrganisationDashboardAllSuggestionsByOrganisationGet {}';
}

class OrganisationDashboardAllAggregateOrganisationAssessmentsByOneDayGet
    extends OrganisationDashboardEvent {
  const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneDayGet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() =>
      'OrganisationDashboardAllAggregateOrganisationAssessmentsByOneDayGet {}';
}

class OrganisationDashboardAllAggregateOrganisationAssessmentsByOneWeekGet
    extends OrganisationDashboardEvent {
  const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneWeekGet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() =>
      'OrganisationDashboardAllAggregateOrganisationAssessmentsByOneWeekGet {}';
}

class OrganisationDashboardAllAggregateOrganisationAssessmentsByOneMonthGet
    extends OrganisationDashboardEvent {
  const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneMonthGet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() =>
      'OrganisationDashboardAllAggregateOrganisationAssessmentsByOneMonthGet {}';
}

class OrganisationDashboardAllAggregateOrganisationAssessmentsByOneYearGet
    extends OrganisationDashboardEvent {
  const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneYearGet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() =>
      'OrganisationDashboardAllAggregateOrganisationAssessmentsByOneYearGet {}';
}

class OrganisationDashboardOrganisationUpdate
    extends OrganisationDashboardEvent {
  const OrganisationDashboardOrganisationUpdate(this.context);

  final BuildContext context;

  @override
  String toString() => 'OrganisationDashboardOrganisationUpdate {}';
}

class OrganisationDashboardAggregateAssessmentsGet
    extends OrganisationDashboardEvent {
  const OrganisationDashboardAggregateAssessmentsGet();

  @override
  String toString() => 'OrganisationDashboardAggregateAssessmentsGet {}';
}
