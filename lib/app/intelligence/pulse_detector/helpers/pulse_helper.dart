// Dart imports:
import 'dart:collection';

// Package imports:
import 'package:image/image.dart' as image_lib;

// Project imports:
import 'package:bonfirehealth/app/intelligence/pulse_detector/helpers/helpers.dart';

class InputData {
  InputData(this.image, this.timestamp) {
    final resizedImage = image_lib.copyResize(
      image!,
      width: PulseDetectorParam.inputSize,
      height: PulseDetectorParam.inputSize,
    );
    decodedImage = imageToFloat32List(resizedImage);
    image = null;
  }
  List<double>? decodedImage;
  image_lib.Image? image;
  double timestamp;
}

class InputBuffer {
  InputBuffer({this.bufferSize = 101}) {
    buffer = ListQueue<InputData>();
  }
  final int bufferSize;
  ListQueue<InputData>? buffer;

  void update(InputData item) {
    if (buffer!.length == bufferSize) {
      buffer!.removeFirst();
    }
    buffer!.addLast(item);
  }

  InputData elementAt(int index) {
    return buffer!.elementAt(index);
  }

  void clear() {
    buffer!.clear();
  }

  bool get ready {
    return buffer!.length == bufferSize;
  }

  int get length {
    return buffer!.length;
  }

  double get fps {
    if (buffer!.length >= 2) {
      return (1000 *
              length /
              (buffer!.last.timestamp - buffer!.first.timestamp))
          .clamp(1, 1000);
    }
    return 0;
  }
}

List<int> findPeaksByDistance(List<double> pulsePred, {int distance = 15}) {
  final peaks = localMaxima1d(pulsePred);
  final priority = <double>[];
  for (final peak in peaks) {
    priority.add(pulsePred[peak]);
  }
  final keep = selectByPeakDistance(peaks, priority, distance);

  final keepPeaks = <int>[];
  for (var i = 0; i < keep.length; i++) {
    if (keep[i] > 0) {
      keepPeaks.add(peaks[i]);
    }
  }
  return keepPeaks;
}

List<int> localMaxima1d(List<double> x) {
  final len = x.length ~/ 2;
  final midPoints = List.filled(len, 0);
  final leftEdges = List.filled(len, 0);
  final rightEdges = List.filled(len, 0);

  var m = 0;
  var i = 1;
  final iMax = x.length - 1;

  while (i < iMax) {
    // Test if previous sample is smaller
    if (x[i - 1] < x[i]) {
      var iAhead = i + 1; // Index to look ahead of current sample

      // Find next sample that is unequal to x[i]
      while (iAhead < iMax && x[iAhead] == x[i]) {
        iAhead += 1;
      }

      // Maxima is found if next unequal sample is smaller than x[i]
      if (x[iAhead] < x[i]) {
        leftEdges[m] = i;
        rightEdges[m] = iAhead - 1;
        midPoints[m] = (leftEdges[m] + rightEdges[m]) ~/ 2;

        m += 1;
        // Skip samples that can't be maximum
        i = iAhead;
      }
    }

    i += 1;
  }

  final newMidPoints = <int>[];
  for (final point in midPoints) {
    if (point > 0) {
      newMidPoints.add(point);
    }
  }
  return newMidPoints;
}

List<int> selectByPeakDistance(
  List<int> peaks,
  List<double> priority,
  int distance,
) {
  final peaksSize = peaks.length;
  final keep = List<int>.filled(peaksSize, 1);

  final priorityAndIndex = <List<double>>[];
  for (var i = 0; i < priority.length; i++) {
    priorityAndIndex.add([priority[i], i.toDouble()]);
  }

  priorityAndIndex.sort((a, b) => a[0].compareTo(b[0]));
  final priorityToPosition = priorityAndIndex.map((e) => e[1].toInt()).toList();
  for (var i = peaksSize - 1; i >= 0; i--) {
    final j = priorityToPosition[i];

    if (keep[j] == 0) {
      // Skip evaluation for peak already marked as "don't keep"
      continue;
    }

    var k = j - 1;
    while (0 <= k && (peaks[j] - peaks[k] < distance)) {
      keep[k] = 0;
      k -= 1;
    }

    k = j + 1;
    // Flag "later" peaks for removal until minimal distance is exceeded
    while (k < peaksSize && (peaks[k] - peaks[j] < distance)) {
      keep[k] = 0;
      k += 1;
    }
  }
  return keep;
}
