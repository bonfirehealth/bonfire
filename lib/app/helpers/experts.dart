// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

void getQuestionActionCallToAction(BuildContext context, String? value) {
  final l10n = context.l10n;
  if (value == 'app_support') {
    showDialog<void>(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        return PopupForm(
          onTitleTextChanged: (String value) {},
          onDescriptionTextChanged: (String value) {},
          onSubmit: (String title, String description) {
            FocusScope.of(context).unfocus();
            Navigator.of(context).pop();
          },
          submitText: l10n.send,
        );
      },
    );
  } else if (value == 'hotline') {
    final hotline = getHotlineByCountryAndCountryCode();
    callHotline(hotline);
  }
}

Future<void> callQuickHotline() async {
  final hotline = getHotlineByCountryAndCountryCode();
  await callHotline(hotline);
}

Future<void> callHotline(
  String fullContactNumber, {
  bool isWhatsApp = false,
}) async {
  if (isWhatsApp) {
    final whatsAppUrl = 'https://wa.me/$fullContactNumber';
    if (await canLaunchUrl(Uri.parse(whatsAppUrl))) {
      await launchUrl(Uri.parse(whatsAppUrl));
    }
  } else {
    final phoneUrl = Uri(
      scheme: 'tel',
      path: fullContactNumber,
    );
    if (await canLaunchUrl(phoneUrl)) {
      await launchUrl(phoneUrl);
    }
  }
}

String getHotlineByCountryAndCountryCode({
  String countryCode = 'SG',
  String country = 'Singapore',
}) {
  if (countryCode == 'AR' || country == 'Argentina') {
    return '0800-333-9106';
  } else if (countryCode == 'AU' || country == 'Australia') {
    return '1-800-377-275';
  } else if (countryCode == 'AT' || country == 'Austria') {
    return '0800-802196';
  } else if (countryCode == 'BH' || country == 'Bahrain') {
    return '8000-6882';
  } else if (countryCode == 'BD' || country == 'Bangladesh') {
    return '09610-998489';
  } else if (countryCode == 'BE' || country == 'Belgium') {
    return '0800-261-74';
  } else if (countryCode == 'BR' || country == 'Brazil') {
    return '0-800-591-7023';
  } else if (countryCode == 'BG' || country == 'Bulgaria') {
    return '00800-110-0219';
  } else if (countryCode == 'CA' || country == 'Canada') {
    return '1866-641-3847';
  } else if (countryCode == 'CL' || country == 'Chile') {
    return '+56-448909184';
  } else if (countryCode == 'CN' || country == 'China') {
    return '4001-200746';
  } else if (countryCode == 'CO' || country == 'Colombia') {
    return '01800-913-7493';
  } else if (countryCode == 'HR' || country == 'Croatia') {
    return '0800-200-357';
  } else if (countryCode == 'CU' || country == 'Cuba') {
    return 'globalgru@compsych.com';
  } else if (countryCode == 'CW' || country == 'Curaçao') {
    return 'globalgru@compsych.com';
  } else if (countryCode == 'CY' || country == 'Cyprus') {
    return '+357-22000461';
  } else if (countryCode == 'CZ' || country == 'Czech Republic') {
    return '800-700-366';
  } else if (countryCode == 'DK' || country == 'Denmark') {
    return '8082-6013';
  } else if (countryCode == 'EC' || country == 'Ecuador') {
    return '1800-000-644';
  } else if (countryCode == 'EG' || country == 'Egypt') {
    return '0800-000-0637';
  } else if (countryCode == 'EE' || country == 'Estonia') {
    return 'globalgru@compsych.com';
  } else if (countryCode == 'FI' || country == 'Finland') {
    return '0800-915-732';
  } else if (countryCode == 'FR' || country == 'France') {
    return '0805-081906';
  } else if (countryCode == 'DE' || country == 'Germany') {
    return '08003007347';
  } else if (countryCode == 'GR' || country == 'Greece') {
    return '800-8481276';
  } else if (countryCode == 'HK' || country == 'Hong Kong') {
    return '800-905-386';
  } else if (countryCode == 'IS' || country == 'Iceland') {
    return 'globalgru@compsych.com';
  } else if (countryCode == 'IN' || country == 'India') {
    return '000800-100-4444';
  } else if (countryCode == 'ID' || country == 'Indonesia') {
    return '001-8030152046091';
  } else if (countryCode == 'IE' || country == 'Ireland') {
    return '1-800-948-327';
  } else if (countryCode == 'IL' || country == 'Israel') {
    return '1809457274';
  } else if (countryCode == 'IT' || country == 'Italy') {
    return '800-788-706';
  } else if (countryCode == 'JP' || country == 'Japan') {
    return '0120-974-243';
  } else if (countryCode == 'KZ' || country == 'Kazakhstan') {
    return '8-800-3332650';
  } else if (countryCode == 'KR' || countryCode == 'KP' || country.contains('Korea')) {
    return '080-822-1376';
  } else if (countryCode == 'KW' || country == 'Kuwait') {
    return 'globalgru@compsych.com';
  } else if (countryCode == 'LV' || country == 'Latvia') {
    return 'globalgru@compsych.com';
  } else if (countryCode == 'LY' || country == 'Libya') {
    return 'globalgru@compsych.com';
  } else if (countryCode == 'LT' || country == 'Lithuania') {
    return '+370-52140242';
  } else if (countryCode == 'MY' || country == 'Malaysia') {
    return '1-800-813-685';
  } else if (countryCode == 'MT' || country == 'Malta') {
    return '+356-2792 2856';
  } else if (countryCode == 'MX' || country == 'Mexico') {
    return '800-681-9591';
  } else if (countryCode == 'MA' || country == 'Morocco') {
    return '649114599';
  } else if (countryCode == 'NL' || countryCode == 'AN' || country.contains('Netherlands')) {
    return '0-800-020-0726';
  } else if (countryCode == 'NZ' || country == 'New Zealand') {
    return '0800-451978';
  } else if (countryCode == 'NG' || country == 'Nigeria') {
    return '070-80601824';
  } else if (countryCode == 'NO' || country == 'Norway') {
    return '800-15-821';
  } else if (countryCode == 'OM' || country == 'Oman') {
    return '800-77634';
  } else if (countryCode == 'PA' || country == 'Panama') {
    return '+507-833-9094';
  } else if (countryCode == 'PY' || country == 'Paraguay') {
    return '009-800-1787-0007';
  } else if (countryCode == 'PE' || country == 'Peru') {
    return '0800-54669';
  } else if (countryCode == 'PH' || country == 'Philippines') {
    return '1800-1-116-0927';
  } else if (countryCode == 'PL' || country == 'Poland') {
    return '0-0-8001113839';
  } else if (countryCode == 'PT' || country == 'Portugal') {
    return '800-180-069';
  } else if (countryCode == 'QA' || country == 'Qatar') {
    return '00800-100-071';
  } else if (countryCode == 'RO' || country == 'Romania') {
    return '0800-360644';
  } else if (countryCode == 'RU' || country.contains('Russia')) {
    return '8-800-100-6459';
  } else if (countryCode == 'SA' || country == 'Saudi Arabia') {
    return '800-844-8872';
  } else if (countryCode == 'RS' || country == 'Serbia') {
    return '0800-190-258';
  } else if (countryCode == 'SG' || country == 'Singapore') {
    return '(+65)3158-6529';
  } else if (countryCode == 'ZA' || country == 'South Africa') {
    return '080-0991590';
  } else if (countryCode == 'ES' || country == 'Spain') {
    return '900-868553';
  } else if (countryCode == 'LK' || country == 'Sri Lanka') {
    return '+94-078-9997098';
  } else if (countryCode == 'SE' || country == 'Sweden') {
    return '020-889-844';
  } else if (countryCode == 'TW' || country == 'Taiwan') {
    return '00801-12-6953';
  } else if (countryCode == 'TH' || country == 'Thailand') {
    return '180-001-9270';
  } else if (countryCode == 'TT' || country == 'Trinidad and Tobago') {
    return '18002011720';
  } else if (countryCode == 'TR' || country == 'Turkey') {
    return '08503073373';
  } else if (countryCode == 'UA' || country == 'Ukraine') {
    return '0-800-501753';
  } else if (countryCode == 'AE' || country == 'United Arab Emirates') {
    return '800-0320510';
  } else if (countryCode == 'GB' || country == 'United Kingdom') {
    return '0800-917-5320';
  } else if (countryCode == 'US') {
    return '8002727255';
  } else if (countryCode == 'VE' || country == 'Venezuela') {
    return '+58-2123353042';
  } else if (countryCode == 'VN' || country == 'Vietnam') {
    return '+84-24-44581939';
  } else {
    return '8002727255';
  }
}
