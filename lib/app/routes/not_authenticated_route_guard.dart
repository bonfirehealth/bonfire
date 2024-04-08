// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class NotAuthenticatedRouteGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final authToken = await AuthHelper.getAuthToken();
    if (authToken != null) {
      await AuthHelper.init(authToken.item1);
    }
    final isMobileWeb = PlatformHelper.isMobileWeb();
    final isSignedIn = await AuthHelper.isSignedIn();

    final isOrganisationAccount = await AuthHelper.isOrganisationAccount();
    var isValidOrganisationAccount = false;
    if (authToken != null) {
      isValidOrganisationAccount =
          await AuthHelper.isValidOrganisationAccount(authToken.item1);
    }

    logInfo(
      '[NotAuthenticatedRouteGuard] isOrganisationAccount: $isOrganisationAccount isSignedIn: $isSignedIn',
    );

    if (isMobileWeb) {
      if (isSignedIn) {
        if (isOrganisationAccount && isValidOrganisationAccount) {
          resolver.next();
        } else {
          await router.push(const HomeRoute());
        }
      } else {
        resolver.next();
      }
    } else {
      if (FlavorConfig.isDevelopment() || FlavorConfig.isStaging()) {
        if (isSignedIn) {
          if (isOrganisationAccount && isValidOrganisationAccount) {
            resolver.next();
          } else {
            await router.push(const HomeRoute());
          }
        } else {
          resolver.next();
        }
      } else {
        if (isOrganisationAccount && isValidOrganisationAccount) {
          resolver.next();
        } else {
          await router.push(LandingRoute(isSupportedBrowser: true));
        }
      }
    }
  }
}
