part of '../web_screening_page.dart';

class ScreenCountdownTimer extends StatelessWidget {
  const ScreenCountdownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<WebScreeningBloc, WebScreeningState>(
      builder: (context, screenCountdownTotalTime) {
        final bloc = context.read<WebScreeningBloc>();

        return Opacity(
          opacity: bloc.state.screeningStatus == ScreeningStatus.record ? 1 : 0,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaceOverlay(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: min(size.height * 0.3, 250),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    color: AppColourConstant.black000000.withOpacity(0.5),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Analyzing...',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColourConstant.whiteFFFFFF,
                              ),
                        ),
                        SpacerVertical(resizeByHeight(context, 37)),
                        DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColourConstant.whiteFFFFFF,
                          ),
                          child: TimeCircularCountdown(
                            unit: CountdownUnit.second,
                            diameter: 70,
                            countdownTotal: bloc.state.screenCountdownTotalTime,
                            countdownCurrentColor: Colors.transparent,
                            countdownRemainingColor: Colors.transparent,
                            countdownTotalColor: Colors.transparent,
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColourConstant.black000000,
                                ),
                            onUpdated: (_, remainingTime) => bloc.add(
                              WebScreeningScreenCountdownUpdated(
                                context,
                                remainingTime,
                              ),
                            ),
                            onFinished: () {
                              bloc.add(
                                WebScreeningScreenCountdownFinished(
                                  context,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
