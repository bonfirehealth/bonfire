// Flutter imports:
import 'package:flutter/material.dart' hide Notification;

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'notifications_home_event.dart';
part 'notifications_home_state.dart';

class NotificationsHomeBloc
    extends Bloc<NotificationsHomeEvent, NotificationsHomeState> {
  NotificationsHomeBloc() : super(const NotificationsHomeState()) {
    on<NotificationsHomeInitSet>(_onNotificationsHomeInitSet);
    on<NotificationsHomeIsLoadingSet>(_onNotificationsHomeIsLoadingSet);
  }

  Future<void> _onNotificationsHomeInitSet(
    NotificationsHomeInitSet event,
    Emitter<NotificationsHomeState> emit,
  ) async {}

  void _onNotificationsHomeIsLoadingSet(
    NotificationsHomeIsLoadingSet event,
    Emitter<NotificationsHomeState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }
}
