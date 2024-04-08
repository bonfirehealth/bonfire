// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/gen/assets.gen.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/family_members_cubit.dart';
import 'package:bonfirehealth/profile/family_plan/views/widgets/family_member_card.dart';
import '../../../app/widgets/rounded_button.dart';

class FamilyPlanManageView extends StatefulWidget {
  const FamilyPlanManageView({super.key, this.setTabCallback});

  final void Function(int index)? setTabCallback;
  @override
  State<FamilyPlanManageView> createState() => _FamilyPlanManageViewState();
}

class _FamilyPlanManageViewState extends State<FamilyPlanManageView> {
  bool hasList = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamilyMembersCubit, List<User?>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return getEmptyView(context);
        }
        return ListView(
          shrinkWrap: true,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: FamilyMemberCard(
                    user: state[index]!,
                  ),
                );
              },
              itemCount: state.length,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration:
                    BoxDecoration(color: AppColourConstant.deleteRedFAE4E4, borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                child: Row(
                  children: [
                    Assets.images.telegram.image(width: 36, height: 36),
                    const SpacerHorizontal(12),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        context.router.push(SetTelegramUserRoute());
                      },
                      child: Text(
                        'Notify me via Telegram when my family members have health warning signs',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColourConstant.deleteRedTextColorB9817F,
                            ),
                      ),
                    )),
                    const SpacerHorizontal(12),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColourConstant.grey50535A,
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget getEmptyView(BuildContext context) {
    return Column(
      children: [
        SpacerVertical(24),
        Assets.images.familyPlanEmpty.image(width: 240, height: 240),
        SpacerVertical(12),
        Text(
          'No Family Member',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SpacerVertical(8),
        Text(
          "Monitor your family's health",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColourConstant.grey9A9A9A),
        ),
        SpacerVertical(24),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: RoundedButton(
            title: 'Add Member',
            onPressed: () {
              widget.setTabCallback?.call(0);
            },
          ),
        ),
      ],
    );
  }
}
