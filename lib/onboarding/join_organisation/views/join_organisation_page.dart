// Flutter imports:

// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/onboarding/onboarding.dart';

class JoinOrganisationPage extends StatelessWidget {
  const JoinOrganisationPage({
    super.key,
    @QueryParam('oc') this.organisationCode,
    @QueryParam('ot') this.organisationToken,
    @QueryParam('oui') this.organisationUserId,
  });

  final String? organisationCode;
  final String? organisationToken;
  final String? organisationUserId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JoinOrganisationBloc>(
      create: (_) => JoinOrganisationBloc(),
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: JoinOrganisationBody(
            organisationCode: organisationCode,
            organisationToken: organisationToken,
            organisationUserId: organisationUserId,
          ),
        ),
      ),
    );
  }
}

class JoinOrganisationBody extends StatefulWidget {
  const JoinOrganisationBody({
    super.key,
    this.organisationCode,
    this.organisationToken,
    this.organisationUserId,
  });

  final String? organisationCode;
  final String? organisationToken;
  final String? organisationUserId;

  @override
  State<JoinOrganisationBody> createState() => JoinOrganisationBodyState();
}

class JoinOrganisationBodyState extends State<JoinOrganisationBody>
    with AfterLayoutMixin<JoinOrganisationBody> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final bloc = context.read<JoinOrganisationBloc>();
    context.read<AppBloc>().add(const AppIsLoadingSet());
    if (widget.organisationCode != null) {
      bloc.add(JoinOrganisationOrganisationCodeSet(widget.organisationCode!));
    }
    if (widget.organisationUserId != null) {
      bloc.add(
        JoinOrganisationOrganisationUserIdSet(widget.organisationUserId!),
      );
    }
    if (widget.organisationToken != null) {
      bloc.add(
        JoinOrganisationOrganisationTokenSet(widget.organisationToken!),
      );
    }
    bloc.add(JoinOrganisationOrganisationByCodeAndTokenGet(context));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
    final bloc = context.read<JoinOrganisationBloc>();

    return BlocBuilder<JoinOrganisationBloc, JoinOrganisationState>(
      builder: (_, state) {
        if (state.organisation == null) {
          return const SizedBox.shrink();
        }
        return Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppImage.asset(
                            ImageConstant.alissaAvatar,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                    const SpacerVertical(32),
                    Text(
                      l10n.helloAlissa,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColourConstant.grey50535A,
                          ),
                    ),
                    const SpacerVertical(32),
                    Text(
                      l10n.helloAlissaSubtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColourConstant.grey50535A,
                          ),
                    ),
                  ],
                ),
                const SpacerVertical(64),
                RoundedButton(
                  onPressed: () =>
                      bloc.add(JoinOrganisationFormSubmit(context)),
                  title: l10n.getStarted,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                const SpacerVertical(8),
                TextButton(
                  onPressed: () => appBloc
                      .add(AppNextRoute(context, const AuthSignInRoute())),
                  child: Text(
                    l10n.alreadyHaveAccount,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            TextFooter(
              text2OnTap: () => onTermsOfServiceHTMLSelected(context),
              text1: '${l10n.bySigning1} ',
              text2: l10n.bySigning2,
              isText2Underlined: true,
            ),
            const LanguageSelector(buttonHeight: 30, fontSize: 12),
          ],
        );
      },
    );
  }
}
