part of 'chats_home_bloc.dart';

enum ChatsHomeStatus {
  initial,
  asked,
  responding,
  done,
}

class ChatsHomeState {
  const ChatsHomeState({
    required this.user,
    this.message = const <types.Message>[],
    this.status = ChatsHomeStatus.initial,
    this.error = '',
  });

  final types.User user;
  final List<types.Message> message;
  final ChatsHomeStatus? status;
  final String? error;

  ChatsHomeState copyWith({
    List<types.Message>? message,
    ChatsHomeStatus? status,
    String? error,
  }) {
    return ChatsHomeState(
      user: user,
      message: message ?? this.message,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
