// Flutter imports:
// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart' hide Emitter;
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'profile_home_event.dart';
part 'profile_home_state.dart';

class ProfileHomeBloc extends Bloc<ProfileHomeEvent, ProfileHomeState> {
  ProfileHomeBloc() : super(const ProfileHomeState()) {
    on<ProfileHomeInitSet>(_onProfileHomeInitSet);
    on<ProfileHomeIsLoadingSet>(_onProfileHomeIsLoadingSet);
    on<ProfileHomeProfilePhotoSelect>(_onProfileHomeProfilePhotoSelect);
    on<ProfileHomeSignOut>(_onProfileHomeSignOut);
    on<ProfileHomeAggregateTypeSet>(_onProfileHomeAggregateTypeSet);
    on<ProfileHomeAggregateHourAssessmentsForOneDaySet>(
      _onProfileHomeAggregateHourAssessmentsForOneDaySet,
    );
    on<ProfileHomeAggregateHourAssessmentsPreviousDaySet>(
      _onProfileHomeAggregateHourAssessmentsForPreviousDaySet,
    );
    on<ProfileHomeAggregateHourAssessmentsNextDaySet>(
      _onProfileHomeAggregateHourAssessmentsForNextDaySet,
    );
    on<ProfileHomeAggregateDayAssessmentsForOneWeekSet>(
      _onProfileHomeAggregateDayAssessmentsForOneWeekSet,
    );
    on<ProfileHomeAggregateDayAssessmentsForOneMonthSet>(
      _onProfileHomeAggregateDayAssessmentsForOneMonthSet,
    );
    on<ProfileHomeAggregateMonthAssessmentsForOneYearSet>(
      _onProfileHomeAggregateMonthAssessmentsForOneYearSet,
    );
    on<ProfileHomeComparedMemberSet>(_onProfileHomeComparedMemberSet);
  }

  User? get user => state.user;

  Future<void> _onProfileHomeInitSet(
    ProfileHomeInitSet event,
    Emitter<ProfileHomeState> emit,
  ) async {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day);
    final endDate = startDate.toUtc().add(const Duration(days: 1));
    final sharedPrefs = await SharedPreferences.getInstance();
    final response = await UserRepo.getUser();
    final user = response?.item1;
    final userId = user?.getId();
    var organisationId = '';
    if (userId == null) {
      return;
    }

    await sharedPrefs.setString('user_id', userId);
    if (FlavorConfig.instance != null) {
      await MixpanelHelper.init(FlavorConfig.instance!.flavor);
      MixpanelHelper.mixpanel?.identify(userId);
    }

    if (user != null) {
      if (user.organisations != null) {
        final userOrganisation = user.organisations?[0];
        final themeColor =
            userOrganisation?.organisation.themeColor ?? AppConstant.themeColor;
        organisationId = userOrganisation!.organisation.id;
        await sharedPrefs.setString('organisation_theme_color', themeColor);
        if (organisationId != '') {
          await sharedPrefs.setString('organisation_id', organisationId);
        }
      }

      if (user.profile?.getId() != null) {
        await sharedPrefs.setString(
          'profile_id',
          user.profile?.getId() ?? '',
        );
      }
    }

    emit(
      state.copyWith(
        isLoading: false,
        startDate: startDate.toUtc(),
        endDate: endDate,
        assessments: user?.profile?.assessments,
        profile: user?.profile,
        user: user,
        photoBase64: user?.photoBase64,
        suggestions:
            await SuggestionRepo.getAllSuggestionsByOrganisationAndStressLevel(
          organisationId: organisationId,
          stressLevel: getStressLevel(user!.profile?.stressLevel),
        ),
      ),
    );
  }

  void _onProfileHomeIsLoadingSet(
    ProfileHomeIsLoadingSet event,
    Emitter<ProfileHomeState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  void _onProfileHomeComparedMemberSet(
    ProfileHomeComparedMemberSet event,
    Emitter<ProfileHomeState> emit,
  ) {
    final alreadySelected = state.comparedMember?.id == event.user.id;
    if (alreadySelected) {
      emit(state.resetComparedUserData());
    } else {
      emit(state.copyWith(comparedMember: event.user));
      add(ProfileHomeAggregateTypeSet(
          aggregateType: state.currentAggregateType));
    }
  }

  Future<void> _onProfileHomeProfilePhotoSelect(
    ProfileHomeProfilePhotoSelect event,
    Emitter<ProfileHomeState> emit,
  ) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      final imageBytes = result.files.single.bytes;
      if (imageBytes != null) {
        final imageBase64 = convertUint8ListToBase64String(imageBytes);
        final user = await UserRepo.getUser();
        await UserRepo.updateUser(
          photoBase64: imageBase64,
          version: user?.item2 ?? 0,
        );

        emit(
          state.copyWith(
            photoBase64: imageBase64,
          ),
        );
      }
    }
  }

  Future<void> _onProfileHomeSignOut(
    ProfileHomeSignOut event,
    Emitter<ProfileHomeState> emit,
  ) async {
    final context = event.context;
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    await MixpanelHelper.init(FlavorConfig.instance!.flavor);
    MixpanelHelper.mixpanel?.reset();
    await Amplify.Auth.signOut();
    context.read<AppBloc>().add(
          AppReplaceRoute(
            context,
            EnterOrganisationCodeRoute(),
          ),
        );
  }

  Future<void> _onProfileHomeAggregateTypeSet(
    ProfileHomeAggregateTypeSet event,
    Emitter<ProfileHomeState> emit,
  ) async {
    emit(state.copyWith(currentAggregateType: event.aggregateType));

    switch (state.currentAggregateType) {
      case AggregateType.day:
        add(const ProfileHomeAggregateHourAssessmentsForOneDaySet());
        break;
      case AggregateType.week:
        add(const ProfileHomeAggregateDayAssessmentsForOneWeekSet());
        break;
      case AggregateType.month:
        add(const ProfileHomeAggregateDayAssessmentsForOneMonthSet());
        break;
      case AggregateType.year:
        add(const ProfileHomeAggregateMonthAssessmentsForOneYearSet());
        break;
      case AggregateType.allTime:
        break;
    }
  }

  Future<void> _onProfileHomeAggregateHourAssessmentsForOneDaySet(
    ProfileHomeAggregateHourAssessmentsForOneDaySet event,
    Emitter<ProfileHomeState> emit,
  ) async {
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, now.day);
    final endDate = startDate.toUtc().add(const Duration(days: 1));

    emit(
      state.copyWith(
        aggregateHourAssessmentsByOneDay: await AggregateHourAssessmentRepo
            .getAllAggregateHourAssessmentsByProfileAndDates(
          startDate.toUtc(),
          endDate.toUtc(),
          profileId: CoreRepo.profileId,
        ),
        comparedAggregateHourAssessmentsByOneDay: state.comparedMember == null
            ? []
            : await AggregateHourAssessmentRepo
                .getAllAggregateHourAssessmentsByProfileAndDates(
                startDate.toUtc(),
                endDate.toUtc(),
                profileId: state.comparedMember!.id,
              ),
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

  Future<void> _onProfileHomeAggregateHourAssessmentsForPreviousDaySet(
    ProfileHomeAggregateHourAssessmentsPreviousDaySet event,
    Emitter<ProfileHomeState> emit,
  ) async {
    final prevStartDate = state.startDate ?? DateTime.now();
    final startDate = prevStartDate.subtract(const Duration(days: 1));
    final endDate = prevStartDate;

    emit(
      state.copyWith(
        aggregateHourAssessmentsByOneDay: await AggregateHourAssessmentRepo
            .getAllAggregateHourAssessmentsByProfileAndDates(
          startDate.toUtc(),
          endDate.toUtc(),
          profileId: CoreRepo.profileId,
        ),
        comparedAggregateHourAssessmentsByOneDay: state.comparedMember == null
            ? []
            : await AggregateHourAssessmentRepo
                .getAllAggregateHourAssessmentsByProfileAndDates(
                startDate.toUtc(),
                endDate.toUtc(),
                profileId: state.comparedMember!.id,
              ),
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

  Future<void> _onProfileHomeAggregateHourAssessmentsForNextDaySet(
    ProfileHomeAggregateHourAssessmentsNextDaySet event,
    Emitter<ProfileHomeState> emit,
  ) async {
    final prevEndDate = state.endDate ?? DateTime.now();
    final endDate = prevEndDate.add(const Duration(days: 1));
    final startDate = prevEndDate;

    emit(
      state.copyWith(
        aggregateHourAssessmentsByOneDay: await AggregateHourAssessmentRepo
            .getAllAggregateHourAssessmentsByProfileAndDates(
          startDate.toUtc(),
          endDate.toUtc(),
          profileId: CoreRepo.profileId,
        ),
        comparedAggregateHourAssessmentsByOneDay: state.comparedMember == null
            ? []
            : await AggregateHourAssessmentRepo
                .getAllAggregateHourAssessmentsByProfileAndDates(
                startDate.toUtc(),
                endDate.toUtc(),
                profileId: state.comparedMember!.id,
              ),
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

  Future<void> _onProfileHomeAggregateDayAssessmentsForOneWeekSet(
    ProfileHomeAggregateDayAssessmentsForOneWeekSet event,
    Emitter<ProfileHomeState> emit,
  ) async {
    final now = DateTime.now();
    final startDate = LogicHelper.findFirstDateOfTheWeek(now);
    final endDate = LogicHelper.findLastDateOfTheWeek(now);
    emit(
      state.copyWith(
        aggregateDayAssessmentsByOneWeek: await AggregateDayAssessmentRepo
            .getAllAggregateDayAssessmentsByProfileAndDates(
          DateTime(startDate.year, startDate.month, startDate.day).toUtc(),
          DateTime(endDate.year, endDate.month, endDate.day).toUtc(),
          profileId: CoreRepo.profileId,
        ),
        comparedAggregateDayAssessmentsByOneWeek: state.comparedMember == null
            ? []
            : await AggregateDayAssessmentRepo
                .getAllAggregateDayAssessmentsByProfileAndDates(
                DateTime(startDate.year, startDate.month, startDate.day)
                    .toUtc(),
                DateTime(endDate.year, endDate.month, endDate.day).toUtc(),
                profileId: state.comparedMember!.id,
              ),
      ),
    );

    if (event.setAggregateType) {
      emit(
        state.copyWith(
          startDate: DateTime(startDate.year, startDate.month, startDate.day),
          endDate: DateTime(endDate.year, endDate.month, endDate.day),
          currentAggregateType: AggregateType.week,
          currentXAxisIntervalType: DateTimeIntervalType.days,
        ),
      );
    }
  }

  Future<void> _onProfileHomeAggregateDayAssessmentsForOneMonthSet(
    ProfileHomeAggregateDayAssessmentsForOneMonthSet event,
    Emitter<ProfileHomeState> emit,
  ) async {
    final now = DateTime.now();
    final startDate = LogicHelper.findFirstDateOfTheMonth(
      DateTime(now.year, now.month, now.day),
    );
    final endDate = LogicHelper.findLastDateOfTheMonth(
      DateTime(now.year, now.month, now.day),
    );

    emit(
      state.copyWith(
        aggregateDayAssessmentsByOneMonth: await AggregateDayAssessmentRepo
            .getAllAggregateDayAssessmentsByProfileAndDates(
          startDate,
          endDate.add(const Duration(days: 1)),
          profileId: CoreRepo.profileId,
        ),
        comparedAggregateDayAssessmentsByOneMonth: state.comparedMember == null
            ? []
            : await AggregateDayAssessmentRepo
                .getAllAggregateDayAssessmentsByProfileAndDates(
                startDate,
                endDate.add(const Duration(days: 1)),
                profileId: state.comparedMember!.id,
              ),
      ),
    );

    if (event.setAggregateType) {
      emit(
        state.copyWith(
          startDate: startDate,
          endDate: endDate,
          currentAggregateType: AggregateType.month,
          currentXAxisIntervalType: DateTimeIntervalType.days,
        ),
      );
    }
  }

  Future<void> _onProfileHomeAggregateMonthAssessmentsForOneYearSet(
    ProfileHomeAggregateMonthAssessmentsForOneYearSet event,
    Emitter<ProfileHomeState> emit,
  ) async {
    final now = DateTime.now();
    final startDate = LogicHelper.findFirstDateOfTheYear(
      DateTime(now.year, now.month, now.day).toUtc(),
    );
    final endDate = LogicHelper.findLastDateOfTheYear(
      DateTime(now.year, now.month, now.day).toUtc(),
    );

    emit(
      state.copyWith(
        aggregateMonthAssessmentsByOneYear: await AggregateMonthAssessmentRepo
            .getAllAggregateMonthAssessmentsByProfileAndDates(
          startDate.toUtc(),
          endDate.toUtc(),
          profileId: CoreRepo.profileId,
        ),
        comparedAggregateMonthAssessmentsByOneYear: state.comparedMember == null
            ? []
            : await AggregateMonthAssessmentRepo
                .getAllAggregateMonthAssessmentsByProfileAndDates(
                startDate.toUtc(),
                endDate.toUtc(),
                profileId: state.comparedMember!.id,
              ),
      ),
    );

    if (event.setAggregateType) {
      emit(
        state.copyWith(
          startDate: startDate,
          endDate: endDate,
          currentAggregateType: AggregateType.year,
          currentXAxisIntervalType: DateTimeIntervalType.months,
        ),
      );
    }
  }
}
