// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class AuthenticatedRouteGuard extends AutoRouteGuard {
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
      '[AuthenticatedRouteGuard] isMobileWeb: $isMobileWeb isSignedIn: $isSignedIn',
    );

    if (isMobileWeb) {
      if (isSignedIn) {
        if (isOrganisationAccount && isValidOrganisationAccount) {
          await router.push(const OrganisationHomeRoute());
        } else {
          resolver.next();
        }
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
          await router.push(EnterOrganisationCodeRoute());
        }
      }
    } else {
      if (FlavorConfig.isDevelopment() || FlavorConfig.isStaging()) {
        if (isSignedIn) {
          if (isOrganisationAccount && isValidOrganisationAccount) {
            await router.push(const OrganisationHomeRoute());
          } else {
            resolver.next();
          }
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
            await router.push(
              EnterOrganisationCodeRoute(organisationCode: 'nus-81066E09'
                  //organisationCode: 'zhengkeng-3B5pMy'
                  ),
            );
          }
        }
      } else {
        if (isOrganisationAccount && isValidOrganisationAccount) {
          await router.push(const OrganisationHomeRoute());
        } else {
          await router.push(LandingRoute(isSupportedBrowser: true));
        }
      }
    }
  }
}
