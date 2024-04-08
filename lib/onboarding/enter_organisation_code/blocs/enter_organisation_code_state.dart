part of 'enter_organisation_code_bloc.dart';

class EnterOrganisationCodeState {
  const EnterOrganisationCodeState({
    this.isLoading = false,
    this.organisationCode,
    this.finNumber,
    this.organisation,
    this.departmentList,
    this.selectedDepartment,
  });

  final bool isLoading;
  final String? organisationCode;
  final String? finNumber;
  final Organisation? organisation;
  final List<OrgDepartment>? departmentList;
  final OrgDepartment? selectedDepartment;

  EnterOrganisationCodeState copyWith({
    bool? isLoading,
    String? organisationCode,
    String? finNumber,
    Organisation? organisation,
    List<OrgDepartment>? departmentList,
    OrgDepartment? selectedDepartment,
  }) {
    return EnterOrganisationCodeState(
      isLoading: isLoading ?? this.isLoading,
      organisationCode: organisationCode ?? this.organisationCode,
      finNumber: finNumber ?? this.finNumber,
      organisation: organisation ?? this.organisation,
      departmentList: departmentList ?? this.departmentList,
      selectedDepartment: selectedDepartment ?? this.selectedDepartment,
    );
  }
}
