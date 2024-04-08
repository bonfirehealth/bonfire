part of '../saved_questions_page.dart';

class SavedQuestionsAppBar extends StatelessWidget {
  const SavedQuestionsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.router.pop(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColourConstant.grey50535A.withOpacity(0.3),
            ),
          ),
          Text(
            l10n.mySavedQuestions,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
