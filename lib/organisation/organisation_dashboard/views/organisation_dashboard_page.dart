// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:numeral/numeral.dart';
import 'package:recase/recase.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/organisation/organisation.dart';
import 'package:bonfirehealth/profile/family_plan/user_type_enum.dart';

part 'widgets/add_button_card.dart';

part 'widgets/aggregated_vital_line_chart.dart';

part 'widgets/count_card.dart';

part 'widgets/doughnut_chart.dart';

part 'widgets/organisation_dashboard_donut_charts.dart';

part 'widgets/organisation_dashboard_count_cards.dart';

part 'widgets/organisation_dashboard_animated_bar.dart';

part 'widgets/organisation_dashboard_aggregated_charts.dart';

class OrganisationDashboardPage extends StatelessWidget {
  const OrganisationDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrganisationDashboardBloc>(
      create: (_) => OrganisationDashboardBloc(),
      child: const Scaffold(
        body: SafeArea(
          child: OrganisationDashboardBody(),
        ),
      ),
    );
  }
}

class OrganisationDashboardBody extends StatefulWidget {
  const OrganisationDashboardBody({super.key});

  @override
  State<OrganisationDashboardBody> createState() =>
      _OrganisationDashboardBodyState();
}

class _OrganisationDashboardBodyState extends State<OrganisationDashboardBody>
    with AfterLayoutMixin<OrganisationDashboardBody> {
  bool isFamilyMembersTab = false;
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    loadData(context);
  }

  void loadData(BuildContext context) {
    context.read<OrganisationDashboardBloc>()
      ..add(const OrganisationDashboardIsLoadingSet())..add(const OrganisationDashboardInitSet())..add(
      OrganisationDashboardAllOrganisationUsersByOrganisationGet(
        context,
      ),
    )..add(
      OrganisationDashboardAllSuggestionsByOrganisationGet(context),
    )..add(OrganisationDashboardOrganisationUpdate(context))..add(
      const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneDayGet(),
    )..add(
      const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneWeekGet(
        setAggregateType: false,
      ),
    )..add(
      const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneMonthGet(
        setAggregateType: false,
      ),
    )..add(
      const OrganisationDashboardAllAggregateOrganisationAssessmentsByOneYearGet(
        setAggregateType: false,
      ),
    )..add(const OrganisationDashboardIsLoadingSet(isLoading: false));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrganisationHomeBloc, OrganisationHomeState>(
      listener: (context, state) {
       if(state.isFamilyMembersTab == isFamilyMembersTab){
         return;
       }
       setState(() {
         isFamilyMembersTab = state.isFamilyMembersTab;
       });
       loadData(context);
      },
      child: BlocBuilder<OrganisationDashboardBloc, OrganisationDashboardState>(
        builder: (_, state) {
          if (state.isLoading) {
            return Scaffold(
              body: Center(
                child: Center(
                  child: SpinKitCircle(
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
              ),
            );
          }
          return SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: const [
                OrganisationDashboardDonutCharts(),
                OrganisationDashboardCountCards(),
                OrganisationDashboardAnimatedBar(),
                OrganisationDashboardAggregatedCharts(),
              ],
            ),
          );
        },
      ),
    );
  }
}
