
enum UserTypeEnum {
  familyMember('family_member'),
  organisationEmployee('organisation_employee');
  const UserTypeEnum(this.name);
  final String name;
}