// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/organisation/organisation.dart';

class OrganisationProfilePage extends StatelessWidget {
  const OrganisationProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrganisationProfileBloc>(
      create: (_) => OrganisationProfileBloc(),
      child: const Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.all(20),
          child: OrganisationProfileBody(),
        ),
      ),
    );
  }
}

class OrganisationProfileBody extends StatefulWidget {
  const OrganisationProfileBody({super.key});

  @override
  State<OrganisationProfileBody> createState() =>
      _OrganisationProfileBodyState();
}

class _OrganisationProfileBodyState extends State<OrganisationProfileBody>
    with AfterLayoutMixin<OrganisationProfileBody> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context
        .read<OrganisationHomeBloc>()
        .add(const OrganisationHomeCurrentNavigationIndexSet(1));
    context
        .read<OrganisationProfileBloc>()
        .add(const OrganisationProfileInitSet());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganisationProfileBloc, OrganisationProfileState>(
      builder: (_, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: SafeArea(
            top: false,
            bottom: false,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          SpacerVertical(
                            MediaQuery.of(context).viewPadding.top + 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SpacerHorizontal(16),
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: ClipOval(
                                      child: CircleAvatar(
                                        radius: 45,
                                        child: AppImage.asset(
                                          ImageConstant.profileAvatar,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (state.user?.username != null) ...[
                                const SpacerHorizontal(16),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.52,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        state.user?.emailAddress ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color:
                                                  AppColourConstant.whiteF8F8F8,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      AutoSizeText(
                                        state.user?.userType?.name ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              color:
                                                  AppColourConstant.whiteF8F8F8,
                                            ),
                                      ),
                                      AutoSizeText(
                                        state.user?.organisations?[0]
                                                .organisation.name ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              color:
                                                  AppColourConstant.whiteF8F8F8,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              const Expanded(child: SizedBox.shrink()),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          SpacerVertical(
                            MediaQuery.of(context).viewPadding.top + 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
