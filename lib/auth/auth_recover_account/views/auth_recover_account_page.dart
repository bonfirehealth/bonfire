// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/auth/auth.dart';

class AuthRecoverAccountPage extends StatelessWidget {
  const AuthRecoverAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: const AuthRecoverAccountBody(),
    );
  }
}

class AuthRecoverAccountBody extends StatefulWidget {
  const AuthRecoverAccountBody({super.key});

  @override
  State<AuthRecoverAccountBody> createState() => _AuthRecoverAccountBodyState();
}

class _AuthRecoverAccountBodyState extends State<AuthRecoverAccountBody> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final bloc = context.read<AuthRecoverAccountBloc>();

    return BlocBuilder<AuthRecoverAccountBloc, AuthRecoverAccountState>(
      builder: (_, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => appBloc.add(
                    AppReplaceRoute(
                      context,
                      const AuthSignInRoute(),
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColourConstant.grey50535A.withOpacity(0.3),
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: SafeArea(
                minimum: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppImage.asset(
                            ImageConstant.logoCheckup,
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ],
                    ),
                    SpacerVertical(resizeByHeight(context, 30)),
                    Text(
                      l10n.recoverAccountTitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColourConstant.grey50535A,
                          ),
                    ),
                    SpacerVertical(resizeByHeight(context, 30)),
                    SizedBox(
                      width: resizeByWidth(context, 200),
                      child: Text(
                        l10n.recoverAccountSubtitle,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: AppColourConstant.grey50535A,
                                ),
                      ),
                    ),
                    SpacerVertical(resizeByHeight(context, 36)),
                    RoundedTextField(
                      onChanged: (value) =>
                          bloc.add(AuthRecoverAccountEmailAddressSet(value)),
                      hintText: l10n.emailAddress,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SpacerVertical(resizeByHeight(context, 8)),
                    RoundedTextField(
                      onChanged: (value) =>
                          bloc.add(AuthRecoverAccountRecoveryCodeSet(value)),
                      hintText: l10n.recoveryCode,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SpacerVertical(resizeByHeight(context, 16)),
                    RoundedButton(
                      onPressed: () =>
                          bloc.add(AuthRecoverAccountFormSubmit(context)),
                      title: l10n.submit,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            if (state.isLoading)
              ColoredBox(
                color: AppColourConstant.black1E1F2B.withOpacity(0.6),
                child: Center(
                  child: SpinKitCircle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
