// Package imports:
// ignore_for_file: cascade_invocations

// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
// import 'package:bonfirehealth/app/intelligence/pulse_detector/pulse_detector.dart';
// import 'package:bonfirehealth/app/intelligence/pulse_detector/pulse_model_inference_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // locator.registerSingleton<PulseDetector>(PulseDetector());

  // locator.registerLazySingleton<PulseModelInferenceService>(
  //   // ignore: unnecessary_lambdas
  //   () => PulseModelInferenceService(),
  // );
}
