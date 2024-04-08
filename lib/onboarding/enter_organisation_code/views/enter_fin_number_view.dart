// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/onboarding/enter_organisation_code/blocs/enter_organisation_code_bloc.dart';

class EnterFinNumberView extends StatefulWidget {
  const EnterFinNumberView({super.key, this.organisationCode});

  final String? organisationCode;

  @override
  State<EnterFinNumberView> createState() =>
      EnterFinNumberViewState();
}

class EnterFinNumberViewState extends State<EnterFinNumberView>
    with AfterLayoutMixin<EnterFinNumberView> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<EnterOrganisationCodeBloc>();
    
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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColourConstant.grey50535A,
                      ),
                ),
              ],
            ),
            const SpacerVertical(32),
            RoundedTextField(
              controller: _controller,
              onChanged: (value) =>
                  bloc.add(EnterOrganisationCodeFinNumberSet(value)),
              hintText: l10n.enterYourFinNumber,
            ),
            const SpacerVertical(16),
            RoundedButton(
              onPressed: () =>
                  bloc.add(EnterOrganisationCodeFinNumberSubmit(context)),
              title: l10n.login,
              backgroundColor: Theme.of(context).primaryColor,
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
  }
}
