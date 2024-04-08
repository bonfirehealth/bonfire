part of 'profile_home_bloc.dart';

@immutable
abstract class ProfileHomeEvent {
  const ProfileHomeEvent();
}

class ProfileHomeInitSet extends ProfileHomeEvent {
  const ProfileHomeInitSet();

  @override
  String toString() => 'ProfileHomeInitSet {}';
}

class ProfileHomeIsLoadingSet extends ProfileHomeEvent {
  const ProfileHomeIsLoadingSet({this.isLoading = true});

  final bool isLoading;

  @override
  String toString() => 'ProfileHomeIsLoadingSet {}';
}

class ProfileHomeComparedMemberSet extends ProfileHomeEvent {
  const ProfileHomeComparedMemberSet(this.user);

  final User user;
  @override
  String toString() => 'ProfileHomeComparedMemberSet {}';
}

class ProfileHomeProfilePhotoSelect extends ProfileHomeEvent {
  const ProfileHomeProfilePhotoSelect();

  @override
  String toString() => 'ProfileHomeProfilePhotoSelect {}';
}


class ProfileHomeSignOut extends ProfileHomeEvent {
  const ProfileHomeSignOut(this.context);

  final BuildContext context;

  @override
  String toString() => 'ProfileHomeSignOut {}';
}

class ProfileHomeAggregateTypeSet extends ProfileHomeEvent {
  const ProfileHomeAggregateTypeSet({this.aggregateType = AggregateType.day});

  final AggregateType aggregateType;

  @override
  String toString() => 'ProfileHomeAggregateTypeSet {}';
}

class ProfileHomeAggregateHourAssessmentsForOneDaySet extends ProfileHomeEvent {
  const ProfileHomeAggregateHourAssessmentsForOneDaySet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() => 'ProfileHomeAggregateHourAssessmentsForOneDaySet {}';
}

class ProfileHomeAggregateHourAssessmentsPreviousDaySet extends ProfileHomeEvent {
  const ProfileHomeAggregateHourAssessmentsPreviousDaySet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() => 'ProfileHomeAggregateHourAssessmentsPreviousDaySet {}';
}

class ProfileHomeAggregateHourAssessmentsNextDaySet extends ProfileHomeEvent {
  const ProfileHomeAggregateHourAssessmentsNextDaySet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() => 'ProfileHomeAggregateHourAssessmentsNextDaySet {}';
}


class ProfileHomeAggregateDayAssessmentsForOneWeekSet extends ProfileHomeEvent {
  const ProfileHomeAggregateDayAssessmentsForOneWeekSet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() => 'ProfileHomeAggregateDayAssessmentsForOneWeekSet {}';
}

class ProfileHomeAggregateDayAssessmentsForOneMonthSet
    extends ProfileHomeEvent {
  const ProfileHomeAggregateDayAssessmentsForOneMonthSet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() => 'ProfileHomeAggregateDayAssessmentsForOneMonthSet {}';
}

class ProfileHomeAggregateMonthAssessmentsForOneYearSet
    extends ProfileHomeEvent {
  const ProfileHomeAggregateMonthAssessmentsForOneYearSet({
    this.setAggregateType = true,
  });

  final bool setAggregateType;

  @override
  String toString() => 'ProfileHomeAggregateMonthAssessmentsForOneYearSet {}';
}
