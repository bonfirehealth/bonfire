part of 'search_department_code_bloc.dart';

@immutable
abstract class SearchDepartmentCodeEvent {
  const SearchDepartmentCodeEvent();
}

class SearchDepartmentCodeInitSet extends SearchDepartmentCodeEvent {
  const SearchDepartmentCodeInitSet();

  @override
  String toString() => 'SearchYourDepartmentInitSet {}';
}

class SearchDepartmentCodeIsLoadingSet extends SearchDepartmentCodeEvent {
  const SearchDepartmentCodeIsLoadingSet({
    this.isLoading = true,
  });

  final bool isLoading;

  @override
  String toString() => 'SearchYourDepartmentIsLoadingSet {}';
}

class SearchDepartmentCodeDepartmentCodeSet
    extends SearchDepartmentCodeEvent {
  const SearchDepartmentCodeDepartmentCodeSet(this.departmentCode);

  final String departmentCode;

  @override
  String toString() => 'SearchYourDepartmentDepartmentCodeSet {}';
}

class SearchYourDepartmentFormFormSubmit extends SearchDepartmentCodeEvent {
  const SearchYourDepartmentFormFormSubmit(this.context);

  final BuildContext context;

  @override
  String toString() => 'SearchYourDepartmentFormFormSubmit {}';
}