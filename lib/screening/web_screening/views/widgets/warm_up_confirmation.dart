part of '../web_screening_page.dart';

class WarmUpConfirmation extends StatefulWidget {
  const WarmUpConfirmation({super.key});

  @override
  State<WarmUpConfirmation> createState() => _WarmUpConfirmationState();
}

class _WarmUpConfirmationState extends State<WarmUpConfirmation>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<WebScreeningBloc, WebScreeningState>(
      builder: (context, state) {
        return SizedBox(
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
                top: size.height * 0.12,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: size.height * 0.1,
                  child: const DemoCircleWave(
                    count: 100,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: max(size.height * 0.3, 300),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: CombinedWave(
                    reverse: false,
                    models: const [
                      SinusoidalModel(
                        formular: WaveFormular.travelling,
                        amplitude: 25,
                        waves: 20,
                        translate: 2.5,
                        frequency: 0.5,
                      ),
                      SinusoidalModel(
                        amplitude: 20,
                        waves: 15,
                        translate: 7.5,
                        frequency: 1.5,
                      ),
                      SinusoidalModel(
                        amplitude: 25,
                        waves: 4,
                        translate: 7.5,
                        frequency: 1.5,
                      ),
                    ],
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 350,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColourConstant.heartColor,
                            AppColourConstant.lightWaveColor.withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _build(context, state),
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (!context.router.isTopMost) {
                      context.router.pop();
                    } else {
                      context.router.replace(const HomeRoute());
                    }
                  },
                  icon: SizedBox(
                    width: 18,
                    height: 18,
                    child: AppImage.asset(
                      ImageConstant.closeCross,
                      width: 18,
                      height: 18,
                      fit: BoxFit.cover,
                      color: AppColourConstant.whiteFFFFFF,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _build(BuildContext context, WebScreeningState state) {
    if (state.screeningStatus == ScreeningStatus.confirmation ||
        state.screeningStatus == ScreeningStatus.warmUp ||
        state.screeningStatus == ScreeningStatus.record ||
        state.screeningStatus == ScreeningStatus.firstResult ||
        state.screeningStatus == ScreeningStatus.warmDown ||
        state.screeningStatus == ScreeningStatus.completed) {
      if (state.screeningStatus == ScreeningStatus.confirmation) {
        return Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
            child: Column(
              children: [
                Text(
                  context.l10n.screeningStartMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColourConstant.whiteFFFFFF,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: RoundedButton(
                    onPressed: () {
                      context
                          .read<WebScreeningBloc>()
                          .add(WebScreeningWarmUpStart(context));
                      // .add(WebScreeningCompleted());
                    },
                    title: "I'm ready",
                  ),
                ),
              ],
            ),
          ),
        );
      }
      if (state.screeningStatus == ScreeningStatus.warmUp) {
        return const Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
            child: WarmUpCountdownTimer(),
          ),
        );
      }

      if (state.screeningStatus == ScreeningStatus.record ||
          state.screeningStatus == ScreeningStatus.warmDown ||
          state.screeningStatus == ScreeningStatus.firstResult ||
          state.screeningStatus == ScreeningStatus.completed) {
        final l10n = context.l10n;
        final appBloc = context.read<AppBloc>();
        final size = MediaQuery.of(context).size;

        final heartRate = state.screeningResultAssessment?.heartRate;
        var isHeartRateNormal = false;
        if (heartRate != null && heartRate >= 60 && heartRate <= 100) {
          isHeartRateNormal = true;
        }

        final readinessIndex = state.screeningResultAssessment?.readinessIndex;
        var isReadinessIndexNormal = false;
        if (readinessIndex != null &&
            readinessIndex >= 50 &&
            readinessIndex <= 100) {
          isReadinessIndexNormal = true;
        }

        return Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Column(
            children: [
              if (state.screeningStatus == ScreeningStatus.record ||
                  state.screeningStatus == ScreeningStatus.firstResult ||
                  state.screeningStatus == ScreeningStatus.warmDown ||
                  state.screeningStatus == ScreeningStatus.completed)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 30,
                    ),
                    child: SizedBox(
                      height: size.height * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _buildVitalCard(
                              symbol: l10n.heartRateSymbol,
                              title: l10n.heartRate,
                              normalRange: l10n.heartRateNormalRangeValues,
                              description: l10n.heartRateDescription,
                              image: ImageConstant.heartRate,
                              primaryValue:
                                  state.screeningResultAssessment?.heartRate,
                              name: 'Heart Rate',
                              isNormal: isHeartRateNormal,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: _buildVitalCard(
                              symbol: l10n.readinessIndexSymbol,
                              title: l10n.readinessIndex,
                              normalRange: l10n.readinessIndexNormalRangeValues,
                              description: l10n.readinessIndexDescription,
                              image: ImageConstant.readinessIndex,
                              primaryValue: state
                                  .screeningResultAssessment?.readinessIndex,
                              secondaryValue: 100,
                              name: 'Mental Readiness',
                              isNormal: isReadinessIndexNormal,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: _buildVitalCardWithLink(
                              name: 'Fatigue',
                              image: ImageConstant.fatigue,
                              onTapCallback: () {
                                appBloc.add(
                                  AppNextRoutePath(
                                    context,
                                    'Driver Assistant',
                                    '/screening/driver-assistant',
                                    '',
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.1,
                child: _buildFooter(context, state),
              )
            ],
          ),
        );
      }
    }
    return Container();
  }

  Widget _buildFooter(BuildContext context, WebScreeningState state) {
    final l10n = context.l10n;
    const message = 'Hello';
    final bloc = context.read<WebScreeningBloc>();

    if (state.screeningStatus == ScreeningStatus.record ||
        state.screeningStatus == ScreeningStatus.firstResult) {
      return Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 4),
        child: Column(
          children: [
            AutoSizeText(
              'Keep your finger still',
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
                countdownTotal: state.screenCountdownTotalTime,
                countdownCurrentColor: Colors.transparent,
                countdownRemainingColor: Colors.transparent,
                countdownTotalColor: Colors.transparent,
                textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
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
      );
    }

    if (state.screeningStatus == ScreeningStatus.warmDown) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Center(
          child: AutoSizeText(
            'The analysis results will be available in seconds',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      );
    }

    if (state.screeningStatus == ScreeningStatus.completed) {
      final result = state.screeningResultAssessment;
      final heartRate = result?.heartRate;
      final readinessIndex = result?.readinessIndex;
      final appBloc = context.read<AppBloc>();

      if (heartRate != null &&
          heartRate > 0 &&
          readinessIndex != null &&
          readinessIndex > 0) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          child: RoundedButton(
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
        );
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Column(
            children: [
              AutoSizeText(
                'Something went wrong',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.redAccent,
                    ),
              ),
              RoundedButton(
                onPressed: () {
                  appBloc.add(
                    AppNextRoutePath(
                      context,
                      'Face scan',
                      '/screening',
                      '',
                    ),
                  );
                },
                title: 'Try again',
              )
            ],
          ),
        );
      }
    }

    return Container();
  }

  Widget _buildVitalCard({
    required String symbol,
    required String title,
    required String normalRange,
    required String description,
    required String image,
    required double? primaryValue,
    required String name,
    int fractionDigits = 0,
    double? secondaryValue,
    String? unit,
    bool isNormal = true,
  }) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColourConstant.black1E1F2B.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            // width: boxSize,
            margin: const EdgeInsets.only(
              top: 10,
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: AutoSizeText(
                    name,
                    minFontSize: 8,
                    maxFontSize: 18,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 8),
                if (primaryValue == null)
                  _buildLoaderWidget()
                else if (primaryValue < 0)
                  AutoSizeText(
                    '...',
                    minFontSize: 16,
                    maxFontSize: 32,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                  )
                else if ((name == 'BP' || name == 'Mental Readiness') &&
                    secondaryValue != null)
                  AutoSizeText(
                    '${primaryValue.toStringAsFixed(fractionDigits)}/${secondaryValue.toStringAsFixed(fractionDigits)}${unit != null ? ' $unit' : ''}',
                    minFontSize: 16,
                    maxFontSize: 32,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                  )
                else
                  AutoSizeText(
                    minFontSize: 16,
                    maxFontSize: 32,
                    '${primaryValue.toStringAsFixed(fractionDigits)} ${unit ?? ''}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                  ),
              ],
            ),
          ),
          if (primaryValue != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  isNormal ? ImageConstant.greenTick : ImageConstant.redAlert,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLoaderWidget({double? width = 16, double? height = 16}) {
    return SizedBox(
      height: height,
      width: width,
      child: const CircularProgressIndicator(
        color: AppColourConstant.whiteEFF3FB,
      ),
    );
  }

  Widget _buildVitalCardWithLink({
    required String name,
    required String image,
    required VoidCallback onTapCallback,
  }) {
    return InkWell(
      onTap: onTapCallback,
      child: Container(
        decoration: BoxDecoration(
          color: AppColourConstant.black1E1F2B.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(
          top: 10,
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (name.isNotEmpty)
              AutoSizeText(
                name,
                minFontSize: 8,
                maxFontSize: 18,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
              ),
            const SizedBox(height: 5),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
