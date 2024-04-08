// Flutter imports:

// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:bonfirehealth/global.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';
import 'package:recase/recase.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/gen/assets.gen.dart';

part 'chats_home_event.dart';
part 'chats_home_state.dart';

class ChatsHomeBloc extends Bloc<ChatsHomeEvent, ChatsHomeState> {
  ChatsHomeBloc()
      : super(const ChatsHomeState(
          user: types.User(
            id: "user",
          ),
        )) {
    on<ChatsHomeAskSet>(_onChatAskQuestionSet);
    on<ChatsHomeSpecialAskSet>(_onChatsHomeSpecialAskSet);
    on<ChatsHomeResponseSuccessSet>(_onChatsHomeResponseSuccessSet);
    on<ChatsHomeResponseFailureSet>(_onChatsHomeResponseFailureSet);
    on<ChatsHomeSaveSet>(_onChatsHomeSaveSet);
    on<ChatsHomeSaveToggleSet>(_onChatsHomeSaveToggleSet);
  }

  final String openaiURI = 'https://api.openai.com/v1/chat/completions';
  final String openaiModerationURI = 'https://api.openai.com/v1/moderations';
  final String apiKey = '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';
  final String modelName = 'gpt-3.5-turbo';
  final int maxTokens = 4000;
  final double temperature = 0.2;
  final String systemMessage =
      'You are a helpful assistant in answering mental and physical health questions. Please use more examples or explain your answers in steps or bullet points if possible';
  final gptUser = types.User(
    id: "ai-health-assistant",
    firstName: "AI",
    lastName: "Health Coach",
    imageUrl: Assets.images.logoTransparent.path,
  );

  void initiate(BuildContext context, String? premessage) {
    if (premessage != null && premessage.isNotEmpty) {
      add(ChatsHomeAskSet(
        context: context,
        questionStr: premessage,
      ));
    }
  }

  Future<void> _onChatAskQuestionSet(
    ChatsHomeAskSet event,
    Emitter<ChatsHomeState> emit,
  ) async {
    emit(
      state.copyWith(
        message: [
          types.TextMessage(
            id: randomAlphaNumeric(6),
            author: state.user,
            text: event.questionStr,
          ),
          ...state.message,
        ],
        status: ChatsHomeStatus.asked,
      ),
    );
    if (isTrialCustomer) return;
    final l10n = event.context.l10n;
    try {
      final response = await fetchAnswer(event.questionStr);
      add(
        ChatsHomeResponseSuccessSet(
          answerStr: response.answer,
        ),
      );
    } catch (e, s) {
      add(
        ChatsHomeResponseFailureSet(
          error: l10n.chatResponseSystemErrorMessage,
        ),
      );
    }
  }

  Future<void> _onChatsHomeSpecialAskSet(
    ChatsHomeSpecialAskSet event,
    Emitter<ChatsHomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: ChatsHomeStatus.asked,
      ),
    );
    final l10n = event.context.l10n;
    try {
      final response = await fetchAnswer('Who are you? And how can you help me to improve my health & wellbeing?');
      add(
        ChatsHomeResponseSuccessSet(
          answerStr: response.answer,
        ),
      );
    } catch (e, s) {
      add(
        ChatsHomeResponseFailureSet(
          error: l10n.chatResponseSystemErrorMessage,
        ),
      );
    }
  }

  Future<void> _onChatsHomeResponseSuccessSet(
    ChatsHomeResponseSuccessSet event,
    Emitter<ChatsHomeState> emit,
  ) async {
    emit(
      state.copyWith(
        message: [
          types.TextMessage(
            id: randomAlphaNumeric(6),
            author: gptUser,
            text: event.answerStr,
          ),
          ...state.message,
        ],
        status: ChatsHomeStatus.done,
      ),
    );
  }

  Future<void> _onChatsHomeResponseFailureSet(
    ChatsHomeResponseFailureSet event,
    Emitter<ChatsHomeState> emit,
  ) async {
    emit(
      state.copyWith(
        message: [
          ...state.message,
          types.TextMessage(
            id: randomAlphaNumeric(4),
            author: gptUser,
            text: event.error,
          ),
        ],
        status: ChatsHomeStatus.done,
      ),
    );
  }

  Future<void> _onChatsHomeSaveSet(
    ChatsHomeSaveSet event,
    Emitter<ChatsHomeState> emit,
  ) async {
    // emit(
    //   state.copyWith(
    //     questionStr: event.questionStr,
    //     answerStr: event.answerStr,
    //     isSaved: event.isSaved,
    //   ),
    // );

    // if (event.isSaved) {
    //   final resp = await UserRepo.getUser();
    //   if (resp != null && resp.item1 != null) {
    //     final groups = resp.item1!.groups ?? [];
    //     for (final group in groups) {
    //       final response = await QuestionRepo.createQuestion(
    //         identifier: ReCase(event.questionStr).pathCase,
    //         name: event.questionStr,
    //         index: 0,
    //         groupId: group.id,
    //       );

    //       final response2 = await QuestionSaveRepo.createQuestionSave(
    //         questionId: response?.item1?.id,
    //       );

    //       final response3 = await AnswerRepo.createAnswer(
    //         identifier: ReCase(event.answerStr).pathCase,
    //         name: event.answerStr,
    //         index: 0,
    //         questionId: response?.item1?.id,
    //       );

    //       emit(
    //         state.copyWith(
    //           question: response?.item1,
    //           questionSave: response2?.item1,
    //           answer: response3?.item1,
    //         ),
    //       );
    //     }
    //   }
    // } else {
    //   final resp = await UserRepo.getUser();
    //   if (resp != null && resp.item1 != null) {
    //     final groups = resp.item1!.groups ?? [];
    //     for (final group in groups) {
    //       final response = await QuestionRepo.deleteQuestion(
    //         questionId: event.question!.id,
    //       );

    //       await QuestionSaveRepo.deleteQuestionSave(
    //         questionSaveId: event.questionSave!.id,
    //       );

    //       final response2 = await AnswerRepo.deleteAnswer(
    //         answerId: event.answer!.id,
    //       );
    //     }
    //   }
    // }
  }

  Future<void> _onChatsHomeSaveToggleSet(
    ChatsHomeSaveToggleSet event,
    Emitter<ChatsHomeState> emit,
  ) async {
    // emit(
    //   state.copyWith(
    //     isSaved: event.isSaved,
    //   ),
    // );
  }

  Future<ChatResponseResult> fetchAnswer(
    String? prompt,
  ) async {
    final client = http.Client();
    if (prompt?.isEmpty ?? true) {
      return Future<ChatResponseResult>.value(
        ChatResponseResult(isEmptyQuestion: true),
      );
    }

    final modResponse = await client.post(
      Uri.parse(openaiModerationURI),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $apiKey'},
      body: jsonEncode(
        <String, String>{'input': prompt!},
      ),
    );
    final flagged = parseModResponse(modResponse.body);
    if (flagged) {
      return Future<ChatResponseResult>.value(
        ChatResponseResult(flagged: true),
      );
    }

    final response = await client.post(
      Uri.parse(openaiURI),
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $apiKey'},
      body: jsonEncode(<String, dynamic>{
        'model': modelName,
        'max_tokens': maxTokens,
        'temperature': temperature,
        'messages': [
          {'role': 'system', 'content': 'Welcome to the mental health advisor. How may I assist you?'},
          {'role': 'user', 'content': prompt},
        ]
      }),
    );

    return compute(parse, response.body);
  }

  ChatResponseResult parse(String responseBody) {
    final data = ChatCompletion.fromMap(
      jsonDecode(responseBody) as Map<String, dynamic>,
    );

    return ChatResponseResult(
      success: true,
      answer: data.choices[0].message.content,
    );
  }

  bool parseModResponse(String responseBody) {
    const defaultValue = false;
    final data = ModerationResult.fromMap(
      jsonDecode(responseBody) as Map<String, dynamic>,
    );
    for (final result in data.results) {
      return result.flagged;
    }
    return defaultValue;
  }
}

class ChatResponseResult {
  ChatResponseResult({
    this.success = false,
    this.flagged = false,
    this.isEmptyQuestion = false,
    this.answer = '',
  });
  bool success = false;
  bool flagged = false;
  bool isEmptyQuestion = false;
  String answer = '';
}

// Define a class that represents your data model
class ChatCompletion {
  // Create a constructor that takes a map as an argument
  ChatCompletion.fromMap(Map<String, dynamic> map)
      : id = map['id'] as String,
        object = map['object'] as String,
        created = map['created'] as int,
        model = map['model'] as String,
        choices = List<Choice>.from(
            (map['choices'] as List<dynamic>).map((choice) => Choice.fromMap(choice as Map<String, dynamic>)));
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;
}

// Define another class that represents a nested object in your data model
class Choice {
  // Create a constructor that takes a map as an argument
  Choice.fromMap(Map<String, dynamic> map)
      : message = Message.fromMap(map['message'] as Map<String, dynamic>),
        finishReason = map['finish_reason'] as String,
        index = map['index'] as int;
  final Message message;
  final String finishReason;
  final int index;
}

// Define another class that represents another nested object in your data model
class Message {
  // Create a constructor that takes a map as an argument
  Message.fromMap(Map<String, dynamic> map)
      : role = map['role'] as String,
        content = map['content'] as String;
  final String role;
  final String content;
}

class ModerationResult {
  ModerationResult({
    required this.id,
    required this.model,
    required this.results,
  });

  factory ModerationResult.fromMap(Map<String, dynamic> map) {
    return ModerationResult(
      id: map['id'] as String,
      model: map['model'] as String,
      results: List<Result>.from(
        (map['results'] as List<dynamic>).map(Result.fromMap),
      ),
    );
  }
  final String id;
  final String model;
  final List<Result> results;
}

class Result {
  Result({
    required this.flagged,
  });

  factory Result.fromMap(dynamic map) {
    final resultMap = map as Map<String, dynamic>;
    return Result(
      flagged: resultMap['flagged'] as bool,
    );
  }
  final bool flagged;
}
