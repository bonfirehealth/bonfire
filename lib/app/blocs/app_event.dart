part of 'app_bloc.dart';

@immutable
abstract class AppEvent {
  const AppEvent();
}

class AppInitSet extends AppEvent {
  const AppInitSet();

  @override
  String toString() => 'AppInitSet {}';
}

class AppIsLoadingSet extends AppEvent {
  const AppIsLoadingSet({
    this.isLoading = true,
    this.loadingText,
  });

  final bool isLoading;
  final String? loadingText;

  @override
  String toString() => 'AppLocaleSet {}';
}

class AppIsErrorDialogShownSet extends AppEvent {
  const AppIsErrorDialogShownSet({this.isErrorDialogShown = true});

  final bool isErrorDialogShown;

  @override
  String toString() => 'AppIsErrorDialogShownSet {}';
}

class AppIsInfoDialogShownSet extends AppEvent {
  const AppIsInfoDialogShownSet({this.isInfoDialogShown = true});

  final bool isInfoDialogShown;

  @override
  String toString() => 'AppIsInfoDialogShownSet {}';
}

class AppLocaleSet extends AppEvent {
  const AppLocaleSet(this.locale);

  final String locale;

  @override
  String toString() => 'AppLocaleSet {}';
}

class AppErrorMessageSet extends AppEvent {
  const AppErrorMessageSet(
    this.context,
    this.errorTitle,
    this.errorMessage,
  );

  final BuildContext context;
  final String errorTitle;
  final String errorMessage;

  @override
  String toString() => 'AppErrorMessageSet {}';
}

class AppInfoMessageSet extends AppEvent {
  const AppInfoMessageSet(
    this.context,
    this.infoTitle,
    this.infoMessage,
  );

  final BuildContext context;
  final String infoTitle;
  final String infoMessage;

  @override
  String toString() => 'AppInfoMessageSet {}';
}

class AppThemeColourSet extends AppEvent {
  const AppThemeColourSet(
    this.themeColour,
  );

  final String themeColour;

  @override
  String toString() => 'AppThemeColourSet {}';
}

class AppReset extends AppEvent {
  const AppReset();

  @override
  String toString() => 'AppReset {}';
}

class AppNextRoute extends AppEvent {
  const AppNextRoute(
    this.context,
    this.pageRouteInfo,
  );

  final BuildContext context;
  final PageRouteInfo pageRouteInfo;

  @override
  String toString() => 'AppNextRoute {}';
}

class AppNextRoutePath extends AppEvent {
  const AppNextRoutePath(
    this.context,
    this.routeTitle,
    this.routePath,
    this.routeUrl,
  );

  final BuildContext context;
  final String routeTitle;
  final String routePath;
  final String routeUrl;

  @override
  String toString() => 'AppNextRoutePath {}';
}

class AppReplaceRoute extends AppEvent {
  const AppReplaceRoute(
    this.context,
    this.pageRouteInfo,
  );

  final BuildContext context;
  final PageRouteInfo pageRouteInfo;

  @override
  String toString() => 'AppNextRoute {}';
}

class AppReplaceRoutePath extends AppEvent {
  const AppReplaceRoutePath(
    this.context,
    this.routeTitle,
    this.routePath,
    this.routeUrl,
  );

  final BuildContext context;
  final String routeTitle;
  final String routePath;
  final String routeUrl;

  @override
  String toString() => 'AppReplaceRoutePath {}';
}
