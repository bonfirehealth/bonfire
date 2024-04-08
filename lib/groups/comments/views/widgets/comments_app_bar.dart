part of '../comments_page.dart';

class CommentsAppBar extends StatelessWidget {
  const CommentsAppBar({
    super.key,
    required this.answerId,
  });

  final String answerId;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CommentsBloc>();
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (_, state) {
        if (state.showHeaderSearchBar) {
          return Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top + 6,
            ),
            child: HeaderSearchBar(
              onBackPressed: () =>
                  bloc.add(const CommentsShowHeaderSearchBarSet()),
              searchList: state.searchList ?? [],
              onSearchTextChanged: (String value) {
                bloc
                  ..add(CommentsSearchTextSet(value))
                  ..add(CommentsCommentsSearch(answerId, value));
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
          title: BlocSelector<CommentsBloc, CommentsState, Answer?>(
            selector: (state) => state.answer,
            builder: (_, answer) {
              if (answer == null) {
                return const SizedBox.shrink();
              }
              return Text(
                answer.name!,
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
          //         const CommentsShowHeaderSearchBarSet(
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
