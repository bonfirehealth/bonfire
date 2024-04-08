// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/organisation/organisation.dart';

class OrganisationSignInPage extends StatelessWidget {
  const OrganisationSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrganisationSignInBloc>(
      create: (_) => OrganisationSignInBloc(),
      child: const Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.all(20),
          child: OrganisationSignInBody(),
        ),
      ),
    );
  }
}

class OrganisationSignInBody extends StatelessWidget {
  const OrganisationSignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<OrganisationSignInBloc>();

    return BlocBuilder<OrganisationSignInBloc, OrganisationSignInState>(
      builder: (_, state) {
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
                      l10n.loginTitle,
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
                        l10n.loginSubtitle,
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
                          bloc.add(OrganisationSignInEmailAddressSet(value)),
                      hintText: l10n.emailAddress,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SpacerVertical(resizeByHeight(context, 8)),
                    RoundedTextField(
                      onChanged: (value) =>
                          bloc.add(OrganisationSignInPasswordSet(value)),
                      hintText: l10n.password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SpacerVertical(resizeByHeight(context, 16)),
                    RoundedButton(
                      onPressed: () =>
                          bloc.add(OrganisationSignInFormSubmit(context)),
                      title: l10n.login,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    SpacerVertical(resizeByHeight(context, 8)),
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
