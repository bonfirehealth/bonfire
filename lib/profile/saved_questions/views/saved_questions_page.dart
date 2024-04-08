// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';
import 'package:bonfirehealth/profile/profile.dart';

part 'widgets/saved_questions_app_bar.dart';
part 'widgets/saved_questions_list_view.dart';

class SavedQuestionsPage extends StatelessWidget {
  const SavedQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SavedQuestionsAppBar(),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: SavedQuestionsBody(),
      ),
    );
  }
}

class SavedQuestionsBody extends StatefulWidget {
  const SavedQuestionsBody({super.key});

  @override
  State<SavedQuestionsBody> createState() => _SavedQuestionsBodyState();
}

class _SavedQuestionsBodyState extends State<SavedQuestionsBody>
    with AfterLayoutMixin<SavedQuestionsBody> {
  @override
  void afterFirstLayout(BuildContext context) {
    context
        .read<SavedQuestionsBloc>()
        .add(const SavedQuestionsQuestionSavesAllGet());
  }

  @override
  Widget build(BuildContext context) {
    return const SavedQuestionsListView();
  }
}
