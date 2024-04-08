// Package imports:
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class UserRepo {
  UserRepo._();

  static Future<Tuple2<User?, int?>?> getUser({String? userId}) async {
    logInfo('getUser()');
    await CoreRepo.init();
    return CoreRepo.getItem<User>(
      'user',
      'getUser',
      variables: <String, dynamic>{
        'userID': userId ?? CoreRepo.userId,
      },
      fromJson: User.fromJson,
    );
  }

  static Future<Tuple2<User?,int?>?> getUserWithAmplify({String? userId}) async {
    await CoreRepo.init();
    final request = ModelQueries.get(
      User.classType,
      userId ?? CoreRepo.userId!,
    );
    final response = await Amplify.API.query(request: request).response;
    return Tuple2(response.data, null);
  }

  static Future<List<User?>?>  getFamilyMembers() async {
    logInfo('getFamilyMembers()');
    await CoreRepo.init();
    final queryPredicate = User.PARENTID.eq(CoreRepo.userId);
    final request = ModelQueries.list<User>(
      User.classType,
      where: queryPredicate,
      limit: 999999999
    );
    final response = await Amplify.API.query(request: request).response;
    return response.data?.items.where((element) => element?.deletedAt==null).toList();
  }

  static Future<Tuple2<User?, int?>?> updateUser({
    String? mobilePushNotificationToken,
    String? webPushNotificationToken,
    String? externalUserId,
    String? photoBase64,
    String? photoUrl,
    String? telegramId,
    int? version = 1,
  }) async {
    logInfo('updateUser()');
    await CoreRepo.init();

    final variables = <String, dynamic>{
      'input': {
        'id': CoreRepo.userId,
        '_version': version,
      },
    };

    final input = variables['input'] as Map<String, dynamic>;

    if (webPushNotificationToken != null) {
      input['webPushNotificationToken'] =
          webPushNotificationToken.replaceAll('"', '');
    }
    if (mobilePushNotificationToken != null) {
      input['mobilePushNotificationToken'] =
          mobilePushNotificationToken.replaceAll('"', '');
    }

    if (externalUserId != null) {
      input['externalUserID'] = externalUserId;
    }

    if (photoBase64 != null) {
      input['photoBase64'] = photoBase64;
    }

    if (photoUrl != null) {
      input['photoUrl'] = photoUrl;
    }

    if (telegramId != null) {
      input['telegramId'] = telegramId;
    }


    return CoreRepo.updateItem<User>(
      'user_update',
      'updateUser',
      variables: variables,
      fromJson: User.fromJson,
    );
  }
}
