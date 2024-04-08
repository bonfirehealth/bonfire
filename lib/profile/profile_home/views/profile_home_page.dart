// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jiffy/jiffy.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:timeago/timeago.dart' as timeago;

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/family_members_cubit.dart';
import 'package:bonfirehealth/profile/family_plan/user_type_enum.dart';
import 'package:bonfirehealth/profile/profile.dart';
import 'package:bonfirehealth/screening/screening.dart';

part 'widgets/assessment_item.dart';
part 'widgets/health_data_item.dart';
part 'widgets/preference_item.dart';
part 'widgets/reward_list_item.dart';
part 'widgets/setting_list_item.dart';
part 'widgets/vital_line_chart.dart';
part 'widgets/chart_view_switcher.dart';
part 'widgets/profile_home_profile_view.dart';
part 'widgets/profile_home_vital_line_chart.dart';
part 'widgets/profile_home_health_data.dart';

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColourConstant.whiteFFFFFF,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: ColoredBox(
          color: Theme.of(context).primaryColor,
          child: const SizedBox.shrink(),
        ),
      ),
      body: const SafeArea(
        child: ProfileHomeBody(),
      ),
    );
  }
}

class ProfileHomeBody extends StatefulWidget {
  const ProfileHomeBody({super.key});

  @override
  State<ProfileHomeBody> createState() => _ProfileHomeBodyState();
}

class _ProfileHomeBodyState extends State<ProfileHomeBody> with AfterLayoutMixin<ProfileHomeBody> {
  @override
  void afterFirstLayout(BuildContext context) {
    context.read<ProfileHomeBloc>()
      ..add(const ProfileHomeInitSet())
      ..add(const ProfileHomeAggregateHourAssessmentsForOneDaySet())
      ..add(
        const ProfileHomeAggregateDayAssessmentsForOneWeekSet(
          setAggregateType: false,
        ),
      )
      ..add(
        const ProfileHomeAggregateDayAssessmentsForOneMonthSet(
          setAggregateType: false,
        ),
      )
      ..add(
        const ProfileHomeAggregateMonthAssessmentsForOneYearSet(
          setAggregateType: false,
        ),
      );

    Future<void>.delayed(const Duration(milliseconds: 2000), () {
      context.read<ProfileHomeBloc>().add(const ProfileHomeIsLoadingSet(isLoading: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileHomeBloc, ProfileHomeState>(
      builder: (_, state) {
        if (state.isLoading) {
          return Center(
            child: SpinKitCircle(
              color: Theme.of(context).primaryColor,
            ),
          );
        }

        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: SafeArea(
            top: false,
            bottom: false,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SpacerVertical(resizeByHeight(context, 20)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.l10n.insights,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const ChartViewSwitcher(),
                    const ProfileHomeVitalLineChart(),
                    const SpacerVertical(24),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColourConstant.whiteEFF3FB),
                        borderRadius: BorderRadius.circular(20),
                        color: AppColourConstant.textFieldGreyFillF4F4F8,
                      ),
                      child: Column(
                        children: [
                          const SpacerVertical(18),
                          const ProfileHomeProfileView(),
                          const SpacerVertical(11),
                          if (state.user?.userType?.identifier != UserTypeEnum.familyMember.name)
                            SettingListItem(
                              icon: ImageConstant.anthropology,
                              title: context.l10n.myFamilyPlanTitle,
                              markAsNew: true,
                              onPressed: () {
                                context.router.push(
                                  const FamilyPlanRoute(),
                                );
                              },
                            ),
                          const SpacerVertical(16),
                          SettingListItem(
                            icon: ImageConstant.anthropology,
                              title: context.l10n.myLatestVitalsTitle,
                            onPressed: () {
                              context.router.push(
                                const LatestVitalsRoute(),
                              );
                            },
                          ),
                          const SpacerVertical(16),
                          // SettingListItem(
                          //   icon: ImageConstant.save,
                          //   title: 'Saved questions', // TODO:
                          //   onPressed: () {
                          //     context.router.push(
                          //       const SavedQuestionsRoute(),
                          //     );
                          //   },
                          // ),
                          // const SpacerVertical(16),
                          SettingListItem(
                            icon: ImageConstant.bodyMassIndex,
                              title: context.l10n.changeMyBMITitle,
                            onPressed: () {
                              context.router.push(
                                CompleteProfileRoute(
                                  profile: state.profile,
                                  isEdit: true,
                                ),
                              );
                            },
                          ),
                          const SpacerVertical(18),
                        ],
                      ),
                    ),
                    const SpacerVertical(16),
                    const LanguageSelector(buttonHeight: 30, fontSize: 12),
                    const SpacerVertical(16),
                    const VersionText(),
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
