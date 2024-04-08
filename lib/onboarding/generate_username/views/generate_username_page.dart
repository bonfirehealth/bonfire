// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/onboarding/onboarding.dart';

class GenerateUsernamePage extends StatelessWidget {
  const GenerateUsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: GenerateUsernameBody(),
      ),
    );
  }
}

class GenerateUsernameBody extends StatefulWidget {
  const GenerateUsernameBody({super.key});

  @override
  State<GenerateUsernameBody> createState() => _GenerateUsernameBodyState();
}

class _GenerateUsernameBodyState extends State<GenerateUsernameBody>
    with AfterLayoutMixin<GenerateUsernameBody> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<GenerateUsernameBloc>()
      ..add(GenerateUsernameInitSet(context))
      ..add(GenerateUsernameUsernameGenerate(_controller));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<GenerateUsernameBloc>();
    final domainName = AppConstant.emailDomainUrl;

    return BlocBuilder<GenerateUsernameBloc, GenerateUsernameState>(
      builder: (_, state) {
        return Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppImage.asset(
                        ImageConstant.anonymousAvatar,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ],
                ),
                const SpacerVertical(32),
                SizedBox(
                  width: 200,
                  child: Text(
                    l10n.goAnonymous,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColourConstant.grey50535A,
                        ),
                  ),
                ),
                const SpacerVertical(32),
                Text(
                  l10n.setGoAnonymousSubtitle(
                    '${state.organisationName}',
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColourConstant.grey50535A,
                      ),
                ),
                const SpacerVertical(32),
                RoundedTextField(
                  controller: _controller,
                  onChanged: (value) =>
                      bloc.add(GenerateUsernameUsernameSet(value)),
                  hintText: l10n.enterUniqueUsername,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      top: PlatformHelper.isMobile() ? 16 : 8,
                      right: 16,
                    ),
                    child: Text(
                      '@$domainName',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      bloc.add(GenerateUsernameUsernameGenerate(_controller)),
                  child: Text(
                    l10n.generateAnotherUsername,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
                const SpacerVertical(16),
                RoundedButton(
                  onPressed: () =>
                      state.username != '' && state.username != null
                          ? bloc.add(GenerateUsernameFormSubmit(context))
                          : null,
                  title: l10n.next,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
