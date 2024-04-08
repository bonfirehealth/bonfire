// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class CommentRepo {
  CommentRepo._();

  static Future<List<Comment>?> getAllComments({
    String? answerId,
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('getAllComments()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/comments',
      'latestComments',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'answerID': answerId,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: Comment.fromJson,
    );
  }

  static Future<List<Comment>?> searchComments({
    String? name,
    String? answerId,
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('searchComments()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/comments_by_search',
      'listComments',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'name': name,
        'answerID': answerId,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: Comment.fromJson,
    );
  }

  static Future<Tuple2<Comment?, int?>?> getComment(
    String commentId,
  ) async {
    logInfo('getComment(): $commentId');
    await CoreRepo.init();
    return CoreRepo.getItem<Comment>(
      'groups/comment',
      'getComment',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'commentID': commentId,
      },
      fromJson: Comment.fromJson,
    );
  }

  static Future<Tuple2<Comment?, int?>?> createComment({
    String? description,
    String? identifier,
    int? index,
    bool isHidden = false,
    String? name,
    int numberOfClicks = 0,
    int numberOfVotes = 0,
    int numberOfViews = 0,
    String? answerId,
  }) async {
    logInfo('createComment()');
    await CoreRepo.init();
    return CoreRepo.createItem<Comment>(
      'groups/comment_create',
      'createComment',
      variables: <String, dynamic>{
        'input': {
          'userID': CoreRepo.userId,
          'description': description,
          'identifier': identifier,
          'index': index,
          'isHidden': isHidden,
          'name': name,
          'numberOfClicks': numberOfClicks,
          'numberOfVotes': numberOfVotes,
          'numberOfViews': numberOfViews,
          'answerID': answerId,
        },
      },
      fromJson: Comment.fromJson,
    );
  }

  static Future<Tuple2<Comment?, int?>?> updateComment({
    String? commentId,
    String? description,
    String? identifier,
    int? index,
    bool? isHidden,
    String? name,
    int? numberOfClicks,
    int? numberOfVotes,
    int? numberOfViews,
    String? answerId,
    int? version = 1,
  }) async {
    logInfo('updateComment()');
    await CoreRepo.init();
    final variables = <String, dynamic>{
      'input': {
        'id': commentId,
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

    if (numberOfVotes != null) {
      input['numberOfVotes'] = numberOfVotes;
    }

    if (numberOfViews != null) {
      input['numberOfViews'] = numberOfViews;
    }

    if (answerId != null) {
      input['answerId'] = answerId;
    }

    return CoreRepo.updateItem<Comment>(
      'groups/comment_update',
      'updateComment',
      variables: variables,
      fromJson: Comment.fromJson,
    );
  }

  static Future<Tuple2<Comment?, int?>?> deleteComment({
    String? commentId,
    int? version = 1,
  }) async {
    logInfo('deleteComment()');
    await CoreRepo.init();
    return CoreRepo.updateItem<Comment>(
      'groups/comment_delete',
      'deleteComment',
      variables: <String, dynamic>{
        'input': {
          'id': commentId,
          '_version': version,
        },
      },
      fromJson: Comment.fromJson,
    );
  }

  static Future<Stream<GraphQLResponse<String>>> subscribeCreateComment(
    String answerId,
  ) async {
    logInfo('subscribeCreateComment()');
    await CoreRepo.init();
    final graphqlFilePath =
        generateGraphqlFilePath('subscriptions', 'groups/comment_create');
    final graphqlQuery = await loadQuery(graphqlFilePath);

    return Amplify.API.subscribe(
      GraphQLRequest<String>(
        document: graphqlQuery,
        variables: <String, dynamic>{
          'answerID': answerId,
        },
      ),
      onEstablished: () => logInfo('subscribeCreateComment() established'),
    );
  }

  static Future<Stream<GraphQLResponse<String>>> subscribeUpdateComment(
    String answerId,
  ) async {
    logInfo('subscribeUpdateComment()');
    await CoreRepo.init();
    final graphqlFilePath =
        generateGraphqlFilePath('subscriptions', 'groups/comment_update');
    final graphqlQuery = await loadQuery(graphqlFilePath);

    return Amplify.API.subscribe(
      GraphQLRequest<String>(
        document: graphqlQuery,
        variables: <String, dynamic>{
          'answerID': answerId,
        },
      ),
      onEstablished: () => logInfo('subscribeUpdateComment() established'),
    );
  }
}
