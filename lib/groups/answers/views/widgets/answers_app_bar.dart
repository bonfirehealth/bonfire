part of '../answers_page.dart';

class AnswersAppBar extends StatelessWidget {
  const AnswersAppBar({
    super.key,
    required this.questionId,
  });

  final String questionId;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AnswersBloc>();
    return BlocBuilder<AnswersBloc, AnswersState>(
      builder: (_, state) {
        if (state.showHeaderSearchBar) {
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top + 6,
            ),
            child: HeaderSearchBar(
              onBackPressed: () =>
                  bloc.add(const AnswersShowHeaderSearchBarSet()),
              searchList: state.searchList ?? [],
              onSearchTextChanged: (String value) {
                bloc
                  ..add(AnswersSearchTextSet(value))
                  ..add(AnswersAnswersSearch(questionId, value));
              },
            ),
          );
        }

        return AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: Theme.of(context).iconTheme,
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
            color: AppColourConstant.whiteFFFFFF,
          ),
          centerTitle: false,
          title: BlocSelector<AnswersBloc, AnswersState, Question?>(
            selector: (state) => state.question,
            builder: (_, question) {
              if (question == null) {
                return const SizedBox.shrink();
              }
              return Text(
                question.name!,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColourConstant.whiteFFFFFF),
              );
            },
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       bloc.add(
          //         const AnswersShowHeaderSearchBarSet(
          //           showHeaderSearchBar: true,
          //         ),
          //       );
          //     },
          //     icon: AppImage.asset(ImageConstant.search),
          //   ),
          // ],
        );
      },
    );
  }
}
