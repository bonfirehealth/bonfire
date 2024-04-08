// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/organisation/organisation.dart';

class OrganisationJourneysPage extends StatelessWidget {
  const OrganisationJourneysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrganisationJourneysBloc>(
      create: (_) => OrganisationJourneysBloc(),
      child: const Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.all(20),
          child: OrganisationJourneysBody(),
        ),
      ),
    );
  }
}

class OrganisationJourneysBody extends StatefulWidget {
  const OrganisationJourneysBody({super.key});

  @override
  State<OrganisationJourneysBody> createState() =>
      _OrganisationJourneysBodyState();
}

class _OrganisationJourneysBodyState extends State<OrganisationJourneysBody>
    with AfterLayoutMixin<OrganisationJourneysBody> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context
        .read<OrganisationHomeBloc>()
        .add(const OrganisationHomeCurrentNavigationIndexSet(1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganisationJourneysBloc, OrganisationJourneysState>(
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
                    AppImage.asset(
                      ImageConstant.journeyWorkflows,
                      width: 1024,
                      height: 500,
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
