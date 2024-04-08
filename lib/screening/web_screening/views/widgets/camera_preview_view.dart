part of '../web_screening_page.dart';

class CameraPreviewView extends StatelessWidget {
  const CameraPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WebScreeningBloc, WebScreeningState, RTCVideoRenderer?>(
      selector: (state) => state.videoRenderer,
      builder: (context, videoRenderer) {
        if (videoRenderer == null) {
          return const SizedBox.shrink();
        }
        return Transform.scale(
          scale: 0.99,
          child: Center(
            child: RTCVideoView(
              videoRenderer,
              mirror: true,
              filterQuality: FilterQuality.high,
              objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
            ),
          ),
        );
      },
    );
  }
}
