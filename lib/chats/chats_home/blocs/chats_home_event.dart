part of 'chats_home_bloc.dart';

@immutable
abstract class ChatsHomeEvent {
  const ChatsHomeEvent();
}

class ChatsHomeInitialSet extends ChatsHomeEvent {}

class ChatsHomeAskSet extends ChatsHomeEvent {
  const ChatsHomeAskSet({
    required this.context,
    required this.questionStr,
    this.answerStr = '',
    this.question,
    this.questionSave,
    this.answer,
    this.initial,
    this.isAnswered,
    this.isSaved,
  });

  final BuildContext context;
  final String questionStr;
  final String? answerStr;
  final Question? question;
  final QuestionSave? questionSave;
  final Answer? answer;
  final bool? initial;
  final bool? isAnswered;
  final bool? isSaved;
}

class ChatsHomeSpecialAskSet extends ChatsHomeEvent {
  const ChatsHomeSpecialAskSet({required this.context});
  final BuildContext context;
}

class ChatsHomeResponseSuccessSet extends ChatsHomeEvent {
  const ChatsHomeResponseSuccessSet({
    required this.answerStr,
  });

  final String answerStr;
}

class ChatsHomeSaveToggleSet extends ChatsHomeEvent {
  const ChatsHomeSaveToggleSet({required this.isSaved});

  final bool isSaved;
}

class ChatsHomeResponseFailureSet extends ChatsHomeEvent {
  const ChatsHomeResponseFailureSet({
    required this.error,
  });

  final String error;
}

class ChatsHomeSaveSet extends ChatsHomeEvent {
  const ChatsHomeSaveSet({
    required this.questionStr,
    required this.answerStr,
    required this.isSaved,
    this.question,
    this.questionSave,
    this.answer,
  });

  final String questionStr;
  final String answerStr;
  final bool isSaved;
  final Question? question;
  final QuestionSave? questionSave;
  final Answer? answer;
}
