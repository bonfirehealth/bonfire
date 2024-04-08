// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:aws_auth/aws_auth.dart';
import 'package:bonfirehealth/app/helpers/flavors.dart';
import 'package:http/http.dart' as http;

import '../constants/amplify_constant.dart';

class S3Policy {
  S3Policy(
    this.key,
    this.bucket,
    this.datetime,
    this.expiration,
    this.credential,
    this.maxFileSize,
    this.sessionToken, {
    this.region = 'ap-southeast-1',
  });

  factory S3Policy.fromS3PresignedPost(
    String key,
    String bucket,
    int expiryMinutes,
    String accessKeyId,
    int maxFileSize,
    String sessionToken, {
    String region = 'ap-southeast-1',
  }) {
    final datetime = SigV4.generateDatetime();
    final expiration = DateTime.now()
        .add(Duration(minutes: expiryMinutes))
        .toUtc()
        .toString()
        .split(' ')
        .join('T');
    final cred =
        '$accessKeyId/${SigV4.buildCredentialScope(datetime, region, 's3')}';
    final p = S3Policy(
      key,
      bucket,
      datetime,
      expiration,
      cred,
      maxFileSize,
      sessionToken,
      region: region,
    );
    return p;
  }

  String expiration;
  String region;
  String bucket;
  String key;
  String credential;
  String datetime;
  String sessionToken;
  int maxFileSize;

  String encode() {
    final bytes = utf8.encode(toString());
    return base64.encode(bytes);
  }

  @override
  String toString() {
    return '''
    { "expiration": "$expiration",
      "conditions": [
        {"bucket": "$bucket"},
        ["starts-with", "\$key", "$key"],
        ["content-length-range", 1, $maxFileSize],
        {"x-amz-credential": "$credential"},
        {"x-amz-algorithm": "AWS4-HMAC-SHA256"},
        {"x-amz-date": "$datetime" },
        {"x-amz-security-token": "$sessionToken" }
      ]
    }
    ''';
  }
}

AWSRequest createPresignS3Request(
  AWS4Signer signer,
  Duration expires,
  String bucketName,
  String bucketPath, {
  bool public = false,
}) {
  final req = AWSRequest(
    'https://$bucketName.s3.${signer.region}.amazonaws.com/$bucketPath',
    method: 'PUT',
    headers: {if (public) 'x-amz-acl': 'public-read'},
  );

  signer.presign(req, expires: expires);

  return req;
}

Uri presignedAWS(
  String key,
  String bucket, {
  String awsAccessKey = '',
  String awsSecretKey = '',
  String? sessionToken,
  String region = 'ap-southeast-1',
  bool public = false,
}) {
  final credentialsProvider = AWSStaticCredentialsProvider(
    awsAccessKey,
    awsSecretKey,
    sessionToken: sessionToken,
  );
  final signer = AWS4Signer(
    credentialsProvider,
    region: region,
    serviceName: 's3',
  );

  final presignedReq = createPresignS3Request(
    signer,
    const Duration(minutes: 5),
    bucket,
    key,
    public: public,
  );

  return presignedReq.url;
}

Future<Uri?> getPresignedUrl(
  String objectKey, {
  String action = 'put_object',
}) async {
  try {
    final bucket = AmplifyConstant.getS3BucketName(
      FlavorConfig.instance!.flavor,
    );
    final endpointUrl = AmplifyConstant.getUploadFileS3FunctionEndpoint(
      FlavorConfig.instance!.flavor,
    );

    final response = await http.post(
      Uri.parse(endpointUrl),
      body: jsonEncode(
        {
          'bucket': bucket,
          'object_key': objectKey,
          'action': action,
        },
      ),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // ignore: avoid_dynamic_calls
      final presignedUrl = jsonData['presigned_url'];

      if (presignedUrl != null) {
        return Uri.parse(presignedUrl as String);
      } else {
        print('Presigned URL is null.');
        return null;
      }
    } else {
      print('Error: ${response.statusCode}');
      print(response.body);
      return null;
    }
  } catch (e) {
    print('Exception: $e');
    return null;
  }
}
