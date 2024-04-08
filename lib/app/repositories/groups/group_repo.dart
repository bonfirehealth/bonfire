// Dart imports:
import 'dart:async';

// Package imports:
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class GroupRepo {
  GroupRepo._();

  static Future<List<Group>?> getAllGroups({
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('getAllGroups()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/groups',
      'latestGroups',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'organisationID': CoreRepo.organisationId,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: Group.fromJson,
    );
  }

  static Future<List<Group>?> searchGroups({
    String? name,
    bool isHidden = false,
    String sortDirection = 'DESC',
  }) async {
    logInfo('searchGroups()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/groups_by_search',
      'listGroups',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'organisationID': CoreRepo.organisationId,
        'name': name,
        'isHidden': isHidden,
        'sortDirection': sortDirection,
      },
      fromJson: Group.fromJson,
    );
  }

  static Future<Tuple2<Group?, int?>?> getGroup(
    String groupId,
  ) async {
    logInfo('getGroup(): $groupId');
    await CoreRepo.init();
    return CoreRepo.getItem<Group>(
      'groups/group',
      'getGroup',
      variables: <String, dynamic>{
        'userID': CoreRepo.userId,
        'groupID': groupId,
      },
      fromJson: Group.fromJson,
    );
  }

  static Future<Tuple2<Group?, int?>?> createGroup({
    String? description,
    String? icon,
    String? identifier,
    int? index,
    bool isApproved = false,
    bool isHidden = false,
    String? name,
    int numberOfClicks = 0,
    int numberOfQuestions = 0,
    int numberOfUsers = 0,
    int numberOfViews = 0,
    int numberOfVotes = 0,
    String? groupGroupTypeId,
  }) async {
    logInfo('createGroup()');
    await CoreRepo.init();
    return CoreRepo.createItem<Group>(
      'groups/group_create',
      'createGroup',
      variables: <String, dynamic>{
        'input': {
          'suggesterID': CoreRepo.userId,
          'organisationID': CoreRepo.organisationId,
          'description': description,
          'icon': icon,
          'identifier': identifier,
          'index': index,
          'isApproved': isApproved,
          'isHidden': isHidden,
          'name': name,
          'numberOfClicks': numberOfClicks,
          'numberOfQuestions': numberOfQuestions,
          'numberOfUsers': numberOfUsers,
          'numberOfViews': numberOfViews,
          'numberOfVotes': numberOfVotes,
          'groupGroupTypeId': groupGroupTypeId,
        },
      },
      fromJson: Group.fromJson,
    );
  }

  static Future<Tuple2<Group?, int?>?> updateGroup({
    String? groupId,
    String? description,
    String? icon,
    String? identifier,
    int? index,
    bool? isApproved,
    bool? isHidden,
    String? name,
    int? numberOfClicks,
    int? numberOfQuestions,
    int? numberOfUsers,
    int? numberOfViews,
    int? numberOfVotes,
    String? groupGroupTypeId,
    int? version = 1,
  }) async {
    logInfo('updateGroup()');
    await CoreRepo.init();
    final variables = <String, dynamic>{
      'input': {
        'id': groupId,
        '_version': version,
      },
    };

    final input = variables['input'] as Map<String, dynamic>;

    if (description != null) {
      input['description'] = description;
    }

    if (icon != null) {
      input['icon'] = icon;
    }

    if (identifier != null) {
      input['identifier'] = identifier;
    }
    if (index != null) {
      input['index'] = index;
    }
    if (isApproved != null) {
      input['isApproved'] = isApproved;
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
    if (numberOfQuestions != null) {
      input['numberOfQuestions'] = numberOfQuestions;
    }

    if (numberOfUsers != null) {
      input['numberOfUsers'] = numberOfUsers;
    }

    if (numberOfViews != null) {
      input['numberOfViews'] = numberOfViews;
    }

    if (numberOfVotes != null) {
      input['numberOfVotes'] = numberOfVotes;
    }

    if (groupGroupTypeId != null) {
      input['groupGroupTypeId'] = groupGroupTypeId;
    }

    return CoreRepo.updateItem<Group>(
      'groups/group_update',
      'updateGroup',
      variables: variables,
      fromJson: Group.fromJson,
    );
  }

  static Future<Tuple2<Group?, int?>?> deleteGroup({
    String? groupId,
    int? version = 1,
  }) async {
    logInfo('deleteGroup()');
    await CoreRepo.init();
    return CoreRepo.updateItem<Group>(
      'groups/group_delete',
      'deleteGroup',
      variables: <String, dynamic>{
        'input': {
          'id': groupId,
          '_version': version,
        },
      },
      fromJson: Group.fromJson,
    );
  }

  static Future<Stream<GraphQLResponse<String>>> subscribeCreateGroup() async {
    logInfo('subscribeCreateGroup()');
    await CoreRepo.init();
    final graphqlFilePath =
        generateGraphqlFilePath('subscriptions', 'groups/group_create');
    final graphqlQuery = await loadQuery(graphqlFilePath);

    return Amplify.API.subscribe(
      GraphQLRequest<String>(
        document: graphqlQuery,
        variables: <String, dynamic>{
          'organisationID': CoreRepo.organisationId,
        },
      ),
      onEstablished: () => logInfo('subscribeCreateGroup() established'),
    );
  }

  static Future<Stream<GraphQLResponse<String>>> subscribeUpdateGroup() async {
    logInfo('subscribeUpdateGroup()');
    await CoreRepo.init();
    final graphqlFilePath =
        generateGraphqlFilePath('subscriptions', 'groups/group_update');
    final graphqlQuery = await loadQuery(graphqlFilePath);

    return Amplify.API.subscribe(
      GraphQLRequest<String>(
        document: graphqlQuery,
        variables: <String, dynamic>{
          'organisationID': CoreRepo.organisationId,
        },
      ),
      onEstablished: () => logInfo('subscribeUpdateGroup() established'),
    );
  }
}
