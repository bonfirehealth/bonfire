// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AnswerRepo {
  AnswerRepo._();

  static Future<List<Answer>?> getAllAnswers({
    String? questionId,
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('getAllAnswers()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/answers',
      'latestAnswers',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'questionID': questionId,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: Answer.fromJson,
    );
  }

  static Future<List<Answer>?> searchAnswers({
    String? name,
    String? questionId,
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('searchAnswers()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/answers_by_search',
      'listAnswers',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'name': name,
        'questionID': questionId,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: Answer.fromJson,
    );
  }

  static Future<Tuple2<Answer?, int?>?> getAnswer(
    String answerId,
  ) async {
    logInfo('getAnswer(): $answerId');
    await CoreRepo.init();
    return CoreRepo.getItem<Answer>(
      'groups/answer',
      'getAnswer',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'answerID': answerId,
      },
      fromJson: Answer.fromJson,
    );
  }

  static Future<Tuple2<Answer?, int?>?> createAnswer({
    String? description,
    String? identifier,
    int? index,
    bool isHidden = false,
    String? name,
    int numberOfClicks = 0,
    int numberOfComments = 0,
    int numberOfVotes = 0,
    int numberOfViews = 0,
    String? questionId,
  }) async {
    logInfo('createAnswer()');
    await CoreRepo.init();
    return CoreRepo.createItem<Answer>(
      'groups/answer_create',
      'createAnswer',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'description': description,
          'identifier': identifier,
          'index': index,
          'isHidden': isHidden,
          'name': name,
          'numberOfClicks': numberOfClicks,
          'numberOfComments': numberOfComments,
          'numberOfVotes': numberOfVotes,
          'numberOfViews': numberOfViews,
          'questionID': questionId,
        },
      },
      fromJson: Answer.fromJson,
    );
  }

  static Future<Tuple2<Answer?, int?>?> updateAnswer({
    String? answerId,
    String? description,
    String? identifier,
    int? index,
    bool? isHidden,
    String? name,
    int? numberOfClicks,
    int? numberOfComments,
    int? numberOfVotes,
    int? numberOfViews,
    String? questionId,
    int? version = 1,
  }) async {
    logInfo('updateAnswer()');
    await CoreRepo.init();
    final variables = <String, dynamic>{
      'input': {
        'id': answerId,
        '_version': version,
      },
    };

    final input = variables['input'] as Map<String, dynamic>;

    if (description != null) {
      input['description'] = description;
    }

    if (identifier != null) {
      input['identifier'] = identifier;
    }

    if (index != null) {
      input['index'] = index;
    }

    if (isHidden != null) {
      input['isHidden'] = isHidden;
    }
    if (name != null) {
      input['name'] = name;
    }

    if (numberOfClicks != null) {
      input['numberOfClicks'] = numberOfClicks;
    }

    if (numberOfComments != null) {
      input['numberOfComments'] = numberOfComments;
    }

    if (numberOfVotes != null) {
      input['numberOfVotes'] = numberOfVotes;
    }

    if (numberOfViews != null) {
      input['numberOfViews'] = numberOfViews;
    }

    if (questionId != null) {
      input['questionId'] = questionId;
    }

    return CoreRepo.updateItem<Answer>(
      'groups/answer_update',
      'updateAnswer',
      variables: variables,
      fromJson: Answer.fromJson,
    );
  }

  static Future<Tuple2<Answer?, int?>?> deleteAnswer({
    String? answerId,
    int? version = 1,
  }) async {
    logInfo('deleteAnswer()');
    await CoreRepo.init();
    return CoreRepo.updateItem<Answer>(
      'groups/answer_delete',
      'deleteAnswer',
      variables: <String, dynamic>{
        'input': {
          'id': answerId,
          '_version': version,
        },
      },
      fromJson: Answer.fromJson,
    );
  }

  static Future<Stream<GraphQLResponse<String>>> subscribeCreateAnswer(
    String questionId,
  ) async {
    logInfo('subscribeCreateAnswer()');
    await CoreRepo.init();
    final graphqlFilePath =
        generateGraphqlFilePath('subscriptions', 'groups/answer_create');
    final graphqlQuery = await loadQuery(graphqlFilePath);

    return Amplify.API.subscribe(
      GraphQLRequest<String>(
        document: graphqlQuery,
        variables: <String, dynamic>{
          'questionID': questionId,
        },
      ),
      onEstablished: () => logInfo('subscribeCreateAnswer() established'),
    );
  }

  static Future<Stream<GraphQLResponse<String>>> subscribeUpdateAnswer(
    String questionId,
  ) async {
    logInfo('subscribeUpdateAnswer()');
    await CoreRepo.init();
    final graphqlFilePath =
        generateGraphqlFilePath('subscriptions', 'groups/answer_update');
    final graphqlQuery = await loadQuery(graphqlFilePath);

    return Amplify.API.subscribe(
      GraphQLRequest<String>(
        document: graphqlQuery,
        variables: <String, dynamic>{
          'questionID': questionId,
        },
      ),
      onEstablished: () => logInfo('subscribeUpdateAnswer() established'),
    );
  }
}
