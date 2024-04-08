part of '../web_screening_page.dart';

class WarmUpCountdownTimer extends StatelessWidget {
  const WarmUpCountdownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final bloc = context.read<WebScreeningBloc>();
    // const aspectRatio = 375 / 500;

    return BlocSelector<WebScreeningBloc, WebScreeningState, int>(
      selector: (state) => state.warmUpCountdownTotalTime,
      builder: (context, warmUpCountdownTotalTime) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Column(
            children: [
              AutoSizeText(
                'Ready in',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColourConstant.whiteFFFFFF,
                ),
                child: TimeCircularCountdown(
                  unit: CountdownUnit.second,
                  diameter: 40,
                  countdownTotal: warmUpCountdownTotalTime,
                  countdownCurrentColor: Colors.transparent,
                  countdownRemainingColor: Colors.transparent,
                  countdownTotalColor: Colors.transparent,
                  textStyle:
                      Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColourConstant.black000000,
                          ),
                  onUpdated: (_, remainingTime) => bloc.add(
                    WebScreeningWarmUpCountdownUpdated(
                      context,
                      remainingTime,
                    ),
                  ),
                  onFinished: () {
                    Future<void>.delayed(Duration.zero, () {
                      bloc.add(
                        WebScreeningWarmUpCountdownFinished(
                          context,
                        ),
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
