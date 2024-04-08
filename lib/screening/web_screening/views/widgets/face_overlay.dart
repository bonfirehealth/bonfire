part of '../web_screening_page.dart';

class FaceOverlay extends StatelessWidget {
  const FaceOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const a = 110.0;
    const b = 140.0;
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;

        return SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              ClipPath(
                clipper: FaceClipper(a, b),
                child: Container(
                  color: AppColourConstant.scaffoldColor,
                ),
              ),
              const Center(
                child: Icon(
                  Icons.fingerprint_outlined,
                  color: Colors.white,
                  size: 100,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem(this.index, this.clipper, {super.key});
  final int index;
  final CustomClipper<Path> clipper;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            colors: [
              AppColourConstant.blue52B7F8,
              AppColourConstant.blue2961EA,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

class FaceClipper extends CustomClipper<Path> {
  FaceClipper(
    this.a,
    this.b, {
    this.isTopLeft = false,
    this.isTopRight = false,
    this.isBottomLeft = false,
    this.isBottomRight = false,
  });

  final double a;
  final double b;
  final bool isTopLeft;
  final bool isTopRight;
  final bool isBottomLeft;
  final bool isBottomRight;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width / 2, size.height / 2 - a)
      ..arcTo(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: a,
          height: b,
        ),
        -pi / 2,
        pi,
        false,
      )
      ..arcTo(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: a,
          height: b,
        ),
        pi / 2,
        pi,
        false,
      )
      ..lineTo(size.width / 2, 0)
      ..lineTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
