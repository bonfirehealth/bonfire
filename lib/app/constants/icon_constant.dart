// Project imports:
import 'package:bonfirehealth/app/constants/image_constant.dart';

class IconsConstant {
  IconsConstant._();

  static List<String> getFilters() {
    return [
      ImageConstant.popular,
      ImageConstant.pendingVotes,
    ];
  }
}
