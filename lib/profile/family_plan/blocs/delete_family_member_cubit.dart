// Package imports:
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/app/blocs/post_state.dart';
import 'package:bonfirehealth/app/models/user.dart';

class DeleteFamilyMemberCubit extends Cubit<PostState<bool>> {
  DeleteFamilyMemberCubit() : super(const PostState.initial());

  Future<void> initiate(String id) async {
    emit(PostState.loading());
    final request = ModelQueries.get(
      User.classType,
      id,
    );
    final response = await Amplify.API.query(request: request).response;
    final user = response.data;
    if (user != null) {
      final deleteUser = user.copyWith(deletedAt: TemporalDateTime.now());
      final deleteReq = ModelMutations.update<User>(
        deleteUser,
        authorizationMode: APIAuthorizationType.userPools,
      );

      await Amplify.API.mutate(request: deleteReq).response;
    }
    emit(PostState.data(true));
  }

  Future<GraphQLResponse<T>> deleteItem<T extends Model>(T obj) async {
    final request = ModelMutations.delete<T>(obj);
    final response = await Amplify.API.mutate(request: request).response;
    return response;
  }
}
