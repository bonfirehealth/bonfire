// Dart imports:
import 'dart:html' as html;

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:username_gen/username_gen.dart';
import 'package:validators/validators.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/constants/amplify_constant.dart';
import 'package:bonfirehealth/app/constants/app_constant.dart';
import 'package:bonfirehealth/app/helpers/auth.dart';
import 'package:bonfirehealth/profile/family_plan/blocs/family_member_sign_in_state.dart';
import '../../../app/helpers/flavors.dart';
import '../../../app/repositories/amplify_repo.dart';
import 'add_family_member_state.dart';

class FamilyMemberSignInCubit extends Cubit<FamilyMemberSignInState> {
  FamilyMemberSignInCubit() : super(const FamilyMemberSignInState.initial());

  Future<void> initiate(String email, String uniqueLinkValue) async {
    emit(const FamilyMemberSignInState.loading());
    final response = await AmplifyRepo.encryptDecryptFamilyMemberPassword('decrypt', uniqueLinkValue);
    final decrypted = response?['value'];
    emit(FamilyMemberSignInState.success(decrypted!));

  }
}
