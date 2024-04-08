// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'complete_profile_event.dart';
part 'complete_profile_state.dart';

class CompleteProfileBloc extends Bloc<CompleteProfileEvent, CompleteProfileState> {
  CompleteProfileBloc() : super(const CompleteProfileState()) {
    on<CompleteProfileInitSet>(_onCompleteProfileInitSet);
    on<CompleteProfileIsLoadingSet>(_onCompleteProfileIsLoadingSet);
    on<CompleteProfileGenderSet>(_onCompleteProfileGenderSet);
    on<CompleteProfileAgeSet>(_onCompleteProfileAgeSet);
    on<CompleteProfileHeightSet>(_onCompleteProfileHeightSet);
    on<CompleteProfileWeightSet>(_onCompleteProfileWeightSet);
    on<CompleteProfileFormSubmit>(_onCompleteProfileFormSubmit);
  }

  Future<void> _onCompleteProfileInitSet(
    CompleteProfileInitSet event,
    Emitter<CompleteProfileState> emit,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    emit(
      state.copyWith(
        isLoading: false,
        gender: event.profile?.gender,
        age: event.profile?.age,
        weight: event.profile?.weight?.toInt(),
        height: event.profile?.height?.toInt(),
      ),
    );
  }

  void _onCompleteProfileIsLoadingSet(
    CompleteProfileIsLoadingSet event,
    Emitter<CompleteProfileState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  Future<void> _onCompleteProfileGenderSet(
    CompleteProfileGenderSet event,
    Emitter<CompleteProfileState> emit,
  ) async {
    emit(state.copyWith(gender: event.gender));
  }

  Future<void> _onCompleteProfileAgeSet(
    CompleteProfileAgeSet event,
    Emitter<CompleteProfileState> emit,
  ) async {
    emit(state.copyWith(age: event.age));
  }

  Future<void> _onCompleteProfileHeightSet(
    CompleteProfileHeightSet event,
    Emitter<CompleteProfileState> emit,
  ) async {
    emit(state.copyWith(height: event.height));
  }

  Future<void> _onCompleteProfileWeightSet(
    CompleteProfileWeightSet event,
    Emitter<CompleteProfileState> emit,
  ) async {
    emit(state.copyWith(weight: event.weight));
  }

  Future<void> _onCompleteProfileFormSubmit(
    CompleteProfileFormSubmit event,
    Emitter<CompleteProfileState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>()
      ..add(AppInfoMessageSet(context, '', ''))
      ..add(
        const AppIsLoadingSet(),
      );
    await onAllowPushNotifications(context);
    final bodyMassIndex = LogicHelper.calculateBodyMassIndex(
      state.weight.toDouble(),
      state.height.toDouble(),
    );

    int? version;
    if (event.isEdit) {
      final response = await ProfileRepo.getProfile();
      version = response?.item2;
    }

    final profile = await ProfileRepo.updateProfile(
      age: state.age,
      gender: state.gender,
      height: state.height.toDouble(),
      heightUnit: state.heightUnit,
      heightUnitName: state.heightUnitName,
      weight: state.weight.toDouble(),
      weightUnit: state.weightUnit,
      weightUnitName: state.weightUnitName,
      bodyMassIndex: bodyMassIndex,
      version: version,
    );
    logInfo(profile);
    appBloc.add(const AppIsLoadingSet(isLoading: false));
    await context.router.replace(const GeneratedCredentialsRoute());
  }
}
