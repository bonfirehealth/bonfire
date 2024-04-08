// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart' as ar;
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/blocs/post_state.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/delete_family_member_cubit.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/set_telegram_user_cubit.dart';
import 'package:bonfirehealth/profile/profile_home/blocs/user_info_cubit.dart';
import '../../../app/constants/app_colour_constant.dart';
import '../../../app/widgets/rounded_button.dart';
import '../../../app/widgets/spacer.dart';
import '../../../gen/assets.gen.dart';

class SetTelegramUserPage extends StatefulWidget {
  SetTelegramUserPage({super.key});

  @override
  State<SetTelegramUserPage> createState() => _SetTelegramUserState();
}

class _SetTelegramUserState extends State<SetTelegramUserPage> {
  final TextEditingController controller = TextEditingController();

  var _btnEnabled = false;

  void checkForm() {
    setState(() {
      _btnEnabled = controller.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SetTelegramUserCubit()),
            BlocProvider(create: (_) => UserInfoCubit()..load()),
          ],
          child: Builder(
            builder: (context) {
              return MultiBlocListener(
                listeners: [
                  BlocListener<SetTelegramUserCubit, PostState<bool>>(listener: (_, state) {
                    state.whenOrNull(loading: () {
                      appBloc.add(const AppIsLoadingSet());
                    }, data: (data) async  {
                      appBloc.add(
                        const AppIsLoadingSet(
                          isLoading: false,
                          loadingText: '',
                        ),
                      );
                      if (data) {
                        try {
                          final response = await launchUrl(Uri.parse('tg://resolve?domain=bonfirehealth_bot&start=start'),mode: LaunchMode.externalNonBrowserApplication,
                          webOnlyWindowName: "_self");
                        }
                        catch(e){
                          // appBloc.add( AppInfoMessageSet(context, "URL", e.toString()));
                        }

                        AutoRouter.of(context).replace(const FamilyPlanRoute());
                      }
                    });
                  }),
                  BlocListener<UserInfoCubit, PostState<UserInfoState>>(listener: (_, state) {
                    state.whenOrNull(loading: () {

                      appBloc.add(const AppIsLoadingSet());
                    }, data: (data) {
                      appBloc.add(
                        const AppIsLoadingSet(
                          isLoading: false,
                          loadingText: '',
                        ),
                      );

                      setState(() {
                        controller.text = data.user.telegramId ?? '';
                      });
                      checkForm();
                    });
                  })
                ],
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SpacerVertical(24),
                      Text(
                        'Enter your Telegram username',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SpacerVertical(12),
                      RoundedTextField(
                        controller: controller,
                        hintText: 'Telegram username',
                        onChanged: (value) {
                          checkForm();
                        },
                      ),
                      SpacerVertical(12),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child:
                               RoundedButton(
                                  title: 'Save',
                                  onPressed:_btnEnabled? () {
                                    BlocProvider.of<SetTelegramUserCubit>(context).initiate(controller.text.trim());
                                  } : null,
                                )
                              ,
                        ),
                      ),
                      SpacerVertical(80),
                      Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
