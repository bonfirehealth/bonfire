// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_member_sign_in_state.freezed.dart';

@freezed
class FamilyMemberSignInState with _$FamilyMemberSignInState {
  const factory FamilyMemberSignInState.initial() = _Initial;
  const factory FamilyMemberSignInState.loading() = _Loading;
  const factory FamilyMemberSignInState.success(String decrypted) = _Data;
}
