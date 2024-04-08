// // Package imports:
// import 'package:equatable/equatable.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

// // ignore: must_be_immutable
// abstract class PulseAiModel extends Equatable {
//   PulseAiModel({this.interpreter});

//   final outputShapes = <List<int>>[];
//   final outputTypes = <TfLiteType>[];

//   Interpreter? interpreter;

//   @override
//   List<Object> get props => [];

//   int get getAddress;

//   Future<void> loadModel();
//   List<double> calculate(List<List<double>> inputs, double fps);
// }
