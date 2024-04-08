// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/blocs/post_state.dart';
import 'package:bonfirehealth/app/models/profile.dart';
import '../../../app/models/user.dart';

part 'user_info_cubit.freezed.dart';

class UserInfoCubit extends Cubit<PostState<UserInfoState>> {
  UserInfoCubit() : super(const PostState.initial());

  Future<void> load() async {
    emit(PostState.loading());
    await CoreRepo.init();
    final userId = CoreRepo.userId;
    if (userId == null) {
      emit(PostState.error(""));
      return;
    }
    final userFuture = UserRepo.getUserWithAmplify();
    final profileFuture = ProfileRepo.getProfile();
    final data = await Future.wait([userFuture, profileFuture]);
    User? user;
    Profile? profile;
    if (data.isNotEmpty) {
      user = data.first?.item1 as User?;
      if (data.length > 1) {
        profile = data[1]?.item1 as Profile?;
      }
    }
    if(user!=null){
      emit(PostState.data(UserInfoState(user: user,profile: profile)));
    }
  }
}

@freezed
class UserInfoState with _$UserInfoState {
  const factory UserInfoState({
    required User user,
    Profile? profile,
  }) = _User;
}
