part of 'notifications_home_bloc.dart';

@immutable
abstract class NotificationsHomeEvent {
  const NotificationsHomeEvent();
}

class NotificationsHomeInitSet extends NotificationsHomeEvent {
  const NotificationsHomeInitSet();

  @override
  String toString() => 'NotificationsHomeInitSet {}';
}

class NotificationsHomeIsLoadingSet extends NotificationsHomeEvent {
  const NotificationsHomeIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'NotificationsHomeIsLoadingSet {}';
}
