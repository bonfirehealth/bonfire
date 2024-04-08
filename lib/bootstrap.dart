// Dart imports:
import 'dart:async';
import 'dart:developer';

// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/helpers/helpers.dart';
import 'package:bonfirehealth/app/intelligence/service_locator.dart';
import 'package:bonfirehealth/app/repositories/amplify_repo.dart';
import 'package:bonfirehealth/app/repositories/telegram_bot_repo.dart';

import 'package:bonfirehealth/app/helpers/webview_stub.dart'
    if (dart.library.html) 'package:bonfirehealth/app/helpers/webview.dart';

import 'global.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logInfo('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logError('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function(String) builder,
  AppFlavor flavor,
) async {
  FlavorConfig(
    flavor: flavor,
    values: FlavorValues(currentFlavor: flavor.name),
  );
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await runZonedGuarded(
    () async {
      Bloc.observer = AppBlocObserver();
      registerWebViewWebImplementation();
      setupLocator();
      AppConstant.init(flavor);
      await initHiveForFlutter();
      await AmplifyRepo.init();
      await MixpanelHelper.init(flavor);
      final sharedPrefs = await SharedPreferences.getInstance();
      final orgId = sharedPrefs.getString('organisation_id');
      if (orgId == 'fa8993ea-ff63-11ed-be56-0242ac120002') {
        isTrialCustomer = true;
      }
      final themeColor = sharedPrefs.getString('organisation_theme_color') ?? '#1A56CF';
      FlutterNativeSplash.remove();

      await SentryFlutter.init(
        (options) {
          options
            ..debug = true
            ..dsn = 'https://d26077ea52d3c94a72b33ac3668e9791@o4505906873434112.ingest.sentry.io/4505906874744832';
        },
        appRunner: () async {
          runApp(await builder(themeColor));
        },
      );
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      if (flavor != AppFlavor.development) {
        Sentry.captureException(error, stackTrace: stackTrace);
      }
    },
  );
}
