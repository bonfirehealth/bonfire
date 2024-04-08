part of '../web_screening_page.dart';

class ScreeningResultsView extends StatelessWidget {
  const ScreeningResultsView({super.key});
  // @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WebScreeningBloc, WebScreeningState>(
      builder: (context, state) {
        const boxSize = 100.0;

        return BlocBuilder<WebScreeningBloc, WebScreeningState>(
          builder: (context, state) {
            return Stack(
              children: [
                _buildBackground(context, state),
                _buildResults(context, state, boxSize),
                _buildDynamic(context, state),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildBackground(BuildContext context, WebScreeningState state) {
    if (state.screeningStatus == ScreeningStatus.warmDown ||
        state.screeningStatus == ScreeningStatus.completed) {
      return Positioned.fill(
        child: Container(
          color: Colors.white,
          constraints: const BoxConstraints(
            minHeight: 500,
          ),
          child: Image.asset(
            ImageConstant.vitruvianMan,
            fit: BoxFit.contain,
            alignment: Alignment.topLeft,
          ),
        ),
      );
    } else {
      return Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FaceOverlay(),
          ],
        ),
      );
    }
  }

  Widget _buildResults(
      BuildContext context, WebScreeningState state, double boxSize) {
    return Positioned(
      child: VitalBoxes(
        assessment: state.screeningResultAssessment,
        boxSize: boxSize,
      ),
    );
  }

  Widget _buildDynamic(BuildContext context, WebScreeningState state) {
    return BlocBuilder<WebScreeningBloc, WebScreeningState>(
      builder: (context, state) {
        final bloc = context.read<WebScreeningBloc>();

        final assessment = state.screeningResultAssessment;

        if ((assessment != null &&
                assessment.readinessIndex != null &&
                assessment.readinessIndex! < 0) ||
            (assessment != null &&
                assessment.stressIndex != null &&
                assessment.stressIndex! < 0) ||
            (assessment != null &&
                assessment.heartRate != null &&
                assessment.heartRate! < 0) ||
            (assessment != null &&
                assessment.heartRateVariability != null &&
                assessment.heartRateVariability! < 0)) {
          if (state.screeningStatus != ScreeningStatus.completed) {
            bloc.add(const WebScreeningTerminated());
          }
          return _buildRetry(context, state);
        } else {
          return _buildFooter(context, state);
        }
      },
    );
  }

  Widget _buildRetry(BuildContext context, WebScreeningState state) {
    final appBloc = context.read<AppBloc>();
    return Stack(
      children: [
        Positioned(
          bottom: 10,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              color: AppColourConstant.black000000.withOpacity(0.5),
              borderRadius: BorderRadius.circular(
                10,
              ), // Adjust the radius as needed
            ),
            height: 150,
            width: 300,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: AutoSizeText(
                    'Can we try again?',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColourConstant.whiteFFFFFF,
                        ),
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    'It seems like we were unable to detect your face or capture your vital signs well.',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColourConstant.whiteFFFFFF,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: InkWell(
            onTap: () {
              appBloc.add(
                AppNextRoutePath(
                  context,
                  'Face scan',
                  '/screening',
                  '',
                ),
              );
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColourConstant
                    .blue1A56CF, // Replace with your desired button color
              ),
              child: const Center(
                child: Text(
                  'Retry',
                  style: TextStyle(
                    color: Colors.white, // Replace with your desired text color
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context, WebScreeningState state) {
    if (state.screeningStatus == ScreeningStatus.warmDown) {
      return _buildWarmdownMessage(context, state);
    } else if (state.screeningStatus == ScreeningStatus.completed) {
      return _buildCompleteMessage(context, state);
    } else {
      return _buildCountdown(context, state);
    }
  }

  Widget _buildWarmdownMessage(BuildContext context, WebScreeningState state) {
    final l10n = context.l10n;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: AppColourConstant.black000000.withOpacity(0.5),
        height: 80,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 10,
        ),
        child: AutoSizeText(
          l10n.screeningPredictingMessage,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColourConstant.whiteFFFFFF,
              ),
        ),
      ),
    );
  }

  Widget _buildCompleteMessage(BuildContext context, WebScreeningState state) {
    final l10n = context.l10n;
    final size = MediaQuery.of(context).size;

    final assessment = state.screeningResultAssessment;

    var readinessIndex = 0.0;
    var heartRate = 0.0;

    var message = '';
    if (isTrialCustomer) {
      if (assessment != null && assessment.heartRate != null) {
        heartRate = assessment.heartRate ?? 0.0;
        if (heartRate < 60) {
          message = 'Your Heart Rate seems Low';
        } else if (readinessIndex > 100) {
          message = 'Your Heart Rate seems High';
        } else {
          message = 'Your Heart Rate seems normal';
        }
      }
    } else {
      if (assessment != null && assessment.readinessIndex != null) {
        readinessIndex = assessment.readinessIndex ?? 0.0;
        if (readinessIndex < 50) {
          message +=
              'readiness index is low - ${readinessIndex.toStringAsFixed(2)}, ';
        } else if (readinessIndex > 100) {
          message +=
              'readiness index is high - ${readinessIndex.toStringAsFixed(2)}, ';
        }
      }

      if (assessment != null && assessment.heartRate != null) {
        heartRate = assessment.heartRate ?? 0.0;
        if (heartRate < 60) {
          message +=
              'heart rate is low - ${heartRate.toStringAsFixed(2)} BPM, ';
        } else if (readinessIndex > 100) {
          message +=
              'heart rate is high - ${heartRate.toStringAsFixed(2)} BPM, ';
        }
      }
    }
    message.trim();

    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        constraints: BoxConstraints(
          minHeight: min(size.height * 0.2, 80),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              onPressed: () {
                if (isTrialCustomer) {
                  context.read<AppBloc>().add(
                        AppReplaceRoutePath(
                          context,
                          'Driver Assistant',
                          '/home/chats?message=$message',
                          '',
                        ),
                      );
                } else {
                  context.read<AppBloc>().add(
                        AppReplaceRoutePath(
                          context,
                          'Driver Assistant',
                          '/home/chats?message=${message.isEmpty ? "" : "Give me a suggestion to improve my health and manage stress. Currently, my $message"}',
                          '',
                        ),
                      );
                }
              },
              title: l10n.assessmentActionSubtitle,
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdown(BuildContext context, WebScreeningState state) {
    final bloc = context.read<WebScreeningBloc>();
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: DecoratedBox(
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
          textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
    );
  }
}
