// Package imports:
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class CoreRepo {
  CoreRepo._();

  static String? endpoint;
  static String? jwtIdToken;
  static int? jwtIdTokenExpiration;
  static String? userId;
  static String? userSubId;
  static String? profileId;
  static String? organisationId;
  static CognitoCredentials? credentials;

  static Future<void> init() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    userId = sharedPrefs.getString('user_id') ?? '';
    userSubId = sharedPrefs.getString('user_sub_id') ?? '';
    profileId = sharedPrefs.getString('profile_id') ?? '';
    organisationId = sharedPrefs.getString('organisation_id') ?? '';
    jwtIdToken = sharedPrefs.getString('jwt_id_token') ?? '';
    jwtIdTokenExpiration = sharedPrefs.getInt('jwt_id_token_expiration') ?? 0;
    var jwtRefreshToken = sharedPrefs.getString('jwt_refresh_token') ?? '';
    EncryptHelper.init(organisationId!, userId!, userSubId!, profileId!);

    if (jwtIdToken!.isNotEmpty && !jwtIdToken!.contains('eyJ')) {
      jwtIdToken = EncryptHelper.decrypt(jwtIdToken!);
    }
    if (jwtRefreshToken.isNotEmpty && !jwtRefreshToken.contains('eyJ')) {
      jwtRefreshToken = EncryptHelper.decrypt(jwtRefreshToken);
    }

    if (organisationId == '' || organisationId == null) {
      if (jwtIdToken != null && jwtIdToken != '') {
        final jwtIdTokenMap = Jwt.parseJwt(jwtIdToken!);
        organisationId = jwtIdTokenMap['custom:organisation_id'] as String?;
      }
      await sharedPrefs.setString('organisation_id', organisationId!);
    }
    if (jwtIdToken != null) {
      if (jwtIdToken!.isNotEmpty) {
        if ((DateTime.now().millisecondsSinceEpoch / 1000) >
            jwtIdTokenExpiration!) {
          final session = await AmplifyRepo.refreshJWTIdToken(
            jwtIdToken!,
            jwtRefreshToken,
          );

          jwtRefreshToken = session?.refreshToken?.getToken() ?? '';
          jwtIdToken = session?.getIdToken().jwtToken ?? '';
          final jwtIdTokenExpiration = session?.accessToken.getExpiration();
          jwtIdToken = EncryptHelper.encrypt(jwtIdToken!);
          await sharedPrefs.setString('jwt_id_token', jwtIdToken!);
          await sharedPrefs.setInt(
            'jwt_id_token_expiration',
            jwtIdTokenExpiration!,
          );
          jwtRefreshToken = EncryptHelper.encrypt(jwtRefreshToken);
          await sharedPrefs.setString('jwt_refresh_token', jwtRefreshToken);
          jwtIdToken = EncryptHelper.decrypt(jwtIdToken!);
        }
      }
    }

    if (credentials == null) {
      final identityPoolId = AmplifyConstant.getIdentityPoolId(
        FlavorConfig.instance!.flavor,
      );
      final userPoolId = AmplifyRepo.getUserPoolId();
      final appClientId = AmplifyRepo.getAppClientId();
      final userPool = CognitoUserPool(userPoolId, appClientId);
      credentials = CognitoCredentials(identityPoolId, userPool);
      if (jwtIdToken != null && jwtIdToken!.isNotEmpty) {
        await credentials?.getAwsCredentials(jwtIdToken);
      }
    }

    endpoint = AmplifyRepo.getAppSyncGraphQLEndpoint();
  }

  static Future<List<T>?> getAllItems<T>(
    String graphqlModel,
    String operationName, {
    String graphqlType = 'queries',
    Map<String, dynamic>? variables,
    void Function(Map<String, dynamic>)? fromJson,
  }) async {
    logInfo('getAllItems(): $T');
    await init();
    try {
      final graphQLHelper = GraphQLHelper(
        endpoint!,
        jwtIdToken!,
      );
      final result = await graphQLHelper.performQuery(
        graphQLHelper.generateGraphqlFilePath(graphqlType, graphqlModel),
        variables: variables ??
            <String, dynamic>{
              'limit': 999999999,
            },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final resultMap = result.data![operationName] as Map<String, dynamic>? ??
          <String, dynamic>{};
      final items = resultMap['items'] as List<dynamic>;
      final models = <T>[];

      for (final item in items) {
        final json = item as Map<String, dynamic>? ?? <String, dynamic>{};
        final model = fromJson!(json) as T;
        final isDeleted = json['_deleted'] as bool? ?? false;
        if (!isDeleted) {
          models.add(model);
        }
      }

      logInfo('getAllItems(): $T - ${models.length}');
      return models;
    } catch (e) {
      logInfo('Error for ScreeningHome: $e');
    }

    return null;
  }

  static Future<Tuple2<T, int?>?> getItem<T>(
    String graphqlModel,
    String operationName, {
    String graphqlType = 'queries',
    Map<String, dynamic>? variables,
    void Function(Map<String, dynamic>)? fromJson,
  }) async {
    logInfo('getItem(): $T');
    await init();
    try {
      final graphQLHelper = GraphQLHelper(
        endpoint!,
        jwtIdToken!,
      );

      final result = await graphQLHelper.performQuery(
        graphQLHelper.generateGraphqlFilePath(graphqlType, graphqlModel),
        variables: variables ?? <String, dynamic>{},
        fetchPolicy: FetchPolicy.networkOnly,
      );

      if (result.data != null) {
        final json = result.data![operationName] as Map<String, dynamic>? ??
            <String, dynamic>{};

        return Tuple2<T, int?>(
          fromJson!(
            json,
          ) as T,
          json['_version'] as int?,
        );
      }
      logError(result);
    } catch (e) {
      logInfo(e);
    }

    return null;
  }

  static Future<Tuple2<T, int?>?> createItem<T>(
    String graphqlModel,
    String operationName, {
    String graphqlType = 'mutations',
    Map<String, dynamic>? variables,
    void Function(Map<String, dynamic>)? fromJson,
  }) async {
    logInfo('createItem(): $T');
    await CoreRepo.init();
    try {
      final graphQLHelper = GraphQLHelper(
        endpoint!,
        jwtIdToken!,
      );
      final result = await graphQLHelper.performQuery(
        graphQLHelper.generateGraphqlFilePath(
          graphqlType,
          graphqlModel,
        ),
        variables: variables ?? <String, dynamic>{},
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final json = result.data![operationName] as Map<String, dynamic>? ??
          <String, dynamic>{};
      return Tuple2<T, int?>(
        fromJson!(
          json,
        ) as T,
        json['_version'] as int?,
      );
    } catch (e) {
      logInfo(e);
    }

    return null;
  }

  static Future<Tuple2<T, int?>?> updateItem<T>(
    String graphqlModel,
    String operationName, {
    String graphqlType = 'mutations',
    Map<String, dynamic>? variables,
    void Function(Map<String, dynamic>)? fromJson,
  }) async {
    logInfo('updateItem(): $T');
    await CoreRepo.init();
    try {
      final graphQLHelper = GraphQLHelper(
        endpoint!,
        jwtIdToken!,
      );
      final file = graphQLHelper.generateGraphqlFilePath(
        graphqlType,
        graphqlModel,
      );
      final result = await graphQLHelper.performQuery(
        graphQLHelper.generateGraphqlFilePath(
          graphqlType,
          graphqlModel,
        ),
        variables: variables ?? <String, dynamic>{},
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final json = result.data![operationName] as Map<String, dynamic>? ??
          <String, dynamic>{};
      return Tuple2<T, int?>(
        fromJson!(
          json,
        ) as T,
        json['_version'] as int?,
      );
    } catch (e) {
      logInfo(e);
    }

    return null;
  }

  static Future<Tuple2<T, int?>?> deleteItem<T>(
    String graphqlModel,
    String operationName, {
    String graphqlType = 'mutations',
    Map<String, dynamic>? variables,
    void Function(Map<String, dynamic>)? fromJson,
  }) async {
    logInfo('deleteItem(): $T');
    await CoreRepo.init();
    try {
      final graphQLHelper = GraphQLHelper(
        endpoint!,
        jwtIdToken!,
      );
      final result = await graphQLHelper.performQuery(
        graphQLHelper.generateGraphqlFilePath(
          graphqlType,
          graphqlModel,
        ),
        variables: variables ?? <String, dynamic>{},
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final json = result.data![operationName] as Map<String, dynamic>? ??
          <String, dynamic>{};
      return Tuple2<T, int?>(
        fromJson!(
          json,
        ) as T,
        json['_version'] as int?,
      );
    } catch (e) {
      logInfo(e);
    }

    return null;
  }
}
