// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    this.buttonHeight = 20,
    this.fontSize = 9,
  });

  final double buttonHeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    return IconMenuButton(
      onChanged: (value) {
        final locale = value!.item2 as String? ?? 'en';
        appBloc.add(AppLocaleSet(locale));
      },
      buttonHeight: buttonHeight,
      fontSize: fontSize,
      text:
          LocaleNames.of(context)!.nameOf(appBloc.state.currentLocale ?? 'en')!,
      items: [
        Tuple2(LocaleNames.of(context)!.nameOf('en')!, 'en'),
        Tuple2(LocaleNames.of(context)!.nameOf('id')!, 'id'),
        Tuple2(LocaleNames.of(context)!.nameOf('ta')!, 'ta'),
        Tuple2(LocaleNames.of(context)!.nameOf('zh')!, 'zh'),
        Tuple2(LocaleNames.of(context)!.nameOf('th')!, 'th'),
      ],
    );
  }
}
