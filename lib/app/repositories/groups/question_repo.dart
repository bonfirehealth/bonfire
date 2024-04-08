// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class QuestionRepo {
  QuestionRepo._();

  static Future<List<Question>?> getAllQuestions({
    String? groupId,
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('getAllQuestions()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/questions',
      'latestQuestions',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'groupID': groupId,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: Question.fromJson,
    );
  }

  static Future<List<Question>?> searchQuestions({
    String? name,
    String? groupId,
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('searchQuestions()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/questions_by_search',
      'listQuestions',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'name': name,
        'groupID': groupId,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: Question.fromJson,
    );
  }

  static Future<Tuple2<Question?, int?>?> getQuestion(
    String questionId,
  ) async {
    logInfo('getQuestion(): $questionId');
    await CoreRepo.init();
    return CoreRepo.getItem<Question>(
      'groups/question',
      'getQuestion',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'questionID': questionId,
      },
      fromJson: Question.fromJson,
    );
  }

  static Future<Tuple2<Question?, int?>?> createQuestion({
    String? description,
    String? identifier,
    int? index,
    bool isHidden = false,
    String? name,
    int numberOfAnswers = 0,
    int numberOfClicks = 0,
    int numberOfSaves = 0,
    int numberOfVotes = 0,
    int numberOfViews = 0,
    String? groupId,
  }) async {
    logInfo('createQuestion()');
    await CoreRepo.init();
    return CoreRepo.createItem<Question>(
      'groups/question_create',
      'createQuestion',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'description': description,
          'identifier': identifier,
          'index': index,
          'isHidden': isHidden,
          'name': name,
          'numberOfAnswers': numberOfAnswers,
          'numberOfClicks': numberOfClicks,
          'numberOfSaves': numberOfSaves,
          'numberOfVotes': numberOfVotes,
          'numberOfViews': numberOfViews,
          'groupID': groupId,
        },
      },
      fromJson: Question.fromJson,
    );
  }

  static Future<Tuple2<Question?, int?>?> updateQuestion({
    String? questionId,
    String? description,
    String? identifier,
    int? index,
    bool? isHidden,
    String? name,
    int? numberOfAnswers,
    int? numberOfClicks,
    int? numberOfSaves,
    int? numberOfVotes,
    int? numberOfViews,
    String? groupId,
    int? version = 1,
  }) async {
    logInfo('updateQuestion()');
    await CoreRepo.init();
    final variables = <String, dynamic>{
      'input': {
        'id': questionId,
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

    if (numberOfAnswers != null) {
      input['numberOfAnswers'] = numberOfAnswers;
    }

    if (numberOfClicks != null) {
      input['numberOfClicks'] = numberOfClicks;
    }

    if (numberOfSaves != null) {
      input['numberOfSaves'] = numberOfSaves;
    }

    if (numberOfVotes != null) {
      input['numberOfVotes'] = numberOfVotes;
    }

    if (numberOfViews != null) {
      input['numberOfViews'] = numberOfViews;
    }

    if (groupId != null) {
      input['groupId'] = groupId;
    }

    return CoreRepo.updateItem<Question>(
      'groups/question_update',
      'updateQuestion',
      variables: variables,
      fromJson: Question.fromJson,
    );
  }

  static Future<Tuple2<Question?, int?>?> deleteQuestion({
    String? questionId,
    int? version = 1,
  }) async {
    logInfo('deleteQuestion()');
    await CoreRepo.init();
    return CoreRepo.updateItem<Question>(
      'groups/question_delete',
      'deleteQuestion',
      variables: <String, dynamic>{
        'input': {
          'id': questionId,
          '_version': version,
        },
      },
      fromJson: Question.fromJson,
    );
  }

  static Future<Stream<GraphQLResponse<String>>> subscribeCreateQuestion(
    String groupId,
  ) async {
    logInfo('subscribeCreateQuestion()');
    await CoreRepo.init();
    final graphqlFilePath =
        generateGraphqlFilePath('subscriptions', 'groups/question_create');
    final graphqlQuery = await loadQuery(graphqlFilePath);

    return Amplify.API.subscribe(
      GraphQLRequest<String>(
        document: graphqlQuery,
        variables: <String, dynamic>{
          'groupID': groupId,
        },
      ),
      onEstablished: () => logInfo('subscribeCreateQuestion() established'),
    );
  }

  static Future<Stream<GraphQLResponse<String>>> subscribeUpdateQuestion(
    String groupId,
  ) async {
    logInfo('subscribeUpdateQuestion()');
    await CoreRepo.init();
    final graphqlFilePath =
        generateGraphqlFilePath('subscriptions', 'groups/question_update');
    final graphqlQuery = await loadQuery(graphqlFilePath);

    return Amplify.API.subscribe(
      GraphQLRequest<String>(
        document: graphqlQuery,
        variables: <String, dynamic>{
          'groupID': groupId,
        },
      ),
      onEstablished: () => logInfo('subscribeUpdateQuestion() established'),
    );
  }
}
