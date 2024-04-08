// Package imports:
import 'package:encrypt/encrypt.dart';

class EncryptHelper {
  EncryptHelper._();

  static Key? key;
  static IV? iv = IV.fromLength(16);

  static void init(
    String organisationId,
    String userId,
    String userSubId,
    String profileId,
  ) {
    final key1 = organisationId.split('-')[0];
    final key2 = userId.split('-')[0];
    final key3 = userSubId.split('-')[0];
    // NOTE: profileId is not used in the encryption key
    // final key4 = profileId.split('-')[0];
    final newKey = '$key1$key2$key3';
    key = Key.fromUtf8(newKey);
  }

  static String encrypt(String plainText) {
    final encrypter = Encrypter(AES(key!));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decrypt(String cipherText) {
    final encrypter = Encrypter(AES(key!));
    final encrypted = Encrypted.fromBase64(cipherText);
    final plainText = encrypter.decrypt(encrypted, iv: iv);
    return plainText;
  }
}
