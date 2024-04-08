// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/auth/auth.dart';

class AuthSignInPage extends StatelessWidget {
  const AuthSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthSignInBloc>(
      create: (_) => AuthSignInBloc(),
      child: ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: const AuthSignInBody(),
      ),
    );
  }
}

class AuthSignInBody extends StatefulWidget {
  const AuthSignInBody({super.key});

  @override
  State<AuthSignInBody> createState() => _AuthSignInBodyState();
}

class _AuthSignInBodyState extends State<AuthSignInBody> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<AuthSignInBloc>();
    final appBloc = context.read<AppBloc>();

    return BlocBuilder<AuthSignInBloc, AuthSignInState>(
      builder: (_, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
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
                      l10n.signInTitle,
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
                        l10n.signInSubtitle,
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
                          bloc.add(AuthSignInEmailAddressSet(value)),
                      hintText: l10n.emailAddress,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SpacerVertical(resizeByHeight(context, 8)),
                    RoundedTextField(
                      onChanged: (value) =>
                          bloc.add(AuthSignInPasswordSet(value)),
                      hintText: l10n.password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SpacerVertical(resizeByHeight(context, 16)),
                    RoundedButton(
                      onPressed: () => bloc.add(AuthSignInFormSubmit(context)),
                      title: l10n.signIn,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    SpacerVertical(resizeByHeight(context, 8)),
                    TextButton(
                      onPressed: () => appBloc.add(
                        AppReplaceRoute(
                          context,
                          const AuthRecoverAccountRoute(),
                        ),
                      ),
                      child: Text(
                        l10n.recoverAccount,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextFooter(
                text2OnTap: () => onTermsOfServiceHTMLSelected(context),
                text1: '${l10n.bySigning1} ',
                text2: l10n.bySigning2,
                isText2Underlined: true,
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
