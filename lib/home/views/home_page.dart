// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/home/home.dart';
import 'package:bonfirehealth/profile/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        const ScreeningHomeRoute(),
        ChatsHomeRoute(),
        // GroupsRoute(),
        const ProfileHomeRoute(),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true,
      bottomNavigationBuilder: (_, tabsRouter) {
        return CustomBottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (int value) {
            tabsRouter.setActiveIndex(value);
            context.read<HomeBloc>().add(HomeCurrentNavigationIndexSet(value));
          },
        );
      },
    );
  }
}
