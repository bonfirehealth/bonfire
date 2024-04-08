// // Dart imports:
// import 'dart:isolate';

// // Project imports:
// import 'package:bonfirehealth/app/intelligence/intelligence.dart';

// class PulseModelInferenceService {
//   late PulseAiModel model;
//   late Function handler;
//   List<double>? inferenceResults;

//   Future<Map<String, dynamic>?> inference({
//     required IsolateHelper isolateUtils,
//     required Map<String, dynamic> params,
//   }) async {
//     final responsePort = ReceivePort();

//     isolateUtils.sendMessage(
//       handler: handler,
//       params: params,
//       sendPort: isolateUtils.sendPort,
//       responsePort: responsePort,
//     );

//     inferenceResults = await responsePort.first as List<double>?;
//     responsePort.close();
//     return null;
//   }

//   void setModelConfig() {
//     model = locator<PulseDetector>();
//     handler = runPulseDetector;
//   }
// }
