// Dart imports:

// Flutter imports:
import 'dart:math';

import 'package:bonfirehealth/global.dart';
import 'package:bonfirehealth/home/blocs/home_bloc.dart';
import 'package:bonfirehealth/organisation/organisation.dart';
import 'package:bonfirehealth/profile/profile_home/blocs/profile_home_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:loading_indicator/loading_indicator.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/chats/chats.dart';
import 'package:bonfirehealth/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

part 'widgets/chat_limitations.dart';
part 'widgets/chat_placeholder.dart';
part 'widgets/chat_prompt.dart';
part 'widgets/chat_response.dart';

class ChatsHomePage extends StatelessWidget {
  const ChatsHomePage({super.key, @queryParam this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    Widget buildMessage(String message) {
      final list = message.split(' ');
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            children: list
                .map(
                  (e) => TextSpan(
                    text: '$e ',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: e.toLowerCase() == 'low' || e.toLowerCase() == 'high'
                              ? Colors.red
                              : e.toLowerCase() == 'normal'
                                  ? Colors.green
                                  : Colors.black,
                        ),
                  ),
                )
                .toList()),
      );
    }

    if (isTrialCustomer) {
      return BlocProvider(
        create: (context) => ChatsHomeBloc()..initiate(context, message),
        child: BlocBuilder<ChatsHomeBloc, ChatsHomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImage.asset(
                    ImageConstant.logoCheckup,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  SpacerVertical(resizeByHeight(context, 25)),
                  if (state.message.isNotEmpty && (state.message.first as types.TextMessage).text.isNotEmpty) ...[
                    buildMessage((state.message.first as types.TextMessage).text),
                    Text(
                      "Let's see if any of this helps",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ] else ...[
                    Text(
                      context.l10n.emptySuggestionsPromptTitle1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      context.l10n.emptySuggestionsPromptTitle2,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  SpacerVertical(resizeByHeight(context, 20)),
                  if (state.message.isEmpty && state.status == ChatsHomeStatus.initial)
                    SizedBox(
                      width: 200,
                      child: RoundedButton(
                        title: context.l10n.emptySuggestionsNavigateToScreenPageButton,
                        onPressed: () {
                          context.read<AppBloc>().add(
                                AppNextRoutePath(
                                  context,
                                  'Reflect',
                                  '/home/screening',
                                  '',
                                ),
                              );
                        },
                      ),
                    )
                  else
                    CarouselSlider(
                      options: CarouselOptions(
                          height: resizeByHeight(context, 200),
                          autoPlayInterval: const Duration(seconds: 5),
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                      items: [
                        GestureDetector(
                          onTap: () async {
                            const url = 'https://www.mindline.sg/physical-health';
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            }
                          },
                          child: Assets.images.banner.bannerOne.image(),
                        ),
                        GestureDetector(
                          onTap: () {
                            callHotline('+65-6692-0851');
                          },
                          child: Assets.images.banner.bannerTwo.image(),
                        ),
                        GestureDetector(
                          onTap: () {
                            callHotline('+65-6333-3636');
                          },
                          child: Assets.images.banner.bannerThree.image(),
                        ),
                      ].map((i) {
                        return Container(
                          margin: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: i,
                          ),
                        );
                      }).toList(),
                    )
                ],
              ),
            );
          },
        ),
      );
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatsHomeBloc>(
          create: (context) => ChatsHomeBloc()..initiate(context, message),
        ),
      ],
      child: const Scaffold(
        backgroundColor: AppColourConstant.whiteFFFFFF,
        body: ChatsHomeBody(),
      ),
    );
  }
}

class ChatsHomeBody extends StatefulWidget {
  const ChatsHomeBody({super.key});

  @override
  _ChatsHomeBodyState createState() => _ChatsHomeBodyState();
}

class _ChatsHomeBodyState extends State<ChatsHomeBody> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    return BlocBuilder<ChatsHomeBloc, ChatsHomeState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SpacerVertical(resizeByHeight(context, 20)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Social Support',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SpacerVertical(resizeByHeight(context, 4)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Consult an AI health coach, peers or human experts',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColourConstant.blue52B7F8),
              ),
            ),
            SpacerVertical(resizeByHeight(context, 10)),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: Chat(
                      messages: state.message,
                      onMessageTap: (ctx, message) {
                        print(message);
                      },
                      onSendPressed: (question) {},
                      showUserAvatars: true,
                      showUserNames: true,
                      user: state.user,
                      customBottomWidget: const ChatPrompt(),
                    ),
                  ),
                  if (state.message.isEmpty && state.status == ChatsHomeStatus.initial)
                    Container(
                      color: AppColourConstant.whiteFFFFFF,
                      margin: const EdgeInsets.only(bottom: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          // Align(
                          //   alignment: Alignment.centerRight,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       TextButton(
                          //         onPressed: () {
                          //           context.router.push(
                          //             const SavedQuestionsRoute(),
                          //           );
                          //         },
                          //         child: Text(
                          //           l10n.viewThisWeekQuestions,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SpacerVertical(10),
                          ChatPlaceholder(),
                          SpacerVertical(16),
                        ],
                      ),
                    ),
                  Positioned(
                    bottom: resizeByHeight(context, 40) + 80,
                    left: 5,
                    child: IconButton(
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          useSafeArea: false,
                          builder: (ctx) => const AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            backgroundColor: AppColourConstant.whiteFFFFFF,
                            content: ChatLimitations(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.warning_amber_outlined,
                        size: 24,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: resizeByHeight(context, 40) + 80,
                  //   right: 10,
                  //   child: IconButton(
                  //     onPressed: () {
                  //       context.read<ChatsHomeBloc>().add(ChatsHomeSpecialAskSet(context: context));
                  //     },
                  //     icon: ClipOval(
                  //       child: Assets.images.chatQuickAction.image(
                  //         height: resizeByHeight(context, 50),
                  //         width: resizeByHeight(context, 50),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
