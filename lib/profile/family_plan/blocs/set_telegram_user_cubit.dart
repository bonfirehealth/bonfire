// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/blocs/post_state.dart';
import 'package:bonfirehealth/app/models/profile.dart';
import '../../../app/models/user.dart';

class SetTelegramUserCubit extends Cubit<PostState<bool>> {
  SetTelegramUserCubit() : super(const PostState.initial());

  void initiate(String telegramUsername) async {
    emit(PostState.loading());
    await CoreRepo.init();
    if (CoreRepo.userId == null) {
      emit(PostState.error('Invalid login state'));
      return;
    }
    final req = await UserRepo.getUser(userId: CoreRepo.userId);
    if (req != null) {
      final setTelegramReq = await UserRepo.updateUser(telegramId: telegramUsername, version: req.item2);
    }
    emit(PostState.data(true));
  }
}
