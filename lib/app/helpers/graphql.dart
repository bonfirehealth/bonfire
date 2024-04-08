// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

// Package imports:
import 'package:graphql_flutter/graphql_flutter.dart';

// Project imports:
import 'package:bonfirehealth/app/helpers/helpers.dart';

class GraphQLHelper {
  GraphQLHelper(this.url, this.token) {
    final httpLink = HttpLink(url);

    final authLink = AuthLink(
      getToken: () => token,
    );
    final link = authLink.concat(httpLink);
    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: HiveStore()),
    );
    valueClient = ValueNotifier(client);
  }

  String url = '';
  String token = '';
  late GraphQLClient client;
  late ValueNotifier<GraphQLClient> valueClient;

  String generateGraphqlFilePath(String type, String value) {
    return 'lib/app/graphql/$type/$value.graphql';
  }

  Future<String> loadQuery(String filePath) async {
    return rootBundle.loadString(filePath);
  }

  Future<QueryOptions> prepareQueryOptions(
    String query, {
    required Map<String, dynamic> variables,
    FetchPolicy fetchPolicy = FetchPolicy.cacheAndNetwork,
    Duration? pollInterval,
  }) async {
    final newQuery = await loadQuery(query);
    return QueryOptions(
      document: gql(newQuery),
      variables: variables,
      fetchPolicy: fetchPolicy,
      pollInterval: pollInterval,
      // errorPolicy: ErrorPolicy.ignore,
    );
  }

  Future<WatchQueryOptions> prepareWatchQueryOptions(
    String query, {
    required Map<String, dynamic> variables,
    FetchPolicy fetchPolicy = FetchPolicy.cacheAndNetwork,
    Duration? pollInterval,
  }) async {
    final newQuery = await loadQuery(query);
    return WatchQueryOptions(
      document: gql(newQuery),
      variables: variables,
      fetchPolicy: fetchPolicy,
      pollInterval: pollInterval,
      errorPolicy: ErrorPolicy.ignore,
    );
  }

  Future<QueryResult> performQuery(
    String query, {
    required Map<String, dynamic> variables,
    FetchPolicy fetchPolicy = FetchPolicy.networkOnly,
    Duration? pollInterval,
  }) async {
    final options = await prepareQueryOptions(
      query,
      variables: variables,
      fetchPolicy: fetchPolicy,
      pollInterval: pollInterval,
    );

    final result = await client.query(options);

    if (result.hasException) {
      logInfo('performQuery from: $query, exception: ${result.exception}');
    }

    return result;
  }

  Future<QueryResult> performMutation(
    String query, {
    required Map<String, dynamic> variables,
  }) async {
    final options = MutationOptions(
      document: gql(query),
      variables: variables,
      errorPolicy: ErrorPolicy.ignore,
    );

    final result = await client.mutate(options);

    if (result.hasException) {
      logInfo('performMutation from: $query, exception: ${result.exception}');
    }

    return result;
  }
}
