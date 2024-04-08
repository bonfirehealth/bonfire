// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:bonfirehealth/global.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/onboarding/enter_organisation_code/views/enter_fin_number_view.dart';
import 'package:bonfirehealth/onboarding/enter_organisation_code/views/search_department_view.dart';
import 'package:bonfirehealth/onboarding/onboarding.dart';
import 'package:bonfirehealth/onboarding/search_your_department/views/search_department_code_page.dart';

class EnterOrganisationCodePage extends StatelessWidget {
  const EnterOrganisationCodePage({
    super.key,
    @QueryParam('oc') this.organisationCode,
  });

  final String? organisationCode;

  Map<String, String?> getUtmParameters() {
    final uri = Uri.parse(html.window.location.href);

    final fragment = uri.fragment;

    if (fragment.isNotEmpty) {
      final fragmentUri = Uri.parse('?$fragment');
      final params = <String, String?>{
        'utm_source': fragmentUri.queryParameters['utm_source'],
        // add other UTM parameters here
      };
      return params;
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    print(getUtmParameters()); //todo: send this to mixpanel later
    final useFinNumer = organisationCode?.contains('zhengkeng-3B5pMy') ?? false;
    isTrialCustomer = useFinNumer;
    final showDepartmentSearchView = organisationCode?.contains('nus-81066E09') ?? false;

    return BlocProvider<EnterOrganisationCodeBloc>(
      create: (_) => EnterOrganisationCodeBloc(),
      child: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: useFinNumer
              ? EnterFinNumberView(organisationCode: organisationCode)
              : showDepartmentSearchView
                  ? SearchDepartmentCodePage(
                      organisationCode: organisationCode ?? '',
                    )
                  : EnterOrganisationCodeBody(organisationCode: organisationCode),
        ),
      ),
    );
  }
}

class EnterOrganisationCodeBody extends StatefulWidget {
  const EnterOrganisationCodeBody({super.key, this.organisationCode});

  final String? organisationCode;

  @override
  State<EnterOrganisationCodeBody> createState() => EnterOrganisationCodeBodyState();
}

class EnterOrganisationCodeBodyState extends State<EnterOrganisationCodeBody>
    with AfterLayoutMixin<EnterOrganisationCodeBody> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.organisationCode != null) {
      context.read<EnterOrganisationCodeBloc>().add(
            EnterOrganisationCodeOrganisationCodeSet(widget.organisationCode!),
          );
      _controller.text = widget.organisationCode!;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appBloc = context.read<AppBloc>();
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
              onChanged: (value) => bloc.add(EnterOrganisationCodeOrganisationCodeSet(value)),
              hintText: l10n.enterOrganisationCode,
            ),
            const SpacerVertical(16),
            RoundedButton(
              onPressed: () => bloc.add(EnterOrganisationCodeFormSubmit(context)),
              title: l10n.getStarted,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            const SpacerVertical(8),
            TextButton(
              onPressed: () => appBloc.add(AppNextRoute(context, const AuthSignInRoute())),
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
  }
}
