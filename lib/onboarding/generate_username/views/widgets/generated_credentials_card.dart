part of '../generated_credentials_page.dart';

class GeneratedCredentialsCard extends StatefulWidget {
  const GeneratedCredentialsCard({super.key});

  @override
  State<GeneratedCredentialsCard> createState() => _GeneratedCredentialsCardState();
}

class _GeneratedCredentialsCardState extends State<GeneratedCredentialsCard> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
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
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        );

    return BlocBuilder<GenerateUsernameBloc, GenerateUsernameState>(
      builder: (_, state) {
        return Column(
          children: [
            if (state.password != null && state.recoveryCodes != null)
              Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 13,
                        right: 13,
                        top: 30,
                        bottom: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Expanded(
                          //           child: Row(
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: [
                          //               AutoSizeText(
                          //                 '${l10n.password}: ',
                          //                 textAlign: TextAlign.left,
                          //                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          //                       fontWeight: FontWeight.bold,
                          //                       color: AppColourConstant.grey50535A,
                          //                     ),
                          //               ),
                          //               AutoSizeText(
                          //                 partialObscureText(
                          //                   state.password ?? '',
                          //                 ),
                          //                 textAlign: TextAlign.left,
                          //                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          //                       letterSpacing: 0.5,
                          //                     ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.end,
                          //           children: [
                          //             IconButton(
                          //               onPressed: () => bloc.add(
                          //                 GenerateUsernameCredentialsClipboardCopy(
                          //                   context,
                          //                 ),
                          //               ),
                          //               icon: const Icon(
                          //                 FontAwesomeIcons.copy,
                          //                 size: 16,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          // const SpacerVertical(8),
                          // if (state.recoveryCodes != null)
                          //   Row(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       SelectableText(
                          //         '${l10n.recoveryCodes}: ',
                          //         textAlign: TextAlign.left,
                          //         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          //               fontWeight: FontWeight.bold,
                          //               color: AppColourConstant.grey50535A,
                          //             ),
                          //       ),
                          //       SelectableText(
                          //         partialObscureTextList(
                          //           context,
                          //           state.recoveryCodes ?? [],
                          //         ),
                          //         textAlign: TextAlign.left,
                          //         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          //               letterSpacing: 0.5,
                          //             ),
                          //       ),
                          //     ],
                          //   ),
                          TimelineTile(
                            isFirst: true,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.1,
                            indicatorStyle: const IndicatorStyle(
                              width: 40,
                              height: 40,
                              indicator: Icon(
                                Icons.check_circle,
                                size: 32,
                                color: AppColourConstant.green00A25D,
                              ),
                              drawGap: true,
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22),
                              child: Text(
                                l10n.generateCredentialsStepTitle1,
                                style: titleStyle,
                              ),
                            ),
                          ),
                          TimelineTile(
                            alignment: TimelineAlign.manual,
                            lineXY: 0.1,
                            indicatorStyle: const IndicatorStyle(
                              width: 40,
                              height: 40,
                              indicator: Icon(
                                Icons.check_circle,
                                size: 32,
                                color: AppColourConstant.green00A25D,
                              ),
                              drawGap: true,
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22),
                              child: Text(
                                l10n.generateCredentialsStepTitle2,
                                style: titleStyle,
                              ),
                            ),
                          ),
                          TimelineTile(
                            isLast: true,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.1,
                            indicatorStyle: IndicatorStyle(
                              width: 40,
                              height: 40,
                              indicator: Icon(
                                Icons.check_circle,
                                size: 32,
                                color: state.isSecretCredentialsSent
                                    ? AppColourConstant.green00A25D
                                    : AppColourConstant.greyCDD5E0,
                              ),
                              drawGap: true,
                            ),
                            endChild: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22),
                              child: Text(
                                l10n.generateCredentialsStepTitle3,
                                style: state.isSecretCredentialsSent
                                    ? titleStyle
                                    : titleStyle?.copyWith(
                                        color: AppColourConstant.greyCDD5E0,
                                      ),
                              ),
                            ),
                          ),
                          if (!state.isSecretCredentialsSent) ...[
                            const SpacerVertical(32),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: RoundedTextField(
                                controller: _controller,
                                onChanged: (value) => bloc.add(
                                  GenerateUsernamePersonalEmailAddressSet(
                                    value,
                                  ),
                                ),
                                verticalPadding: 20,
                                hintText: l10n.yourEmail,
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            const SpacerVertical(16),
                            RoundedButton(
                              onPressed: state.personalEmailAddress != '' && state.personalEmailAddress != null
                                  ? () => bloc
                                    ..add(const GenerateUsernameIsLoadingSet())
                                    ..add(
                                      GenerateUsernameGeneratedCredentialsSend(
                                        context,
                                      ),
                                    )
                                  : null,
                              title: l10n.sendMe,
                              backgroundColor: Theme.of(context).primaryColor,
                              isLoading: state.isLoading,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
