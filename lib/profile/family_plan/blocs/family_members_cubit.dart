

// Package imports:
import 'package:bloc/bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import '../../../app/models/user.dart';

class FamilyMembersCubit extends Cubit<List<User?>> {
  FamilyMembersCubit() : super([]);

  Future<void> load() async {
    final list = await UserRepo.getFamilyMembers();
    emit(list!);
  }
}
