// Project imports:
import 'package:bonfirehealth/app/constants/amplify_constant.dart';
import 'package:bonfirehealth/app/helpers/helpers.dart';

String getS3Image(String imagePath) {
  final bucket = AmplifyConstant.getS3BucketName(
    FlavorConfig.instance!.flavor,
  );

  return 'https://$bucket.s3.ap-southeast-1.amazonaws.com/$imagePath';
}
