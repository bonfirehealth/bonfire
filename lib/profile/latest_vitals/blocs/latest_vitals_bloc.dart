// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'latest_vitals_state.dart';
part 'latest_vitals_event.dart';

class LatestVitalsBloc extends Bloc<LatestVitalsEvent, LatestVitalsState> {
  LatestVitalsBloc() : super(const LatestVitalsState()) {
    on<LatestVitalsInitSet>(_onLatestVitalsInitSet);
  }

  Future<void> _onLatestVitalsInitSet(
    LatestVitalsInitSet event,
    Emitter<LatestVitalsState> emit,
  ) async {
    final profile = await ProfileRepo.getProfile();
    final assessments = profile?.item1?.assessments;

    if (assessments == null || assessments.isEmpty) {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
    } else {
      // We should build a Lambda function for this aggregation?
      Assessment? latestAssessment;
      for (var i = 0; i < assessments.length; i++) {
        final item = assessments[i];
        if (CoreRepo.profileId != item.profileID) {
          continue;
        }

        if (latestAssessment == null) {
          latestAssessment = item;
          continue;
        }

        if (item.updatedAt!.compareTo(latestAssessment.updatedAt!) >= 0) {
          latestAssessment = assessments[i];
        }
      }

      emit(
        state.copyWith(
          isLoading: false,
          assessment: latestAssessment,
        ),
      );
    }
  }
}
