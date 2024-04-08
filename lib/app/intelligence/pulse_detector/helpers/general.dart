// Dart imports:
import 'dart:typed_data';

// Package imports:
import 'package:camera/camera.dart';
import 'package:image/image.dart' as imglib;

// Project imports:
import 'package:bonfirehealth/app/helpers/helpers.dart';

Float32List imageToFloat32List(imglib.Image image) {
  final convertedBytes = Float32List(1 * image.height * image.width * 3);
  final buffer = Float32List.view(convertedBytes.buffer);
  var pixelIndex = 0;
  for (var i = 0; i < image.height; i++) {
    for (var j = 0; j < image.width; j++) {
      final pixel = image.getPixel(j, i);
      buffer[pixelIndex++] = imglib.getRed(pixel).toDouble();
      buffer[pixelIndex++] = imglib.getGreen(pixel).toDouble();
      buffer[pixelIndex++] = imglib.getBlue(pixel).toDouble();
    }
  }
  return convertedBytes.buffer.asFloat32List();
}

List<int> imageToList(imglib.Image image) {
  final convertedBytes = Int32List(1 * image.height * image.width * 3);
  final buffer = Int32List.view(convertedBytes.buffer);
  var pixelIndex = 0;
  for (var i = 0; i < image.height; i++) {
    for (var j = 0; j < image.width; j++) {
      final pixel = image.getPixel(j, i);
      buffer[pixelIndex++] = imglib.getRed(pixel);
      buffer[pixelIndex++] = imglib.getGreen(pixel);
      buffer[pixelIndex++] = imglib.getBlue(pixel);
    }
  }
  return convertedBytes.buffer.asInt32List();
}

imglib.Image convertCameraImage(
  CameraImage image,
  CameraLensDirection direction,
) {
  imglib.Image? img;
  try {
    if (image.format.group == ImageFormatGroup.yuv420) {
      img = _convertYUV420(image, direction);
    } else if (image.format.group == ImageFormatGroup.bgra8888) {
      img = _convertBGRA8888(image, direction);
    }
  } catch (e) {
    logInfo('💙 ERROR:$e');
  }
  return img!;
}

imglib.Image _convertBGRA8888(
  CameraImage image,
  CameraLensDirection direction,
) {
  final img = imglib.Image.fromBytes(
    image.width,
    image.height,
    image.planes[0].bytes,
    format: imglib.Format.bgra,
  );

  //var img1 = (_direction == CameraLensDirection.front)
  //    ? imglib.copyRotate(img, -90)
  //    : imglib.copyRotate(img, 90);
  return img;
}

imglib.Image _convertYUV420(CameraImage image, CameraLensDirection direction) {
  final width = image.width;
  final height = image.height;
  final img = imglib.Image(width, height);
  const hexFF = 0xFF000000;
  final uvyButtonStride = image.planes[1].bytesPerRow;
  final uvPixelStride = image.planes[1].bytesPerPixel;
  for (var x = 0; x < width; x++) {
    for (var y = 0; y < height; y++) {
      final uvIndex =
          uvPixelStride! * (x / 2).floor() + uvyButtonStride * (y / 2).floor();
      final index = y * width + x;
      final yp = image.planes[0].bytes[index];
      final up = image.planes[1].bytes[uvIndex];
      final vp = image.planes[2].bytes[uvIndex];
      final r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
      final g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
          .round()
          .clamp(0, 255);
      final b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);
      img.data[index] = hexFF | (b << 16) | (g << 8) | r;
    }
  }
  final img1 = (direction == CameraLensDirection.front)
      ? imglib.copyRotate(img, -90)
      : imglib.copyRotate(img, 90);
  return img1;
}
