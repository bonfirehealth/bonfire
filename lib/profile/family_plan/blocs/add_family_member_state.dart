// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_family_member_state.freezed.dart';

@freezed
class AddFamilyMemberState with _$AddFamilyMemberState {
  const factory AddFamilyMemberState.initial() = _Initial;
  const factory AddFamilyMemberState.loading() = _Loading;
  const factory AddFamilyMemberState.success(String url) = _Data;
}
