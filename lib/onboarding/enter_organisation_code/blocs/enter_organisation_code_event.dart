part of 'enter_organisation_code_bloc.dart';

@immutable
abstract class EnterOrganisationCodeEvent {
  const EnterOrganisationCodeEvent();
}

class EnterOrganisationCodeInitSet extends EnterOrganisationCodeEvent {
  const EnterOrganisationCodeInitSet();

  @override
  String toString() => 'EnterOrganisationCodeInitSet {}';
}

class EnterOrganisationCodeIsLoadingSet extends EnterOrganisationCodeEvent {
  const EnterOrganisationCodeIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'EnterOrganisationCodeIsLoadingSet {}';
}

class EnterOrganisationCodeOrganisationCodeSet
    extends EnterOrganisationCodeEvent {
  const EnterOrganisationCodeOrganisationCodeSet(this.organisationCode);

  final String organisationCode;

  @override
  String toString() => 'EnterOrganisationCodeOrganisationCodeSet {}';
}

class EnterOrganisationCodeFormSubmit extends EnterOrganisationCodeEvent {
  const EnterOrganisationCodeFormSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'EnterOrganisationCodeFormSubmit {}';
}

class EnterOrganisationCodeFinNumberSet extends EnterOrganisationCodeEvent {
  const EnterOrganisationCodeFinNumberSet(this.finNumber);

  final String finNumber;

  @override
  String toString() => 'EnterOrganisationCodeFinNumberSet {}';
}

class EnterOrganisationCodeFinNumberSubmit extends EnterOrganisationCodeEvent {
  const EnterOrganisationCodeFinNumberSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'EnterOrganisationCodeFinNumberSubmit {}';
}

class EnterOrganisationCodeDepartmentTap extends EnterOrganisationCodeEvent {
  const EnterOrganisationCodeDepartmentTap(this.organisationCode);
  final String organisationCode;

  @override
  String toString() => 'EnterOrganisationCodeDepartmentTap {}';
}

class EnterOrganisationCodeDepartmentSet extends EnterOrganisationCodeEvent {
  const EnterOrganisationCodeDepartmentSet(this.selectedDepartment);

  final OrgDepartment selectedDepartment;

  @override
  String toString() => 'EnterOrganisationCodeDepartmentSet {}';
}

class EnterOrganisationCodeDepartmentSubmit extends EnterOrganisationCodeEvent {
  const EnterOrganisationCodeDepartmentSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'EnterOrganisationCodeDepartmentSubmit {}';
}
