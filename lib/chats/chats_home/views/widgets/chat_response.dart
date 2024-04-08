part of '../chats_home_page.dart';

// class ChatResponse extends StatefulWidget {
//   const ChatResponse({super.key});

//   @override
//   State<ChatResponse> createState() => _ChatResponseState();
// }

// class _ChatResponseState extends State<ChatResponse> {
//   // OpenAPI params

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return BlocBuilder<ChatsHomeBloc, ChatsHomeState>(
//       builder: (_, state) {
//         return Container(
//           padding: const EdgeInsets.only(left: 20, right: 20),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: const BoxDecoration(
//                       color: AppColourConstant.blue1A56CF,
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(8),
//                       ),
//                     ),
//                     child: AutoSizeText(
//                       l10n.alissaSays,
//                       textAlign: TextAlign.left,
//                       style: Theme.of(context)
//                           .textTheme
//                           .labelSmall
//                           ?.copyWith(color: AppColourConstant.whiteFFFFFF),
//                       maxLines: 2,
//                     ),
//                   ),
//                 ],
//               ),
//               const SpacerVertical(4),
//               Container(
//                 padding: const EdgeInsets.all(16) -
//                     const EdgeInsets.only(bottom: 16),
//                 decoration: const BoxDecoration(
//                   color: AppColourConstant.whiteFFFFFF,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(20),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColourConstant.greyCDD5E0,
//                       blurRadius: 4,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   children: [
//                     _buildAnswer(context, state),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 l10n.poweredBy,
//                                 textAlign: TextAlign.left,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyMedium
//                                     ?.copyWith(
//                                       fontWeight: FontWeight.w300,
//                                       color: AppColourConstant.grey50535A,
//                                     ),
//                               ),
//                               const SpacerHorizontal(8),
//                               AppImage.asset(
//                                 ImageConstant.openaiLogo,
//                                 width: 90,
//                                 height: 90,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             context.read<ChatsHomeBloc>().add(
//                                   ChatsHomeSaveToggleSet(
//                                     isSaved: !(state.isSaved ?? false),
//                                   ),
//                                 );
//                             context.read<ChatsHomeBloc>().add(
//                                   ChatsHomeSaveSet(
//                                     answerStr: state.answerStr ?? '',
//                                     questionStr: state.questionStr ?? '',
//                                     isSaved: !(state.isSaved ?? false),
//                                     question: state.question,
//                                     answer: state.answer,
//                                     questionSave: state.questionSave,
//                                   ),
//                                 );
//                           },
//                           child: Column(
//                             children: [
//                               AppImage.asset(
//                                 state.isSaved ?? false
//                                     ? ImageConstant.save
//                                     : ImageConstant.saveOutline,
//                               ),
//                               // AutoSizeText(
//                               //   l10n.save,
//                               //   style: Theme.of(context).textTheme.labelLarge,
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SpacerVertical(14),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildAnswer(BuildContext context, ChatsHomeState state) {
//     final l10n = context.l10n;
//     if (state.status == ChatsHomeStatus.done) {
//       return Column(
//         children: [
//           AutoSizeText(
//             state.answerStr!,
//             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   color: AppColourConstant.blue1A56CF,
//                 ),
//           ),
//         ],
//       );
//     } else {
//       return FutureBuilder<ChatResponseResult>(
//         builder: (ctx, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             if (snapshot.hasError) {
//               return Text(
//                 l10n.chatResponseSystemErrorMessage,
//               );
//             } else if (snapshot.hasData) {
//               final data = snapshot.data;
//               if (data!.success) {
//                 context.read<ChatsHomeBloc>().add(
//                       ChatsHomeResponseSuccessSet(
//                         answerStr: data.answer,
//                       ),
//                     );
//                 return const Center(
//                   child: SpinKitCircle(
//                     color: AppColourConstant.whiteFFFFFF,
//                   ),
//                 );
//               } else {
//                 if (data.flagged) {
//                   return AutoSizeText(
//                     l10n.chatResponseViolateQuestionMessage,
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           color: AppColourConstant.blue1A56CF,
//                         ),
//                   );
//                 }

//                 if (data.isEmptyQuestion) {
//                   return AutoSizeText(
//                     l10n.chatResponseQuestionEmptyMessage,
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           color: AppColourConstant.blue1A56CF,
//                         ),
//                   );
//                 }
//                 return AutoSizeText(
//                   '',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         color: AppColourConstant.blue1A56CF,
//                       ),
//                 );
//               }
//             } else {
//               return Text(
//                 l10n.chatResponseSystemErrorMessage,
//               );
//             }
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//         // future: fetchAnswer(http.Client(), state.questionStr),
//       );
//     }
//   }
// }
