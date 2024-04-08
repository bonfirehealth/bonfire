part of '../web_screening_page.dart';

class BackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = Paint();

    final heightLine = height ~/ 80; // your Horizontal line
    final widthLine = width ~/ 40; // your Vertical line

    final bigHeightLine = height ~/ 20; // your Horizontal line
    final bigWidthLine = width ~/ 10;

    paint.color = AppColourConstant.whiteEFF3FB.withOpacity(0.15);

    for (var i = bigHeightLine; i < height; i += bigHeightLine) {
      final linePath = Path()
        ..addRect(Rect.fromLTRB(0, i.toDouble(), width, (i + 2).toDouble()));
      canvas.drawPath(linePath, paint);
    }

    for (var i = bigWidthLine; i < width; i += bigWidthLine) {
      final linePath = Path()
        ..addRect(Rect.fromLTRB(i.toDouble(), 0, (i + 2).toDouble(), height));
      canvas.drawPath(linePath, paint);
    }

    paint.color = AppColourConstant.whiteEFF3FB.withOpacity(0.04);

    for (var i = heightLine; i < height; i += heightLine) {
      final linePath = Path()
        ..addRect(Rect.fromLTRB(0, i.toDouble(), width, (i + 2).toDouble()));
      canvas.drawPath(linePath, paint);
    }

    for (var i = widthLine; i < width; i += widthLine) {
      final linePath = Path()
        ..addRect(Rect.fromLTRB(i.toDouble(), 0, (i + 2).toDouble(), height));
      canvas.drawPath(linePath, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class DemoCircleWave extends StatefulWidget {
  const DemoCircleWave({super.key, this.count = 10, this.isProcessing = false});
  final int count;
  final bool isProcessing;

  @override
  State<DemoCircleWave> createState() => _DemoCircleWaveState();
}

class _DemoCircleWaveState extends State<DemoCircleWave>
    with TickerProviderStateMixin {
  static const colors = <Color>[
    AppColourConstant.heartColor,
    AppColourConstant.waveColor,
    AppColourConstant.lightWaveColor,
  ];

  late AnimationController controller;
  late AnimationController addPointController;
  late Animation<double> addPointAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      upperBound: 2,
      duration: const Duration(seconds: 10),
    )..repeat();
    addPointController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    addPointAnimation =
        addPointController.drive(CurveTween(curve: Curves.ease));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < (colors.length); i++)
          !widget.isProcessing
              ? Positioned.fill(
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    builder: (_, double opacity, __) {
                      return CustomPaint(
                        painter: CircleWavePainter(
                          controller,
                          addPointAnimation,
                          i,
                          colors[i].withOpacity(opacity),
                          widget.count,
                          context,
                        ),
                      );
                    },
                  ),
                )
              : Container()
      ],
    );
  }
}

class CircleWavePainter extends CustomPainter {
  CircleWavePainter(
    this.animation,
    this.addAnimation,
    this.index,
    this.color,
    this.count,
    this.context,
  ) : super(repaint: animation);
  final Animation<double> animation;
  final Animation<double> addAnimation;
  final int index;
  final Color color;
  final BuildContext context;
  final int count;

  static const halfPi = math.pi / 2;
  static const twoPi = math.pi * 2;
  final n = 6;

  @override
  void paint(Canvas canvas, Size size) {
    final t = animation.value;
    final halfWidth = size.width / 2;
    final halfHeight = size.height / 2;
    final q = index * halfPi;

    List<Offset> computeOffsets(int length) {
      final offsets = <Offset>[];
      for (var i = 0; i < length; i++) {
        final th = i * twoPi / length;
        var os = map(math.cos(th - twoPi * t), -1, 1, 0, 1);

        os = 0.125 * math.pow(os, 2.75);
        final r = min(120, MediaQuery.of(context).size.width * 0.3) *
            (1 + os * math.cos(n * th + 1.5 * twoPi * t + q));
        offsets.add(
          Offset(r * math.sin(th) + halfWidth, -r * math.cos(th) + halfHeight),
        );
      }
      return offsets;
    }

    final offsets = computeOffsets(count);

    if (count > 1 && addAnimation.value < 1) {
      final t = addAnimation.value;
      final oldOffsets = computeOffsets(count - 1);
      for (var i = 0; i < count - 1; i++) {
        offsets[i] = Offset.lerp(oldOffsets[i], offsets[i], t)!;
      }
      offsets[count - 1] = Offset.lerp(
        oldOffsets[count - 2],
        offsets[count - 1],
        t,
      )!;
    }

    final path = Path()..addPolygon(offsets, true);
    canvas.drawPath(
      path,
      Paint()
        ..blendMode = BlendMode.lighten
        ..color = color
        ..strokeWidth = 6
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double map(
    // ignore: non_constant_identifier_names
    double x,
    double inMin,
    double inMax,
    double outMin,
    double outMax,
  ) {
    return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
  }
}
