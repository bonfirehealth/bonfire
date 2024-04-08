// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/src/route/page_route_info.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/add_family_member_cubit.dart';
import 'package:bonfirehealth/profile/family_plan/views/family_plan_add_view.dart';
import 'package:bonfirehealth/profile/family_plan/views/family_plan_manage_view.dart';
import 'package:bonfirehealth/profile/profile.dart';
import 'package:bonfirehealth/screening/screening.dart';
import '../blocs/family_members_cubit.dart';

class FamilyPlanPage extends StatefulWidget {
  const FamilyPlanPage({super.key});

  @override
  State<FamilyPlanPage> createState() => _FamilyPlanPageState();
}

class _FamilyPlanPageState extends State<FamilyPlanPage> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AddFamilyMemberCubit()),
          BlocProvider(create: (_) => ProfileHomeBloc()),
          BlocProvider(create: (_) =>
          FamilyMembersCubit()
            ..load()),
        ],
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    onPressed: () {
                      context.router.push(const HomeRoute());
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 180,
                        child: TabBar(
                          controller: _controller,
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text('Add'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text('Manage'),
                            ),
                          ],
                          unselectedLabelColor: Colors.black,
                          labelColor: Colors.black,
                          indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black, width: 2),
                              insets: EdgeInsets.only(top: 4)),
                        ),
                      ),
                      const SpacerVertical(12),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBarView(
                            controller: _controller,
                            children:  [
                              BlocBuilder<FamilyMembersCubit, List<User?>>(
                                builder: (context, state) {
                                  return FamilyPlanAddView(membersCount: state.length,setTabCallback: _controller.animateTo,);
                                },
                              ),
                              FamilyPlanManageView(setTabCallback:  _controller.animateTo,),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
