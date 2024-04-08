// Package imports:
import 'package:camera/camera.dart';

class CameraHelper {
  CameraHelper._();

  static Future<CameraDescription> getCamera(
    CameraLensDirection cameraDirection,
  ) async {
    return availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == cameraDirection,
      ),
    );
  }
}
