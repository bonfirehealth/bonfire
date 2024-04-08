// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:bonfirehealth/app/routes/routes.dart';
import 'package:bonfirehealth/auth/auth.dart';
import 'package:bonfirehealth/browser/browser.dart';
import 'package:bonfirehealth/chats/chats.dart';
import 'package:bonfirehealth/groups/groups.dart';
import 'package:bonfirehealth/home/home.dart';
import 'package:bonfirehealth/landing/landing.dart';
import 'package:bonfirehealth/notifications/notifications.dart';
import 'package:bonfirehealth/onboarding/onboarding.dart';
import 'package:bonfirehealth/organisation/organisation.dart';
import 'package:bonfirehealth/profile/family_plan/views/family_member_sign_in_page.dart';
import 'package:bonfirehealth/profile/family_plan/views/set_telegram_user_page.dart';
import 'package:bonfirehealth/profile/family_plan/views/widgets/family_member_card.dart';
import 'package:bonfirehealth/profile/profile.dart';
import 'package:bonfirehealth/rewards/rewards.dart';
import 'package:bonfirehealth/screening/screening.dart';
import '../../profile/family_plan/views/delete_family_member_page.dart';
import '../../profile/family_plan/views/family_plan_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    // Home
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/home',
      page: HomePage,
      initial: true,
      customRouteBuilder: confirmToExitRouteBuilder,
      children: [
        // Screening
        CustomRoute<void>(
          path: 'screening',
          page: ScreeningHomePage,
        ),

        // Groups
        CustomRoute<void>(
          path: 'groups',
          page: GroupsPage,
        ),

        // Rewards
        CustomRoute<void>(
          path: 'rewards',
          page: RewardsHomePage,
        ),

        // Chats
        CustomRoute<void>(
          path: 'chats',
          page: ChatsHomePage,
        ),

        // Profile
        CustomRoute<void>(
          path: 'profile',
          page: ProfileHomePage,
        ),
      ],
    ),
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/latest-vitals',
      page: LatestVitalsPage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),

    // Screening
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/screening',
      page: WebScreeningPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),
    // CustomRoute<void>(
    //   guards: [AuthenticatedRouteGuard],
    //   path: '/screening/mobile',
    //   page: MobileScreeningPage,
    //   transitionsBuilder: TransitionsBuilders.slideBottom,
    // ),
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/screening/triage',
      page: ScreeningTriagePage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/screening/driver-assistant',
      page: ScreeningDriverAssistantPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),

    // Auth
    CustomRoute<void>(
      guards: [NotAuthenticatedRouteGuard],
      path: '/sign-in',
      page: AuthSignInPage,
    ),
    CustomRoute<void>(
      guards: [NotAuthenticatedRouteGuard],
      path: '/recover',
      page: AuthRecoverAccountPage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),
    CustomRoute<void>(
      guards: [NotAuthenticatedRouteGuard],
      path: '/reset-password',
      page: AuthResetPasswordPage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),

    // Landing
    CustomRoute<void>(
      guards: [LandingRouteGuard],
      path: '/landing',
      page: LandingPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),

    // Onboarding
    CustomRoute<void>(
      guards: [NotAuthenticatedRouteGuard],
      path: '/join',
      page: JoinOrganisationPage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),
    CustomRoute<void>(
      guards: [NotAuthenticatedRouteGuard],
      path: '/organisation-code',
      page: EnterOrganisationCodePage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),
    CustomRoute<void>(
      guards: [NotAuthenticatedRouteGuard],
      path: '/generate-username',
      page: GenerateUsernamePage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),
    CustomRoute<void>(
      guards: [NotAuthenticatedRouteGuard],
      path: '/generated-credentials',
      page: GeneratedCredentialsPage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),
    CustomRoute<void>(
      guards: [
        // NotAuthenticatedRouteGuard,
        // AuthenticatedRouteGuard,
      ],
      path: '/complete-profile',
      page: CompleteProfilePage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),

    // Notifications
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/notifications/home',
      page: NotificationsHomePage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),

    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/allow-notifications',
      page: AllowNotificationsPage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),

    // Profile
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/saved-questions',
      page: SavedQuestionsPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),

    // Profile
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/family-plan',
      page: FamilyPlanPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),

    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/family-plan/delete/:id',
      page: DeleteFamilyMemberPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),

    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/family-plan/telegram/:id',
      page: SetTelegramUserPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),

    // Browser
    CustomRoute<void>(
      guards: [],
      path: '/browser',
      page: BrowserPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
    ),

    // Groups
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/groups/:groupId/questions',
      page: QuestionsPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/groups/:groupId/questions/:questionId/answers',
      page: AnswersPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute<void>(
      guards: [AuthenticatedRouteGuard],
      path: '/groups/:groupId/questions/:questionId/answers/:answerId/comments',
      page: CommentsPage,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),

    // Organisation Sign In
    CustomRoute<void>(
      guards: [NotAuthenticatedOrganisationRouteGuard],
      path: '/organisation/sign-in',
      page: OrganisationSignInPage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),

    //Family Member Sign In
    CustomRoute<void>(
      guards: [NotAuthenticatedRouteGuard],
      path: '/family-member/:uniqueLinkValue',
      page: FamilyMemberSignInPage,
      customRouteBuilder: confirmToExitRouteBuilder,
    ),

    // Organisation
    CustomRoute<void>(
      guards: [AuthenticatedOrganisationRouteGuard],
      path: '/organisation',
      page: OrganisationHomePage,
      customRouteBuilder: confirmToExitRouteBuilder,
      children: [
        // Organisation Dashboard
        CustomRoute<void>(
          path: 'dashboard',
          page: OrganisationDashboardPage,
        ),

        // Organisation Journeys
        CustomRoute<void>(
          path: 'journeys',
          page: OrganisationJourneysPage,
        ),

        // Organisation Profile
        CustomRoute<void>(
          path: 'profile',
          page: OrganisationProfilePage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
