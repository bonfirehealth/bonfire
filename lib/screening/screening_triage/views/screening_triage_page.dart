// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/screening/screening.dart';

part 'widgets/close_button.dart';
part 'widgets/suggestion_card.dart';
part 'widgets/suggestions_header.dart';
part 'widgets/suggestions_page_view.dart';

class ScreeningTriagePage extends StatelessWidget {
  const ScreeningTriagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColourConstant.whiteF8F8F8,
      body: SafeArea(
        child: ScreeningTriageBody(),
      ),
    );
  }
}

class ScreeningTriageBody extends StatelessWidget {
  const ScreeningTriageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SuggestionsHeader(),
              SpacerVertical(16),
              SuggestionsPageView(),
            ],
          ),
        ),
        const CloseButton(),
      ],
    );
  }
}
