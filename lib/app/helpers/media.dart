// Dart imports:
// ignore_for_file: cascade_invocations

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/helpers/helpers.dart';
import 'package:bonfirehealth/app/repositories/repositories.dart';

class MediaHelper {
  MediaHelper._();

  static Future<Map<String, dynamic>> uploadVideoViaJson(
    html.Blob blob,
    String url,
    String inputFileObjectKey,
    String outputFileObjectKey, {
    String inputFileMimeType = 'video/webm',
    String outputFileMimeType = 'video/mp4',
  }) async {
    logInfo('uploadVideoViaJson()');
    final base64String = await convertBlobToBase64String(blob);
    if (base64String != null) {
      final uri = Uri.parse(url);
      final request = http.Request('POST', uri);
      request.headers['Content-Type'] = 'application/json';
      final body = jsonEncode({
        'input_file': {
          'object_blob': base64String,
          'object_key': inputFileObjectKey,
          'mime_type': inputFileMimeType,
        },
        'output_file': {
          'object_key': outputFileObjectKey,
          'mime_type': outputFileMimeType,
        },
      });
      request.body = body;
      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      final responseJson = json.decode(responseString) as Map<String, dynamic>;
      final responseBody = responseJson['data'] as Map<String, dynamic>;

      return <String, dynamic>{
        'is_processed': responseBody['is_processed'],
        'frames_per_second': responseBody['frames_per_second'],
        'images_zip_url': responseBody['images_zip_url'],
      };
    }
    return <String, dynamic>{};
  }

  static Future<Map<String, dynamic>> uploadVideoViaMultipartFormData(
    html.Blob blob,
    String url,
    String inputFileObjectKey,
    String outputFileObjectKey, {
    String inputFileMimeType = 'video/webm',
    String outputFileMimeType = 'video/mp4',
    String recorderType = '',
  }) async {
    try {
      logInfo('uploadVideoViaMultipartFormData()');
      final base64String = await convertBlobToBase64String(blob);
      if (base64String != null) {
        final xhr = html.HttpRequest();
        // ignore: cascade_invocations
        xhr.open('POST', url);
        xhr.onReadyStateChange.listen((event) {
          if (xhr.readyState == 4) {
            if (xhr.status == 200) {
              logInfo('Response ${xhr.response}');
            }
          }
        });
        xhr.onError.listen((event) {
          logInfo('Network Error $event');
        });

        final formData = html.FormData();
        const fileType = 'video';
        formData
          ..appendBlob('$fileType-input-file-blob', blob)
          ..append('type', recorderType)
          ..append('$fileType-input-file-mime-type', inputFileMimeType)
          ..append('$fileType-input-file-key', inputFileObjectKey)
          ..append('$fileType-output-file-mime-type', outputFileMimeType)
          ..append('$fileType-output-file-key', outputFileObjectKey);

        xhr.send(formData);
        while (xhr.response == '') {
          await Future<void>.delayed(const Duration(milliseconds: 1));
          // ignore: invariant_booleans
          if (xhr.response != '') {
            break;
          }
        }

        final responseJson =
            json.decode(xhr.response as String) as Map<String, dynamic>;
        final responseBody = responseJson['data'] as Map<String, dynamic>;

        return <String, dynamic>{
          'is_processed': responseBody['is_processed'],
          'frames_per_second': responseBody['frames_per_second'],
          'images_zip_url': responseBody['images_zip_url'],
          'video_url': responseBody['video_url'],
        };
      }
    } catch (e) {
      logInfo('uploadVideoViaMultipartFormData(): Error $e');
    }

    return <String, dynamic>{};
  }

  static Future<Map<String, dynamic>?> uploadVideoToS3Bucket2(
    html.Blob blob,
    String videoProcessingFunctionEndpoint,
    String inputFileObjectKey,
    String outputFileObjectKey, {
    int? begin,
    int? end,
    String inputFileMimeType = 'video/webm',
    String outputFileMimeType = 'video/mp4',
  }) async {
    await CoreRepo.init();
    final bucket = AmplifyConstant.getS3BucketName(
      FlavorConfig.instance!.flavor,
    );

    logInfo('uploadVideoToS3Bucket2');

    // Create a presigned-url
    // final uploadFileS3FunctionEndpoint =
    //     AmplifyConstant.getUploadFileS3FunctionEndpoint(
    //   FlavorConfig.instance!.flavor,
    // );
    final uri = await getPresignedUrl(
      // uploadFileS3FunctionEndpoint,
      // bucket,
      inputFileObjectKey,
    );

    final file = await convertBlobToFile(blob);

    final responseMap = await HttpHelper().put(uri.toString(), file);
    final statusCode = responseMap['statusCode'] as int;

    if (statusCode == 200) {
      final uri = Uri.parse(videoProcessingFunctionEndpoint);
      final request = http.Request('POST', uri);
      request.headers['Content-Type'] = 'application/json';
      final body = jsonEncode({
        'bucket': bucket,
        'input_file': {
          'object_key': inputFileObjectKey,
          'mime_type': inputFileMimeType,
        },
        'output_file': {
          'object_key': outputFileObjectKey,
          'mime_type': outputFileMimeType,
          'begin': begin,
          'end': end,
        },
      });
      request.body = body;
      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      final responseJson = json.decode(responseString) as Map<String, dynamic>;
      final responseBody = responseJson['data'] as Map<String, dynamic>;

      return <String, dynamic>{
        'is_processed': responseBody['is_processed'],
        'frames_per_second': responseBody['frames_per_second'],
        'images_zip_url': responseBody['images_zip_url'],
      };
    }
    return null;
  }

  static Future<Uri?> uploadVideoToS3BucketByPresignedUrl(
    html.Blob blob,
    String inputFileObjectKey,
  ) async {
    await CoreRepo.init();
    final bucket = AmplifyConstant.getS3BucketName(
      FlavorConfig.instance!.flavor,
    );

    logInfo('uploadVideoToS3Bucket2');

    // Create a presigned-url
    // final uploadFileS3FunctionEndpoint =
    //     AmplifyConstant.getUploadFileS3FunctionEndpoint(
    //   FlavorConfig.instance!.flavor,
    // );
    final uri = await getPresignedUrl(
      // uploadFileS3FunctionEndpoint,
      // bucket,
      inputFileObjectKey,
    );

    final file = await convertBlobToFile(blob);

    final responseMap = await HttpHelper().put(uri.toString(), file);
    final statusCode = responseMap['statusCode'] as int;
    if (statusCode == 200) {
      return uri;
    }

    return null;
  }

  static Future<Map<String, dynamic>> uploadVideoToS3Bucket(
    html.Blob blob,
    String url,
    String inputFileObjectKey,
    String outputFileObjectKey, {
    String inputFileMimeType = 'video/webm',
    String outputFileMimeType = 'video/mp4',
    double framesPerSecond = 30.0,
  }) async {
    await CoreRepo.init();
    final bucket = AmplifyConstant.getS3BucketName(
      FlavorConfig.instance!.flavor,
    );

    try {
      logInfo('uploadVideoToS3Bucket()');
      final file = await convertBlobToFile(blob);

      final uri = presignedAWS(
        inputFileObjectKey,
        bucket,
        awsAccessKey: AmplifyConstant.getAccessKeyID(
          FlavorConfig.instance!.flavor,
        ),
        awsSecretKey: AmplifyConstant.getSecretAccessKey(
          FlavorConfig.instance!.flavor,
        ),
      );

      // final response = await http.put(uri, body: _file);
      final responseMap = await HttpHelper().put(uri.toString(), file);
      final statusCode = responseMap['statusCode'] as int;

      if (statusCode == 200) {
        final uri = Uri.parse(url);
        final request = http.Request('POST', uri);
        request.headers['Content-Type'] = 'application/json';
        final body = jsonEncode({
          'input_file': {
            'object_key': inputFileObjectKey,
            'mime_type': inputFileMimeType,
          },
          'output_file': {
            'object_key': outputFileObjectKey,
            'mime_type': outputFileMimeType,
          },
        });
        request.body = body;
        final response = await request.send();
        final responseString = await response.stream.bytesToString();

        final responseJson =
            json.decode(responseString) as Map<String, dynamic>;
        final responseBody = responseJson['data'] as Map<String, dynamic>;

        return <String, dynamic>{
          'is_processed': responseBody['is_processed'],
          'frames_per_second': responseBody['frames_per_second'],
          'images_zip_url': responseBody['images_zip_url'],
        };
      }
    } catch (e) {
      logInfo('uploadVideoToS3Bucket(): Error $e');
    }
    return <String, dynamic>{
      'is_processed': false,
    };
  }

  static Future<void> deleteFileS3(String inputFileObjectKey) async {
    try {
      final presignedUrl =
          await getPresignedUrl(inputFileObjectKey, action: 'delete_object');
      if (presignedUrl != null) {
        final response = await http.delete(presignedUrl);
        if (response.statusCode == 204) {
          logInfo('Object deleted successfully: $inputFileObjectKey');
        } else {
          logInfo('Failed to delete object. Status code: ${response.statusCode}');
        }
      }
    } catch (error) {
      logInfo('Error: $error');
    }
  }

  static Future<Uint8List?> convertBlobToFile(html.Blob blob) async {
    final fileReader = html.FileReader();
    fileReader.readAsArrayBuffer(blob);
    await fileReader.onLoad.first;
    // ignore: cast_nullable_to_non_nullable
    return fileReader.result as Uint8List;
  }

  static Future<String?> convertBlobToBase64String(html.Blob blob) async {
    logInfo('convertBlobToBase64String()');
    String? file;

    final reader = html.FileReader()
      ..readAsDataUrl(blob.slice(0, blob.size, blob.type));
    reader.onLoadEnd.listen((event) {
      file = reader.result.toString().split(',').last;
    }).onData((data) {
      file = reader.result.toString().split(',').last;
    });

    while (file == null) {
      await Future<void>.delayed(const Duration(milliseconds: 1));
      // ignore: invariant_booleans
      if (file != null) {
        break;
      }
    }

    return file;
  }
}
