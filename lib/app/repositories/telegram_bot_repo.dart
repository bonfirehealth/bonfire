// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app_config.dart';

class TelegramBotRepo {
  TelegramBotRepo._();

  static late TeleDart teledart;



  static Future<void> checkAndSendToFamilyMemberOwner(String message) async {
    await CoreRepo.init();
    final user = await UserRepo.getUserWithAmplify();
    if (user?.item1 != null && user!.item1!.parentId != null) {
      final parentUser = await getParentUser();
      if (parentUser != null && parentUser.telegramChatId!=null) {
        await sendMessageWithTelegramBot(telegramChatId: parentUser.telegramChatId!,telegramUsername: parentUser.telegramId, message:  message);
      }
    }
  }

  static Future<Map<String, String>?> sendMessageWithTelegramBot({required String telegramChatId, String? telegramUsername,required String message}) async {
    final endpoint = AmplifyConstant.getTelegramBotFunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );
    final requestJson = {
      'message': {
        'chat': {'id': telegramChatId, 'username': telegramUsername},
        'from': {'id': telegramChatId, 'username': telegramUsername},
        'text': message
      }
    };

    http.Response? response;
    try {
      response = await http.post(
        Uri.parse(endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestJson),
      );

      final body = json.decode(response.body);
      return {};
    } catch (e) {
      logInfo('sendMessageWithTelegramBot(): $e');
      return <String, String>{};
    }
  }

  static Future<User?> getParentUser() async {
    await CoreRepo.init();
    final user = await UserRepo.getUserWithAmplify();
    if (user?.item1 != null) {
      final parentId = user!.item1!.parentId;
      if (parentId != null) {
        final ownerUser = await UserRepo.getUserWithAmplify(userId: parentId);
        return ownerUser?.item1;
      }
    }
    return null;
  }

}
