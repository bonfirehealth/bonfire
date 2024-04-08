// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/gen/assets.gen.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/add_family_member_cubit.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/add_family_member_state.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/family_members_cubit.dart';
import '../../../app/widgets/rounded_button.dart';

class FamilyPlanAddView extends StatefulWidget {
  const FamilyPlanAddView({super.key, required this.membersCount, this.setTabCallback});

  final int membersCount;
  final void Function(int index)? setTabCallback;

  @override
  State<FamilyPlanAddView> createState() => _FamilyPlanAddViewState();
}

class _FamilyPlanAddViewState extends State<FamilyPlanAddView> {
  final firstNameTC = TextEditingController();
  final lastNameTC = TextEditingController();

  int selectedAvatar = 0;
  String avatarValue = '';

  String getAvatarName(String path) {
    return path.split('/').last;
  }

  bool btnEnabled = false;

  void checkForm() {
    setState(() {
      btnEnabled = firstNameTC.text.trim().isNotEmpty && lastNameTC.text.trim().isNotEmpty;
    });
  }

  Future<void> showShareDialog(BuildContext context, String shareLink) async {
    await showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpacerVertical(24),
                  Image.asset(
                    'images/share_illustration.png',
                    height: 200,
                  ),
                  SpacerVertical(24),
                  RoundedTextField(
                    fillColor: AppColourConstant.textFieldGreyFillF4F4F8,
                    borderColor: AppColourConstant.textFieldGreyFillF4F4F8,
                    textColor: AppColourConstant.textFieldTextColorA0B2C6,
                    verticalPadding: 24,
                    readOnly: true,
                    initialValue: shareLink,
                  ),
                  SpacerVertical(24),
                  SizedBox(
                    height: 60,
                    child: RoundedButton(
                      title: 'Share Link',
                      onPressed: () async {
                        await Share.share(shareLink).then((value) => Navigator.of(context).pop());
                      },
                      backgroundColor: AppColourConstant.btnEnabledColor2C74F1,
                      disabledColor: AppColourConstant.btnDisabledColorCFD5DD,
                      disabledTextColor: Colors.white,
                    ),
                  ),
                  SpacerVertical(24),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = BlocProvider.of<AppBloc>(context);
    return widget.membersCount >= 5
        ? getLimitReachedView(context)
        : BlocListener<AddFamilyMemberCubit, AddFamilyMemberState>(
            listener: (context, state) {
              state.whenOrNull(success: (data) async {
                appBloc
                  ..add(
                    const AppIsLoadingSet(
                      isLoading: false,
                      loadingText: '',
                    ),
                  );
                await showShareDialog(context, data);
                try {
                  await Clipboard.setData(ClipboardData(text: data));
                } catch (e) {}
                BlocProvider.of<FamilyMembersCubit>(context).load();
                widget.setTabCallback?.call(1);
                print("Data is $data");
              }, loading: () {
                appBloc.add(const AppIsLoadingSet());
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundedTextField(
                    verticalPadding: 24,
                    fillColor: AppColourConstant.textFieldGreyFillF4F4F8,
                    borderColor: AppColourConstant.textFieldGreyFillF4F4F8,
                    textColor: AppColourConstant.textFieldTextColorA0B2C6,
                    controller: firstNameTC,
                    hintText: 'First name',
                    onChanged: (value) {
                      checkForm();
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RoundedTextField(
                    verticalPadding: 24,
                    fillColor: AppColourConstant.textFieldGreyFillF4F4F8,
                    borderColor: AppColourConstant.textFieldGreyFillF4F4F8,
                    textColor: AppColourConstant.textFieldTextColorA0B2C6,
                    controller: lastNameTC,
                    hintText: 'Last name',
                    onChanged: (value) {
                      checkForm();
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Choose avatar",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedAvatar = index;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: selectedAvatar == index ? AppColourConstant.blue1A56CF : Colors.white,
                              radius: 26,
                              child: CircleAvatar(
                                radius: selectedAvatar == index ? 21 : 24,
                                backgroundImage: Assets.images.avatars.values[index].provider(),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: Assets.images.avatars.values.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 60,
                    child: RoundedButton(
                      backgroundColor: AppColourConstant.btnEnabledColor2C74F1,
                      disabledColor: AppColourConstant.btnDisabledColorCFD5DD,
                      disabledTextColor: Colors.white,
                      onPressed: btnEnabled
                          ? () {
                              avatarValue = getAvatarName(Assets.images.avatars.values[selectedAvatar].path);
                              BlocProvider.of<AddFamilyMemberCubit>(context).createUser(CoreRepo.organisationId,
                                  firstNameTC.text.trim(), lastNameTC.text.trim(), avatarValue);
                            }
                          : null,
                      title: 'Create Link',
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Widget getLimitReachedView(BuildContext context) {
    return Column(
      children: [
        const SpacerVertical(24),
        Assets.images.familyPlan.image(width: 240, height: 240),
        const SpacerVertical(12),
        Text(
          'Need a bigger house?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SpacerVertical(8),
        Text(
          "You have added the maximum number of 5 family members",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColourConstant.grey9A9A9A),
        ),
        const SpacerVertical(24),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: RoundedButton(
            backgroundColor: AppColourConstant.btnEnabledColor2C74F1,
            disabledColor: AppColourConstant.btnDisabledColorCFD5DD,
            disabledTextColor: Colors.white,
            title: 'Manage members',
            onPressed: () {
              setState(() {
                widget.setTabCallback?.call(1);
              });
            },
          ),
        ),
      ],
    );
  }
}
