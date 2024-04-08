part of '../web_screening_page.dart';

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final radius = size.width * 1.25;
    final centerY = size.height - radius;
    final path = Path();
    // ignore: cascade_invocations
    path
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, centerY),
          radius: radius,
        ),
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ScreeningHeader extends StatelessWidget {
  const ScreeningHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<WebScreeningBloc, WebScreeningState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              Column(
                children: [
                  const Spacer(),
                  Container(
                    width: size.width,
                    constraints: BoxConstraints(
                      minHeight: min(size.height * 0.3, 250),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    color: WebRTCHelper.setColourByScreeningStatus(
                      state.screeningStatus,
                      state.bodyTemperature,
                    ).withOpacity(0.5),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width,
                          child: AutoSizeText(
                            '${state.screeningMessage}',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColourConstant.whiteFFFFFF,
                                ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ),
                        if (state.bodyTemperature != null)
                          SizedBox(
                            width: size.width,
                            child: AutoSizeText(
                              '${state.bodyTemperature!.fixedDecimals(
                                decimals: 1,
                                removeZeroDecimals: false,
                              )}°C',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColourConstant.whiteF8F8F8,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
