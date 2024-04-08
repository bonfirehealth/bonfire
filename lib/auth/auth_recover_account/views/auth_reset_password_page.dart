// Flutter imports:

// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/auth/auth.dart';

class AuthResetPasswordPage extends StatelessWidget {
  const AuthResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.background,
      child: const AuthResetPasswordBody(),
    );
  }
}

class AuthResetPasswordBody extends StatefulWidget {
  const AuthResetPasswordBody({super.key});

  @override
  State<AuthResetPasswordBody> createState() => _AuthResetPasswordBodyState();
}

class _AuthResetPasswordBodyState extends State<AuthResetPasswordBody> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<AuthRecoverAccountBloc>();

    return BlocBuilder<AuthRecoverAccountBloc, AuthRecoverAccountState>(
      builder: (_, state) {
        if (state.isPasswordReset) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitThreeBounce(
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  l10n.resetPasswordRedirectMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        }

        return Stack(
          children: [
            Scaffold(
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
                      l10n.resetPasswordTitle,
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
                        l10n.resetPasswordSubtitle,
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
                          bloc.add(AuthRecoverAccountPasswordSet(value)),
                      controller: _passwordController,
                      hintText: l10n.newPassword,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SpacerVertical(resizeByHeight(context, 8)),
                    RoundedTextField(
                      onChanged: (value) =>
                          bloc.add(AuthRecoverAccountConfirmPasswordSet(value)),
                      controller: _confirmPasswordController,
                      hintText: l10n.newPasswordConfirm,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SpacerVertical(resizeByHeight(context, 16)),
                    RoundedButton(
                      onPressed: () =>
                          bloc.add(AuthRecoverAccountResetFormSubmit(context)),
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
