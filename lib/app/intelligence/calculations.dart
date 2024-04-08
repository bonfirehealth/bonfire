// Dart imports:
import 'dart:math' as math;

// Package imports:
import 'package:ml_linalg/linalg.dart';

// Project imports:
import 'package:bonfirehealth/app/helpers/helpers.dart';

class Calculations {
  Calculations._();

  static final List<double> bpmRange = [40, 200];
  static final List<double> hrvRange = [1, 1000];
  static final List<double> siRange = [1, 10];

  static final List<int> rrIntervalsList = [];
  static double beatsPerMinute = 0;
  static double heartRateVariability = 0;
  static double stressIndex = 0;

  static List<double> calculate(List<int> peaks, double fps) {
    calculateRRInterval(peaks, fps);
    calculateBeatsPerMinute(rrIntervalsList);
    calculateHeartRateVariability(rrIntervalsList);
    calculateStressIndex(rrIntervalsList);
    return [beatsPerMinute, heartRateVariability, stressIndex];
  }

  // Calculate RR-intervals (in ms) list from the given peaks and fps
  static void calculateRRInterval(List<int> peaks, double fps) {
    logInfo('💙 calculateRRInterval: ${peaks.length}, $fps');

    rrIntervalsList.clear();
    var cnt = 0;

    while (cnt < peaks.length - 1) {
      final rrInterval = peaks[cnt + 1] - peaks[cnt];
      final msDist = ((rrInterval / fps) * 1000).toInt();
      rrIntervalsList.add(msDist);
      cnt += 1;
    }

    logInfo('💙 fps: $fps');
    logInfo('💙 peaks: ${peaks.toList()}');
    logInfo('💙 peaks.length: ${peaks.length}');
    logInfo(
      '💙 rrIntervalsList: ${rrIntervalsList.toList()}',
    );
    logInfo(
      '💙 rrIntervalsList.length: ${rrIntervalsList.length}',
    );
  }

  static void calculateBeatsPerMinute(List<int> list) {
    if (list.isNotEmpty) {
      beatsPerMinute = 60000.0 / (Vector.fromList(list).mean() + 1e-12);
      logInfo('💙 beatsPerMinute: $beatsPerMinute');
    }
    beatsPerMinute = beatsPerMinute.clamp(bpmRange[0], bpmRange[1]);
  }

  // Calculate HRV using SDNN method.
  // Ref: https://imotions.com/blog/heart-rate-variability/
  // HRV = sqrt(mean((RR1 - RR2)^2 + (RR2 - RR3)^2 + ...))
  static void calculateHeartRateVariability(List<int> list) {
    logInfo('💙 calculateHeartRateVariability: ${list.length}');

    if (list.length >= 2) {
      var sumSquaredIntervalDiff = 0.0;
      for (var i = 1; i < list.length; i++) {
        sumSquaredIntervalDiff += math.pow(list[i] - list[i - 1], 2);
      }

      heartRateVariability =
          math.sqrt(sumSquaredIntervalDiff / (list.length - 1));
    }
    heartRateVariability = heartRateVariability.clamp(hrvRange[0], hrvRange[1]);
  }

  static void calculateStressIndex(List<int> list) {
    logInfo('💙 calculateStressIndex: ${list.length}');

    // Ref: https://www.kubios.com/hrv-analysis-methods/
    // Binarize the RR-intervals with bin size = 50ms
    if (list.isNotEmpty) {
      const binSize = 50; // 50ms
      final firstBin = (list[0] / binSize).ceil();
      var maxInterval = firstBin;
      var minInterval = firstBin;
      final rrDist = {firstBin: 1};
      var maxFreqs = 0;
      var mode = 0;
      for (var i = 1; i < list.length; i++) {
        final bin = (list[i] / binSize).ceil();
        if (rrDist.containsKey(bin)) {
          rrDist[bin] = rrDist[bin] ?? 0 + 1;
        } else {
          rrDist[bin] = 1;
        }
        if (rrDist[bin]! > maxFreqs) {
          mode = bin;
          maxFreqs = rrDist[bin] ?? 0;
        }

        if (bin > maxInterval) {
          maxInterval = bin;
        }

        if (bin < minInterval) {
          minInterval = bin;
        }
      }
      final mo = (mode * binSize).toDouble() / 1000.0;
      final mxDmn = (maxInterval - minInterval + 1e-12) * binSize / 1000.0;
      stressIndex = (maxFreqs / list.length) / (2 * mo * mxDmn);
    }

    stressIndex = stressIndex.clamp(siRange[0], siRange[1]);
  }
}
