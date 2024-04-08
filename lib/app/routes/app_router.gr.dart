// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:bonfirehealth/app/app.dart' as _i21;
import 'package:bonfirehealth/app/routes/routes.dart' as _i19;
import 'package:bonfirehealth/auth/auth.dart' as _i4;
import 'package:bonfirehealth/browser/browser.dart' as _i11;
import 'package:bonfirehealth/chats/chats.dart' as _i16;
import 'package:bonfirehealth/groups/groups.dart' as _i12;
import 'package:bonfirehealth/home/home.dart' as _i1;
import 'package:bonfirehealth/landing/landing.dart' as _i5;
import 'package:bonfirehealth/notifications/notifications.dart' as _i7;
import 'package:bonfirehealth/onboarding/onboarding.dart' as _i6;
import 'package:bonfirehealth/organisation/organisation.dart' as _i13;
import 'package:bonfirehealth/profile/family_plan/views/delete_family_member_page.dart'
    as _i9;
import 'package:bonfirehealth/profile/family_plan/views/family_member_sign_in_page.dart'
    as _i14;
import 'package:bonfirehealth/profile/family_plan/views/family_plan_page.dart'
    as _i8;
import 'package:bonfirehealth/profile/family_plan/views/set_telegram_user_page.dart'
    as _i10;
import 'package:bonfirehealth/profile/profile.dart' as _i2;
import 'package:bonfirehealth/rewards/rewards.dart' as _i15;
import 'package:bonfirehealth/screening/screening.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i20;
import 'package:flutter/material.dart' as _i18;

class AppRouter extends _i17.RootStackRouter {
  AppRouter({
    _i18.GlobalKey<_i18.NavigatorState>? navigatorKey,
    required this.authenticatedRouteGuard,
    required this.notAuthenticatedRouteGuard,
    required this.landingRouteGuard,
    required this.notAuthenticatedOrganisationRouteGuard,
    required this.authenticatedOrganisationRouteGuard,
  }) : super(navigatorKey);

  final _i19.AuthenticatedRouteGuard authenticatedRouteGuard;

  final _i19.NotAuthenticatedRouteGuard notAuthenticatedRouteGuard;

  final _i19.LandingRouteGuard landingRouteGuard;

  final _i19.NotAuthenticatedOrganisationRouteGuard
      notAuthenticatedOrganisationRouteGuard;

  final _i19.AuthenticatedOrganisationRouteGuard
      authenticatedOrganisationRouteGuard;

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i1.HomePage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LatestVitalsRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i2.LatestVitalsPage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WebScreeningRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i3.WebScreeningPage(),
        transitionsBuilder: _i17.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScreeningTriageRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i3.ScreeningTriagePage(),
        transitionsBuilder: _i17.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScreeningDriverAssistantRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i3.ScreeningDriverAssistantPage(),
        transitionsBuilder: _i17.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthSignInRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i4.AuthSignInPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthRecoverAccountRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i4.AuthRecoverAccountPage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthResetPasswordRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i4.AuthResetPasswordPage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LandingRoute.name: (routeData) {
      final args = routeData.argsAs<LandingRouteArgs>(
          orElse: () => const LandingRouteArgs());
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i5.LandingPage(
          key: args.key,
          isSupportedBrowser: args.isSupportedBrowser,
        ),
        transitionsBuilder: _i17.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    JoinOrganisationRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<JoinOrganisationRouteArgs>(
          orElse: () => JoinOrganisationRouteArgs(
                organisationCode: queryParams.optString('oc'),
                organisationToken: queryParams.optString('ot'),
                organisationUserId: queryParams.optString('oui'),
              ));
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i6.JoinOrganisationPage(
          key: args.key,
          organisationCode: args.organisationCode,
          organisationToken: args.organisationToken,
          organisationUserId: args.organisationUserId,
        ),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    EnterOrganisationCodeRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<EnterOrganisationCodeRouteArgs>(
          orElse: () => EnterOrganisationCodeRouteArgs(
              organisationCode: queryParams.optString('oc')));
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i6.EnterOrganisationCodePage(
          key: args.key,
          organisationCode: args.organisationCode,
        ),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GenerateUsernameRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i6.GenerateUsernamePage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GeneratedCredentialsRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i6.GeneratedCredentialsPage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CompleteProfileRoute.name: (routeData) {
      final args = routeData.argsAs<CompleteProfileRouteArgs>(
          orElse: () => const CompleteProfileRouteArgs());
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i6.CompleteProfilePage(
          key: args.key,
          profile: args.profile,
          isEdit: args.isEdit,
        ),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NotificationsHomeRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i7.NotificationsHomePage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AllowNotificationsRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i7.AllowNotificationsPage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SavedQuestionsRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i2.SavedQuestionsPage(),
        transitionsBuilder: _i17.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FamilyPlanRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i8.FamilyPlanPage(),
        transitionsBuilder: _i17.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DeleteFamilyMemberRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DeleteFamilyMemberRouteArgs>(
          orElse: () =>
              DeleteFamilyMemberRouteArgs(id: pathParams.getString('id')));
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i9.DeleteFamilyMemberPage(
          key: args.key,
          id: args.id,
        ),
        transitionsBuilder: _i17.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SetTelegramUserRoute.name: (routeData) {
      final args = routeData.argsAs<SetTelegramUserRouteArgs>(
          orElse: () => const SetTelegramUserRouteArgs());
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i10.SetTelegramUserPage(key: args.key),
        transitionsBuilder: _i17.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BrowserRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<BrowserRouteArgs>(
          orElse: () => BrowserRouteArgs(
                title: queryParams.optString('title'),
                url: queryParams.optString('url'),
                isUrlBypass: queryParams.getBool(
                  'is_url_bypass',
                  false,
                ),
              ));
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i11.BrowserPage(
          key: args.key,
          title: args.title,
          url: args.url,
          isUrlBypass: args.isUrlBypass,
        ),
        transitionsBuilder: _i17.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    QuestionsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<QuestionsRouteArgs>(
          orElse: () =>
              QuestionsRouteArgs(groupId: pathParams.getString('groupId')));
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i12.QuestionsPage(
          key: args.key,
          groupId: args.groupId,
        ),
        transitionsBuilder: _i17.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AnswersRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AnswersRouteArgs>(
          orElse: () => AnswersRouteArgs(
                groupId: pathParams.getString('groupId'),
                questionId: pathParams.getString('questionId'),
              ));
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i12.AnswersPage(
          key: args.key,
          groupId: args.groupId,
          questionId: args.questionId,
        ),
        transitionsBuilder: _i17.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CommentsRoute.name: (routeData) {
      final args = routeData.argsAs<CommentsRouteArgs>();
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i12.CommentsPage(
          key: args.key,
          groupId: args.groupId,
          questionId: args.questionId,
          answerId: args.answerId,
        ),
        transitionsBuilder: _i17.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrganisationSignInRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i13.OrganisationSignInPage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FamilyMemberSignInRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<FamilyMemberSignInRouteArgs>(
          orElse: () => FamilyMemberSignInRouteArgs(
                uniqueLinkValue: pathParams.getString('uniqueLinkValue'),
                e: queryParams.optString('e'),
              ));
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i14.FamilyMemberSignInPage(
          key: args.key,
          uniqueLinkValue: args.uniqueLinkValue,
          e: args.e,
        ),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrganisationHomeRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i13.OrganisationHomePage(),
        customRouteBuilder: _i19.confirmToExitRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ScreeningHomeRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i3.ScreeningHomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    GroupsRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i12.GroupsPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    RewardsHomeRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i15.RewardsHomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChatsHomeRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ChatsHomeRouteArgs>(
          orElse: () =>
              ChatsHomeRouteArgs(message: queryParams.optString('message')));
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: _i16.ChatsHomePage(
          key: args.key,
          message: args.message,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProfileHomeRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i2.ProfileHomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrganisationDashboardRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i13.OrganisationDashboardPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrganisationJourneysRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i13.OrganisationJourneysPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    OrganisationProfileRoute.name: (routeData) {
      return _i17.CustomPage<void>(
        routeData: routeData,
        child: const _i13.OrganisationProfilePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i17.RouteConfig(
          HomeRoute.name,
          path: '/home',
          guards: [authenticatedRouteGuard],
          children: [
            _i17.RouteConfig(
              ScreeningHomeRoute.name,
              path: 'screening',
              parent: HomeRoute.name,
            ),
            _i17.RouteConfig(
              GroupsRoute.name,
              path: 'groups',
              parent: HomeRoute.name,
            ),
            _i17.RouteConfig(
              RewardsHomeRoute.name,
              path: 'rewards',
              parent: HomeRoute.name,
            ),
            _i17.RouteConfig(
              ChatsHomeRoute.name,
              path: 'chats',
              parent: HomeRoute.name,
            ),
            _i17.RouteConfig(
              ProfileHomeRoute.name,
              path: 'profile',
              parent: HomeRoute.name,
            ),
          ],
        ),
        _i17.RouteConfig(
          LatestVitalsRoute.name,
          path: '/latest-vitals',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          WebScreeningRoute.name,
          path: '/screening',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          ScreeningTriageRoute.name,
          path: '/screening/triage',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          ScreeningDriverAssistantRoute.name,
          path: '/screening/driver-assistant',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          AuthSignInRoute.name,
          path: '/sign-in',
          guards: [notAuthenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          AuthRecoverAccountRoute.name,
          path: '/recover',
          guards: [notAuthenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          AuthResetPasswordRoute.name,
          path: '/reset-password',
          guards: [notAuthenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          LandingRoute.name,
          path: '/landing',
          guards: [landingRouteGuard],
        ),
        _i17.RouteConfig(
          JoinOrganisationRoute.name,
          path: '/join',
          guards: [notAuthenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          EnterOrganisationCodeRoute.name,
          path: '/organisation-code',
          guards: [notAuthenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          GenerateUsernameRoute.name,
          path: '/generate-username',
          guards: [notAuthenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          GeneratedCredentialsRoute.name,
          path: '/generated-credentials',
          guards: [notAuthenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          CompleteProfileRoute.name,
          path: '/complete-profile',
        ),
        _i17.RouteConfig(
          NotificationsHomeRoute.name,
          path: '/notifications/home',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          AllowNotificationsRoute.name,
          path: '/allow-notifications',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          SavedQuestionsRoute.name,
          path: '/saved-questions',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          FamilyPlanRoute.name,
          path: '/family-plan',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          DeleteFamilyMemberRoute.name,
          path: '/family-plan/delete/:id',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          SetTelegramUserRoute.name,
          path: '/family-plan/telegram/:id',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          BrowserRoute.name,
          path: '/browser',
        ),
        _i17.RouteConfig(
          QuestionsRoute.name,
          path: '/groups/:groupId/questions',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          AnswersRoute.name,
          path: '/groups/:groupId/questions/:questionId/answers',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          CommentsRoute.name,
          path:
              '/groups/:groupId/questions/:questionId/answers/:answerId/comments',
          guards: [authenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          OrganisationSignInRoute.name,
          path: '/organisation/sign-in',
          guards: [notAuthenticatedOrganisationRouteGuard],
        ),
        _i17.RouteConfig(
          FamilyMemberSignInRoute.name,
          path: '/family-member/:uniqueLinkValue',
          guards: [notAuthenticatedRouteGuard],
        ),
        _i17.RouteConfig(
          OrganisationHomeRoute.name,
          path: '/organisation',
          guards: [authenticatedOrganisationRouteGuard],
          children: [
            _i17.RouteConfig(
              OrganisationDashboardRoute.name,
              path: 'dashboard',
              parent: OrganisationHomeRoute.name,
            ),
            _i17.RouteConfig(
              OrganisationJourneysRoute.name,
              path: 'journeys',
              parent: OrganisationHomeRoute.name,
            ),
            _i17.RouteConfig(
              OrganisationProfileRoute.name,
              path: 'profile',
              parent: OrganisationHomeRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/home',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.LatestVitalsPage]
class LatestVitalsRoute extends _i17.PageRouteInfo<void> {
  const LatestVitalsRoute()
      : super(
          LatestVitalsRoute.name,
          path: '/latest-vitals',
        );

  static const String name = 'LatestVitalsRoute';
}

/// generated route for
/// [_i3.WebScreeningPage]
class WebScreeningRoute extends _i17.PageRouteInfo<void> {
  const WebScreeningRoute()
      : super(
          WebScreeningRoute.name,
          path: '/screening',
        );

  static const String name = 'WebScreeningRoute';
}

/// generated route for
/// [_i3.ScreeningTriagePage]
class ScreeningTriageRoute extends _i17.PageRouteInfo<void> {
  const ScreeningTriageRoute()
      : super(
          ScreeningTriageRoute.name,
          path: '/screening/triage',
        );

  static const String name = 'ScreeningTriageRoute';
}

/// generated route for
/// [_i3.ScreeningDriverAssistantPage]
class ScreeningDriverAssistantRoute extends _i17.PageRouteInfo<void> {
  const ScreeningDriverAssistantRoute()
      : super(
          ScreeningDriverAssistantRoute.name,
          path: '/screening/driver-assistant',
        );

  static const String name = 'ScreeningDriverAssistantRoute';
}

/// generated route for
/// [_i4.AuthSignInPage]
class AuthSignInRoute extends _i17.PageRouteInfo<void> {
  const AuthSignInRoute()
      : super(
          AuthSignInRoute.name,
          path: '/sign-in',
        );

  static const String name = 'AuthSignInRoute';
}

/// generated route for
/// [_i4.AuthRecoverAccountPage]
class AuthRecoverAccountRoute extends _i17.PageRouteInfo<void> {
  const AuthRecoverAccountRoute()
      : super(
          AuthRecoverAccountRoute.name,
          path: '/recover',
        );

  static const String name = 'AuthRecoverAccountRoute';
}

/// generated route for
/// [_i4.AuthResetPasswordPage]
class AuthResetPasswordRoute extends _i17.PageRouteInfo<void> {
  const AuthResetPasswordRoute()
      : super(
          AuthResetPasswordRoute.name,
          path: '/reset-password',
        );

  static const String name = 'AuthResetPasswordRoute';
}

/// generated route for
/// [_i5.LandingPage]
class LandingRoute extends _i17.PageRouteInfo<LandingRouteArgs> {
  LandingRoute({
    _i20.Key? key,
    bool isSupportedBrowser = false,
  }) : super(
          LandingRoute.name,
          path: '/landing',
          args: LandingRouteArgs(
            key: key,
            isSupportedBrowser: isSupportedBrowser,
          ),
        );

  static const String name = 'LandingRoute';
}

class LandingRouteArgs {
  const LandingRouteArgs({
    this.key,
    this.isSupportedBrowser = false,
  });

  final _i20.Key? key;

  final bool isSupportedBrowser;

  @override
  String toString() {
    return 'LandingRouteArgs{key: $key, isSupportedBrowser: $isSupportedBrowser}';
  }
}

/// generated route for
/// [_i6.JoinOrganisationPage]
class JoinOrganisationRoute
    extends _i17.PageRouteInfo<JoinOrganisationRouteArgs> {
  JoinOrganisationRoute({
    _i20.Key? key,
    String? organisationCode,
    String? organisationToken,
    String? organisationUserId,
  }) : super(
          JoinOrganisationRoute.name,
          path: '/join',
          args: JoinOrganisationRouteArgs(
            key: key,
            organisationCode: organisationCode,
            organisationToken: organisationToken,
            organisationUserId: organisationUserId,
          ),
          rawQueryParams: {
            'oc': organisationCode,
            'ot': organisationToken,
            'oui': organisationUserId,
          },
        );

  static const String name = 'JoinOrganisationRoute';
}

class JoinOrganisationRouteArgs {
  const JoinOrganisationRouteArgs({
    this.key,
    this.organisationCode,
    this.organisationToken,
    this.organisationUserId,
  });

  final _i20.Key? key;

  final String? organisationCode;

  final String? organisationToken;

  final String? organisationUserId;

  @override
  String toString() {
    return 'JoinOrganisationRouteArgs{key: $key, organisationCode: $organisationCode, organisationToken: $organisationToken, organisationUserId: $organisationUserId}';
  }
}

/// generated route for
/// [_i6.EnterOrganisationCodePage]
class EnterOrganisationCodeRoute
    extends _i17.PageRouteInfo<EnterOrganisationCodeRouteArgs> {
  EnterOrganisationCodeRoute({
    _i20.Key? key,
    String? organisationCode,
  }) : super(
          EnterOrganisationCodeRoute.name,
          path: '/organisation-code',
          args: EnterOrganisationCodeRouteArgs(
            key: key,
            organisationCode: organisationCode,
          ),
          rawQueryParams: {'oc': organisationCode},
        );

  static const String name = 'EnterOrganisationCodeRoute';
}

class EnterOrganisationCodeRouteArgs {
  const EnterOrganisationCodeRouteArgs({
    this.key,
    this.organisationCode,
  });

  final _i20.Key? key;

  final String? organisationCode;

  @override
  String toString() {
    return 'EnterOrganisationCodeRouteArgs{key: $key, organisationCode: $organisationCode}';
  }
}

/// generated route for
/// [_i6.GenerateUsernamePage]
class GenerateUsernameRoute extends _i17.PageRouteInfo<void> {
  const GenerateUsernameRoute()
      : super(
          GenerateUsernameRoute.name,
          path: '/generate-username',
        );

  static const String name = 'GenerateUsernameRoute';
}

/// generated route for
/// [_i6.GeneratedCredentialsPage]
class GeneratedCredentialsRoute extends _i17.PageRouteInfo<void> {
  const GeneratedCredentialsRoute()
      : super(
          GeneratedCredentialsRoute.name,
          path: '/generated-credentials',
        );

  static const String name = 'GeneratedCredentialsRoute';
}

/// generated route for
/// [_i6.CompleteProfilePage]
class CompleteProfileRoute
    extends _i17.PageRouteInfo<CompleteProfileRouteArgs> {
  CompleteProfileRoute({
    _i20.Key? key,
    _i21.Profile? profile,
    bool isEdit = false,
  }) : super(
          CompleteProfileRoute.name,
          path: '/complete-profile',
          args: CompleteProfileRouteArgs(
            key: key,
            profile: profile,
            isEdit: isEdit,
          ),
        );

  static const String name = 'CompleteProfileRoute';
}

class CompleteProfileRouteArgs {
  const CompleteProfileRouteArgs({
    this.key,
    this.profile,
    this.isEdit = false,
  });

  final _i20.Key? key;

  final _i21.Profile? profile;

  final bool isEdit;

  @override
  String toString() {
    return 'CompleteProfileRouteArgs{key: $key, profile: $profile, isEdit: $isEdit}';
  }
}

/// generated route for
/// [_i7.NotificationsHomePage]
class NotificationsHomeRoute extends _i17.PageRouteInfo<void> {
  const NotificationsHomeRoute()
      : super(
          NotificationsHomeRoute.name,
          path: '/notifications/home',
        );

  static const String name = 'NotificationsHomeRoute';
}

/// generated route for
/// [_i7.AllowNotificationsPage]
class AllowNotificationsRoute extends _i17.PageRouteInfo<void> {
  const AllowNotificationsRoute()
      : super(
          AllowNotificationsRoute.name,
          path: '/allow-notifications',
        );

  static const String name = 'AllowNotificationsRoute';
}

/// generated route for
/// [_i2.SavedQuestionsPage]
class SavedQuestionsRoute extends _i17.PageRouteInfo<void> {
  const SavedQuestionsRoute()
      : super(
          SavedQuestionsRoute.name,
          path: '/saved-questions',
        );

  static const String name = 'SavedQuestionsRoute';
}

/// generated route for
/// [_i8.FamilyPlanPage]
class FamilyPlanRoute extends _i17.PageRouteInfo<void> {
  const FamilyPlanRoute()
      : super(
          FamilyPlanRoute.name,
          path: '/family-plan',
        );

  static const String name = 'FamilyPlanRoute';
}

/// generated route for
/// [_i9.DeleteFamilyMemberPage]
class DeleteFamilyMemberRoute
    extends _i17.PageRouteInfo<DeleteFamilyMemberRouteArgs> {
  DeleteFamilyMemberRoute({
    _i20.Key? key,
    required String id,
  }) : super(
          DeleteFamilyMemberRoute.name,
          path: '/family-plan/delete/:id',
          args: DeleteFamilyMemberRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'DeleteFamilyMemberRoute';
}

class DeleteFamilyMemberRouteArgs {
  const DeleteFamilyMemberRouteArgs({
    this.key,
    required this.id,
  });

  final _i20.Key? key;

  final String id;

  @override
  String toString() {
    return 'DeleteFamilyMemberRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i10.SetTelegramUserPage]
class SetTelegramUserRoute
    extends _i17.PageRouteInfo<SetTelegramUserRouteArgs> {
  SetTelegramUserRoute({_i20.Key? key})
      : super(
          SetTelegramUserRoute.name,
          path: '/family-plan/telegram/:id',
          args: SetTelegramUserRouteArgs(key: key),
        );

  static const String name = 'SetTelegramUserRoute';
}

class SetTelegramUserRouteArgs {
  const SetTelegramUserRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'SetTelegramUserRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.BrowserPage]
class BrowserRoute extends _i17.PageRouteInfo<BrowserRouteArgs> {
  BrowserRoute({
    _i20.Key? key,
    String? title,
    String? url,
    bool isUrlBypass = false,
  }) : super(
          BrowserRoute.name,
          path: '/browser',
          args: BrowserRouteArgs(
            key: key,
            title: title,
            url: url,
            isUrlBypass: isUrlBypass,
          ),
          rawQueryParams: {
            'title': title,
            'url': url,
            'is_url_bypass': isUrlBypass,
          },
        );

  static const String name = 'BrowserRoute';
}

class BrowserRouteArgs {
  const BrowserRouteArgs({
    this.key,
    this.title,
    this.url,
    this.isUrlBypass = false,
  });

  final _i20.Key? key;

  final String? title;

  final String? url;

  final bool isUrlBypass;

  @override
  String toString() {
    return 'BrowserRouteArgs{key: $key, title: $title, url: $url, isUrlBypass: $isUrlBypass}';
  }
}

/// generated route for
/// [_i12.QuestionsPage]
class QuestionsRoute extends _i17.PageRouteInfo<QuestionsRouteArgs> {
  QuestionsRoute({
    _i20.Key? key,
    required String groupId,
  }) : super(
          QuestionsRoute.name,
          path: '/groups/:groupId/questions',
          args: QuestionsRouteArgs(
            key: key,
            groupId: groupId,
          ),
          rawPathParams: {'groupId': groupId},
        );

  static const String name = 'QuestionsRoute';
}

class QuestionsRouteArgs {
  const QuestionsRouteArgs({
    this.key,
    required this.groupId,
  });

  final _i20.Key? key;

  final String groupId;

  @override
  String toString() {
    return 'QuestionsRouteArgs{key: $key, groupId: $groupId}';
  }
}

/// generated route for
/// [_i12.AnswersPage]
class AnswersRoute extends _i17.PageRouteInfo<AnswersRouteArgs> {
  AnswersRoute({
    _i20.Key? key,
    required String groupId,
    required String questionId,
  }) : super(
          AnswersRoute.name,
          path: '/groups/:groupId/questions/:questionId/answers',
          args: AnswersRouteArgs(
            key: key,
            groupId: groupId,
            questionId: questionId,
          ),
          rawPathParams: {
            'groupId': groupId,
            'questionId': questionId,
          },
        );

  static const String name = 'AnswersRoute';
}

class AnswersRouteArgs {
  const AnswersRouteArgs({
    this.key,
    required this.groupId,
    required this.questionId,
  });

  final _i20.Key? key;

  final String groupId;

  final String questionId;

  @override
  String toString() {
    return 'AnswersRouteArgs{key: $key, groupId: $groupId, questionId: $questionId}';
  }
}

/// generated route for
/// [_i12.CommentsPage]
class CommentsRoute extends _i17.PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    _i20.Key? key,
    required String groupId,
    required String questionId,
    required String answerId,
  }) : super(
          CommentsRoute.name,
          path:
              '/groups/:groupId/questions/:questionId/answers/:answerId/comments',
          args: CommentsRouteArgs(
            key: key,
            groupId: groupId,
            questionId: questionId,
            answerId: answerId,
          ),
        );

  static const String name = 'CommentsRoute';
}

class CommentsRouteArgs {
  const CommentsRouteArgs({
    this.key,
    required this.groupId,
    required this.questionId,
    required this.answerId,
  });

  final _i20.Key? key;

  final String groupId;

  final String questionId;

  final String answerId;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, groupId: $groupId, questionId: $questionId, answerId: $answerId}';
  }
}

/// generated route for
/// [_i13.OrganisationSignInPage]
class OrganisationSignInRoute extends _i17.PageRouteInfo<void> {
  const OrganisationSignInRoute()
      : super(
          OrganisationSignInRoute.name,
          path: '/organisation/sign-in',
        );

  static const String name = 'OrganisationSignInRoute';
}

/// generated route for
/// [_i14.FamilyMemberSignInPage]
class FamilyMemberSignInRoute
    extends _i17.PageRouteInfo<FamilyMemberSignInRouteArgs> {
  FamilyMemberSignInRoute({
    _i20.Key? key,
    required String uniqueLinkValue,
    String? e,
  }) : super(
          FamilyMemberSignInRoute.name,
          path: '/family-member/:uniqueLinkValue',
          args: FamilyMemberSignInRouteArgs(
            key: key,
            uniqueLinkValue: uniqueLinkValue,
            e: e,
          ),
          rawPathParams: {'uniqueLinkValue': uniqueLinkValue},
          rawQueryParams: {'e': e},
        );

  static const String name = 'FamilyMemberSignInRoute';
}

class FamilyMemberSignInRouteArgs {
  const FamilyMemberSignInRouteArgs({
    this.key,
    required this.uniqueLinkValue,
    this.e,
  });

  final _i20.Key? key;

  final String uniqueLinkValue;

  final String? e;

  @override
  String toString() {
    return 'FamilyMemberSignInRouteArgs{key: $key, uniqueLinkValue: $uniqueLinkValue, e: $e}';
  }
}

/// generated route for
/// [_i13.OrganisationHomePage]
class OrganisationHomeRoute extends _i17.PageRouteInfo<void> {
  const OrganisationHomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          OrganisationHomeRoute.name,
          path: '/organisation',
          initialChildren: children,
        );

  static const String name = 'OrganisationHomeRoute';
}

/// generated route for
/// [_i3.ScreeningHomePage]
class ScreeningHomeRoute extends _i17.PageRouteInfo<void> {
  const ScreeningHomeRoute()
      : super(
          ScreeningHomeRoute.name,
          path: 'screening',
        );

  static const String name = 'ScreeningHomeRoute';
}

/// generated route for
/// [_i12.GroupsPage]
class GroupsRoute extends _i17.PageRouteInfo<void> {
  const GroupsRoute()
      : super(
          GroupsRoute.name,
          path: 'groups',
        );

  static const String name = 'GroupsRoute';
}

/// generated route for
/// [_i15.RewardsHomePage]
class RewardsHomeRoute extends _i17.PageRouteInfo<void> {
  const RewardsHomeRoute()
      : super(
          RewardsHomeRoute.name,
          path: 'rewards',
        );

  static const String name = 'RewardsHomeRoute';
}

/// generated route for
/// [_i16.ChatsHomePage]
class ChatsHomeRoute extends _i17.PageRouteInfo<ChatsHomeRouteArgs> {
  ChatsHomeRoute({
    _i20.Key? key,
    String? message,
  }) : super(
          ChatsHomeRoute.name,
          path: 'chats',
          args: ChatsHomeRouteArgs(
            key: key,
            message: message,
          ),
          rawQueryParams: {'message': message},
        );

  static const String name = 'ChatsHomeRoute';
}

class ChatsHomeRouteArgs {
  const ChatsHomeRouteArgs({
    this.key,
    this.message,
  });

  final _i20.Key? key;

  final String? message;

  @override
  String toString() {
    return 'ChatsHomeRouteArgs{key: $key, message: $message}';
  }
}

/// generated route for
/// [_i2.ProfileHomePage]
class ProfileHomeRoute extends _i17.PageRouteInfo<void> {
  const ProfileHomeRoute()
      : super(
          ProfileHomeRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileHomeRoute';
}

/// generated route for
/// [_i13.OrganisationDashboardPage]
class OrganisationDashboardRoute extends _i17.PageRouteInfo<void> {
  const OrganisationDashboardRoute()
      : super(
          OrganisationDashboardRoute.name,
          path: 'dashboard',
        );

  static const String name = 'OrganisationDashboardRoute';
}

/// generated route for
/// [_i13.OrganisationJourneysPage]
class OrganisationJourneysRoute extends _i17.PageRouteInfo<void> {
  const OrganisationJourneysRoute()
      : super(
          OrganisationJourneysRoute.name,
          path: 'journeys',
        );

  static const String name = 'OrganisationJourneysRoute';
}

/// generated route for
/// [_i13.OrganisationProfilePage]
class OrganisationProfileRoute extends _i17.PageRouteInfo<void> {
  const OrganisationProfileRoute()
      : super(
          OrganisationProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'OrganisationProfileRoute';
}
