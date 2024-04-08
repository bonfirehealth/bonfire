// ignore_for_file: use_build_context_synchronously

// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teledart/model.dart';
import 'package:universal_html/html.dart' as html;

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/extensions/double_extensions.dart';
import 'package:bonfirehealth/app/repositories/telegram_bot_repo.dart';
import 'package:bonfirehealth/profile/profile.dart';
import 'package:bonfirehealth/screening/screening.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'web_screening_event.dart';
part 'web_screening_state.dart';

enum ScreeningStatus {
  setup,
  start,
  confirmation,
  warmUp,
  record,
  predict,
  firstResult,
  warmDown,
  completed,
}

class WebScreeningBloc extends Bloc<WebScreeningEvent, WebScreeningState> {
  WebScreeningBloc() : super(const WebScreeningState()) {
    on<WebScreeningInitSet>(_onWebScreeningInitSet);
    on<WebScreeningIsLoadingSet>(_onWebScreeningIsLoadingSet);
    on<WebScreeningStart>(_onWebScreeningStart);
    on<WebScreeningStop>(_onWebScreeningStop);
    on<WebScreeningScreenCountdownUpdated>(
      _onWebScreeningScreenCountdownUpdated,
    );
    on<WebScreeningScreenCountdownFinished>(
      _onWebScreeningScreenCountdownFinished,
    );
    on<WebScreeningCompleted>(
      _onWebScreeningCompleted,
    );
    on<WebScreeningTerminated>(
      _onWebScreeningTerminated,
    );
    on<WebScreeningWarmUpStart>(
      _onWebScreeningWarmUpStart,
    );
    on<WebScreeningWarmUpCountdownUpdated>(
      _onWebScreeningWarmUpCountdownUpdated,
    );
    on<WebScreeningWarmUpCountdownFinished>(
      _onWebScreeningWarmUpCountdownFinished,
    );
    on<WebScreeningFirstResultSet>(_onWebScreeningFirstResultSet);
    on<WebScreeningPredictStatusSet>(_onWebScreeningPredictStatusSet);
    on<WebScreeningRecordStatusSet>(_onWebScreeningRecordStatusSet);
    on<WebScreeningWarmUpStatusSet>(_onWebScreeningWarmUpStatusSet);
    on<WebScreeningAssessmentSet>(_onWebScreeningAssessmentSet);
    on<WebScreeningResultAssessmentSet>(_onWebScreeningResultAssessmentSet);
    on<WebScreeningStressLevelSet>(_onWebScreeningStressLevelSet);
    on<WebScreeningBodyTemperatureSet>(_onWebScreeningBodyTemperatureSet);
    on<WebScreeningDispose>(_onWebScreeningDispose);
  }
  @override
  Future<void> close() async {
    add(const WebScreeningDispose());
    await super.close();
  }

  Future<void> _onWebScreeningInitSet(
    WebScreeningInitSet event,
    Emitter<WebScreeningState> emit,
  ) async {
    // Warm-up the Lambda functions
    // unawaited(
    //   AmplifyRepo.predictVitalSigns(
    //     'private/screening_video_test.mp4',
    //     'screening_video_test.mp4',
    //     'HR',
    //     30,
    //     weight: 72,
    //     height: 165,
    //     age: 30,
    //     gender: 'male',
    //     isDeleteVideo: false,
    //   ),
    // );
    // unawaited(
    //   AmplifyRepo.predictBodyTemperature(
    //     'private/screening_video_test.mp4',
    //     'screening_video_test.mp4',
    //   ),
    // );

    final checkBrowserTuple =
        await WebRTCHelper.checkMobileBrowserCompatibility();
    final browserName = checkBrowserTuple.item1;
    final isBrowserSupported = checkBrowserTuple.item2;
    // emit(
    //   state.copyWith(
    //     isBrowserSupported: isBrowserSupported,
    //   ),
    // );

    try {
      var mediaConstraints =
          WebRTCHelper.setMediaConstraintsByBrowser(browserName);

      // ignore: avoid_dynamic_calls
      mediaConstraints['video']['facingMode'] = 'environment';
      final videoRenderer = state.videoRenderer ?? RTCVideoRenderer();
      await videoRenderer.initialize();
      var mediaDevices = await navigator.mediaDevices.enumerateDevices();
      mediaDevices = mediaDevices.where((d) => d.kind == 'videoinput').toList();

      var mediaStream =
          await navigator.mediaDevices.getUserMedia(mediaConstraints);
      if (browserName == BrowserName.safari) {
        mediaStream =
            await navigator.mediaDevices.getUserMedia(mediaConstraints);
      }

      videoRenderer.srcObject = mediaStream;
      emit(state.copyWith(videoRenderer: videoRenderer));

      if (isBrowserSupported) {
        emit(
          state.copyWith(
            cameraPermissionStatus:
                await WebRTCHelper.checkMobileBrowserCameraPermissionStatus(),
          ),
        );
      }

      emit(
        state.copyWith(
          mediaDevices: mediaDevices,
          mediaStream: mediaStream,
          mediaRecorder: MediaRecorder(),
          screenCountdownTotalTime: 40,
          screenCountdownRemainingTime: 5,
          warmUpCountdownTotalTime: 5,
          warmUpCountdownRemainingTime: 5,
          screeningMessage: '',
        ),
      );

      add(const WebScreeningIsLoadingSet(isLoading: false));
      emit(state.copyWith(screeningStatus: ScreeningStatus.confirmation));
    } catch (e, s) {
      // if (isBrowserSupported) {
      //   var isDenied = false;
      //   if (browserName == BrowserName.safari) {
      //     isDenied = e.toString().contains('denied');
      //   }
      //   emit(
      //     state.copyWith(
      //       cameraPermissionStatus:
      //           await WebRTCHelper.checkMobileBrowserCameraPermissionStatus(
      //         isDenied: isDenied,
      //       ),
      //     ),
      //   );
      // }
      logInfo(e.toString());
      await Sentry.captureException(e, stackTrace: s);
    }
  }

  void _onWebScreeningIsLoadingSet(
    WebScreeningIsLoadingSet event,
    Emitter<WebScreeningState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  /// Handles the start of web screening when a [WebScreeningStart] event is received.
  ///
  /// This function sets up the initial state, performs necessary checks, and
  /// triggers actions related to starting a web screening session.
  ///
  /// Parameters:
  ///   - `event`: The [WebScreeningStart] event triggering the function.
  ///   - `emit`: Emitter for updating the [WebScreeningState].
  Future<void> _onWebScreeningStart(
    WebScreeningStart event,
    Emitter<WebScreeningState> emit,
  ) async {
    // Set loading state and reset body temperature in the state
    add(const WebScreeningIsLoadingSet());
    add(const WebScreeningBodyTemperatureSet(null));

    // Obtain the context and profile home BLoC from the event
    final context = event.context;
    final profileHomeBloc = context.read<ProfileHomeBloc>();

    // Check mobile browser compatibility using WebRTCHelper
    final browserName = await _getBrowserName();

    // Retrieve user profile information
    final profileInfo = await _getProfileInfo();

    // Retrieve the media stream from the current state
    final mediaStream = state.mediaStream;

    await CoreRepo.init();

    // Fetch all self-cares and find the 'Slow Down' self-care
    final selfCares = await SelfCareRepo.getAllSelfCares();
    final activeSelfCare =
        selfCares?.firstWhere((element) => element.name == 'Slow Down');
    final selfCareId = activeSelfCare?.id;

    // Create a self-care usage record for the active self-care
    await SelfCareUsageRepo.createSelfCareUsage(selfCareID: selfCareId);

    // Get the current date and create an assessment record
    final date = DateTime.now();
    final response3 = await AssessmentRepo.createAssessment(
      selfCareId: activeSelfCare?.id,
      startDate: date,
      endDate: date,
    );

    // Log information about the assessment creation response
    logInfo('response3');
    logInfo(response3);
    logInfo(response3?.item1);

    // Create a profile activity if the active self-care has an associated activity
    if (activeSelfCare?.activity?.id != null) {
      await ActivityRepo.createProfileActivity(
        activityId: activeSelfCare?.activity?.id,
      );
    }

    // Set loading state to false and update the state with assessment details
    add(const WebScreeningIsLoadingSet(isLoading: false));
    add(WebScreeningRecordStatusSet(context));
    add(WebScreeningAssessmentSet(response3?.item1));

    // Initialize variables for video processing
    var numSlices = 0;
    final blobs = <html.Blob>[];

    final mediaRecorder = state.mediaRecorder;
    mediaRecorder?.startWeb(
      mediaStream!,
      mimeType: browserName == BrowserName.safari ? 'video/mp4' : 'video/webm',
      onDataChunk: (dynamic blob, bool isLastOne) async {
        final newBlob = blob as html.Blob;
        if (newBlob.size > 0) {
          blobs.add(newBlob);
          numSlices++;
          logInfo('numSlices: $numSlices');

          if (numSlices == 10) {
            // Calculate heart rate and blodd pressure metrics after 10 seconds
            final videoBlob = html.Blob(blobs, newBlob.type);
            unawaited(
              _updateHeartRate(
                videoBlob,
                profileHomeBloc,
                profileInfo,
              ),
            );
          } else if (numSlices == 29) {
            // Calculate readiness index after 30 seconds
            final videoBlob = html.Blob(blobs, newBlob.type);
            unawaited(
              _updateReadinessIndex(
                videoBlob,
                profileHomeBloc,
                profileInfo,
              ),
            );
          }
          // else if (numSlices == 59) {
          //   // Calculate VO2-max after 60 seconds
          //   final videoBlob = html.Blob(blobs, newBlob.type);
          //   unawaited(_updateVO2Max(videoBlob, profileInfo));
          // }
        }
      },
    );
  }

  /// Updates heart rate based on the provided video blob.
  ///
  /// This function processes a screening video, predicts vital signs, and updates
  /// the assessment with the calculated values.
  ///
  /// Parameters:
  ///   - `blob`: The video blob to be processed.
  ///   - `profileHomeBloc`: The profile home BLoC for accessing user profile information.
  ///
  /// Throws:
  ///   - Exceptions captured during video processing or vital signs prediction are logged using Sentry.
  Future<void> _updateHeartRate(
    html.Blob blob,
    ProfileHomeBloc profileHomeBloc,
    Map<String, dynamic> profileInfo,
  ) async {
    logInfo('_updateHeartRate start');

    // Retrieve the name of the browser being used
    final browserName = await _getBrowserName();

    // Generate unique object keys for video processing
    final objectKeys = await _generateVideoName();

    // Default frames per second value
    var framesPerSecond = 30.0;

    // Placeholder for predicted vital signs data
    Map<String, dynamic>? predictVitalSignsData = <String, dynamic>{};

    try {
      // Process the screening video using Amplify Repo
      final uploadedInputVideoUri =
          await MediaHelper.uploadVideoToS3BucketByPresignedUrl(
        blob,
        objectKeys['inputObjectKey']!,
      );

      if (uploadedInputVideoUri == null) {
        // Terminate all if caught
        add(const WebScreeningTerminated());

        logError('_updateHeartRate_processScreeningVideo() error');
        return;
      }

      // Update frames per second from the video processing response
      // framesPerSecond = uploadResponse['frames_per_second'] as double;
    } catch (e, s) {
      // Terminate all if caught
      add(const WebScreeningTerminated());

      // Capture and log exceptions using Sentry
      logError('_updateHeartRate() error: $e');
      await Sentry.captureException(e, stackTrace: s);
      return;
    }

    try {
      logInfo('objectKeys: $objectKeys');

      final inputVideoUri = await getPresignedUrl(
        // genPresignedUrlFunctionEndpoint,
        // bucket,
        objectKeys['inputObjectKey']!,
        action: 'get_object',
      );

      // Predict vital signs based on processed video
      const metrics = 'HR';
      predictVitalSignsData = await AmplifyRepo.predictVitalSigns(
        // objectKeys['outputObjectKey']!,
        inputVideoUri.toString(),
        objectKeys['inputObjectKey']!.split('/').last,
        metrics,
        framesPerSecond,
        weight: profileInfo['weight'] as double,
        height: (profileInfo['height'] as double) / 100.0,
        age: profileInfo['age'] as int,
        gender: (profileInfo['gender'] as String).toLowerCase(),
        readinessHistory: [],
      );

      logInfo('predictVitalSignsData: $predictVitalSignsData');

      if (predictVitalSignsData == null) {
        add(const WebScreeningTerminated());
        unawaited(MediaHelper.deleteFileS3(objectKeys['inputObjectKey']!));
        return;
      }

      // Update the assessment with the predicted vital signs if assessment ID is available
      final assessment = state.assessment;
      if (assessment?.id != null) {
        final heartRate = predictVitalSignsData['heart_rate'] as double;
        final heartRateVariability =
            predictVitalSignsData['heart_rate_variability'] as double;
        // final systolicBloodPressure =
        //     predictVitalSignsData['systolic_blood_pressure'] as double;
        // final diastolicBloodPressure =
        //     predictVitalSignsData['diastolic_blood_pressure'] as double;

        // Add the updated assessment to the state
        add(const WebScreeningFirstResultSet());
        add(
          WebScreeningResultAssessmentSet(
            ScreeningResultAssessment(
              // bodyTemperature: state.bodyTemperature,
              heartRate: heartRate,
              heartRateVariability: heartRateVariability,
              // systolicBloodPressure: systolicBloodPressure,
              // diastolicBloodPressure: diastolicBloodPressure,
            ),
          ),
        );
      }

      logInfo('_updateHeartRate end');
    } catch (e, s) {
      // Terminate all if caught
      add(const WebScreeningTerminated());
      unawaited(MediaHelper.deleteFileS3(objectKeys['inputObjectKey']!));

      await Sentry.captureException(e, stackTrace: s);
      logInfo('Error $e');
      //
    }
  }

  Future<void> _updateReadinessIndex(
    html.Blob blob,
    ProfileHomeBloc profileHomeBloc,
    Map<String, dynamic> profileInfo,
  ) async {
    logInfo('_updateReadinessIndex start');

    // Retrieve the name of the browser being used
    final browserName = await _getBrowserName();

    // Generate unique object keys for video processing
    final objectKeys = await _generateVideoName();

    // Default frames per second value
    var framesPerSecond = 30.0;

    // Placeholder for predicted vital signs data
    Map<String, dynamic>? predictVitalSignsData = <String, dynamic>{};

    Uri? uploadedInputVideoUri;

    // Upload video to S3
    try {
      logInfo('Processing video $objectKeys');
      uploadedInputVideoUri =
          await MediaHelper.uploadVideoToS3BucketByPresignedUrl(
        blob,
        objectKeys['inputObjectKey']!,
      );

      if (uploadedInputVideoUri == null) {
        // Terminate all if caught
        add(const WebScreeningTerminated());

        logError('_updateReadinessIndex_processScreeningVideo() error');
        return;
      }
    } catch (e, s) {
      // Terminate all if caught
      add(const WebScreeningTerminated());

      logError('_updateReadinessIndex() error: $e');
      await Sentry.captureException(e, stackTrace: s);
      return;
    }

    try {
      // Get user's readiness history
      final assessmentResp = await AssessmentRepo.getAllAssessmentsByProfileID(
          profileInfo['id'] as String);
      final history = <Map<String, dynamic>>[];
      for (final assessment in assessmentResp!) {
        if (assessment.kbType != null &&
            assessment.profileID == profileInfo['id'] &&
            assessment.kbArtefactLevel == 'GOOD') {
          history.add(
            {
              'type': 'readiness',
              'artefact': assessment.kbArtefact,
              'artefact_level': assessment.kbArtefactLevel,
              'create_timestamp': assessment.kbCreateTimestamp,
              'mean_hr_bpm': assessment.kbMeanHrBpm,
              'mean_rr_ms': assessment.kbMeanRRMs,
              'pns_index': assessment.kbPnsIndex,
              'readiness': assessment.kbReadiness,
              'rmssd_ms': assessment.kbRmssdMs,
              'sd1_ms': assessment.kbSd1Ms,
              'sd2_ms': assessment.kbSd2Ms,
              'sdnn_ms': assessment.kbSdnnMs,
              'sns_index': assessment.kbSnsIndex,
              'stress_index': assessment.kbStressIndex ?? 0.0,
            },
          );
        }
      }

      final inputVideoUri = await getPresignedUrl(
        // genPresignedUrlFunctionEndpoint,
        // bucket,
        objectKeys['inputObjectKey']!,
        action: 'get_object',
      );

      // Predict vital signs
      const metrics = 'RI';
      predictVitalSignsData = await AmplifyRepo.predictVitalSigns(
        // objectKeys['outputObjectKey']!,
        inputVideoUri.toString(),
        objectKeys['inputObjectKey']!.split('/').last,
        metrics,
        framesPerSecond,
        convert: false,
        weight: profileInfo['weight'] as double,
        height: (profileInfo['height'] as double) / 100.0,
        age: profileInfo['age'] as int,
        gender: (profileInfo['gender'] as String).toLowerCase(),
        readinessHistory: history,
      );

      if (predictVitalSignsData == null) {
        add(const WebScreeningTerminated());
        unawaited(MediaHelper.deleteFileS3(objectKeys['inputObjectKey']!));
        return;
      }

      logInfo('predictVitalSigns result: $predictVitalSignsData');

      // Stress index is now taken from `readiness_index` value from Kubios's API
      final stressIndex = predictVitalSignsData['readiness_index'] as double;

      // Calculate sympathetic nervous system index
      final sympatheticNervousSystemIndex =
          predictVitalSignsData['sympathetic_nervous_system_index'] ??
              stressIndex;

      // Calculate stress level from the sympathetic nervous system index
      final stressLevel = LogicHelper.calculateStressLevel(
        (sympatheticNervousSystemIndex as double?) ?? 0,
      );

      add(WebScreeningStressLevelSet(stressLevel));

      // Update the state's assessment
      final assessment = state.assessment;
      if (assessment?.id != null) {
        // Extract Kubios's results from the response
        Map<String, dynamic> kubiosResult;
        if (predictVitalSignsData.containsKey('kubios_result') &&
            predictVitalSignsData['kubios_result'] != null) {
          kubiosResult =
              predictVitalSignsData['kubios_result'] as Map<String, dynamic>;
        } else {
          kubiosResult = {
            'artefact': null,
            'artefact_level': null,
            'create_timestamp': null,
            'mean_hr_bpm': -9999,
            'mean_rr_ms': -9999,
            'pns_index': -9999,
            'readiness': -9999,
            'respiratory_rate': -9999,
            'rmssd_ms': -9999,
            'sd1_ms': -9999,
            'sd2_ms': -9999,
            'sdnn_ms': -9999,
            'sns_index': -9999,
            'stress_index': -9999,
          };
        }

        // Add the updated assessment to the state
        add(
          WebScreeningResultAssessmentSet(
            ScreeningResultAssessment(
              // bodyTemperature: state.bodyTemperature,
              heartRate: state.screeningResultAssessment?.heartRate,
              heartRateVariability:
                  state.screeningResultAssessment?.heartRateVariability,
              // systolicBloodPressure:
              //     state.screeningResultAssessment?.systolicBloodPressure,
              // diastolicBloodPressure:
              //     state.screeningResultAssessment?.diastolicBloodPressure,
              readinessIndex: kubiosResult['readiness'] as double?,
              // In this case, readiness index would be assigned to stress index
              stressIndex: kubiosResult['stress_index'] as double?,
            ),
          ),
        );

        // Actually update the assessment
        final response2 = await AssessmentRepo.updateAssessment(
          assessmentId: assessment?.id,
          endDate: DateTime.now(),
          oxygenLevel: predictVitalSignsData['oxygen_level'] as double?,
          oxygenSaturationLevel:
              predictVitalSignsData['blood_oxygen_level'] as double?,
          respiratoryRate: predictVitalSignsData['respiratory_rate'] as double?,
          stressIndex: stressIndex,
          bodyTemperature: state.bodyTemperature,
          stressLevel: stressLevel.name.capitalizeFirstofEach,
          systolicBloodPressure:
              predictVitalSignsData['systolic_blood_pressure'] as double?,
          diastolicBloodPressure:
              predictVitalSignsData['diastolic_blood_pressure'] as double?,
          heartRate: predictVitalSignsData['heart_rate'] as double?,
          heartRateVariability:
              predictVitalSignsData['heart_rate_variability'] as double?,
          sympatheticNervousSystemIndex: sympatheticNervousSystemIndex,
          kbType: 'readiness',
          kbArtefact: kubiosResult['artefact'] as double?,
          kbArtefactLevel: kubiosResult['artefact_level'] as String?,
          kbCreateTimestamp: kubiosResult['create_timestamp'] as String?,
          kbMeanHrBpm: kubiosResult['mean_hr_bpm'] as double?,
          kbMeanRRMs: kubiosResult['mean_rr_ms'] as double?,
          kbPnsIndex: kubiosResult['pns_index'] as double?,
          kbReadiness: kubiosResult['readiness'] as double?,
          kbRmssdMs: kubiosResult['rmssd_ms'] as double?,
          kbSd1Ms: kubiosResult['sd1_ms'] as double?,
          kbSd2Ms: kubiosResult['sd2_ms'] as double?,
          kbSdnnMs: kubiosResult['sdnn_ms'] as double?,
          kbSnsIndex: kubiosResult['sns_index'] as double?,
          kbStressIndex: kubiosResult['stress_index'] as double?,
        );

        // Insert an assessment
        add(WebScreeningAssessmentSet(response2?.item1));

        // Calculate body mass index
        double? bodyMassIndex;
        if (profileHomeBloc.user != null) {
          final weight = profileHomeBloc.user?.profile?.weight;
          final height = profileHomeBloc.user?.profile?.height;
          if (weight != null && height != null) {
            bodyMassIndex = LogicHelper.calculateBodyMassIndex(weight, height);
          }
        }

        // Send an error notification to Telegram
        if (response2?.item1 != null) {
          unawaited(_sendTelegramMessage(response2!.item1!));
        }

        // Update user's profile with the latest assessment
        await ProfileRepo.updateProfile(
          bodyMassIndex: bodyMassIndex,
          oxygenLevel: predictVitalSignsData['oxygen_level'] as double?,
          oxygenSaturationLevel:
              predictVitalSignsData['blood_oxygen_level'] as double?,
          respiratoryRate: predictVitalSignsData['respiratory_rate'] as double?,
          stressIndex: stressIndex,
          bodyTemperature: state.bodyTemperature,
          stressLevel: getStressLevelName(stressLevel),
          systolicBloodPressure:
              predictVitalSignsData['systolic_blood_pressure'] as double?,
          diastolicBloodPressure:
              predictVitalSignsData['diastolic_blood_pressure'] as double?,
          heartRate: predictVitalSignsData['heart_rate'] as double?,
          heartRateVariability:
              predictVitalSignsData['heart_rate_variability'] as double?,
          sympatheticNervousSystemIndex: sympatheticNervousSystemIndex,
          version: profileInfo['version'] as int,
        );
      }

      logInfo('_updateReadinessIndex end');

      add(const WebScreeningCompleted());

    } catch (e, s) {
      // Terminate all if caught
      add(const WebScreeningTerminated());
      unawaited(MediaHelper.deleteFileS3(objectKeys['inputObjectKey']!));

      await Sentry.captureException(e, stackTrace: s);
    }
  }

  /// Retrieves the name of the current browser asynchronously.
  ///
  /// This function uses WebRTCHelper to check the mobile browser compatibility
  /// and returns the name of the browser as a Future<BrowserName>.
  Future<BrowserName> _getBrowserName() async {
    // Check mobile browser compatibility using WebRTCHelper
    final checkBrowserTuple =
        await WebRTCHelper.checkMobileBrowserCompatibility();

    // Retrieve the browser name from the tuple
    final browserName = checkBrowserTuple.item1;
    return browserName;
  }

  /// Generates unique video object keys for input and output based on the current browser.
  ///
  /// This function retrieves the browser name, user sub ID from shared preferences,
  /// and generates unique object keys for screening videos.
  ///
  /// Returns a Map<String, String> with 'inputObjectKey' and 'outputObjectKey'.
  Future<Map<String, String>> _generateVideoName() async {
    // Retrieve the current browser name
    final browserName = await _getBrowserName();

    // Retrieve user sub ID from shared preferences
    final sharedPrefs = await SharedPreferences.getInstance();
    final userSubId = sharedPrefs.getString('user_sub_id');

    // Generate a unique object ID
    final objectId = generateId();

    // Construct the object key for video processing
    final objectKey =
        'private/${AmplifyConstant.awsLambdaRegion}:$userSubId/screenings/$objectId';

    // Determine the video extension based on the browser type
    final videoExtensionFile =
        browserName == BrowserName.safari ? '.mp4' : '.webm';

    // Create input and output object keys
    final inputObjectKey = '$objectKey$videoExtensionFile';
    final outputObjectKey = '$objectKey.mp4';

    return {
      'inputObjectKey': inputObjectKey,
      'outputObjectKey': outputObjectKey
    };
  }

  Future<Map<String, dynamic>> _getProfileInfo() async {
    final response = await ProfileRepo.getProfile();

    return {
      'id': response?.item1?.id,
      'weight': response?.item1?.weight ?? 0,
      'height': response?.item1?.height ?? 0,
      'age': response?.item1?.age ?? 0,
      'gender': response?.item1?.gender ?? '',
      'version': response?.item2 ?? 1,
    };
  }

  Future<void> _sendTelegramMessage(Assessment assessment) async {
    final resp = await UserRepo.getUser();
    final user = resp?.item1;
    final telegramId = user?.organisations?.first.organisation.telegramId;

    var message = 'FIN number: ${user?.username}\n\nHealth warning signs:\n';

    var heartRate = 0.0;
    var readinessIndex = 0.0;
    var heartRateVariability = 0.0;
    var bodyTemperature = 0.0;
    var oxygenSaturationLevel = 0.0;
    var respiratoryRate = 0.0;
    var systolicBloodPressure = 0.0;
    var diastolicBloodPressure = 0.0;

    if (assessment.heartRate != null && assessment.heartRate != -9999) {
      heartRate = assessment.heartRate!;
    }

    if (assessment.stressIndex != null && assessment.stressIndex != -9999) {
      readinessIndex = assessment.stressIndex!;
    }

    if (assessment.heartRateVariability != null &&
        assessment.heartRateVariability != -9999) {
      heartRateVariability = assessment.heartRateVariability!;
    }
    if (assessment.bodyTemperature != null &&
        assessment.bodyTemperature != -9999) {
      bodyTemperature = assessment.bodyTemperature!;
    }
    if (assessment.oxygenSaturationLevel != null &&
        assessment.oxygenSaturationLevel != -9999) {
      oxygenSaturationLevel = assessment.oxygenSaturationLevel!;
    }
    if (assessment.respiratoryRate != null &&
        assessment.respiratoryRate != -9999) {
      respiratoryRate = assessment.respiratoryRate!;
    }
    if (assessment.systolicBloodPressure != null &&
        assessment.systolicBloodPressure != -9999) {
      systolicBloodPressure = assessment.systolicBloodPressure!;
    }
    if (assessment.diastolicBloodPressure != null &&
        assessment.diastolicBloodPressure != -9999) {
      diastolicBloodPressure = assessment.diastolicBloodPressure!;
    }

    final isHeartRateNormal = VitalSign.heartRate.isNormal(heartRate);
    if (!isHeartRateNormal) {
      message += '- Heart Rate: ${heartRate.fixedDecimals()}\n';
    }

    final isReadinessIndexNormal =
        VitalSign.readinessIndex.isNormal(readinessIndex);
    if (!isReadinessIndexNormal) {
      message += '- Readiness Index: ${readinessIndex.fixedDecimals()}/100\n';
    }

    final isHeartRateVariabilityNormal =
        VitalSign.heartRateVariability.isNormal(heartRateVariability);
    if (!isHeartRateVariabilityNormal) {
      message +=
          '- Heart Rate Variability: ${heartRateVariability.fixedDecimals()}\n';
    }

    final isBodyTemperatureNormal =
        VitalSign.temperature.isNormal(bodyTemperature);
    if (!isBodyTemperatureNormal) {
      message += '- Temperature: ${bodyTemperature.fixedDecimals(
        decimals: 1,
        removeZeroDecimals: false,
      )}\n';
    }

    final isOxygenSaturationLevelNormal =
        VitalSign.oxygenSaturationLevel.isNormal(oxygenSaturationLevel);
    if (!isOxygenSaturationLevelNormal) {
      message +=
          '- Blood Oxygen Level: ${oxygenSaturationLevel.fixedDecimals()}\n';
    }

    final isRespiratoryRateNormal =
        VitalSign.respiratoryRate.isNormal(respiratoryRate);
    if (!isRespiratoryRateNormal) {
      message += '- Respiratory Rate: ${respiratoryRate.fixedDecimals()}\n';
    }

    final isBloodPressureNormal = VitalSign.bloodPressure.isNormal(
      systolicBloodPressure,
      secondaryValue: diastolicBloodPressure,
    );
    if (!isBloodPressureNormal) {
      message +=
          '- Blood Pressure: ${systolicBloodPressure.fixedDecimals()}/${diastolicBloodPressure.fixedDecimals()}\n';
    }

    if (!isHeartRateNormal ||
        !isReadinessIndexNormal ||
        !isHeartRateVariabilityNormal ||
        !isBodyTemperatureNormal ||
        !isOxygenSaturationLevelNormal ||
        !isRespiratoryRateNormal ||
        !isBloodPressureNormal) {
      await TelegramBotRepo.checkAndSendToFamilyMemberOwner(message);
      if (telegramId == null || telegramId.isEmpty) return;
      await TelegramBotRepo.sendMessageWithTelegramBot(
          telegramChatId: telegramId, message: message);
    }
  }

  Future<void> _onWebScreeningStop(
    WebScreeningStop event,
    Emitter<WebScreeningState> emit,
  ) async {
    try {
      await state.mediaRecorder?.stop();
    } catch (e, s) {
      logInfo('stop error: $e');
      await Sentry.captureException(e, stackTrace: s);
    }
    emit(
      state.copyWith(
        mediaRecorder: MediaRecorder(),
      ),
    );
  }

  Future<void> _onWebScreeningScreenCountdownUpdated(
    WebScreeningScreenCountdownUpdated event,
    Emitter<WebScreeningState> emit,
  ) async {
    emit(
      state.copyWith(
        screenCountdownRemainingTime: event.remainingTime,
      ),
    );
  }

  Future<void> _onWebScreeningScreenCountdownFinished(
    WebScreeningScreenCountdownFinished event,
    Emitter<WebScreeningState> emit,
  ) async {
    /// Stop screening & start predict
    add(const WebScreeningStop());

    // add(WebScreeningPredictStatusSet(event.context));
    await Future<void>.delayed(const Duration(seconds: 1), () async {
      // Turn off the video stream
      try {
        state.mediaStream?.getTracks().forEach((track) {
          track.stop();
        });
        logInfo('_onWebScreeningScreenCountdownFinished(): stop tracks');
      } catch (e, s) {
        logInfo('_onWebScreeningScreenCountdownFinished(): $e');
        await Sentry.captureException(e, stackTrace: s);
      }

      emit(
        state.copyWith(
          screeningMessage: '',
          screeningStatus: ScreeningStatus.warmDown,
        ),
      );
    });
  }

  Future<void> _onWebScreeningCompleted(
    WebScreeningCompleted event,
    Emitter<WebScreeningState> emit,
  ) async {
    add(const WebScreeningStop());

    emit(
      state.copyWith(
        screeningMessage: '',
        screeningStatus: ScreeningStatus.completed,
      ),
    );
  }

  Future<void> _onWebScreeningTerminated(
    WebScreeningTerminated event,
    Emitter<WebScreeningState> emit,
  ) async {
    add(const WebScreeningStop());

    add(
      WebScreeningResultAssessmentSet(
        ScreeningResultAssessment(
          heartRate: -9999,
          heartRateVariability: -9999,
          readinessIndex: -9999,
        ),
      ),
    );

    add(const WebScreeningCompleted());
  }

  Future<void> _onWebScreeningFirstResultSet(
    WebScreeningFirstResultSet event,
    Emitter<WebScreeningState> emit,
  ) async {
    emit(
      state.copyWith(
        screeningMessage: '',
        screeningStatus: ScreeningStatus.firstResult,
      ),
    );
  }

  Future<void> _onWebScreeningWarmUpStart(
    WebScreeningWarmUpStart event,
    Emitter<WebScreeningState> emit,
  ) async {
    add(WebScreeningWarmUpStatusSet(event.context));
  }

  Future<void> _onWebScreeningWarmUpCountdownUpdated(
    WebScreeningWarmUpCountdownUpdated event,
    Emitter<WebScreeningState> emit,
  ) async {
    emit(
      state.copyWith(
        screenCountdownRemainingTime: event.remainingTime,
      ),
    );
  }

  Future<void> _onWebScreeningWarmUpCountdownFinished(
    WebScreeningWarmUpCountdownFinished event,
    Emitter<WebScreeningState> emit,
  ) async {
    add(WebScreeningStart(event.context));
  }

  Future<void> _onWebScreeningPredictStatusSet(
    WebScreeningPredictStatusSet event,
    Emitter<WebScreeningState> emit,
  ) async {
    final l10n = event.context.l10n;
    emit(
      state.copyWith(
        screeningStatus: ScreeningStatus.predict,
        screeningMessage: l10n.screeningPredictingMessage,
      ),
    );
  }

  Future<void> _onWebScreeningRecordStatusSet(
    WebScreeningRecordStatusSet event,
    Emitter<WebScreeningState> emit,
  ) async {
    emit(
      state.copyWith(
        screeningStatus: ScreeningStatus.record,
      ),
    );
  }

  Future<void> _onWebScreeningWarmUpStatusSet(
    WebScreeningWarmUpStatusSet event,
    Emitter<WebScreeningState> emit,
  ) async {
    emit(
      state.copyWith(
        screeningStatus: ScreeningStatus.warmUp,
      ),
    );
  }

  Future<void> _onWebScreeningAssessmentSet(
    WebScreeningAssessmentSet event,
    Emitter<WebScreeningState> emit,
  ) async {
    emit(
      state.copyWith(
        assessment: event.assessment,
      ),
    );
  }

  Future<void> _onWebScreeningResultAssessmentSet(
    WebScreeningResultAssessmentSet event,
    Emitter<WebScreeningState> emit,
  ) async {
    emit(
      state.copyWith(
        screeningResultAssessment: event.resultAssessment,
      ),
    );
  }

  Future<void> _onWebScreeningStressLevelSet(
    WebScreeningStressLevelSet event,
    Emitter<WebScreeningState> emit,
  ) async {
    emit(
      state.copyWith(
        stressLevel: event.stressLevel,
      ),
    );
  }

  Future<void> _onWebScreeningBodyTemperatureSet(
    WebScreeningBodyTemperatureSet event,
    Emitter<WebScreeningState> emit,
  ) async {
    emit(
      state.copyWith(
        bodyTemperature: event.bodyTemperature,
      ),
    );
  }

  Future<void> _onWebScreeningDispose(
    WebScreeningDispose event,
    Emitter<WebScreeningState> emit,
  ) async {
    try {
      state.mediaStream?.getTracks().forEach((track) {
        track.stop();
      });
    } catch (e, s) {
      logInfo('_onWebScreeningScreenCountdownFinished(): $e');
      await Sentry.captureException(e, stackTrace: s);
    }
  }
}
