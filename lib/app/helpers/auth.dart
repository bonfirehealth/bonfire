// Package imports:
import 'package:jwt_decode/jwt_decode.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AuthHelper {
  AuthHelper._();

  static Future<void> init(String? jwtIdToken) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var userId = sharedPrefs.getString('user_id');
    var userSubId = sharedPrefs.getString('user_sub_id');
    if (jwtIdToken != null) {
      final jwtIdTokenMap = Jwt.parseJwt(jwtIdToken);

      if (userSubId == null || userSubId == '') {
        if (jwtIdToken != '') {
          userSubId = jwtIdTokenMap['sub'] as String?;
          await sharedPrefs.setString('user_sub_id', userSubId ?? '');
        }
      }

      if (userId == null || userId == '') {
        if (jwtIdToken != '') {
          userId = jwtIdTokenMap['custom:user_id'] as String?;
          if (userId != null) {
            await sharedPrefs.setString('user_id', userId);
            await MixpanelHelper.init(FlavorConfig.instance!.flavor);
            MixpanelHelper.mixpanel?.identify(userId);
          }
        }
      }
    }
  }

  static bool isPasswordMatched(String password, String confirmPassword) {
    logInfo('isPasswordMatched: ${password == confirmPassword}');
    return password == confirmPassword;
  }

  static bool isPasswordRequirementMet(String password) {
    final requirementRegEx = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    );

    logInfo(
      'isPasswordRequirementMet: ${requirementRegEx.hasMatch(password)}',
    );
    return requirementRegEx.hasMatch(password);
  }

  static String generatePassword({
    bool isWithLetters = true,
    bool isWithUppercase = true,
    bool isWithNumbers = true,
    bool isWithSpecial = true,
    double numberCharPassword = 64,
  }) {
    final passwordGenerator = RandomPasswordGenerator();

    var password = passwordGenerator.randomPassword(
      letters: isWithLetters,
      uppercase: isWithUppercase,
      numbers: isWithNumbers,
      specialChar: isWithSpecial,
      passwordLength: numberCharPassword,
    );

    while (!isPasswordRequirementMet(password)) {
      password = passwordGenerator.randomPassword(
        letters: isWithLetters,
        uppercase: isWithUppercase,
        numbers: isWithNumbers,
        specialChar: isWithSpecial,
        passwordLength: numberCharPassword,
      );
    }

    return password;
  }

  static Future<bool> isSignedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool('is_signed_in') ?? false;
  }

  static Future<bool> isOrganisationAccount() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool('is_organisation_account') ?? false;
  }

  static Future<bool> isValidOrganisationAccount(String? jwtIdToken) async {
    var isValid = false;

    if (jwtIdToken != null) {
      final jwtIdTokenMap = Jwt.parseJwt(jwtIdToken);
      final emailAddress = jwtIdTokenMap['email'] as String?;

      if (emailAddress != null) {
        final domainName = AppConstant.emailDomainUrl ?? 'bonfire.love';
        if (!emailAddress.contains(domainName)) {
          isValid = true;
        }
      }
    }

    return isValid;
  }

  static Future<Tuple3<String?, String?, String?>>
      getOrganisationQueryParams() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final organisationCode = sharedPrefs.getString('organisation_code');
    final organisationToken = sharedPrefs.getString('organisation_token');
    final organisationUserId = sharedPrefs.getString('organisation_user_id');
    return Tuple3(organisationCode, organisationToken, organisationUserId);
  }

  static Future<void> initEncrypt() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userId = sharedPrefs.getString('user_id') ?? '';
    final userSubId = sharedPrefs.getString('user_sub_id') ?? '';
    final profileId = sharedPrefs.getString('profile_id') ?? '';
    final organisationId = sharedPrefs.getString('organisation_id') ?? '';
    EncryptHelper.init(organisationId, userId, userSubId, profileId);
  }

  static Future<Tuple2<String, String>?> getAuthToken() async {
    await initEncrypt();
    final sharedPrefs = await SharedPreferences.getInstance();
    var jwtIdToken = sharedPrefs.getString('jwt_id_token');
    var jwtRefreshToken = sharedPrefs.getString('jwt_refresh_token');
    if (jwtIdToken != null) {
      if (jwtIdToken.isNotEmpty && !jwtIdToken.contains('eyJ')) {
        jwtIdToken = EncryptHelper.decrypt(jwtIdToken);
      }

      if (jwtRefreshToken != null) {
        if (jwtRefreshToken.isNotEmpty && !jwtRefreshToken.contains('eyJ')) {
          jwtRefreshToken = EncryptHelper.decrypt(jwtRefreshToken);
          return Tuple2(jwtIdToken, jwtRefreshToken);
        }
      }
    }

    return null;
  }
}
