// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class LandingRouteGuard extends AutoRouteGuard {
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
    final organisationParams = await AuthHelper.getOrganisationQueryParams();
    final organisationCode = organisationParams.item1;
    final organisationToken = organisationParams.item2;
    final organisationUserId = organisationParams.item3;

    logInfo(
      '[LandingRouteGuard] isMobileWeb: $isMobileWeb isSignedIn: $isSignedIn',
    );

    if (isMobileWeb) {
      if (isSignedIn) {
        await router.push(const HomeRoute());
      } else {
        if (organisationCode != null && organisationToken != null) {
          await router.push(
            JoinOrganisationRoute(
              organisationCode: organisationCode,
              organisationToken: organisationToken,
              organisationUserId: organisationUserId,
            ),
          );
        } else {
          if (isOrganisationAccount && isValidOrganisationAccount) {
            await router.push(const OrganisationHomeRoute());
          } else {
            resolver.next();
          }
        }
      }
    } else {
      if (FlavorConfig.isDevelopment() || FlavorConfig.isStaging()) {
        if (isSignedIn) {
          await router.push(const HomeRoute());
        } else {
          if (organisationCode != null && organisationToken != null) {
            await router.push(
              JoinOrganisationRoute(
                organisationCode: organisationCode,
                organisationToken: organisationToken,
                organisationUserId: organisationUserId,
              ),
            );
          } else {
            await router.push(const OrganisationSignInRoute());
          }
        }
      } else {
        if (isSignedIn && isOrganisationAccount && isValidOrganisationAccount) {
          await router.push(const OrganisationHomeRoute());
        } else {
          final sharedPrefs = await SharedPreferences.getInstance();
          await sharedPrefs.setBool('is_signed_in', false);
          await router.push(const OrganisationSignInRoute());
        }
      }
    }
  }
}
