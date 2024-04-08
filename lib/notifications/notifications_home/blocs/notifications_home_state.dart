part of 'notifications_home_bloc.dart';

class NotificationsHomeState {
  const NotificationsHomeState({
    this.isLoading = false,
    this.notifications,
  });

  final bool isLoading;
  final List<Notification>? notifications;

  NotificationsHomeState copyWith({
    bool? isLoading,
    List<Notification>? notifications,
  }) {
    return NotificationsHomeState(
      isLoading: isLoading ?? this.isLoading,
      notifications: notifications ?? this.notifications,
    );
  }
}
