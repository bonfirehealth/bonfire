// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart' show AutoTabsScaffold;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart' hide CustomBottomNavigationBar;
import 'package:bonfirehealth/organisation/organisation.dart';

part 'widgets/bottom_navigation_bar.dart';
part 'widgets/bottom_navigation_icon.dart';
part 'widgets/dropdown_menu_button.dart';
part 'widgets/left_navigation_rail.dart';
part 'widgets/organisation_home_app_bar.dart';

class OrganisationHomePage extends StatelessWidget {
  const OrganisationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrganisationHomeBloc(),
      child: const OrganisationHomeBody(),
    );
  }
}

class OrganisationHomeBody extends StatefulWidget {
  const OrganisationHomeBody({super.key});

  @override
  State<OrganisationHomeBody> createState() => _OrganisationHomeBodyState();
}

class _OrganisationHomeBodyState extends State<OrganisationHomeBody>
    with AfterLayoutMixin<OrganisationHomeBody> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context
        .read<OrganisationProfileBloc>()
        .add(const OrganisationProfileInitSet());
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        OrganisationDashboardRoute(),
        OrganisationJourneysRoute(),
        // OrganisationProfileRoute(),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true,
      appBarBuilder: (_, index) => const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: OrganisationHomeAppBar(),
      ),
      builder: (context, child, animation) {
        final tabsRouter = context.tabsRouter;
        return Row(
          children: [
            if (MediaQuery.of(context).size.width >= 800) ...[
              BlocSelector<OrganisationHomeBloc, OrganisationHomeState, int>(
                selector: (state) => state.currentNavigationIndex,
                builder: (_, currentNavigationIndex) {
                  return LeftNavigationRail(
                    selectedIndex: currentNavigationIndex,
                    onDestinationSelected: (value) {
                      tabsRouter.setActiveIndex(value);
                      context.read<OrganisationHomeBloc>().add(
                            OrganisationHomeCurrentNavigationIndexSet(value),
                          );
                    },
                  );
                },
              ),
            ],
            Expanded(child: child),
          ],
        );
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        if (MediaQuery.of(context).size.width >= 800) {
          return const SizedBox.shrink();
        }

        return CustomBottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (int value) {
            tabsRouter.setActiveIndex(value);
            context.read<OrganisationHomeBloc>().add(
                  OrganisationHomeCurrentNavigationIndexSet(value),
                );
          },
        );
      },
    );
  }
}
