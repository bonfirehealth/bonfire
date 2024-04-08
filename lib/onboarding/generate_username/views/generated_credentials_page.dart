// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/onboarding/onboarding.dart';

part 'widgets/generated_credentials_header.dart';
part 'widgets/generated_credentials_card.dart';
part 'widgets/generated_credentials_skip_button.dart';

class GeneratedCredentialsPage extends StatelessWidget {
  const GeneratedCredentialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColourConstant.grey3E3E31.withOpacity(0.62),
      body: const SafeArea(
        top: false,
        bottom: false,
        minimum: EdgeInsets.symmetric(horizontal: 20),
        child: GeneratedCredentialsBody(),
      ),
    );
  }
}

class GeneratedCredentialsBody extends StatefulWidget {
  const GeneratedCredentialsBody({super.key});

  @override
  State<GeneratedCredentialsBody> createState() => _GeneratedCredentialsBodyState();
}

class _GeneratedCredentialsBodyState extends State<GeneratedCredentialsBody>
    with AfterLayoutMixin<GeneratedCredentialsBody> {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<AppBloc>().add(const AppIsLoadingSet(isLoading: false));
    context.read<GenerateUsernameBloc>().add(GenerateUsernameInitSet(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateUsernameBloc, GenerateUsernameState>(
      builder: (_, state) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                const SpacerVertical(64),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    GeneratedCredentialsHeader(),
                    GeneratedCredentialsCard(),
                    // GeneratedCredentialsSkipButton(),
                  ],
                ),
                const SpacerVertical(8),
              ],
            ),
          ),
        );
      },
    );
  }
}
