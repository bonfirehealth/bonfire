// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/auth/auth.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/family_member_sign_in_cubit.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/family_member_sign_in_state.dart';

class FamilyMemberSignInPage extends StatefulWidget {
  const FamilyMemberSignInPage({super.key,@pathParam required this.uniqueLinkValue,@queryParam this.e});

  final String uniqueLinkValue;
  final String? e;
  @override
  State<FamilyMemberSignInPage> createState() => _FamilyMemberSignInPageState();
}

class _FamilyMemberSignInPageState extends State<FamilyMemberSignInPage> {
  @override
  void initState() {
    super.initState();
    print("Uniquelinkvalue: ${widget.uniqueLinkValue} and email: ${widget.e}");
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => FamilyMemberSignInCubit()..initiate(widget.e!, widget.uniqueLinkValue)),
      BlocProvider(create: (_) => AuthSignInBloc()),
    ], child: Builder(builder: (context) {
      return MultiBlocListener(
        listeners: [
          BlocListener<FamilyMemberSignInCubit,FamilyMemberSignInState>(listener: (_,state) {
            state.whenOrNull(
              success: (decrypted) {
                BlocProvider.of<AuthSignInBloc>(context)
                  ..add(const AuthSignInInitSet())
                  ..add(AuthSignInEmailAddressSet(widget.e!))
                  ..add(AuthSignInPasswordSet(decrypted))
                  ..add(AuthSignInFormSubmit(context));
              }
            );
          }),
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [

            ],
          ),
        ),
      );
    }));
  }
}
