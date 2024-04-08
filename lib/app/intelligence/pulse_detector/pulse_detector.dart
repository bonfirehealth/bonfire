// // ignore: must_be_immutable

// // Flutter imports:
// import 'package:flutter/foundation.dart';

// // Package imports:
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

// // Project imports:
// import 'package:bonfirehealth/app/intelligence/calculations.dart';
// import 'package:bonfirehealth/app/intelligence/pulse_detector/helpers/helpers.dart';
// import 'package:bonfirehealth/app/intelligence/pulse_detector/models/models.dart';

// // ignore: must_be_immutable
// class PulseDetector extends PulseAiModel {
//   PulseDetector({this.interpreter}) {
//     loadModel();
//   }

//   final int inputSize = 128;
//   final double threshold = 0.7;

//   @override
//   // ignore: overridden_fields
//   Interpreter? interpreter;

//   @override
//   List<Object> get props => [];

//   @override
//   int get getAddress => interpreter!.address;

//   @override
//   Future<void> loadModel() async {
//     final interpreterOptions = InterpreterOptions();

//     // ignore: cascade_invocations
//     interpreterOptions.threads = 4;
//     interpreter = interpreter ??
//         await Interpreter.fromAsset(
//           'models/mtts_can_bs101.tflite',
//           options: interpreterOptions,
//         );

//       logInfo('💙 Interpreter Created Successfully');

//     final outputTensors = interpreter?.getOutputTensors();

//     outputTensors?.forEach((tensor) {
//       outputShapes.add(tensor.shape);
//       outputTypes.add(tensor.type);
//     });
//   }

//   @override
//   List<double> calculate(List<List<double>?> inputs, double fps) {
//     final output =
//         TensorBuffer.createFixedSize(outputShapes[0], outputTypes[0]);
//     interpreter?.run(inputs, _output.buffer);

//     // Detrend the pulse predictions
//     var pulsePred = _output.getDoubleList();
//     final ba = butter([0.75 / fps * 2, 2.5 / fps * 2]);

//     pulsePred = filtfilt(ba[0], ba[1], pulsePred);
//     final peakIndices = findPeaksByDistance(pulsePred);

//     final reading = Calculations.calculate(peakIndices, fps);
//       logInfo('💙 reading: $reading');
//       logInfo('💙 peakIndices: ${peakIndices.length}');

//     return reading;
//   }
// }

// List<double> runPulseDetector(Map<String, dynamic> params) {
//   final pulseDetector = PulseDetector(
//     interpreter: Interpreter.fromAddress(params['address'] as int),
//   );

//   final result = pulseDetector.calculate(
//     params['inputs'] as List<List<double>?>,
//     params['fps'] as double,
//   );

//   return result;
// }
