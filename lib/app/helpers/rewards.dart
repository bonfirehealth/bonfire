// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';

LinearGradient getRewardsLinearGradientColourByMembershipTier(
  String? membershipTier,
) {
  switch (membershipTier) {
    case 'Silver':
      return const LinearGradient(
        colors: [
          AppColourConstant.greyCDD5E0,
          AppColourConstant.grey9A9A9A,
        ],
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.topRight,
        stops: [0.0, 1.0],
      );

    case 'Gold':
      return const LinearGradient(
        colors: [
          AppColourConstant.yellowFFEB98,
          AppColourConstant.yellowD5AC05,
        ],
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.topRight,
        stops: [0.0, 1.0],
      );

    case 'Platinum':
      return const LinearGradient(
        colors: [
          AppColourConstant.greyCDD5E0,
          AppColourConstant.grey50535A,
        ],
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.topRight,
        stops: [0.0, 1.0],
      );

    default:
      return const LinearGradient(
        colors: [
          AppColourConstant.whiteF8F8F8,
          AppColourConstant.whiteF8F8F8,
        ],
        begin: FractionalOffset.topLeft,
        end: FractionalOffset.topRight,
        stops: [0.0, 1.0],
      );
  }
}

String getRewardsIconByMembershipTier(
  String? membershipTier,
) {
  switch (membershipTier) {
    case 'Silver':
      return ImageConstant.silverMember;

    case 'Gold':
      return ImageConstant.goldMember;

    case 'Platinum':
      return ImageConstant.platinumMember;

    default:
      return ImageConstant.silverMember;
  }
}
