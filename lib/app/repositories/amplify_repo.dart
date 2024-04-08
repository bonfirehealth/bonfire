// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:html';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

// Package imports:
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';
import 'package:universal_html/html.dart' as html;

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

import 'package:bonfirehealth/app/constants/amplify_config_development.dart'
    as development;
import 'package:bonfirehealth/app/constants/amplify_config_production.dart'
    as production;
import 'package:bonfirehealth/app/constants/amplify_config_staging.dart'
    as staging;

class AmplifyRepo {
  AmplifyRepo._();

  static final apiPlugin = AmplifyAPI(modelProvider: ModelProvider.instance);
  static final analyticsPlugin = AmplifyAnalyticsPinpoint();
  static final authPlugin = AmplifyAuthCognito();
  static final storagePlugin = AmplifyStorageS3();

  static final dataStorePlugin = AmplifyDataStore(
    modelProvider: ModelProvider.instance,
  );
  static AmplifyConfig? amplifyConfig;
  static String amplifyConfigString = '';

  static Future<void> init() async {
    try {
      if (FlavorConfig.isProduction()) {
        amplifyConfigString = production.amplifyconfig;
      } else if (FlavorConfig.isStaging()) {
        amplifyConfigString = staging.amplifyconfig;
      } else {
        amplifyConfigString = development.amplifyconfig;
      }

      final json = jsonDecode(amplifyConfigString) as Map;
      amplifyConfig = AmplifyConfig.fromJson(json.cast());

      await Amplify.addPlugins([
        apiPlugin,
        analyticsPlugin,
        authPlugin,
        storagePlugin,
        if (!kIsWeb) dataStorePlugin,
      ]);

      try {
        await Amplify.configure(amplifyConfigString);
      } on AmplifyAlreadyConfiguredException {
        logInfo('Amplify was already configured.');
      }

      Amplify.Hub.listen(
        HubChannel.Api,
        (ApiHubEvent event) {
          if (event is SubscriptionHubEvent) {
            logInfo('[SubscriptionHubEvent]: $event');
          }
        },
      );
    } catch (e) {
      logInfo('An error occurred while configuring Amplify: $e');
    }
  }

  Future<String> loadQuery(String filePath) async {
    return rootBundle.loadString(filePath);
  }

  static String getUserPoolId() {
    var userPoolId = '';
    for (final entry in amplifyConfig!.auth!.plugins.entries) {
      if (entry.key == 'awsCognitoAuthPlugin') {
        for (final entry2 in entry.value.toJson().entries) {
          if (entry2.key == 'CognitoUserPool') {
            final map = entry2.value as Map<String, dynamic>?;
            final map2 = map!['Default'] as Map<String, dynamic>;
            userPoolId = '${map2['PoolId']}';
          }
        }
      }
    }

    return userPoolId;
  }

  static String getAppClientId() {
    var clientId = '';
    for (final entry in amplifyConfig!.auth!.plugins.entries) {
      if (entry.key == 'awsCognitoAuthPlugin') {
        for (final entry2 in entry.value.toJson().entries) {
          if (entry2.key == 'CognitoUserPool') {
            final map = entry2.value as Map<String, dynamic>?;
            final map2 = map!['Default'] as Map<String, dynamic>;

            clientId = '${map2['AppClientId']}';
          }
        }
      }
    }

    return clientId;
  }

  static String getAppSyncGraphQLEndpoint() {
    var endpoint = '';
    for (final entry in amplifyConfig!.auth!.plugins.entries) {
      if (entry.key == 'awsCognitoAuthPlugin') {
        for (final entry2 in entry.value.toJson().entries) {
          if (entry2.key == 'AppSync') {
            final map = entry2.value as Map<String, dynamic>?;
            final map2 = map!['Default'] as Map<String, dynamic>;
            endpoint = '${map2['ApiUrl']}';
          }
        }
      }
    }

    return endpoint;
  }

  static Future<Map<String, dynamic>> confirmSignUpAsGroup(
      String username, String emailAddress, String password,
      {String groupName = 'organisation_employees',
      String organisationId = '',
      String? userTypeId,
      String? parentId,
      String? uniqueLinkValue,
      String? firstName,
      String? lastName,
      String? avatar}) async {
    final userPoolId = AmplifyRepo.getUserPoolId();
    final appClientId = AmplifyRepo.getAppClientId();
    final userPool = CognitoUserPool(userPoolId, appClientId);
    var userId = '';
    var userSubId = '';
    var profileId = '';

    CognitoUserPoolData data;
    try {
      data = await userPool.signUp(
        emailAddress,
        password,
      );

      userSubId = data.userSub ?? '';
    } catch (e) {
      logInfo('confirmSignUpAsGroup(): $e');
    }

    try {
      final userMap = await callConfirmAndVerifySignUp(
        username,
        emailAddress,
        groupName,
        organisationId,
        userType: userTypeId,
        parentId: parentId,
        uniqueLinkValue: uniqueLinkValue,
        firstName: firstName,
        lastName: lastName,
        avatar: avatar,
      );
      if (parentId != null) {
        return {};
      }
      userId = userMap?['user_id'] as String? ?? '';
      profileId = userMap?['profile_id'] as String? ?? '';
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString('user_id', userId);
      await sharedPrefs.setString('profile_id', profileId);
      await sharedPrefs.setString('user_sub_id', userSubId);
      final newUsername = emailAddress.split('@')[0];
      await MixpanelHelper.init(FlavorConfig.instance!.flavor);
      MixpanelHelper.setCredentials(userId, newUsername, emailAddress);
      return <String, dynamic>{
        'user_id': userId,
        'user_sub_id': userSubId,
        'profile_id': profileId,
        'organisation_id': organisationId,
      };
    } catch (e) {
      logInfo('callConfirmAndVerifySignUp(): $e');
    }

    return <String, dynamic>{};
  }

  static Future<Tuple2<CognitoUserSession?, String?>> signIn(
    String emailAddress,
    String password,
  ) async {
    var userPoolId = '';
    var clientId = '';
    for (final entry in amplifyConfig!.auth!.plugins.entries) {
      if (entry.key == 'awsCognitoAuthPlugin') {
        for (final entry2 in entry.value.toJson().entries) {
          if (entry2.key == 'CognitoUserPool') {
            final map = entry2.value as Map<String, dynamic>?;
            final map2 = map!['Default'] as Map<String, dynamic>;
            userPoolId = '${map2['PoolId']}';
            clientId = '${map2['AppClientId']}';
          }
        }
      }
    }
    final userPool = CognitoUserPool(userPoolId, clientId);
    final cognitoUser = CognitoUser(emailAddress, userPool);
    final authDetails = AuthenticationDetails(
      username: emailAddress,
      password: password,
    );
    CognitoUserSession? session;
    String? errorMessage;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
      await Amplify.Auth.signIn(
        username: emailAddress,
        password: password,
      );
    } on CognitoUserNewPasswordRequiredException catch (e) {
      // handle New Password challenge
      errorMessage = e.message;
      logInfo(e);
    } on CognitoUserMfaRequiredException catch (e) {
      // handle SMS_MFA challenge
      errorMessage = e.message;
      logInfo(e);
    } on CognitoUserSelectMfaTypeException catch (e) {
      // handle SELECT_MFA_TYPE challenge
      errorMessage = e.message;
      logInfo(e);
    } on CognitoUserMfaSetupException catch (e) {
      // handle MFA_SETUP challenge
      errorMessage = e.message;
      logInfo(e);
    } on CognitoUserTotpRequiredException catch (e) {
      // handle SOFTWARE_TOKEN_MFA challenge
      errorMessage = e.message;
      logInfo(e);
    } on CognitoUserCustomChallengeException catch (e) {
      // handle CUSTOM_CHALLENGE challenge
      errorMessage = e.message;
      logInfo(e);
    } on CognitoUserConfirmationNecessaryException catch (e) {
      // handle User Confirmation Necessary
      errorMessage = e.message;
      logInfo(e);
    } on CognitoClientException catch (e) {
      // handle Wrong Username and Password and Cognito Client
      errorMessage = e.message;
      logInfo(e);
    } catch (e) {
      errorMessage = '$e';
      logInfo(e);
    }
    logInfo(session?.getAccessToken().getJwtToken());
    return Tuple2<CognitoUserSession?, String?>(session, errorMessage);
  }

  static Future<void> saveUserSessionLocal(
    CognitoUserSession session,
    String userId,
    String organisationId,
  ) async {
    var jwtRefreshToken = session.refreshToken?.getToken() ?? '';
    var jwtIdToken = session.getIdToken().jwtToken ?? '';
    final jwtIdTokenMap = Jwt.parseJwt(jwtIdToken);
    final userSubId = jwtIdTokenMap['sub'] as String;
    final jwtIdTokenExpiration = session.accessToken.getExpiration();
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.remove('organisation_code');
    await sharedPrefs.remove('organisation_token');
    await sharedPrefs.remove('organisation_user_id');
    await sharedPrefs.setBool('is_signed_in', true);

    await sharedPrefs.setString('organisation_id', organisationId);

    await sharedPrefs.setString('user_id', userId);
    await sharedPrefs.setString('user_sub_id', userSubId);
    final profileId = sharedPrefs.getString('profile_id') ?? '';
    EncryptHelper.init(
      organisationId,
      userId,
      userSubId,
      profileId,
    );
    jwtIdToken = EncryptHelper.encrypt(jwtIdToken);
    await sharedPrefs.setString('jwt_id_token', jwtIdToken);
    await sharedPrefs.setInt(
      'jwt_id_token_expiration',
      jwtIdTokenExpiration,
    );
    jwtRefreshToken = EncryptHelper.encrypt(jwtRefreshToken);
    await sharedPrefs.setString(
      'jwt_refresh_token',
      jwtRefreshToken,
    );
  }

  static Future<CognitoUserSession?> refreshJWTIdToken(
    String idToken,
    String refreshToken,
  ) async {
    final jwtIdTokenMap = Jwt.parseJwt(idToken);
    final emailAddress = jwtIdTokenMap['email'] as String;
    final userPoolId = AmplifyRepo.getUserPoolId();
    final appClientId = AmplifyRepo.getAppClientId();
    final userPool = CognitoUserPool(userPoolId, appClientId);
    final cognitoUser = CognitoUser(emailAddress, userPool);
    final cognitoRefreshToken = CognitoRefreshToken(refreshToken);
    final session = await cognitoUser.refreshSession(cognitoRefreshToken);
    var jwtRefreshToken = session?.refreshToken?.getToken() ?? '';
    var jwtIdToken = session?.getIdToken().jwtToken ?? '';
    final jwtIdTokenExpiration = session?.accessToken.getExpiration();

    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString('user_id') ?? '';
    final userSubId = sharedPrefs.getString('user_sub_id') ?? '';
    final profileId = sharedPrefs.getString('profile_id') ?? '';
    final organisationId = sharedPrefs.getString('organisation_id') ?? '';
    EncryptHelper.init(organisationId, userId, userSubId, profileId);
    jwtIdToken = EncryptHelper.encrypt(jwtIdToken);
    await sharedPrefs.setString('jwt_id_token', jwtIdToken);
    await sharedPrefs.setInt(
      'jwt_id_token_expiration',
      jwtIdTokenExpiration!,
    );
    jwtRefreshToken = EncryptHelper.encrypt(jwtRefreshToken);
    await sharedPrefs.setString('jwt_refresh_token', jwtRefreshToken);
    return session;
  }

  static Future<Map<String, dynamic>?> callConfirmAndVerifySignUp(
      String username,
      String emailAddress,
      String groupName,
      String organisationId,
      {String? userType,
      String? parentId,
      String? uniqueLinkValue,
      String? firstName,
      String? lastName,
      String? avatar}) async {
    final endpoint = AmplifyConstant.getConfirmSignUpFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );
    final userTypeId = userType ??
        AmplifyConstant.getOrganisationEmployeeTypeId(
          FlavorConfig.instance!.flavor,
        );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'username': username,
        'email_address': emailAddress,
        'group_name': groupName,
        'organisation_id': organisationId,
        'user_type_id': userTypeId,
        'parent_id': parentId,
        'unique_link_value': uniqueLinkValue,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final userId = '${data['user_id']}';
      final profileId = '${data['profile_id']}';

      return <String, dynamic>{
        'user_id': userId,
        'profile_id': profileId,
      };
    } catch (e) {
      logInfo('getConfirmSignUpFunctionEndpoint(): $e');
      return <String, dynamic>{};
    }
  }

  static Future<Organisation?> callCheckOrganisationByCodeAndToken(
    String organisationCode,
    String organisationToken,
  ) async {
    final endpoint = AmplifyConstant.getCheckOrganisationByCodeFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'organisation_code': organisationCode,
        'organisation_token': organisationToken,
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      return Organisation.fromJson(data);
    } catch (e) {
      logInfo(e);
    }
    return null;
  }

  static Future<Organisation?> callCheckOrganisationBySecretCode(
    String secretCode,
  ) async {
    final endpoint = AmplifyConstant.getCheckOrganisationByCodeFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'secret_code': secretCode,
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      return Organisation.fromJson(data);
    } catch (e) {
      logInfo(e);
    }
    return null;
  }

  static Future<List<String>> callGenerateRecoveryCodes(
    String userId,
    String userSubId, {
    int numberOfRecoveryCodes = 10,
  }) async {
    final endpoint = AmplifyConstant.getGenerateRecoveryCodesFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'user_id': userId,
        'user_sub_id': userSubId,
        'number_of_recovery_codes': numberOfRecoveryCodes,
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final tempCodes = data['recovery_codes'] as List<dynamic>;
      final recoveryCodes = <String>[];
      for (final code in tempCodes) {
        recoveryCodes.add(code as String);
      }

      return recoveryCodes;
    } catch (e) {
      logInfo(e);
    }
    return [];
  }

  static Future<ProfileResult> callCheckProfileExists(String userId) async {
    final endpoint = AmplifyConstant.getCheckProfileExistsFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'user_id': userId,
      });
      //final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http
          .post(
            Uri.parse(endpoint),
            headers: {'Content-Type': 'application/json'},
            body: bodyMap,
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body) as Map;

        if (responseData['profile'] != null) {
          final profileData = responseData['profile'] as Map<String, dynamic>;
          final profile = Profile.fromJson(profileData);
          return ProfileResult(
            created: responseData['created'] as bool,
            profile: profile,
          );
        }
      }
      return ProfileResult(created: false);
    } catch (e, s) {
      logInfo(e);
      logInfo(s);
    }
    return ProfileResult(created: false);
  }

  static Future<void> setDepartment(
    String userId,
    String departmentId,
  ) async {
    final endpoint = AmplifyConstant.getSetDepartmentFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'user_id': userId,
        'department_id': departmentId,
      });

      await http
          .post(
            Uri.parse(endpoint),
            headers: {'Content-Type': 'application/json'},
            body: bodyMap,
          )
          .timeout(const Duration(seconds: 10));
    } catch (e, s) {
      logInfo(e);
      logInfo(s);
    }
  }

  static Future<bool> callCheckEmailAddressAvailability(
    String emailAddress,
  ) async {
    final endpoint =
        AmplifyConstant.getCheckEmailAddressAvailabilityFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'email_address': emailAddress,
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final isEmailAddressAvailable =
          data['is_email_address_available'] as bool? ?? false;
      logInfo('$data');
      return isEmailAddressAvailable;
    } catch (e) {
      logInfo(e);
    }
    return false;
  }

  static Future<List<OrgDepartment>> callGetOrganisationDepartment(
      String organisationCode) async {
    final endpoint = AmplifyConstant.getOrgDepartmentsFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      response = await http.get(
        Uri.parse('$endpoint/?organisation_code=$organisationCode'),
        headers: {'Content-Type': 'text/plain'},
      );
      if (response.statusCode == 200) {
        final responseDataList = jsonDecode(response.body) as List<dynamic>;

        if (responseDataList.isNotEmpty) {
          final orgDepartments = responseDataList.map((item) {
            return OrgDepartment(
              id: item['id'] as String,
              organisationCode: item['organisation_code'] as String,
              levelOne: item['level_one'] as String,
              levelTwo: item['level_two'] as String,
            );
          }).toList();
          return orgDepartments;
        }
      }
    } catch (e, s) {
      logInfo(e);
      logInfo(s);
    }
    return [];
  }

  static Future<String?> recoverAccount(
    String emailAddress,
    String recoveryCode,
  ) async {
    final endpoint = AmplifyConstant.getRecoverAccountFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'email_address': emailAddress,
        'recovery_code': recoveryCode,
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final recoveryCodeId = data['recovery_code_id'] as String;
      final isValid = data['is_valid'] as bool? ?? false;
      logInfo('$data');
      if (isValid) {
        return recoveryCodeId;
      }
    } catch (e) {
      logInfo(e);
    }
    return null;
  }

  static Future<bool> resetPassword(
    String emailAddress,
    String password,
    String recoveryCode,
    String recoveryCodeId,
  ) async {
    final endpoint = AmplifyConstant.getResetPasswordFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'email_address': emailAddress,
        'password': password,
        'recovery_code': recoveryCode,
        'recovery_code_id': recoveryCodeId,
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final isReset = data['is_reset'] as bool? ?? false;
      final isUsed = data['is_used'] as bool? ?? false;
      logInfo('$data');
      return isReset && isUsed;
    } catch (e) {
      logInfo(e);
    }
    return false;
  }

  static Future<Map<String, dynamic>?> reportWeekly(
      String personalEmailAddress, String emailAddress) async {
    final endpoint = AmplifyConstant.getReportWeeklyFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{});
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final isSent = data['is_sent'] as bool;
      return <String, dynamic>{
        'is_sent': isSent,
      };
    } catch (e) {
      logInfo('sendSecretCredentialsEmail(): $e');
      return <String, dynamic>{};
    }
  }

  static Future<Map<String, dynamic>?> sendSecretCredentialsEmail(
    String personalEmailAddress,
    String emailAddress,
    String password,
    List<String> recoveryCodes,
    String userId,
  ) async {
    final endpoint =
        AmplifyConstant.getSendSecretCredentialsEmailFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'personal_email_address': personalEmailAddress,
        'email_address': emailAddress,
        'password': password,
        'recovery_codes': recoveryCodes,
        'user_id': userId,
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final isSent = data['is_sent'] as bool;
      return <String, dynamic>{
        'is_sent': isSent,
      };
    } catch (e) {
      logInfo('sendSecretCredentialsEmail(): $e');
      return <String, dynamic>{};
    }
  }

  static Future<Map<String, dynamic>?> processScreeningVideo(
    html.Blob blob,
    String inputObjectKey,
    String outputObjectKey, {
    int? begin,
    int? end,
    BrowserName browserName = BrowserName.safari,
  }) async {
    final endpoint = AmplifyConstant.getProcessScreeningVideoFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    final uploadResponse = await MediaHelper.uploadVideoToS3Bucket2(
      blob,
      endpoint,
      inputObjectKey,
      outputObjectKey,
      begin: begin,
      end: end,
      inputFileMimeType:
          browserName == BrowserName.safari ? 'video/mp4' : 'video/webm',
    );

    return uploadResponse;
  }

  static Future<Uint8List> convertBlobToBytes(html.Blob blob) async {
    final reader = FileReader();
    final completer = Completer<Uint8List>();

    reader.onLoadEnd.listen((_) {
      completer.complete(Uint8List.fromList(reader.result as List<int>));
    });

    reader.onError.listen((_) {
      completer.completeError('Error reading Blob.');
    });

    reader.readAsArrayBuffer(blob);

    return completer.future;
  }

  static Future<Map<String, dynamic>?> checkScreeningVideoQuality(
    String imagesUrl,
    double framesPerSecond,
  ) async {
    final endpoint =
        AmplifyConstant.getCheckScreeningVideoQualityFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          <String, dynamic>{
            'video_url': imagesUrl,
            // 'images_url': imagesUrl,
            'fps': framesPerSecond,
          },
        ),
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final isCheckerPassed = data['is_checker_passed'] as bool;
      final message = data['message'] as String;

      return <String, dynamic>{
        'is_checker_passed': isCheckerPassed,
        'message': message,
      };
    } catch (e) {
      logInfo('checkScreeningVideoQuality(): $e');
      return <String, dynamic>{};
    }
  }

  static Future<Map<String, dynamic>?> predictVitalSigns(
    String videoUrl,
    String filename,
    String metrics,
    double framesPerSecond, {
    bool convert = true,
    double weight = 0,
    double height = 0,
    int age = 0,
    String gender = '',
    double? startTime,
    double? endTime,
    List<Map<String, dynamic>> readinessHistory = const [],
    bool isDeleteVideo = true,
  }) async {
    final endpoint = AmplifyConstant.getPredictVitalSignsFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );
    final bucket = AmplifyConstant.getS3BucketName(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;

    // response = await http.post(
    //   Uri.parse(endpoint),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(
    //     <String, dynamic>{
    //       'bucket': bucket,
    //       'video_url': videoUrl,
    //       'fps': framesPerSecond,
    //       'user_info': {
    //         'weight': weight,
    //         'height': height,
    //         'age': age,
    //         'gender': gender.toLowerCase(),
    //       },
    //       'readiness_history': readinessHistory,
    //       'is_delete_video': isDeleteVideo,
    //     },
    //   ),
    // );
    final request = http.MultipartRequest('POST', Uri.parse(endpoint));
    request.fields['video_url'] = videoUrl;
    request.fields['filename'] = filename;
    request.fields['fps'] = framesPerSecond.toString();
    request.fields['age'] = age.toString();
    request.fields['weight'] = weight.toString();
    request.fields['height'] = height.toString();
    request.fields['sex'] = gender;
    request.fields['metrics'] = metrics;
    if (startTime != null) {
      request.fields['start_time'] = startTime.toString();
    }
    if (endTime != null) {
      request.fields['end_time'] = endTime.toString();
    }
    request.fields['readiness_history'] = jsonEncode(readinessHistory);

    response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as Map<String, dynamic>?;

      if (body != null && body['status_code'] == 200) {
        // final dataArray = body['data'] as List<dynamic>?;
        // var data = <String, dynamic>{};

        // if (dataArray != null) {
        //   data = dataArray[0] as Map<String, dynamic>;
        // } else {
        //   data = body;
        // }
        final data = body['data'] as Map<String, dynamic>;

        final o2 = -9999;
        final respRate = -9999;
        final spo2 = -9999;
        final sp = data['systolic_blood_pressure'] as double?;
        final dp = data['diastolic_blood_pressure'] as double?;
        final hrv = data['heart_rate_variability'] as double?;
        final bpm = data['heart_rate'] as double?;
        final readinessIndex = data['readiness_index'] as double?;
        final vo2Max = data['vo2_max'] as double?;

        final kubiosResult = data['readiness_detail'] as Map<String, dynamic>?;

        if (kubiosResult != null && kubiosResult.containsKey('artefact_level')) {

          final si = kubiosResult['stress_index'];
          final snsIndex = kubiosResult['sns_index'];
          return <String, dynamic>{
            'oxygen_level': o2,
            'respiratory_rate': respRate,
            'blood_oxygen_level': spo2,
            'stress_index': si,
            'readiness_index': readinessIndex,
            'systolic_blood_pressure': sp,
            'diastolic_blood_pressure': dp,
            'heart_rate_variability': hrv,
            'heart_rate': bpm,
            'sympathetic_nervous_system_index': snsIndex,
            'sns_index': snsIndex,
            'vo2Max': vo2Max,
            'kubios_result': kubiosResult,
          };
        } else {
          const si = -9999;
          const snsIndex = -9999;
          return <String, dynamic>{
            'oxygen_level': o2,
            'respiratory_rate': respRate,
            'blood_oxygen_level': spo2,
            'stress_index': si,
            'readiness_index': readinessIndex,
            'systolic_blood_pressure': sp,
            'diastolic_blood_pressure': dp,
            'heart_rate_variability': hrv,
            'heart_rate': bpm,
            'sympathetic_nervous_system_index': snsIndex,
            'sns_index': snsIndex,
            'vo2Max': vo2Max,
            'kubios_result': null,
          };
        }
      }
    }
    return null;
  }

  static Future<Map<String, double>?> predictBodyTemperature(
    String videoUrl,
    String filename,
  ) async {
    final endpoint = AmplifyConstant.getPredictBodyTemperatureFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    // http.Response? response;
    try {
      // response = await http.post(
      //   Uri.parse(endpoint),
      //   headers: {'Content-Type': 'application/json'},
      //   body: jsonEncode(
      //     <String, String>{
      //       'video_url': videoUrl,
      //       'filename': filename,
      //     },
      //   ),
      // );
      final request = http.MultipartRequest('POST', Uri.parse(endpoint));
      request.fields['video_url'] = videoUrl;
      request.fields['filename'] = filename;
      request.fields['metrics'] = 'BT';

      // final response = await http.Response.fromStream(await request.send());
      final streamedResponse = await request.send();

      if (streamedResponse.statusCode == 200) {
        final response = await streamedResponse.stream.bytesToString();
        final body = json.decode(response) as Map<String, dynamic>;
        if (body['status_code'] == 200) {
          // ignore: avoid_dynamic_calls
          return {'hinge': body['data']['body_temperature'] as double};
        }
        return <String, double>{};
      } else {
        logInfo(
            'predictBodyTemperature() error - HTTP Status Code: ${streamedResponse.statusCode}');
        return <String, double>{};
      }
    } catch (e) {
      logInfo('predictBodyTemperature(): $e');
      return <String, double>{};
    }
  }

  static Future<Map<String, dynamic>?> predictVO2Max(
    int age,
    String sex,
    double hb30To60,
  ) async {
    final endpoint = AmplifyConstant.getPredictVO2MaxFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          <String, dynamic>{
            'age': age,
            'sex': sex,
            'hb30to60': hb30To60,
          },
        ),
      );
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        return {'vo2max': body['vo2max'] as double};
      } else {
        logInfo(
            'An error has occurred while predicting VO2-max: ${response.statusCode}');
        return <String, dynamic>{};
      }
    } catch (e) {
      logError('predictVO2Max(): $e');
      return <String, dynamic>{};
    }
  }

  static Future<Map<String, String>?> encryptDecryptFamilyMemberPassword(
      String action, String value) async {
    final endpoint =
        AmplifyConstant.getFamilyMemberPasswordManagerFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          <String, String>{'action': action, 'value': value},
        ),
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      print('Body from familyPlan is $body');
      return {'value': body['payload'] as String};
    } catch (e) {
      logInfo('encryptDecryptFamilyMemberPassword(): $e');
      return <String, String>{};
    }
  }

  static Future<Map<String, dynamic>?> triggerAggregateAssessmentsByTimePeriod(
    String profileId, {
    String timezone = 'Asia/Singapore',
  }) async {
    final endpoint =
        AmplifyConstant.getAggregateAssessmentsByTimePeriodFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'profile_id': profileId,
        'timezone': timezone,
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final isSuccess = data['is_success'] as bool;
      return <String, dynamic>{
        'is_success': isSuccess,
      };
    } catch (e) {
      logInfo('triggerAggregateAssessmentsByTimePeriod(): $e');
      return <String, dynamic>{};
    }
  }

  static Future<Map<String, dynamic>?>
      triggerAggregateOrganisationAssessmentsByTimePeriod(
    String organisationId, {
    String timezone = 'Asia/Singapore',
  }) async {
    final endpoint = AmplifyConstant
        .getAggregateOrganisationAssessmentsByTimePeriodFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    http.Response? response;
    try {
      final bodyMap = jsonEncode(<String, dynamic>{
        'organisation_id': organisationId,
        'timezone': timezone,
      });
      final encodedBody = base64.encode(utf8.encode(bodyMap));
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'text/plain'},
        body: encodedBody,
      );
      final body = json.decode(response.body) as Map<String, dynamic>;
      final dataArray = body['data'] as List<dynamic>?;
      var data = <String, dynamic>{};
      if (dataArray != null) {
        data = dataArray[0] as Map<String, dynamic>;
      } else {
        data = body;
      }

      final isSuccess = data['is_success'] as bool;
      return <String, dynamic>{
        'is_success': isSuccess,
      };
    } catch (e) {
      logInfo('triggerAggregateOrganisationAssessmentsByTimePeriod(): $e');
      return <String, dynamic>{};
    }
  }
}

class ProfileResult {
  ProfileResult({
    this.profile,
    required this.created,
  });
  final Profile? profile;
  final bool created;
}

class OrgDepartment {
  OrgDepartment({
    required this.id,
    required this.organisationCode,
    required this.levelOne,
    required this.levelTwo,
  });
  final String id;
  final String organisationCode;
  final String levelOne;
  final String levelTwo;
  String get displayDepartment => '$levelOne - $levelTwo';
}
