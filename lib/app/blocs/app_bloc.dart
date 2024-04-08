// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart' hide AutoRouterExtension;

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppInitSet>(_onAppInitSet);
    on<AppIsLoadingSet>(_onAppIsLoadingSet);
    on<AppIsErrorDialogShownSet>(_onAppIsErrorDialogShownSet);
    on<AppIsInfoDialogShownSet>(_onAppIsInfoDialogShownSet);
    on<AppLocaleSet>(_onAppLocaleSet);
    on<AppErrorMessageSet>(_onAppErrorMessageSet);
    on<AppInfoMessageSet>(_onAppInfoMessageSet);
    on<AppThemeColourSet>(_onAppThemeColourSet);
    on<AppReset>(_onAppReset);
    on<AppNextRoute>(_onAppNextRoute);
    on<AppNextRoutePath>(_onAppNextRoutePath);
    on<AppReplaceRoute>(_onAppReplaceRoute);
    on<AppReplaceRoutePath>(_onAppReplaceRoutePath);
  }

  Future<void> _onAppInitSet(
    AppInitSet event,
    Emitter<AppState> emit,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();

    var themeColour = sharedPrefs.getString('organisation_theme_color');
    if (themeColour == null || themeColour == '') {
      themeColour = AppColourConstant.blue1A56CF.toHex();
    }
    emit(state.copyWith(themeColour: themeColour));
  }

  void _onAppIsLoadingSet(
    AppIsLoadingSet event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
        loadingText: event.loadingText,
      ),
    );
  }

  void _onAppIsErrorDialogShownSet(
    AppIsErrorDialogShownSet event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(isErrorDialogShown: event.isErrorDialogShown));
  }

  void _onAppIsInfoDialogShownSet(
    AppIsInfoDialogShownSet event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(isInfoDialogShown: event.isInfoDialogShown));
  }

  Future<void> _onAppLocaleSet(
    AppLocaleSet event,
    Emitter<AppState> emit,
  ) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString('locale', event.locale);
    Intl.defaultLocale = event.locale;
    emit(state.copyWith(currentLocale: event.locale));
  }

  void _onAppErrorMessageSet(
    AppErrorMessageSet event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        context: event.context,
        errorTitle: event.errorTitle,
        errorMessage: event.errorMessage,
      ),
    );
  }

  void _onAppInfoMessageSet(
    AppInfoMessageSet event,
    Emitter<AppState> emit,
  ) {
    emit(
      state.copyWith(
        context: event.context,
        infoTitle: event.infoTitle,
        infoMessage: event.infoMessage,
      ),
    );
  }

  void _onAppThemeColourSet(
    AppThemeColourSet event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(themeColour: event.themeColour));
  }

  Future<void> _onAppReset(
    AppReset event,
    Emitter<AppState> emit,
  ) async {
    emit(const AppState());
  }

  Future<void> _onAppNextRoute(
    AppNextRoute event,
    Emitter<AppState> emit,
  ) async {
    await event.context.router.push(
      event.pageRouteInfo,
    );
  }

  Future<void> _onAppNextRoutePath(
    AppNextRoutePath event,
    Emitter<AppState> emit,
  ) async {
    if (event.routePath.contains('/browser')) {
      if (event.routeUrl.contains('buy.stripe.com')) {
        html.window.open(event.routeUrl, '_self');
      } else {
        await event.context.router.push(
          BrowserRoute(
            isUrlBypass: event.routePath.contains('?is_url_bypass=true'),
            title: event.routeTitle,
            url: event.routeUrl,
          ),
        );
      }
    } else if (event.routePath.contains('/call')) {
      await launchUrl(Uri.parse(event.routeUrl));
    } else {
      await event.context.router.pushNamed(event.routePath);
    }
  }

  Future<void> _onAppReplaceRoute(
    AppReplaceRoute event,
    Emitter<AppState> emit,
  ) async {
    await event.context.router.replace(
      event.pageRouteInfo,
    );
  }

  Future<void> _onAppReplaceRoutePath(
    AppReplaceRoutePath event,
    Emitter<AppState> emit,
  ) async {
    if (event.routePath.contains('/browser')) {
      if (event.routeUrl.contains('buy.stripe.com')) {
        html.window.open(event.routeUrl, '_self');
      } else {
        await event.context.router.push(
          BrowserRoute(
            isUrlBypass: event.routePath.contains('?is_url_bypass=true'),
            title: event.routeTitle,
            url: event.routeUrl,
          ),
        );
      }
    } else if (event.routePath.contains('/call')) {
      await launchUrl(Uri.parse(event.routeUrl));
    } else {
      await event.context.router.replaceNamed(event.routePath);
    }
  }
}
