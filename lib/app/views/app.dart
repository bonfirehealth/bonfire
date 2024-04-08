// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:responsive_framework/responsive_framework.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/auth/auth.dart';
import 'package:bonfirehealth/groups/groups.dart';
import 'package:bonfirehealth/onboarding/onboarding.dart';
import 'package:bonfirehealth/organisation/organisation.dart';
import 'package:bonfirehealth/profile/profile.dart';
import 'package:bonfirehealth/rewards/rewards.dart';
import 'package:bonfirehealth/screening/screening.dart';

final appRouter = AppRouter(
  authenticatedRouteGuard: AuthenticatedRouteGuard(),
  authenticatedOrganisationRouteGuard: AuthenticatedOrganisationRouteGuard(),
  landingRouteGuard: LandingRouteGuard(),
  notAuthenticatedRouteGuard: NotAuthenticatedRouteGuard(),
  notAuthenticatedOrganisationRouteGuard:
      NotAuthenticatedOrganisationRouteGuard(),
);

class App extends StatefulWidget {
  const App({
    super.key,
    required this.themeColour,
  });

  final String themeColour;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Flushbar<dynamic>? _flushbar;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // App
        BlocProvider<AppBloc>(
          create: (_) => AppBloc(),
        ),

        // Auth
        BlocProvider<AuthRecoverAccountBloc>(
          create: (_) => AuthRecoverAccountBloc(),
        ),

        // Onboarding
        BlocProvider<GenerateUsernameBloc>(
          create: (_) => GenerateUsernameBloc(),
        ),

        // Screening
        BlocProvider<ScreeningHomeBloc>(
          create: (_) => ScreeningHomeBloc(),
        ),
        BlocProvider<ScreeningTriageBloc>(
          create: (_) => ScreeningTriageBloc(),
        ),

        // Groups
        BlocProvider<GroupsBloc>(
          create: (_) => GroupsBloc(),
        ),
        BlocProvider<QuestionsBloc>(
          create: (_) => QuestionsBloc(),
        ),
        BlocProvider<AnswersBloc>(
          create: (_) => AnswersBloc(),
        ),
        BlocProvider<CommentsBloc>(
          create: (_) => CommentsBloc(),
        ),

        // Rewards
        BlocProvider<RewardsHomeBloc>(
          create: (_) => RewardsHomeBloc(),
        ),

        // Profile
        BlocProvider<ProfileHomeBloc>(
          create: (_) => ProfileHomeBloc(),
        ),
        BlocProvider<SavedQuestionsBloc>(
          create: (_) => SavedQuestionsBloc(),
        ),

        // Organisation
        BlocProvider<OrganisationProfileBloc>(
          create: (_) => OrganisationProfileBloc(),
        ),
      ],
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          final themeColour = state.themeColour != ''
              ? HexColor.fromHex(state.themeColour)
              : HexColor.fromHex(widget.themeColour);
          if (state.errorMessage != null && state.errorMessage != '') {
            if (_flushbar != null) {
              _flushbar?.dismiss(state.context);
            }

            if (!state.isErrorDialogShown) {
              _flushbar = Flushbar<dynamic>(
                onStatusChanged: ((status) {
                  if (status == FlushbarStatus.DISMISSED) {
                  } else if (status == FlushbarStatus.SHOWING) {}
                }),
                duration: const Duration(seconds: 5),
                flushbarPosition: FlushbarPosition.TOP,
                title: state.errorTitle,
                message: state.errorMessage,
                backgroundGradient: LinearGradient(
                  colors: [Colors.red, Colors.red.shade300],
                ),
                backgroundColor: Colors.red,
                boxShadows: [
                  BoxShadow(
                    color: Colors.red[800]!,
                    offset: const Offset(0, 2),
                    blurRadius: 3,
                  )
                ],
              )..show(state.context!);
            }
          } else {
            if (state.infoMessage != null && state.infoMessage != '') {
              if (_flushbar != null) {
                _flushbar?.dismiss(state.context);
              }

              if (!state.isInfoDialogShown) {
                _flushbar = Flushbar<dynamic>(
                  onStatusChanged: ((status) {
                    if (status == FlushbarStatus.DISMISSED) {
                    } else if (status == FlushbarStatus.SHOWING) {}
                  }),
                  duration: const Duration(seconds: 5),
                  flushbarPosition: FlushbarPosition.TOP,
                  title: state.infoTitle,
                  message: state.infoMessage,
                  backgroundGradient: LinearGradient(
                    colors: [
                      themeColour,
                      themeColour,
                    ],
                  ),
                  backgroundColor: themeColour,
                  boxShadows: [
                    BoxShadow(
                      color: themeColour,
                      offset: const Offset(0, 2),
                      blurRadius: 3,
                    )
                  ],
                )..show(state.context!);
              }
            }
          }
        },
        child: FutureBuilder<String>(
          future: getLocale(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              final locale = snapshot.data ?? 'en';
              return BlocBuilder<AppBloc, AppState>(
                builder: (_, state) {
                  return MaterialApp.router(
                    theme: AppTheme.dynamicThemeData(
                      primaryColor: state.themeColour != ''
                          ? HexColor.fromHex(state.themeColour)
                          : HexColor.fromHex(widget.themeColour),
                    ),
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      LocaleNamesLocalizationsDelegate(),
                    ],
                    locale: Locale(state.currentLocale ?? locale),
                    supportedLocales: AppLocalizations.supportedLocales,
                    routerDelegate: AutoRouterDelegate(appRouter),
                    routeInformationParser: appRouter.defaultRouteParser(),
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor:
                              context.textScaleFactor.clamp(1.0, 1.3),
                        ),
                        child: Stack(
                          children: [
                            ResponsiveWrapper.builder(
                              BouncingScrollWrapper.builder(context, child!),
                              maxWidth: 1400,
                              defaultScale: true,
                              breakpoints: [
                                const ResponsiveBreakpoint.resize(
                                  450,
                                  name: MOBILE,
                                ),
                                const ResponsiveBreakpoint.autoScale(
                                  800,
                                  name: TABLET,
                                ),
                                const ResponsiveBreakpoint.autoScale(
                                  1000,
                                  name: TABLET,
                                ),
                                const ResponsiveBreakpoint.resize(
                                  1200,
                                  name: DESKTOP,
                                ),
                              ],
                              background: Container(
                                color: AppColourConstant.whiteF8F8F8,
                              ),
                            ),
                            if (state.isLoading)
                              LoadingOverlay(text: state.loadingText),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
