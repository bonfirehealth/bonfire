// Project imports:
import 'package:bonfirehealth/app/constants/amplify_secrets.dart';
import 'package:bonfirehealth/app/helpers/helpers.dart';

class AmplifyConstant {
  AmplifyConstant._();

  static String awsLambdaRegion = 'ap-southeast-1';
  static String awsLambdaDomain = 'lambda-url.$awsLambdaRegion.on.aws';
  static String awsLambdaToken = '';
  static String awsS3Domain = 's3.$awsLambdaRegion.amazonaws.com';

  static String getAccessKeyID(AppFlavor environment) {
    return SecretsConstants.getAWSAccessKeyID(environment);
  }

  static String getSecretAccessKey(AppFlavor environment) {
    return SecretsConstants.getAWSSecretAccessKey(environment);
  }

  static String getS3BucketName(AppFlavor environment) {
    switch (environment) {
      case AppFlavor.development:
        return 'bonfirehealth95213-dev';
      case AppFlavor.staging:
        return 'bonfirehealth32119-stg';
      case AppFlavor.production:
        return 'bonfirehealth63650-prod';
    }
  }

  static String getUploadFileS3FunctionEndpoint(AppFlavor environment) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://4z5qusktolro5upbeiyx3oqequ0lvqsu.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://4z5qusktolro5upbeiyx3oqequ0lvqsu.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://4z5qusktolro5upbeiyx3oqequ0lvqsu.$awsLambdaDomain';
    }
  }

  static String getPredictVO2MaxFunctionEndpoint(AppFlavor environment) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://lfu5m2nowibj7gf72nvce5idke0clftb.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://inqtzwardr6tlodswvz5frupm40xhqxu.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://yd4jls5is7wa6vhayctzmapdqi0bjhhj.$awsLambdaDomain';
    }
  }

  static String generateFullS3FilePath(
    AppFlavor environment,
    String relativePath,
  ) {
    if (!relativePath.contains('https://')) {
      final bucketName = getS3BucketName(environment);
      return 'https://$bucketName.s3.ap-southeast-1.amazonaws.com/$relativePath';
    } else {
      return relativePath;
    }
  }

  static String getIdentityPoolId(AppFlavor environment) {
    switch (environment) {
      case AppFlavor.development:
        return 'ap-southeast-1:d3108541-a60a-4178-956c-c4c300f5ada1'; // ap-southeast-1_MhcIZyTuD
      case AppFlavor.staging:
        return 'ap-southeast-1:725d98ce-9133-402f-bc98-907d5ea5bd28'; // ap-southeast-1_qPfrtEcg0
      case AppFlavor.production:
        return 'ap-southeast-1:5ae0b2f8-b236-40df-8224-fa0f409fa001';
    }
  }

  static String getOrganisationEmployeeTypeId(AppFlavor environment) {
    switch (environment) {
      case AppFlavor.development:
        return '5b65c95f-80fc-4e87-b3de-443ba177d657';
      case AppFlavor.staging:
        return '5b65c95f-80fc-4e87-b3de-443ba177d657';
      case AppFlavor.production:
        return '5b65c95f-80fc-4e87-b3de-443ba177d657';
    }
  }

  static String getFamilyMemberTypeId(AppFlavor environment) {
    switch (environment) {
      case AppFlavor.development:
        return 'a4bbd83b-721d-4388-9441-f3647b19cc89';
      case AppFlavor.staging:
        return 'a4bbd83b-721d-4388-9441-f3647b19cc89';
      case AppFlavor.production:
        return 'a4bbd83b-721d-4388-9441-f3647b19cc89';
    }
  }

  static String getConfirmSignUpFunctionEndpoint(AppFlavor environment) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://wym45pkoto44ffggbkcxtypc3i0lghle.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://jx6hkmkbvfdgzt7q3rxlpje7ue0glvlm.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://42ykau75aauw6h5qcrxsjssvjy0qbrts.$awsLambdaDomain';
    }
  }

  static String getCheckOrganisationByCodeFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://24pr5napqscyc3wrz4uzjfnhcq0ssreq.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://kzej5b3mcu7n63ed4lyuknf2ce0uedif.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://ha4wvke22tt65rbqivbqjoe3ku0mtile.$awsLambdaDomain';
    }
  }

  static String getGenerateRecoveryCodesFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://aj542zrlavh7z4ti2hgnwobnt40oarva.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://zuftiysdyi6vb5yb23tjm7vvam0pfgfw.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://fgcps5fkp5jpk6xe5mpr2acrtm0sccwc.$awsLambdaDomain';
    }
  }

  static String getCheckEmailAddressAvailabilityFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://hlbrwqpn4gloiu6vanm6mq2tce0ftkky.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://io4uywzzf7zgm2qgu6eal2uuy40fxntf.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://ollwbhpz7p64nhzylsxetsg4qe0eqioa.$awsLambdaDomain';
    }
  }

  static String getCheckProfileExistsFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://waml3kuxe57qskx7u6ihtumjau0gvvzb.$awsLambdaDomain';

      case AppFlavor.staging:
        return 'https://sfjracefa6pvjsshdkoqf3bybm0wiwpe.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://iyiyxvp5a4lze6afwq3jjyzlpa0ynxya.$awsLambdaDomain';
    }
  }

  static String getSetDepartmentFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://o4nnqyoqjpthataz77tdqeiquu0umecf.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://2rqkchvvmrth5kpwpnguznk3ze0grpdr.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://cyzmtfic5efifqnbzv46v54fje0uddup.$awsLambdaDomain';
    }
  }

  static String getOrgDepartmentsFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://fivcrcydmhwkfs37vepesqvuai0hktrg.$awsLambdaDomain';

      case AppFlavor.staging:
        return 'https://2op765krdegay3yvxohtrsejyy0dwauo.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://m3pnltb6wehm22mqrt7sbk62ny0phiqh.$awsLambdaDomain';
    }
  }

  static String getRecoverAccountFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://vlydlg5ggngrhwksaciwekvire0qjvfx.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://ta5q62dc7tngji5ujjli326mcq0syuxs.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://j6krh3c5ncw24rs6tt6z5pkjku0bcfgf.$awsLambdaDomain';
    }
  }

  static String getResetPasswordFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://rkhczz4s6wdnvgsp4szfzkbj4e0qsktq.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://tuksxu567e2xf4g32qlujnq2wu0ogqif.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://27sw7j5neqhi6fslovpljceb2q0plmnb.$awsLambdaDomain';
    }
  }

  static String getCheckScreeningVideoQualityFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://s3u6kvbfliajsjrphciftuh7tm0cfjrc.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://chtjdo544cwbs376dip7n52l5e0vrlli.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://to3uaalhvsodkbfynmqme4xhnq0wmhsy.$awsLambdaDomain';
    }
  }

  static String getProcessScreeningVideoFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        // return 'https://ixupvu4vzurhd3if4cwhn5mjfy0pgygu.$awsLambdaDomain';
        return 'https://mkkyz6cmqc.execute-api.ap-southeast-1.amazonaws.com/dev/process';
      case AppFlavor.staging:
        // return 'https://32bnndebf6g6cziidrydkhfrkq0pjuts.$awsLambdaDomain';
        return 'https://mkkyz6cmqc.execute-api.ap-southeast-1.amazonaws.com/dev/process';
      case AppFlavor.production:
        // return 'https://vhzhtwxoqfmg22veavrfswja5e0fxmoq.$awsLambdaDomain';
        return 'https://mkkyz6cmqc.execute-api.ap-southeast-1.amazonaws.com/dev/process';
    }
  }

  static String getPredictVitalSignsFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        // return 'https://nw2p6uhurwfgvivazy3436rx2y0bqgwz.$awsLambdaDomain';
        // return 'https://mz42s9ul9j.execute-api.ap-southeast-1.amazonaws.com/dev/predict';
        return 'https://6o7rjrcdy3.execute-api.ap-southeast-1.amazonaws.com/dev/analysis';
      case AppFlavor.staging:
        // return 'https://krmwi7lgsh6cs764zsyxwpo2ve0tiuqh.$awsLambdaDomain';
        // return 'https://mz42s9ul9j.execute-api.ap-southeast-1.amazonaws.com/dev/predict';
        return 'https://6o7rjrcdy3.execute-api.ap-southeast-1.amazonaws.com/dev/analysis';
      case AppFlavor.production:
        // return 'https://dnr2cdcwkavc7q2iyvp6ui3tim0rezpy.$awsLambdaDomain';
        // return 'https://mz42s9ul9j.execute-api.ap-southeast-1.amazonaws.com/dev/predict';
        return 'https://6o7rjrcdy3.execute-api.ap-southeast-1.amazonaws.com/dev/analysis';
    }
  }

  static String getPredictBodyTemperatureFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        // return 'https://l2zrr2f3f4h2rqwffeahpscp6q0parlj.$awsLambdaDomain';
        return 'https://6o7rjrcdy3.execute-api.ap-southeast-1.amazonaws.com/dev/analysis';
      case AppFlavor.staging:
        // return 'https://xr3y3ghkj2waupu4ah44ddp7xu0vkasp.$awsLambdaDomain';
        return 'https://6o7rjrcdy3.execute-api.ap-southeast-1.amazonaws.com/dev/analysis';
      case AppFlavor.production:
        // return 'https://mqcbfq2xerpsi4bsc5mdxzmtb40hkuxt.$awsLambdaDomain';
        return 'https://6o7rjrcdy3.execute-api.ap-southeast-1.amazonaws.com/dev/analysis';
    }
  }

  static String getSendSecretCredentialsEmailFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://52fjqoqmhtuyth5elt57jwk5rq0alkjs.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://4ztpzm7vofmtkdt7zkb3xsf4va0zwphy.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://6pcldku4qhoo32a42hiu3k5ewa0dbaeb.$awsLambdaDomain';
    }
  }

  static String getReportWeeklyFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://5lizkiwa2zj44yzlpm6vtc4kcm0pvshd.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://5lizkiwa2zj44yzlpm6vtc4kcm0pvshd.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://5lizkiwa2zj44yzlpm6vtc4kcm0pvshd.$awsLambdaDomain';
    }
  }

  static String getAggregateAssessmentsByTimePeriodFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://urwhr3zuaqblzxjo2lo626daxu0ydeic.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://rns2fjfptydsriufhtthlfjggu0lavgf.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://rvm23drpmfex4e2i2w4fqbptwm0ntxdf.$awsLambdaDomain';
    }
  }

  static String getAggregateOrganisationAssessmentsByTimePeriodFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://vysq3hw4ux6an6n7alg6jjwz2e0ebson.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://ukt3b5cvadi5tswrveyt6qpwy40kbayw.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://nwskvetjdloexkxgubsufap3nu0glwjf.$awsLambdaDomain';
    }
  }

  static String getFamilyMemberPasswordManagerFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://ry66kv62tz4pa2hsuugge4lerm0tqhig.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://jxgqt7p233nj3tloqx55oyt3vm0fzrgg.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://izrurgdyw2n2j47okmo4jqdwye0wadec.$awsLambdaDomain';
    }
  }

  static String getTelegramBotFunctionEndpoint(
    AppFlavor environment,
  ) {
    switch (environment) {
      case AppFlavor.development:
        return 'https://vnvmxs2527d257knayborv7zei0wsacy.$awsLambdaDomain';
      case AppFlavor.staging:
        return 'https://u4mp6pbkd53k3zgoodyxpnk6s40lxhdl.$awsLambdaDomain';
      case AppFlavor.production:
        return 'https://l7kqvqzqbvz3quxnj5hqf5cegm0zvczt.$awsLambdaDomain';
    }
  }
}
