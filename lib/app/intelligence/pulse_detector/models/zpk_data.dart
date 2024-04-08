// Package imports:
import 'package:scidart/numdart.dart';

class ZpkData {
  ZpkData({
    required this.z,
    required this.p,
    required this.k,
  });
  final ArrayComplex z;
  final ArrayComplex p;
  final double k;
}
