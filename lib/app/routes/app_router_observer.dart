// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';

class AppRouterObserver extends AutoRouterObserver {
  factory AppRouterObserver() {
    return _singleton;
  }

  AppRouterObserver._internal();

  static final AppRouterObserver _singleton = AppRouterObserver._internal();

  /**
   * History
   */

  /// A list of all the past routes
  final List<Route<dynamic>?> _history = <Route<dynamic>?>[];

  /// Gets a clone of the navigation history as an immutable list.
  BuiltList<Route<dynamic>> get history =>
      BuiltList<Route<dynamic>>.from(_history);

  /// Gets a list of navigation history as an immutable list.
  BuiltList<String?> get historyChanges =>
      BuiltList<String?>.from(history.map<String?>((r) => r.settings.name));

  /// Gets the top route in the navigation stack.
  Route<dynamic>? get top => _history.last;

  /// A list of all routes that were popped to reach the current.
  final List<Route<dynamic>?> _poppedRoutes = <Route<dynamic>?>[];

  /// Gets a clone of the popped routes as an immutable list.
  BuiltList<Route<dynamic>> get poppedRoutes =>
      BuiltList<Route<dynamic>>.from(_poppedRoutes);

  /// Gets the next route in the navigation history,
  /// which is the most recently popped route.
  Route<dynamic>? get next => _poppedRoutes.last;

  /// A stream that broadcasts whenever the navigation history changes.
  final _historyStreamCtrl = StreamController<HistoryChange>.broadcast();

  /// Accessor to the history change stream.
  Stream<HistoryChange> get onRouteChanges => _historyStreamCtrl.stream;

  /**
   * Main Bottom Nav History
   */

  /// A list of all the past main routes
  final List<TabPageRoute> _mainHistory = <TabPageRoute>[];

  /// Gets a clone of the main history as an immutable list.
  BuiltList<TabPageRoute> get mainHistory =>
      BuiltList<TabPageRoute>.from(_mainHistory);

  /// Gets a list of main history as an immutable list.
  BuiltList<String?> get mainHistories =>
      BuiltList<String?>.from(mainHistory.map<String>((r) => r.path));

  /// Gets a list of main history index as an immutable list.
  BuiltList<int?> get mainIndexes =>
      BuiltList<int?>.from(mainHistory.map<int>((r) => r.index));

  /// A stream that broadcasts whenever the main history changes.
  final _mainHistoryStreamCtrl = StreamController<TabChange>.broadcast();

  /// Accessor to the history change stream.
  Stream<TabChange> get onMainChanges => _mainHistoryStreamCtrl.stream;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _poppedRoutes.add(_history.last);
    _history.removeLast();
    _historyStreamCtrl.add(
      HistoryChange(
        action: NavAction.pop,
        newRoute: route,
        oldRoute: previousRoute,
      ),
    );
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.add(route);
    _poppedRoutes.remove(route);
    _historyStreamCtrl.add(
      HistoryChange(
        action: NavAction.push,
        newRoute: route,
        oldRoute: previousRoute,
      ),
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _history.remove(route);
    _historyStreamCtrl.add(
      HistoryChange(
        action: NavAction.remove,
        newRoute: route,
        oldRoute: previousRoute,
      ),
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final oldRouteIndex = _history.indexOf(oldRoute);
    _history.replaceRange(oldRouteIndex, oldRouteIndex + 1, [newRoute]);
    _historyStreamCtrl.add(
      HistoryChange(
        action: NavAction.replace,
        newRoute: newRoute,
        oldRoute: oldRoute,
      ),
    );
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _mainHistory.add(route);
    _mainHistoryStreamCtrl.add(
      TabChange(
        action: TabAction.init,
        newRoute: route,
        oldRoute: previousRoute,
      ),
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _mainHistory
      ..removeWhere((element) => element.index == route.index)
      ..add(route);

    _mainHistoryStreamCtrl.add(
      TabChange(
        action: TabAction.change,
        newRoute: route,
        oldRoute: previousRoute,
      ),
    );
  }

  void didPopTabRoute() {
    final secondLast = _mainHistory.length - 2;
    _mainHistory.removeAt(secondLast);

    _mainHistoryStreamCtrl.add(TabChange(action: TabAction.pop));
  }
}

/// A class that contains all data that needs
/// to be broadcasted through the history change stream.
class HistoryChange {
  HistoryChange({this.action, this.newRoute, this.oldRoute});

  final NavAction? action;
  final Route<dynamic>? newRoute;
  final Route<dynamic>? oldRoute;

  @override
  String toString() {
    return '$action: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}';
  }
}

enum NavAction { push, pop, remove, replace }

/// A class that contains all data that needs
/// to be broadcasted through the history change stream.
class TabChange {
  TabChange({this.action, this.newRoute, this.oldRoute});

  final TabAction? action;
  final TabPageRoute? newRoute;
  final TabPageRoute? oldRoute;

  @override
  String toString() {
    return '$action: ${oldRoute?.name} -> ${newRoute?.name}';
  }
}

enum TabAction { init, change, pop }
