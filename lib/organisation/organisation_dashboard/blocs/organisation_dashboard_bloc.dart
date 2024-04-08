// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/organisation/organisation.dart';
import 'package:bonfirehealth/profile/family_plan/user_type_enum.dart';

part 'organisation_dashboard_event.dart';
part 'organisation_dashboard_state.dart';

class OrganisationDashboardBloc
    extends Bloc<OrganisationDashboardEvent, OrganisationDashboardState> {
  OrganisationDashboardBloc() : super(const OrganisationDashboardState()) {
    on<OrganisationDashboardInitSet>(_onOrganisationDashboardInitSet);
    on<OrganisationDashboardIsLoadingSet>(_onOrganisationDashboardIsLoadingSet);
    on<OrganisationDashboardAggregateTypeSet>(
      _onOrganisationDashboardAggregateTypeSet,
    );
    on<OrganisationDashboardXAxisIntervalTypeSet>(
      _onOrganisationDashboardXAxisIntervalTypeSet,
    );
    on<OrganisationDashboardVitalSignSet>(_onOrganisationDashboardVitalSignSet);
    on<OrganisationDashboardStartDateSet>(_onOrganisationDashboardStartDateSet);
    on<OrganisationDashboardEndDateSet>(_onOrganisationDashboardEndDateSet);
    on<OrganisationDashboardAllOrganisationUsersByOrganisationGet>(
      _onOrganisationDashboardAllOrganisationUsersByOrganisationGet,
    );
    on<OrganisationDashboardAllSuggestionsByOrganisationGet>(
      _onOrganisationDashboardAllSuggestionsByOrganisationGet,
    );
    on<OrganisationDashboardAllAggregateOrganisationAssessmentsByOneDayGet>(
      _onOrganisationDashboardAllAggregateOrganisationAssessmentsByOneDayGet,
    );
    on<OrganisationDashboardAllAggregateOrganisationAssessmentsByOneWeekGet>(
      _onOrganisationDashboardAllAggregateOrganisationAssessmentsByOneWeekGet,
    );
    on<OrganisationDashboardAllAggregateOrganisationAssessmentsByOneMonthGet>(
      _onOrganisationDashboardAllAggregateOrganisationAssessmentsByOneMonthGet,
    );
    on<OrganisationDashboardAllAggregateOrganisationAssessmentsByOneYearGet>(
      _onOrganisationDashboardAllAggregateOrganisationAssessmentsByOneYearGet,
    );
    on<OrganisationDashboardOrganisationUpdate>(
      _onOrganisationDashboardOrganisationUpdate,
    );
  }

  Future<void> _onOrganisationDashboardInitSet(
    OrganisationDashboardInitSet event,
    Emitter<OrganisationDashboardState> emit,
  ) async {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day);
    final endDate = startDate.toUtc().add(const Duration(days: 1));
    emit(
      state.copyWith(
        startDate: startDate.toUtc(),
        endDate: endDate,
      ),
    );
  }

  void _onOrganisationDashboardIsLoadingSet(
    OrganisationDashboardIsLoadingSet event,
    Emitter<OrganisationDashboardState> emit,
  ) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  Future<void> _onOrganisationDashboardAggregateTypeSet(
    OrganisationDashboardAggregateTypeSet event,
    Emitter<OrganisationDashboardState> emit,
  ) async {
    emit(state.copyWith(currentAggregateType: event.aggregateType));

    switch (state.currentAggregateType) {
      case AggregateType.day:
        add(const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneDayGet());
        break;
      case AggregateType.week:
        add(const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneWeekGet());
        break;
      case AggregateType.month:
        add(const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneMonthGet());
        break;
      case AggregateType.year:
        add(const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneYearGet());
        break;
      case AggregateType.allTime:
        break;
    }
  }

  void _onOrganisationDashboardXAxisIntervalTypeSet(
    OrganisationDashboardXAxisIntervalTypeSet event,
    Emitter<OrganisationDashboardState> emit,
  ) {
    emit(
      state.copyWith(
        currentXAxisIntervalType: event.currentXAxisIntervalType,
      ),
    );
  }

  void _onOrganisationDashboardVitalSignSet(
    OrganisationDashboardVitalSignSet event,
    Emitter<OrganisationDashboardState> emit,
  ) {
    emit(state.copyWith(currentVitalSign: event.currentVitalSign));
  }

  void _onOrganisationDashboardStartDateSet(
    OrganisationDashboardStartDateSet event,
    Emitter<OrganisationDashboardState> emit,
  ) {
    emit(state.copyWith(startDate: event.startDate));
  }

  void _onOrganisationDashboardEndDateSet(
    OrganisationDashboardEndDateSet event,
    Emitter<OrganisationDashboardState> emit,
  ) {
    emit(state.copyWith(endDate: event.endDate));
  }

  Future<void> _onOrganisationDashboardAllOrganisationUsersByOrganisationGet(
    OrganisationDashboardAllOrganisationUsersByOrganisationGet event,
    Emitter<OrganisationDashboardState> emit,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var organisationId = sharedPrefs.getString('organisation_id');

    organisationId ??=
        event.context.read<OrganisationProfileBloc>().organisationId;

    final forFamilyMembers = event.context.read<OrganisationHomeBloc>().state.isFamilyMembersTab;
    final userType = forFamilyMembers ? UserTypeEnum.familyMember : UserTypeEnum.organisationEmployee;

    final now = DateTime.now();
    final todayDate = DateTime(now.year, now.month, now.day);
    final startWeekDate = LogicHelper.findFirstDateOfTheWeek(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final endWeekDate = LogicHelper.findLastDateOfTheWeek(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final startMonthDate = LogicHelper.findFirstDateOfTheMonth(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final endMonthDate = LogicHelper.findLastDateOfTheMonth(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final startYearDate = LogicHelper.findFirstDateOfTheYear(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final endYearDate = LogicHelper.findLastDateOfTheYear(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final organisationUsers =
        await OrganisationRepo.getAllOrganisationUsersByOrganisation(
      organisationId!,
      hourStartDate: todayDate.toUtc(),
      hourEndDate: todayDate.toUtc().add(const Duration(days: 1)),
      dayStartDate: startWeekDate,
      dayEndDate: endWeekDate,
      monthStartDate: startMonthDate,
      monthEndDate: endMonthDate,
      yearStartDate: startYearDate,
      yearEndDate: endYearDate,
    );
    if(organisationUsers!=null && organisationUsers.isNotEmpty){
      organisationUsers.forEach((element) {print(element.user.deletedAt?.toString());});
      organisationUsers.removeWhere((element) => element.user.deletedAt!=null);
    }

    emit(
      state.copyWith(
        organisationUsers: organisationUsers,
        totalNumberOfActiveUsers:
            OrganisationDashboardHelper.calculateTotalNumberOfActiveUsers(
          organisationUsers,
              userType: userType
        ),
        totalNumberOfUsers:
            OrganisationDashboardHelper.calculateTotalNumberOfUsers(
          organisationUsers,
                userType: userType
        ),
        totalNumberOfCompletedScreenings: OrganisationDashboardHelper
            .calculateTotalNumberOfCompletedScreenings(organisationUsers, userType: userType),
        totalNumberOfIncompletedScreenings: OrganisationDashboardHelper
            .calculateTotalNumberOfIncompletedScreenings(organisationUsers, userType: userType),
      ),
    );
  }

  Future<void> _onOrganisationDashboardAllSuggestionsByOrganisationGet(
    OrganisationDashboardAllSuggestionsByOrganisationGet event,
    Emitter<OrganisationDashboardState> emit,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var organisationId = sharedPrefs.getString('organisation_id');
    organisationId ??=
        event.context.read<OrganisationProfileBloc>().organisationId;
    final suggestions = await SuggestionRepo.getAllSuggestionsByOrganisation(
      organisationId!,
    );

    emit(
      state.copyWith(
        suggestions: suggestions,
        totalNumberOfSuggestionsClicked: OrganisationDashboardHelper
            .calculateTotalNumberOfSuggestionsClicked(suggestions),
        totalNumberOfSuggestionsViewed:
            OrganisationDashboardHelper.calculateTotalNumberOfSuggestionsViewed(
          suggestions,
        ),
        totalNumberOfEAPSuggestionsClicked: OrganisationDashboardHelper
            .calculateTotalNumberOfEAPSuggestionsClicked(suggestions),
      ),
    );
  }

  Future<void>
      _onOrganisationDashboardAllAggregateOrganisationAssessmentsByOneDayGet(
    OrganisationDashboardAllAggregateOrganisationAssessmentsByOneDayGet event,
    Emitter<OrganisationDashboardState> emit,
  ) async {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day).toUtc();
    final endDate = startDate.add(const Duration(days: 1));
    final aggregateOrganisationAssessments =
        await AggregateHourOrganisationAssessmentRepo
            .getAllAggregateHourOrganisationAssessmentsByOrganisationAndDates(
      startDate,
      endDate,
    );

    var numberOfProfiles = 0;

    if (aggregateOrganisationAssessments != null &&
        aggregateOrganisationAssessments.isNotEmpty) {
      numberOfProfiles =
          aggregateOrganisationAssessments[0].numberOfProfiles ?? 0;
    }

    emit(
      state.copyWith(
        aggregateHourOrganisationAssessmentsByOneDay:
            aggregateOrganisationAssessments,
        totalNumberOfCompletedScreeningUsers: numberOfProfiles,
      ),
    );

    if (event.setAggregateType) {
      emit(
        state.copyWith(
          startDate: startDate,
          endDate: endDate,
          currentAggregateType: AggregateType.day,
          currentXAxisIntervalType: DateTimeIntervalType.hours,
        ),
      );
    }
  }

  Future<void>
      _onOrganisationDashboardAllAggregateOrganisationAssessmentsByOneWeekGet(
    OrganisationDashboardAllAggregateOrganisationAssessmentsByOneWeekGet event,
    Emitter<OrganisationDashboardState> emit,
  ) async {
    final now = DateTime.now();
    final startWeekDate = LogicHelper.findFirstDateOfTheWeek(
      DateTime(now.year, now.month, now.day),
    );
    final endWeekDate = LogicHelper.findLastDateOfTheWeek(
      DateTime(now.year, now.month, now.day),
    );
    final aggregateOrganisationAssessments =
        await AggregateDayOrganisationAssessmentRepo
            .getAllAggregateDayOrganisationAssessmentsByOrganisationAndDates(
      startWeekDate,
      endWeekDate,
    );
    var numberOfProfiles = 0;

    if (aggregateOrganisationAssessments != null &&
        aggregateOrganisationAssessments.isNotEmpty) {
      numberOfProfiles =
          aggregateOrganisationAssessments[0].numberOfProfiles ?? 0;
    }

    emit(
      state.copyWith(
        aggregateDayOrganisationAssessmentsByOneWeek:
            aggregateOrganisationAssessments,
        totalNumberOfCompletedScreeningUsers: numberOfProfiles,
      ),
    );

    if (event.setAggregateType) {
      emit(
        state.copyWith(
          startDate: startWeekDate,
          endDate: endWeekDate,
          currentAggregateType: AggregateType.week,
          currentXAxisIntervalType: DateTimeIntervalType.days,
        ),
      );
    }
  }

  Future<void>
      _onOrganisationDashboardAllAggregateOrganisationAssessmentsByOneMonthGet(
    OrganisationDashboardAllAggregateOrganisationAssessmentsByOneMonthGet event,
    Emitter<OrganisationDashboardState> emit,
  ) async {
    final now = DateTime.now();
    final startMonthDate = LogicHelper.findFirstDateOfTheMonth(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final endMonthDate = LogicHelper.findLastDateOfTheMonth(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final aggregateOrganisationAssessments =
        await AggregateDayOrganisationAssessmentRepo
            .getAllAggregateDayOrganisationAssessmentsByOrganisationAndDates(
      startMonthDate,
      endMonthDate,
    );
    var numberOfProfiles = 0;

    if (aggregateOrganisationAssessments != null &&
        aggregateOrganisationAssessments.isNotEmpty) {
      numberOfProfiles =
          aggregateOrganisationAssessments[0].numberOfProfiles ?? 0;
    }

    emit(
      state.copyWith(
        aggregateDayOrganisationAssessmentsByOneMonth:
            aggregateOrganisationAssessments,
        totalNumberOfCompletedScreeningUsers: numberOfProfiles,
      ),
    );

    if (event.setAggregateType) {
      emit(
        state.copyWith(
          startDate: startMonthDate,
          endDate: endMonthDate,
          currentAggregateType: AggregateType.month,
          currentXAxisIntervalType: DateTimeIntervalType.days,
        ),
      );
    }
  }

  Future<void>
      _onOrganisationDashboardAllAggregateOrganisationAssessmentsByOneYearGet(
    OrganisationDashboardAllAggregateOrganisationAssessmentsByOneYearGet event,
    Emitter<OrganisationDashboardState> emit,
  ) async {
    final now = DateTime.now();
    final startYearDate = LogicHelper.findFirstDateOfTheYear(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final endYearDate = LogicHelper.findLastDateOfTheYear(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final aggregateOrganisationAssessments =
        await AggregateMonthOrganisationAssessmentRepo
            .getAllAggregateMonthOrganisationAssessmentsByOrganisationAndDates(
      startYearDate,
      endYearDate,
    );
    var numberOfProfiles = 0;

    if (aggregateOrganisationAssessments != null &&
        aggregateOrganisationAssessments.isNotEmpty) {
      numberOfProfiles =
          aggregateOrganisationAssessments[0].numberOfProfiles ?? 0;
    }

    emit(
      state.copyWith(
        aggregateMonthOrganisationAssessmentsByOneYear:
            aggregateOrganisationAssessments,
        totalNumberOfCompletedScreeningUsers: numberOfProfiles,
      ),
    );

    if (event.setAggregateType) {
      emit(
        state.copyWith(
          startDate: startYearDate,
          endDate: endYearDate,
          currentAggregateType: AggregateType.year,
          currentXAxisIntervalType: DateTimeIntervalType.months,
        ),
      );
    }
  }

  Future<void> _onOrganisationDashboardOrganisationUpdate(
    OrganisationDashboardOrganisationUpdate event,
    Emitter<OrganisationDashboardState> emit,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var organisationId = sharedPrefs.getString('organisation_id');
    organisationId ??=
        event.context.read<OrganisationProfileBloc>().organisationId;
    await OrganisationRepo.updateOrganisation(
      organisationId: organisationId,
      totalNumberOfActiveUsers: state.totalNumberOfActiveUsers,
      totalNumberOfUsers: state.totalNumberOfUsers,
      totalNumberOfCompletedScreenings: state.totalNumberOfCompletedScreenings,
      totalNumberOfIncompletedScreenings:
          state.totalNumberOfIncompletedScreenings,
      totalNumberOfSuggestionsClicked: state.totalNumberOfSuggestionsClicked,
      totalNumberOfSuggestionsViewed: state.totalNumberOfSuggestionsViewed,
    );
  }
}
