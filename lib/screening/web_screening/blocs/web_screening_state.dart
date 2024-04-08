part of 'web_screening_bloc.dart';

class ScreeningResultAssessment {
  ScreeningResultAssessment({
    this.bodyTemperature,
    this.heartRate,
    this.heartRateVariability,
    this.readinessIndex,
    this.stressIndex,
    this.respiratoryRate,
    this.systolicBloodPressure,
    this.diastolicBloodPressure,
    this.vo2Max,
  });

  final double? bodyTemperature;
  final double? heartRate;
  final double? heartRateVariability;
  final double? readinessIndex;
  final double? stressIndex;
  final double? respiratoryRate;
  final double? systolicBloodPressure;
  final double? diastolicBloodPressure;
  final double? vo2Max;
}

class WebScreeningState {
  const WebScreeningState({
    this.assessment,
    this.screeningResultAssessment,
    this.stressLevel,
    this.cameraPermissionStatus = PermissionStatus.granted,
    this.screenCountdownTotalTime = 5,
    this.screenCountdownRemainingTime = 5,
    this.warmUpCountdownTotalTime = 5,
    this.warmUpCountdownRemainingTime = 5,
    this.screeningMessage,
    this.screeningStatus = ScreeningStatus.start,
    this.mediaDevices,
    this.mediaStream,
    this.mediaRecorder,
    this.videoRenderer,
    this.isBrowserSupported = true,
    this.isLoading = true,
    this.bodyTemperature,
  });

  final Assessment? assessment;
  final ScreeningResultAssessment? screeningResultAssessment;
  final StressLevel? stressLevel;
  final PermissionStatus? cameraPermissionStatus;
  final int screenCountdownTotalTime;
  final int screenCountdownRemainingTime;
  final int warmUpCountdownTotalTime;
  final int warmUpCountdownRemainingTime;
  final String? screeningMessage;
  final ScreeningStatus? screeningStatus;
  final List<MediaDeviceInfo>? mediaDevices;
  final MediaStream? mediaStream;
  final MediaRecorder? mediaRecorder;
  final RTCVideoRenderer? videoRenderer;
  final bool isBrowserSupported;
  final bool isLoading;
  final double? bodyTemperature;

  WebScreeningState copyWith({
    Assessment? assessment,
    ScreeningResultAssessment? screeningResultAssessment,
    StressLevel? stressLevel,
    PermissionStatus? cameraPermissionStatus,
    int? screenCountdownTotalTime,
    int? screenCountdownRemainingTime,
    int? warmUpCountdownTotalTime,
    int? warmUpCountdownRemainingTime,
    String? screeningMessage,
    ScreeningStatus? screeningStatus,
    List<MediaDeviceInfo>? mediaDevices,
    MediaStream? mediaStream,
    MediaRecorder? mediaRecorder,
    RTCVideoRenderer? videoRenderer,
    bool? isBrowserSupported,
    bool? isLoading,
    double? bodyTemperature,
  }) {
    return WebScreeningState(
      assessment: assessment ?? this.assessment,
      screeningResultAssessment:
          screeningResultAssessment ?? this.screeningResultAssessment,
      stressLevel: stressLevel ?? this.stressLevel,
      cameraPermissionStatus:
          cameraPermissionStatus ?? this.cameraPermissionStatus,
      screenCountdownTotalTime:
          screenCountdownTotalTime ?? this.screenCountdownTotalTime,
      screenCountdownRemainingTime:
          screenCountdownRemainingTime ?? this.screenCountdownRemainingTime,
      warmUpCountdownTotalTime:
          warmUpCountdownTotalTime ?? this.warmUpCountdownTotalTime,
      warmUpCountdownRemainingTime:
          warmUpCountdownRemainingTime ?? this.warmUpCountdownRemainingTime,
      screeningMessage: screeningMessage ?? this.screeningMessage,
      screeningStatus: screeningStatus ?? this.screeningStatus,
      mediaDevices: mediaDevices ?? this.mediaDevices,
      mediaStream: mediaStream ?? this.mediaStream,
      mediaRecorder: mediaRecorder ?? this.mediaRecorder,
      videoRenderer: videoRenderer ?? this.videoRenderer,
      isBrowserSupported: isBrowserSupported ?? this.isBrowserSupported,
      isLoading: isLoading ?? this.isLoading,
      bodyTemperature: bodyTemperature ?? this.bodyTemperature,
    );
  }
}
