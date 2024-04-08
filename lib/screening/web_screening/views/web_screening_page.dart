// Dart imports:
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'dart:math' as math show sin, cos, pi, pow, min;

// Flutter imports:
import 'package:bonfirehealth/global.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sinusoidals/flutter_sinusoidals.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/extensions/double_extensions.dart';
import 'package:bonfirehealth/app/widgets/footer_view_wrapper.dart';
import 'package:bonfirehealth/groups/groups.dart';
import 'package:bonfirehealth/profile/profile.dart';
import 'package:bonfirehealth/screening/screening.dart';

part 'widgets/animated_count.dart';
part 'widgets/camera_preview_view.dart';
part 'widgets/face_overlay.dart';
part 'widgets/not_supported_view.dart';
part 'widgets/permission_denied_view.dart';
part 'widgets/screen_countdown_timer.dart';
part 'widgets/screening_header.dart';
part 'widgets/screening_results_view.dart';
part 'widgets/vital_box_loader.dart';
part 'widgets/vital_box_summary_card.dart';
part 'widgets/vital_box.dart';
part 'widgets/vital_boxes_loader.dart';
part 'widgets/vital_boxes.dart';
part 'widgets/warm_up_confirmation.dart';
part 'widgets/warm_up_countdown_timer.dart';
part 'widgets/web_screening_floating_action_button.dart';
part 'widgets/background.dart';

class WebScreeningPage extends StatefulWidget {
  const WebScreeningPage({super.key});

  @override
  State<WebScreeningPage> createState() => _WebScreeningPageState();
}

class _WebScreeningPageState extends State<WebScreeningPage> {
  // @override
  // void dispose() {
  //   context.read<WebScreeningBloc>().add(const WebScreeningDispose());

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WebScreeningBloc>(
      create: (BuildContext context) => WebScreeningBloc(),
      child: const Scaffold(
        body: SafeArea(
          top: false,
          child: WebScreeningBody(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: WebScreeningFloatingActionButton(),
      ),
    );
  }
}

class WebScreeningBody extends StatefulWidget {
  const WebScreeningBody({super.key});

  @override
  State<WebScreeningBody> createState() => _WebScreeningBodyState();
}

class _WebScreeningBodyState extends State<WebScreeningBody>
    with AfterLayoutMixin<WebScreeningBody> {
  @override
  void afterFirstLayout(BuildContext context) {
    context.read<WebScreeningBloc>().add(WebScreeningInitSet(context));
    context.read<ProfileHomeBloc>().add(const ProfileHomeInitSet());
    context.read<GroupsBloc>()
      ..add(const GroupsAllGroupsGet())
      ..add(const GroupsAllGroupTypesGet())
      ..add(const GroupsCreateGroupStreamUnsubscribe())
      ..add(const GroupsUpdateGroupStreamUnsubscribe())
      ..add(const GroupsCreateGroupStreamSubscribe())
      ..add(const GroupsUpdateGroupStreamSubscribe())
      ..add(GroupsFirstGroupSelect(context));
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return BlocBuilder<WebScreeningBloc, WebScreeningState>(
      builder: (context, state) {
        if (!state.isBrowserSupported) {
          return const NotSupportedView();
        }

        // if (state.cameraPermissionStatus == PermissionStatus.denied) {
        //   return const PermissionDeniedView();
        // }

        return DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColourConstant.black1E1F2B,
          ),
          child: Stack(
            children: [
              const CameraPreviewView(),
              // if (state.isLoading) ...[
              //   const Center(
              //     child: SpinKitCircle(
              //       color: AppColourConstant.whiteFFFFFF,
              //     ),
              //   ),
              // ],
              if (state.screeningStatus == ScreeningStatus.confirmation ||
                  state.screeningStatus == ScreeningStatus.warmUp ||
                  state.screeningStatus == ScreeningStatus.record ||
                  state.screeningStatus == ScreeningStatus.predict ||
                  state.screeningStatus == ScreeningStatus.firstResult ||
                  state.screeningStatus == ScreeningStatus.warmDown ||
                  state.screeningStatus == ScreeningStatus.completed) ...[
                const WarmUpConfirmation(),
              ],
              // if (state.screeningStatus == ScreeningStatus.warmUp) ...[
              //   const WarmUpCountdownTimer(),
              // ],
              // if (state.screeningStatus == ScreeningStatus.record ||
              //     state.screeningStatus == ScreeningStatus.predict) ...[
              //   const ScreenCountdownTimer(),
              // ],
              // if (state.screeningMessage != null &&
              //     state.screeningMessage != '')
              //   const ScreeningHeader(),

              // if (state.screeningStatus == ScreeningStatus.record ||
              //     state.screeningStatus == ScreeningStatus.predict ||
              //     state.screeningStatus == ScreeningStatus.firstResult ||
              //     state.screeningStatus == ScreeningStatus.warmDown ||
              //     state.screeningStatus == ScreeningStatus.completed) ...[
              //   const ScreeningResultsView(),
              // ],
            ],
          ),
        );
      },
    );
  }
}
