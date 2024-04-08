// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class NotAuthenticatedOrganisationRouteGuard extends AutoRouteGuard {
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
      '[NotAuthenticatedOrganisationRouteGuard] isOrganisationAccount: $isOrganisationAccount',
    );

    if (!isMobileWeb) {
      if (isSignedIn) {
        if (isOrganisationAccount && isValidOrganisationAccount) {
          await router.push(const OrganisationHomeRoute());
        } else {
          await router.push(const HomeRoute());
        }
      } else {
        resolver.next();
      }
    } else {
      if (isSignedIn) {
        if (isOrganisationAccount && isValidOrganisationAccount) {
          resolver.next();
          // await router.push(const OrganisationHomeRoute());
        } else {
          await router.push(const HomeRoute());
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
                //  organisationCode: 'zhengkeng-3B5pMy'
                ),
          );
        }
      }
    }
  }
}
