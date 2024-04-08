// Flutter imports:

// Flutter imports:
import 'package:bonfirehealth/global.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/gen/assets.gen.dart';
import 'package:bonfirehealth/profile/profile.dart';
import 'package:bonfirehealth/screening/screening.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreeningHomePage extends StatelessWidget {
  const ScreeningHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ScreeningBody(),
    );
  }
}

class ScreeningBody extends StatefulWidget {
  const ScreeningBody({super.key});

  @override
  State<ScreeningBody> createState() => _ScreeningBodyState();
}

class _ScreeningBodyState extends State<ScreeningBody> with AfterLayoutMixin<ScreeningBody> {
  @override
  void afterFirstLayout(BuildContext context) {
    context.read<ProfileHomeBloc>()
      ..add(const ProfileHomeInitSet())
      ..add(const ProfileHomeAggregateHourAssessmentsForOneDaySet());
    context.read<ScreeningHomeBloc>().add(const ScreeningHomeInitSet());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();

    return BlocSelector<ScreeningHomeBloc, ScreeningHomeState, SelfCare?>(
      selector: (state) => state.activeSelfCare,
      builder: (_, activeSelfCare) {
        final selfCare = activeSelfCare;

        if (selfCare == null) {
          return Center(
            child: SpinKitCircle(
              color: Theme.of(context).primaryColor,
            ),
          );
        }

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              colors: [
                AppColourConstant.blue52B7F8,
                AppColourConstant.blue2961EA,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColourConstant.greyE6EFFF,
                blurRadius: 2,
                offset: Offset(
                  0,
                  -1,
                ),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: SafeArea(
              top: false,
              bottom: false,
              child: Column(
                children: [
                  if (isTrialCustomer)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          callHotline('6589017505', isWhatsApp: true);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Assets.images.itSupportChat.image(
                              width: 32,
                              height: 32,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              l10n.itSupportTitleButton,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColourConstant.whiteFFFFFF,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    SpacerVertical(resizeByHeight(context, 48)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const _AnimatedScreeningTitle(),
                        SpacerVertical(resizeByHeight(context, 54)),
                        InkWell(
                          onTap: () => appBloc.add(
                            AppNextRoutePath(
                              context,
                              selfCare.name ?? '',
                              selfCare.routePath ?? '',
                              selfCare.url ?? '',
                            ),
                          ),
                          onLongPress: isTrialCustomer
                              ? () => showDialog<void>(
                                    useSafeArea: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const PopupCounsellorCallDialog();
                                    },
                                  )
                              : () {
                                  appBloc.add(
                                    AppNextRoutePath(
                                      context,
                                      'Driver Assistant',
                                      '/screening/driver-assistant',
                                      '',
                                    ),
                                  );
                                },
                          child: Container(
                            width: 186,
                            height: 186,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF69B2F9)),
                            padding: const EdgeInsets.all(33),
                            child: Assets.images.faceId.image(),
                          ),
                        ), //Text
                        SpacerVertical(resizeByHeight(context, 48)),
                      ],
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(
                  //       left: 20,
                  //       bottom: 20,
                  //     ),
                  //     child: BlocSelector<ProfileHomeBloc, ProfileHomeState, User?>(
                  //       selector: (state) => state.user,
                  //       builder: (_, user) {
                  //         final organisationUsers = user?.organisations;
                  //         if (organisationUsers == null) {
                  //           return AppImage.asset(
                  //             ImageConstant.logoTransparent,
                  //             width: 60,
                  //             height: 60,
                  //           );
                  //         }
                  //
                  //         final organisationUser = organisationUsers[0];
                  //
                  //         return Row(
                  //           children: [
                  //             CachedNetworkImage(
                  //               imageUrl: AmplifyConstant.generateFullS3FilePath(
                  //                 FlavorConfig.instance!.flavor,
                  //                 '${organisationUser.organisation.logoURL}',
                  //               ),
                  //               fit: BoxFit.contain,
                  //               height: 60,
                  //               width: 60,
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AnimatedScreeningTitle extends StatelessWidget {
  const _AnimatedScreeningTitle();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: resizeByWidth(context, 300),
          height: 50,
          child: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColourConstant.whiteFFFFFF,
                ),
            child: AnimatedTextKit(
              repeatForever: true,
              pause: Duration.zero,
              animatedTexts: [
                RotateAnimatedText(l10n.screeningTitle),
                if (isTrialCustomer)
                  RotateAnimatedText(l10n.longPressForHelp)
                else
                  RotateAnimatedText(l10n.screeningTitleForDriver),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
