part of '../chats_home_page.dart';

class ChatPrompt extends StatefulWidget {
  const ChatPrompt({super.key});

  @override
  State<ChatPrompt> createState() => _ChatPromptState();
}

class _ChatPromptState extends State<ChatPrompt> {
  TextEditingController? controller;

  @override
  void initState() {
    controller = TextEditingController(
      text: '',
    );
    super.initState();
  }

  bool activeSendButton = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsHomeBloc, ChatsHomeState>(builder: (_, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (state.status == ChatsHomeStatus.asked)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 8),
                  child: Assets.images.logoTransparent.image(
                    height: 32,
                    width: 32,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 40,
                  width: 100,
                  child: const LoadingIndicator(
                      indicatorType: Indicator.ballPulseSync,
                      colors: [
                        Color(0xFFbdd5d2),
                        Color(0xFF527499),
                      ],
                      backgroundColor: AppColourConstant.whiteFFFFFF,
                      pathBackgroundColor: AppColourConstant.whiteFFFFFF),
                ),
              ],
            ),
          const SizedBox(height: 100),
          Container(
            color: AppColourConstant.textFieldGreyFillF4F4F8,
            padding: EdgeInsets.symmetric(
              horizontal: resizeByWidth(context, 20),
              vertical: resizeByHeight(context, 20),
            ),
            child: RoundedTextField(
              onChanged: (String value) {
                setState(() {
                  activeSendButton = value.isNotEmpty;
                });
              },
              controller: controller,
              hintText: "Ask a question...",
              minLines: 1,
              maxLines: 4,
              verticalPadding: 22,
              inputFormatters: [LengthLimitingTextInputFormatter(1000)],
              borderColor: AppColourConstant.greyE0E0E0,
              suffixIcon: IconButton(
                onPressed: (state.status == ChatsHomeStatus.asked || !activeSendButton)
                    ? null
                    : () {
                        context.read<ChatsHomeBloc>().add(
                              ChatsHomeAskSet(
                                context: context,
                                questionStr: controller!.text,
                              ),
                            );
                        setState(() {
                          controller?.clear();
                          activeSendButton = false;
                        });
                      },
                color: AppColourConstant.blue008CD6,
                icon: const Icon(
                  FeatherIcons.send,
                  size: 26,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
