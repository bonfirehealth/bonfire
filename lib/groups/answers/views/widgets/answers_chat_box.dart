part of '../answers_page.dart';

class AnswersChatBox extends StatelessWidget {
  const AnswersChatBox({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AnswersBloc>();
    return Positioned(
      bottom: 85,
      child: BlocSelector<AnswersBloc, AnswersState, List<AnswerFile>?>(
        selector: (state) => state.newAnswerFiles,
        builder: (_, newAnswerFiles) {
          if (newAnswerFiles == null) {
            return const SizedBox.shrink();
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: newAnswerFiles.length,
              itemBuilder: (BuildContext context, int index) {
                final file = newAnswerFiles[index];
                const isLocal = false;

                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.6,
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: isLocal
                            // ignore: dead_code
                            ? AppImage.asset(
                                file.url!,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              )
                            : CachedNetworkImage(
                                imageUrl: file.url!,
                                placeholder: (context, url) => SpinKitCircle(
                                  color: Theme.of(context).primaryColor,
                                ),
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColourConstant.pinkFF6188,
                        child: IconButton(
                          onPressed: () => bloc.add(
                            AnswersFileDelete(index, file.key!),
                          ),
                          icon: AppImage.asset(
                            ImageConstant.closeCross,
                            color: AppColourConstant.whiteFFFFFF,
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
