// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class SelfCareRepo {
  SelfCareRepo._();

  static Future<List<SelfCare>?> getAllSelfCares() async {
    logInfo('getAllSelfCares()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'self_cares',
      'listSelfCares',
      fromJson: SelfCare.fromJson,
    );
  }

  static Future<Tuple2<SelfCare?, int?>?> getSelfCare(String selfCareId) async {
    logInfo('getSelfCare()');
    await CoreRepo.init();
    return CoreRepo.getItem<SelfCare>(
      'self_care',
      'getSelfCare',
      variables: <String, dynamic>{
        'selfCareID': selfCareId,
      },
      fromJson: SelfCare.fromJson,
    );
  }
}
