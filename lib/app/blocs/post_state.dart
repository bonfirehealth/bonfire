// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

@freezed
class PostState<T> with _$PostState<T> {
  const factory PostState.initial() = Initial;
  factory PostState.loading() = Loading;
  factory PostState.data(T data) = Data;
  factory PostState.error(String message) = Error;
}
