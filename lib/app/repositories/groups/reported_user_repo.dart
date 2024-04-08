// Dart imports:
import 'dart:async';

// Package imports:
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class ReportedUserRepo {
  ReportedUserRepo._();

  static Future<List<ReportedUser>?> getAllReportedUsers({
    bool isHidden = false,
  }) async {
    logInfo('getAllReportedUsers()');
    await CoreRepo.init();
    return CoreRepo.getAllItems(
      'groups/reported_users',
      'listReportedUsers',
      variables: <String, dynamic>{
        'organisationID': CoreRepo.organisationId,
        'isHidden': isHidden,
      },
      fromJson: ReportedUser.fromJson,
    );
  }

  static Future<Tuple2<ReportedUser?, int?>?> createReportedUser({
    String? userId,
    String? description,
    bool isHidden = false,
    bool isVerified = false,
    String? name,
  }) async {
    logInfo('createReportedUser()');
    await CoreRepo.init();
    return CoreRepo.createItem<ReportedUser>(
      'groups/reported_user_create',
      'createReportedUser',
      variables: <String, dynamic>{
        'input': {
          'organisationID': CoreRepo.organisationId,
          'description': description,
          'isHidden': isHidden,
          'isVerified': isVerified,
          'name': name,
          'reporterID': CoreRepo.userId,
          'userID': userId,
        },
      },
      fromJson: ReportedUser.fromJson,
    );
  }

  static Future<Tuple2<ReportedUser?, int?>?> updateReportedUser({
    String? reportedUserId,
    String? userId,
    String? description,
    bool isHidden = false,
    bool isVerified = false,
    String? name,
    int? version = 1,
  }) async {
    logInfo('updateReportedUser()');
    await CoreRepo.init();
    return CoreRepo.updateItem<ReportedUser>(
      'groups/reported_user_update',
      'updateReportedUser',
      variables: <String, dynamic>{
        'input': {
          'id': reportedUserId,
          'organisationID': CoreRepo.organisationId,
          'description': description,
          'isHidden': isHidden,
          'isVerified': isVerified,
          'name': name,
          'reporterID': CoreRepo.userId,
          'userID': userId,
          '_version': version,
        },
      },
      fromJson: ReportedUser.fromJson,
    );
  }

  static Future<Tuple2<ReportedUser?, int?>?> deleteReportedUser({
    String? reportedUserId,
    int? version = 1,
  }) async {
    logInfo('deleteReportedUser()');
    await CoreRepo.init();
    return CoreRepo.updateItem<ReportedUser>(
      'groups/reported_user_delete',
      'deleteReportedUser',
      variables: <String, dynamic>{
        'input': {
          'id': reportedUserId,
          '_version': version,
        },
      },
      fromJson: ReportedUser.fromJson,
    );
  }
}
