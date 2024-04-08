// Dart imports:
import 'dart:typed_data';
import 'dart:ui';

// Package imports:
import 'package:camera/camera.dart';
import 'package:image/image.dart' as image_lib;

/// ImageUtils
class ImageUtils {
  static List<dynamic> cropImage(CameraImage cameraImage, Rect cropRect) {
    if (cameraImage.format.group == ImageFormatGroup.yuv420) {
      final stopwatch = Stopwatch();
      // ignore: cascade_invocations
      stopwatch.start();

      final planes = _cropYUV420(
        cameraImage,
        cropRect,
      );
      stopwatch.stop();
      // logInfo(
      //     '💙=== _crop yuv time: ${stopwatch.elapsedMilliseconds}ms');
      // ignore: cascade_invocations
      stopwatch.start();
      final ret = _convertYUV420ToRGBImageBytesList(
        planes[0],
        planes[1],
        planes[2],
        // cameraImage.planes[1].bytesPerRow,
        (cropRect.width.toInt() / 2.0).ceil(),
        // cameraImage.planes[1].bytesPerPixel!,
        1,
        cropRect.width.toInt(),
        cropRect.height.toInt(),
      );
      stopwatch.stop();
      // logInfo(
      //     '💙== to image bytes list time: ${stopwatch.elapsedMilliseconds}');
      return ret;
    } else {
      final croppedImageBytes = _cropBGRA8888(cameraImage, cropRect);
      final image = _convertRGBAToImage(
        croppedImageBytes,
        cropRect.width.toInt(),
        cropRect.height.toInt(),
      );
      return <image_lib.Image>[image];
    }
  }
  // /// Converts a [CameraImage] in YUV420 format to [Image] in RGB format
  // static image_lib.Image? convertCameraImage(CameraImage cameraImage) {
  //   if (cameraImage.format.group == ImageFormatGroup.yuv420) {
  //     return convertYUV420ToImage(cameraImage);
  //   } else if (cameraImage.format.group == ImageFormatGroup.bgra8888) {
  //     return convertBGRA8888ToImage(cameraImage);
  //   } else {
  //     return null;
  //   }
  // }

  static Uint8List _cropBGRA8888(CameraImage cameraImage, Rect cropRect) {
    final cropRectWidth = cropRect.width.toInt();
    final cropRectHeight = cropRect.height.toInt();
    final cropRectTop = cropRect.top.toInt();
    final cropRectLeft = cropRect.left.toInt();

    // Crop
    final imgWidth = cameraImage.planes[0].width ?? 0;
    final bytes = cameraImage.planes[0].bytes;
    final croppedImageBytes = Uint8List(cropRectWidth * cropRectHeight * 4);
    // logInfo("cropRectWidth: $cropRectWidth cropRectHeight: ${cameraImage.planes[0].bytesPerRow} imgWidth: $imgWidth bytes: ${bytes.length} croppedImageBytes: ${croppedImageBytes.length}");
    for (var i = 0; i < cropRectHeight; i++) {
      // var imgPos =
      //     4 * (cropRectTop + i) * imgWidth + cropRectLeft; // 4 each pixel
      final imgPos = 4 * (cropRectTop + i) * imgWidth + 4 * cropRectLeft;
      final croppedImgPos = 4 * i * cropRectWidth;
      List.copyRange(
        croppedImageBytes,
        croppedImgPos,
        bytes,
        imgPos,
        imgPos + cropRectWidth * 4,
      );
    }

    for (var i = 0; i < cropRectWidth * cropRectHeight; i += 4) {
      final tmp = croppedImageBytes[i];
      croppedImageBytes[i] = croppedImageBytes[i + 2];
      croppedImageBytes[i + 2] = tmp;
    }
    return croppedImageBytes;
    // final rgbaBytes = Uint8List(cropRectWidth * cropRectHeight * 4);
    // for (var i = 0; i < cropRectWidth * cropRectHeight; i++) {
    //   logInfo("index : $i");
    //   var srcPixel = croppedImageBytes.sublist(i * 4, (i + 1) * 4);
    //   logInfo("srcPixel : ${srcPixel.length}");
    //   // Swap r and b
    //   final tmp = srcPixel[0];
    //   srcPixel[0] = srcPixel[2];
    //   srcPixel[2] = tmp;
    //   List.copyRange(rgbaBytes, i * 4, srcPixel, 0, 4);
    // }
    // return rgbaBytes;
  }

  // /// Converts a [CameraImage] in BGRA888 format to [Image] in RGB format
  static image_lib.Image _convertRGBAToImage(
    Uint8List bytes,
    int width,
    int height,
  ) {
    final img = image_lib.Image.fromBytes(
      width,
      height,
      bytes,
    );
    return img;
  }

  static List<Uint8List> _cropYUV420(CameraImage cameraImage, Rect cropRect) {
    if (cameraImage.planes[1].bytesPerPixel == 1) {
      return _cropYUVTriPlanar(cameraImage, cropRect);
    } else if (cameraImage.planes[1].bytesPerPixel == 2) {
      return _cropYUVBiPlanar(cameraImage, cropRect);
    } else {
      // return _cropYUVBiPlanar(cameraImage, cropRect);
      throw Exception('Not supported format');
    }
  }

  static List<Uint8List> _cropYUVTriPlanar(
    CameraImage cameraImage,
    Rect cropRect,
  ) {
    final plane0 = cameraImage.planes[0].bytes;
    final plane1 = cameraImage.planes[1].bytes;
    final plane2 = cameraImage.planes[2].bytes;
    final imgWidth = cameraImage.width;

    // 1.5 mean 1.0 for Y and 0.25 each for U and V
    final cropRectWidth = cropRect.width.toInt();
    final cropRectHeight = cropRect.height.toInt();
    var cropRectTop = cropRect.top.toInt();
    var cropRectLeft = cropRect.left.toInt();
    if (cropRectLeft.isOdd) {
      cropRectLeft -= 1;
    }
    if (cropRectTop.isOdd) {
      cropRectTop -= 1;
    }

    // var croppedImgSize = (cropRectWidth * cropRectHeight * 1.5).floor();
    // var croppedImg = List<int>.filled(croppedImgSize, 0);
    final yPlaneSize = cropRectWidth * cropRectHeight;
    final uPlaneHeight = (cropRectHeight / 2.0).ceil();
    final uPlaneWidth = (cropRectWidth / 2.0).ceil();
    final uPlaneSize = uPlaneWidth * uPlaneHeight;
    final vPlaneHeight = (cropRectHeight / 2.0).ceil();
    final vPlaneWidth = (cropRectWidth / 2.0).ceil();
    final vPlaneSize = vPlaneWidth * vPlaneHeight;
    // final bytes = Uint8List(croppedImgYPlaneSize + uPlaneSize + vPlaneSize);

    // Start points of UV plane
    // var imgYPlaneSize = (src.length / 1.5).ceil();
    // final imgYPlaneSize = plane0.length;

    // Y plane copy
    final outPlane0 = Uint8List(yPlaneSize);
    for (var i = 0; i < cropRectHeight; i++) {
      final imgPos = (cropRectTop + i) * imgWidth + cropRectLeft;
      final croppedImgPos = i * cropRectWidth;
      // System.arraycopy(img, imgPos, croppedImg, croppedImgPos, cropRect.width());
      // List.copyRange(
      //   croppedImg,
      //   croppedImgPos,
      //   src,
      //   imgPos,
      //   imgPos + cropRectWidth,
      // );
      // bytes.putUint8List(plane0.sublist(imgPos, imgPos + cropRectWidth));
      List.copyRange(
        outPlane0,
        croppedImgPos,
        plane0,
        imgPos,
        imgPos + cropRectWidth,
      );
    }

    // U plane copy
    final outPlane1 = Uint8List(uPlaneSize);
    for (var i = 0; i < uPlaneHeight; i++) {
      final imgPos =
          (cropRectTop ~/ 2 + i) * (imgWidth ~/ 2) + (cropRectLeft ~/ 2);
      final croppedImgPos = i * uPlaneWidth;
      // System.arraycopy(
      //     img, imgPos, croppedImg, croppedImgPos, cropRect.width());
      // List.copyRange(
      //   croppedImg,
      //   croppedImgPos,
      //   src,
      //   imgPos,
      //   imgPos + cropRectWidth,
      // );

      // bytes.putUint8List(plane1.sublist(imgPos, imgPos + uPlaneWidth));
      List.copyRange(
        outPlane1,
        croppedImgPos,
        plane1,
        imgPos,
        imgPos + uPlaneWidth,
      );
    }

    // V plane copy
    final outPlane2 = Uint8List(vPlaneSize);
    for (var i = 0; i < vPlaneHeight; i++) {
      // logInfo('💙==== $i $yPlaneHeight ${plane2.length}');
      final imgPos =
          (cropRectTop ~/ 2 + i) * (imgWidth ~/ 2) + (cropRectLeft ~/ 2);

      // bytes.putUint8List(plane2.sublist(imgPos, imgPos + yPlaneWidth));

      // var croppedImgPos = croppedImgYPlaneSize + uPlaneSize + (i * vPlaneWidth);
      final croppedImgPos = i * vPlaneWidth;
      // logInfo(
      //     '======= imgPos $imgPos crop Pos $croppedImgPos width $cropRectWidth bytes size ${bytes.length} $croppedImgYPlaneSize $uPlaneSize');
      List.copyRange(
        outPlane2,
        croppedImgPos,
        plane2,
        imgPos,
        imgPos + vPlaneWidth,
      );
    }
    // logInfo('============== ok');
    // final retPlane0 = bytes.sublist(0, croppedImgYPlaneSize);
    // final retPlane1 =
    //     bytes.sublist(croppedImgYPlaneSize, croppedImgYPlaneSize + uPlaneSize);
    // final retPlane2 = bytes.sublist(croppedImgYPlaneSize + uPlaneSize);

    // final planes = bytes.done().buffer.asUint8List();
    // return [retPlane0, retPlane1, retPlane2];
    return [outPlane0, outPlane1, outPlane2];
  }

  static List<Uint8List> _cropYUVBiPlanar(
    CameraImage cameraImage,
    Rect cropRect,
  ) {
    final plane0 = cameraImage.planes[0].bytes; // y plane
    final plane1 = cameraImage.planes[1].bytes; // uv plane
    final imgWidth = cameraImage.width;

    // 1.5 mean 1.0 for Y and 0.25 each for U and V
    final cropRectWidth = cropRect.width.toInt();
    final cropRectHeight = cropRect.height.toInt();
    var cropRectTop = cropRect.top.toInt();
    var cropRectLeft = cropRect.left.toInt();
    if (cropRectLeft.isOdd) {
      cropRectLeft -= 1;
    }
    if (cropRectTop.isOdd) {
      cropRectTop -= 1;
    }

    // var croppedImgSize = (cropRectWidth * cropRectHeight * 1.5).floor();
    // var croppedImg = List<int>.filled(croppedImgSize, 0);
    final yPlaneSize = cropRectWidth * cropRectHeight;
    final uPlaneHeight = (cropRectHeight / 2.0).ceil();
    final uPlaneWidth = (cropRectWidth / 2.0).ceil();
    final uPlaneSize = uPlaneWidth * uPlaneHeight;
    final vPlaneHeight = (cropRectHeight / 2.0).ceil();
    final vPlaneWidth = (cropRectWidth / 2.0).ceil();
    final vPlaneSize = vPlaneWidth * vPlaneHeight;
    final outPlane0 = Uint8List(yPlaneSize);

    // Y plane copy
    for (var i = 0; i < cropRectHeight; i++) {
      final imgPos = (cropRectTop + i) * imgWidth + cropRectLeft;
      final croppedImgPos = i * cropRectWidth;
      List.copyRange(
        outPlane0,
        croppedImgPos,
        plane0,
        imgPos,
        imgPos + cropRectWidth,
      );
    }

    // UV plane copy
    final outPlane1 = Uint8List(uPlaneSize);
    final outPlane2 = Uint8List(vPlaneSize);
    final index1 = List.generate(uPlaneWidth, (index) => index * 2);
    final index2 = List.generate(vPlaneWidth, (index) => index * 2 + 1);
    for (var i = 0; i < uPlaneHeight; i++) {
      // Get the uv row
      final imgPos = (cropRectTop ~/ 2 + i) * imgWidth + cropRectLeft;
      final uvRow = plane1.sublist(imgPos, imgPos + cropRectWidth);
      final uRow = index1.map((idx) => uvRow[idx]).toList();
      final vRow = index2.map((idx) => uvRow[idx]).toList();

      List.copyRange(outPlane1, i * uPlaneWidth, uRow, 0, uPlaneWidth);
      List.copyRange(outPlane2, i * vPlaneWidth, vRow, 0, vPlaneWidth);
    }

    return [outPlane0, outPlane1, outPlane2];
  }

  /// Converts a [CameraImage] in YUV420 format to [Image] in RGB format
  // static List<int> _convertYUV420ToRGBImageBytesList(
  //   Uint8List plane0,
  //   Uint8List plane1,
  //   Uint8List plane2,
  //   int bytesPerRow,
  //   int bytesPerPixel,
  //   int width,
  //   int height,
  // ) {
  //   // final width = cameraImage.width;
  //   // final height = cameraImage.height;

  //   final uvRowStride = bytesPerRow;
  //   final uvPixelStride = bytesPerPixel;

  //   // final image = image_lib.Image(width, height);

  //   var retImage = List<int>.filled(width * height * 3, 0);
  //   var index = 0;
  //   for (var w = 0; w < width; w++) {
  //     for (var h = 0; h < height; h++) {
  //       final uvIndex =
  //           uvPixelStride * (w / 2).floor() + uvRowStride * (h / 2).floor();
  //       final yindex = h * width + w;

  //       final y = plane0[yindex];
  //       final u = plane1[uvIndex];
  //       final v = plane2[uvIndex];

  //       // image.data[index] = ImageUtils.yuv2rgb(y, u, v);
  //       var color = ImageUtils._yuv2rgb(y, u, v);
  //       // final r = color & 0xff;
  //       // final g = (color >> 8) & 0xff;
  //       // final b = (color >> 16) & 0xff;

  //       // if (r > 255 || g > 255 || b > 255 || r < 0 || g < 0 || b < 0) {
  //       //   throw Exception('============= rgb $r $g $b');
  //       // }
  //       // retImage[index++] = color & 0xff;
  //       // retImage[index++] = (color >> 8) & 0xff;
  //       // retImage[index++] = (color >> 16) & 0xff;
  //       retImage[index++] = color[0];
  //       retImage[index++] = color[1];
  //       retImage[index++] = color[2];
  //     }
  //   }
  //   return retImage;
  // }

  // /// Converts a [CameraImage] in YUV420 format to [Image] in RGB format
  // static image_lib.Image convertYUV420ToImage(CameraImage cameraImage) {
  static List<dynamic> _convertYUV420ToRGBImageBytesList(
    Uint8List plane0,
    Uint8List plane1,
    Uint8List plane2,
    int bytesPerRow,
    int bytesPerPixel,
    int width,
    int height,
  ) {
    final uvRowStride = bytesPerRow;
    final uvPixelStride = bytesPerPixel;

    final image = image_lib.Image(height, width); // Rotate
    final bytes = Uint8List(width * height * 3);
    // const bytesIndex = 0;
    for (var w = 0; w < width; w++) {
      for (var h = 0; h < height; h++) {
        final uvIndex =
            uvPixelStride * (w / 2).floor() + uvRowStride * (h / 2).floor();
        final index = h * width + w;

        final y = plane0[index];
        final u = plane1[uvIndex];
        final v = plane2[uvIndex];

        // image.data[index] = ImageUtils.yuv2rgb(y, u, v);
        final r = (y + v * 1436 / 1024 - 179).round().clamp(0, 255);
        final g = (y - u * 46549 / 131072 + 44 - v * 93604 / 131072 + 91)
            .round()
            .clamp(0, 255);
        final b = (y + u * 1814 / 1024 - 227).round().clamp(0, 255);
        // image.data[index] = 0xff | (b << 16) | (g << 8) | r;
        // In Android, we need to rotate image by 90 degrees in counter-clockwise
        // so must do a transformation in the index
        final rotateIndex = (width - 1 - w) * height + h;
        image.data[rotateIndex] = 0xff000000 |
            ((b << 16) & 0xff0000) |
            ((g << 8) & 0xff00) |
            (r & 0xff);

        // Fill bytes
        bytes[rotateIndex] = r;
        bytes[rotateIndex + 1] = g;
        bytes[rotateIndex + 2] = b;
      }
    }
    return <dynamic>[image, bytes];
  }

  /// Convert a single YUV pixel to RGB
  static List<int> yuv2rgb(int y, int u, int v) {
    // Convert yuv pixel to rgb
    var r = (y + v * 1436 / 1024 - 179).round();
    var g = (y - u * 46549 / 131072 + 44 - v * 93604 / 131072 + 91).round();
    var b = (y + u * 1814 / 1024 - 227).round();

    // Clipping RGB values to be inside boundaries [ 0 , 255 ]
    r = r.clamp(0, 255);
    g = g.clamp(0, 255);
    b = b.clamp(0, 255);
    return [r, g, b];

    // return 0xff000000 |
    //     ((b << 16) & 0xff0000) |
    //     ((g << 8) & 0xff00) |
  }
}
