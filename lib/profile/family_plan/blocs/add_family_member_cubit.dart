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
import '../../../app/helpers/flavors.dart';
import '../../../app/repositories/amplify_repo.dart';
import 'add_family_member_state.dart';

class AddFamilyMemberCubit extends Cubit<AddFamilyMemberState> {
  AddFamilyMemberCubit() : super(const AddFamilyMemberState.initial());

  static String getFamilyPlanUrl(String uniqueLinkVal, String emailAddress) {
    return '${html.window.location.protocol}//${html.window.location.host}/#/family-member/$uniqueLinkVal?e=$emailAddress';
  }

  Future<void> createUser(String? organisationId, String firstName, String lastName, String avatarName) async {
    emit(AddFamilyMemberState.loading());
    await CoreRepo.init();
    final usernameGen = UsernameGen()..setSeperator('_');
    final username = usernameGen.generate().replaceAll('-', '_').toLowerCase();
    final domainName = AppConstant.emailDomainUrl;
    final emailAddress = '$username@$domainName';
    final password = AuthHelper.generatePassword(numberCharPassword: 8);
    final isEmailAddressValid = isEmail(emailAddress);
    final isEmailAddressAvailable = await AmplifyRepo.callCheckEmailAddressAvailability(
      emailAddress,
    );
    if (isEmailAddressAvailable && isEmailAddressValid) {
      final uniqueLinkValueResponse = await AmplifyRepo.encryptDecryptFamilyMemberPassword('encrypt', password);
      final uniqueLinkVal = uniqueLinkValueResponse?['value'];
      print("PARENT ID IS ${CoreRepo.userId}");
      final userMap = await AmplifyRepo.confirmSignUpAsGroup(username, emailAddress, password,
          organisationId: organisationId ?? '',
          userTypeId: AmplifyConstant.getFamilyMemberTypeId(FlavorConfig.instance!.flavor),
          parentId: CoreRepo.userId,
          uniqueLinkValue: uniqueLinkVal,
          firstName: firstName,
          avatar: avatarName,
          lastName: lastName);

      final url =getFamilyPlanUrl(uniqueLinkVal!, emailAddress);
      emit(AddFamilyMemberState.success(url));
    }
  }
}
