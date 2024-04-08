part of '../questions_page.dart';

class QuestionsAppBar extends StatelessWidget {
  const QuestionsAppBar({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<QuestionsBloc>();
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      builder: (_, state) {
        if (state.showHeaderSearchBar) {
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top + 6,
            ),
            child: HeaderSearchBar(
              onBackPressed: () =>
                  bloc.add(const QuestionsShowHeaderSearchBarSet()),
              searchList: state.searchList ?? [],
              onSearchTextChanged: (String value) {
                bloc
                  ..add(QuestionsSearchTextSet(value))
                  ..add(QuestionsQuestionsSearch(groupId, value));
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
          title: BlocSelector<QuestionsBloc, QuestionsState, Group?>(
            selector: (state) => state.group,
            builder: (_, group) {
              if (group == null) {
                return const SizedBox.shrink();
              }
              return Text(
                group.name!,
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
          //         const QuestionsShowHeaderSearchBarSet(
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
