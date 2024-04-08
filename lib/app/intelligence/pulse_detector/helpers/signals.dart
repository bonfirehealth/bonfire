// Dart imports:
import 'dart:math' as math;

// Package imports:
import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/vector.dart';
import 'package:scidart/numdart.dart';

// Project imports:
import 'package:bonfirehealth/app/intelligence/pulse_detector/models/models.dart';

List<List<double>> butter(
  List<double> frequencies, {
  String btype = 'bandpass',
  String output = 'ba',
}) {
  // buttap
  var zpkData = buttap();
  final z = zpkData.z;
  final p = zpkData.p;
  final k = zpkData.k;

  // Not analog
  const fs = 2.0;
  final warped = Array(
    [
      2 * fs * math.tan(math.pi * frequencies[0] / fs),
      2 * fs * math.tan(math.pi * frequencies[1] / fs)
    ],
  );

  final bw = warped[1] - warped[0];
  final wo = math.sqrt(warped[0] * warped[1]);
  zpkData = lp2bpZpk(z, p, k, wo: wo, bw: bw);

  // not analog
  zpkData = bilinearZpk(zpkData.z, zpkData.p, zpkData.k, fs);

  return zpk2tf(zpkData.z, zpkData.p, zpkData.k);
}

// Filter implemented using state-space representation.
// Assume a filter with second order difference equation (assuming a[0]=1):
//     y[n] = b[0]*x[n] + b[1]*x[n-1] + b[2]*x[n-2] + ...
//                      - a[1]*y[n-1] - a[2]*y[n-2]
List<double> customLfilter(List<double> b, List<double> a, List<double> x) {
  // var bVec = Vector.fromList(b);
  // var aVec = Vector.fromList(a);
  // var xVec = Vector.fromList(x);

  final am = Matrix.fromList([
    [-a[1], 1],
    [-a[2], 0],
  ]);
  final B = Array2d([
    Array([b[1] - b[0] * a[1]]),
    Array([b[2] - b[0] * a[2]]),
  ]);
  final bVec = Vector.fromList([b[1] - b[0] * a[1], b[2] - b[0] * a[2]]);
  final C = Vector.fromList([1, 0]);
  final D = b[0];

  // Determine initial state (solve zi = A*zi + B, see scipy.signal.lfilter_zi)
  final aList =
      (Matrix.scalar(1, 2) - am).map((row) => Array(row.toList())).toList();
  final A = Array2d(aList);
  final ziArray2d = matrixSolve(A, B); // 2-d array shape of (1, 2)

  // Scale the initial state vector zi by the first input value
  final zi = Vector.fromList(matrixColumnToArray(ziArray2d, 0).toList());
  var z = zi * x[0];

  // Apply filter
  final y = List<double>.filled(x.length, 0);
  for (var n = 0; n < x.length; n++) {
    // Determine n-th output value (note this simplifies to y[n] = z[0] + b[0]*x[n])
    y[n] = C.dot(z) + D * x[n];

    // Determine next state (i.e. z[n+1])
    z = (am * z).getColumn(0) + bVec * x[n];
  }
  return y;
}

List<double> filtfilt(List<double> b, List<double> a, List<double> x) {
  // Apply 'odd' padding to input signal
  final padLen = 3 * math.max(a.length, b.length)
      as int; // the scipy.signal.filtfilt default

  final leftExt =
      x.sublist(1, 1 + padLen).reversed.map((e) => 2 * x.first - e).toList();
  final rightExt = x.reversed
      .toList()
      .sublist(1, 1 + padLen)
      .map((e) => 2 * x.last - e)
      .toList();
  final xForward = leftExt + x + rightExt;
  final xForwardLen = xForward.length;

  // Filter forward
  final yForward = customLfilter(b, a, xForward);

  // Filter backward
  final xBackward = yForward.reversed.toList();
  final yBackward = customLfilter(b, a, xBackward);

  final result = yBackward.reversed.toList();
  return result.sublist(padLen, xForwardLen - padLen);
}

// List<double> lfilterZi(List<double> b, List<double> a) {
//   while (a.length > 1 && a[0] == 0) {
//     a = a.sublist(1);
//   }

//   if (a.isEmpty) {
//     throw Exception('There must be at least one nonzero `a` coefficient.');
//   }

//   var aVec = Vector.fromList(a);
//   var bVec = Vector.fromList(b);
//   if (a[0] != 1) {
//     // Normalize the coefficients so a[0] == 1.
//     bVec = bVec / a[0];
//     aVec = aVec / a[0];
//   }

//   var n = math.max(a.length, b.length);

//   // Pad a or b with zeros so they are the same length.
//   if (aVec.length < n) {
//     final pad = n - aVec.length;
//     aVec = Vector.fromList(aVec.toList() + List<double>.filled(pad, 0));
//   } else {
//     final pad = n - bVec.length;
//     bVec = Vector.fromList(bVec.toList() + List<double>.filled(pad, 0));
//   }

//   final companionMList = companionMatrix(aVec);
//   final companionM = Matrix.fromList(companionMList);
//   var identityMinusA = Matrix.identity(n - 1) - companionM.transpose();
//   var A = Array2d(identityMinusA.map((row) => Array(row.toList())).toList());
//   var bList = (bVec.subvector(1) - aVec.subvector(1) * bVec[0]).toList();
//   var bArr = arrayReshapeToMatrix(Array(bList), 1);

//   var zi = matrixSolve(A, bArr);
//   return matrixColumnToArray(zi, 0).toList();
// }

// List<List<double>> companionMatrix(Vector a) {
//   final firstRow = (a.subvector(1) * -1) / (a[0] * 1.0);
//   List<List<double>> compList = [firstRow.toList()];
//   final n = a.length;
//   for (var i = 0; i < n - 2; i++) {
//     var zeros = List<double>.filled(n - 1, 0);
//     zeros[i] = 0;
//     compList.add(zeros);
//   }
//   return compList;
// }

// ValidationData validatePad(List<double> x, int ntaps) {
//   var edge = ntaps * 3;
//   var ext = oddExt(x, edge);
//   return ValidationData(ext: ext, edge: edge);
// }

// class ValidationData {
//   final List<double> ext;
//   final int edge;
//   ValidationData({required this.ext, required this.edge});
// }

// oddExt(List<double> x, int n) {
//   final len = x.length;
//   final leftEnd = x.first;
//   final leftExt = Vector.fromList(x.sublist(1, 1 + n));
//   final rightEnd = x.last;
//   List<double> rightExtList = [];
//   int i = len - 2;
//   while (i >= len - 2 - n) {
//     rightExtList.add(x[i]);
//   }
//   final rightExt = Vector.fromList(rightExtList);

//   final left = (leftExt * -1 + 2 * leftEnd).toList();
//   final right = (rightExt * -1 + 2 * rightEnd).toList();
//   return left + x + right;
// }

// Buttap for order = 1 only
ZpkData buttap() {
  final z = ArrayComplex([]);
  final p = ArrayComplex([Complex(real: -1)]);
  const k = 1.0;
  return ZpkData(z: z, p: p, k: k);
}

ZpkData lp2bpZpk(
  ArrayComplex z,
  ArrayComplex p,
  double k, {
  double wo = 1.0,
  double bw = 1.0,
}) {
  final degree_ = relativeDegree(z, p);

  // Scale poles and zeros to desired bandwidth
  final zlpComp = arrayComplexMultiplyToScalar(z, bw / 2);
  final plp = arrayComplexMultiplyToScalar(p, bw / 2);

  // var zlpComp = arrayToComplexArray(zlp);

  // Duplicate poles and zeros and shift from baseband to +wo and -wo
  var zbpComp = arrayComplexConcat(
    arrayComplexAddToArrayComplex(
      zlpComp,
      arrayComplexSqrt(
        arrayComplexAddToScalar(arrayComplexPow(zlpComp, 2), -wo * wo),
      ),
    ),
    arrayComplexSubToArrayComplex(
      zlpComp,
      arrayComplexSqrt(
        arrayComplexAddToScalar(arrayComplexPow(zlpComp, 2), -wo * wo),
      ),
    ),
  );

  final power = arrayComplexPow(plp, 2);
  final add = arrayComplexAddToScalar(power, -wo * wo);
  final sqrt = arrayComplexSqrt(add);
  // ignore: unused_local_variable
  final add2 = arrayComplexAddToArrayComplex(plp, sqrt);

  final pbpComp = arrayComplexConcat(
    arrayComplexAddToArrayComplex(
      plp,
      arrayComplexSqrt(
        arrayComplexAddToScalar(arrayComplexPow(plp, 2), -wo * wo),
      ),
    ),
    arrayComplexSubToArrayComplex(
      plp,
      arrayComplexSqrt(
        arrayComplexAddToScalar(arrayComplexPow(plp, 2), -wo * wo),
      ),
    ),
  );

  // Move degree zeros to origin, leaving degree zeros at infinity for BPF
  zbpComp = arrayComplexConcat(
    zbpComp,
    ArrayComplex.fixed(
      degree_,
      initialValue: Complex(),
    ),
  );

  final kbpComp = k * math.pow(bw, degree_);
  return ZpkData(z: zbpComp, p: pbpComp, k: kbpComp);
}

int relativeDegree(ArrayComplex z, ArrayComplex p) {
  final degree = p.length - z.length;
  if (degree < 0) {
    throw Exception(
      'Improper transfer function. "Must have at least as many poles as zeros.',
    );
  } else {
    return degree;
  }
}

ZpkData bilinearZpk(ArrayComplex z, ArrayComplex p, double k, double fs) {
  final degree_ = relativeDegree(z, p);
  final fs2 = 2 * fs;

  // Bilinear transform the poles and zeros
  var zz = arrayComplexDivToArrayComplex(
    arrayComplexAddToScalar(z, fs2),
    scalarSubToArrayComplex(fs2, z),
  );
  final pz = arrayComplexDivToArrayComplex(
    arrayComplexAddToScalar(p, fs2),
    scalarSubToArrayComplex(fs2, p),
  );

  // Any zeros that were at infinity get moved to the Nyquist frequency
  zz = arrayComplexConcat(
    zz,
    ArrayComplex.fixed(
      degree_,
      initialValue: Complex(real: -1),
    ),
  );

  final kz = k *
      divComplex(
        arrayComplexProd(
          scalarSubToArrayComplex(fs2, z),
        ),
        arrayComplexProd(
          scalarSubToArrayComplex(fs2, p),
        ),
      ).real;
  return ZpkData(z: zz, p: pz, k: kz);
}

List<List<double>> zpk2tf(ArrayComplex z, ArrayComplex p, double k) {
  final b = arrayMultiplyToScalar(Array(polyOfRoots(z)), k).toList();
  final a = polyOfRoots(p);
  return [b, a];
}

ArrayComplex arrayComplexPow(ArrayComplex a, num b) {
  final c = ArrayComplex.fixed(a.length);
  for (var i = 0; i < a.length; i++) {
    c[i] = complexPow(a[i], b);
  }

  return c;
}

Complex complexPow(Complex a, num b) {
  return Complex(
    real: (a.real * a.real) - (a.imaginary * a.imaginary),
    imaginary: 2 * a.real * a.imaginary,
  );
}

ArrayComplex arrayComplexAddToScalar(ArrayComplex a, num b) {
  final c = ArrayComplex.fixed(a.length);
  for (var i = 0; i < a.length; i++) {
    c[i] = Complex(real: a[i].real + b, imaginary: a[i].imaginary);
  }
  return c;
}

ArrayComplex scalarSubToArrayComplex(num a, ArrayComplex b) {
  final c = ArrayComplex.fixed(b.length);
  for (var i = 0; i < b.length; i++) {
    c[i] = Complex(real: a - b[i].real, imaginary: -b[i].imaginary);
  }
  return c;
}

ArrayComplex arrayComplexSqrt(ArrayComplex a) {
  final c = ArrayComplex.fixed(a.length);
  for (var i = 0; i < a.length; i++) {
    final real = a[i].real;
    final img = a[i].imaginary;

    var newReal = 0.0;
    var newImg = 0.0;
    if (img == 0) {
      if (real < 0) {
        newReal = 0;
        newImg = -math.sqrt(real.abs());
      } else {
        newReal = math.sqrt(real);
        newImg = 0;
      }
    } else {
      newReal = math.sqrt((math.sqrt(real * real + img * img) + img) / 2);
      newImg = math.sqrt((math.sqrt(real * real + img * img) - img) / 2);
      newImg = img > 0 ? newImg : -newImg;
    }

    c[i] = Complex(real: newReal, imaginary: newImg);
  }
  return c;
}

ArrayComplex arrayComplexAddToArrayComplex(ArrayComplex a, ArrayComplex b) {
  final c = ArrayComplex.fixed(a.length);
  for (var i = 0; i < a.length; i++) {
    c[i] = Complex(
      real: a[i].real + b[i].real,
      imaginary: a[i].imaginary + b[i].imaginary,
    );
  }
  return c;
}

ArrayComplex arrayComplexSubToArrayComplex(ArrayComplex a, ArrayComplex b) {
  final c = ArrayComplex.fixed(a.length);
  for (var i = 0; i < a.length; i++) {
    c[i] = Complex(
      real: a[i].real - b[i].real,
      imaginary: a[i].imaginary - b[i].imaginary,
    );
  }
  return c;
}

ArrayComplex arrayComplexDivToArrayComplex(ArrayComplex a, ArrayComplex b) {
  final c = ArrayComplex.fixed(a.length);
  for (var i = 0; i < a.length; i++) {
    c[i] = divComplex(a[i], b[i]);
  }
  return c;
}

Complex divComplex(Complex x, Complex y) {
  final a = x.real;
  final b = x.imaginary;
  final c = y.real;
  final d = y.imaginary;

  final newReal = (a * c + b * d) / (c * c + d * d);
  final newImg = (b * c - a * d) / (c * c + d * d);
  return Complex(real: newReal, imaginary: newImg);
}

Complex minusComplex(Complex a) {
  final c = Complex(
    real: a.real != 0 ? -a.real : 0,
    imaginary: a.imaginary != 0 ? -a.imaginary : 0,
  );
  return c;
}

Complex mulComplex(Complex x, Complex y) {
  final a = x.real;
  final b = x.imaginary;
  final c = y.real;
  final d = y.imaginary;
  final m = Complex(real: a * c - b * d, imaginary: a * d + b * c);
  return m;
}

Complex arrayComplexProd(ArrayComplex a) {
  var prod = Complex(real: 1);
  for (var i = 0; i < a.length; i++) {
    prod = prod * a[i];
  }
  return prod;
}

List<double> polyOfRoots(ArrayComplex a) {
  final first = a[0];
  final second = a[1];
  final poly = <double>[1];

  // ignore: cascade_invocations
  poly
    ..add(minusComplex(first + second).real)
    ..add(mulComplex(first, second).real);
  return poly;
}
