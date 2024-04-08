// Dart imports:
import 'dart:math';

extension DoubleExt on double {
  String fixedDecimals({
    int decimals = 0,
    bool removeZeroDecimals = true,
  }) {
    var d = decimals;
    final mod = pow(10.0, d);
    final result = (this * mod).round().toDouble() / mod;
    if (removeZeroDecimals && result - (result.truncate()) == 0.0) d = 0;
    return result.toStringAsFixed(d);
  }
}
