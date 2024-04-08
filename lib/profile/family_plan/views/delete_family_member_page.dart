// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart' as ar;
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/blocs/post_state.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/delete_family_member_cubit.dart';
import '../../../app/constants/app_colour_constant.dart';
import '../../../app/widgets/rounded_button.dart';
import '../../../app/widgets/spacer.dart';
import '../../../gen/assets.gen.dart';

class DeleteFamilyMemberPage extends StatefulWidget {
  DeleteFamilyMemberPage({super.key, @ar.pathParam required this.id});

  String id;

  @override
  State<DeleteFamilyMemberPage> createState() => _DeleteFamilyMemberPageState();
}

class _DeleteFamilyMemberPageState extends State<DeleteFamilyMemberPage> {
  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (_) => DeleteFamilyMemberCubit(),
          child: Builder(
            builder: (context) {
              return BlocListener<DeleteFamilyMemberCubit, PostState<bool>>(
                listener: (context, state) {
                  state.whenOrNull(
                    loading: (){
                      appBloc.add(const AppIsLoadingSet());
                    },
                    data: (data){
                      appBloc
                        .add(
                          const AppIsLoadingSet(
                            isLoading: false,
                            loadingText: '',
                          ),
                        );
                      if(data){
                        AutoRouter.of(context).replace(const FamilyPlanRoute());
                      }
                    }
                  );
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_outlined),
                          onPressed: () {
                            AutoRouter.of(context).replace(const FamilyPlanRoute());
                          },
                        ),
                      ),
                    ),
                    Spacer(),
                    Assets.images.deleteRecord.image(width: 240, height: 240),
                    SpacerVertical(12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.3),
                      child: Text(
                        'You sure about this?',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SpacerVertical(8),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
                      child: Text(
                        "If you delete this member, they will lose access to their account",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColourConstant.grey6C798B, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SpacerVertical(24),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: RoundedButton(
                        backgroundColor: AppColourConstant.deleteRedFAE4E4,
                        textColor: AppColourConstant.deleteRedTextColorB9817F,
                        title: 'Delete this member',
                        onPressed: () {
                         BlocProvider.of<DeleteFamilyMemberCubit>(context).initiate(widget.id);
                        },
                      ),
                    ),
                    SpacerVertical(80),
                    Spacer(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
