part of 'search_department_code_bloc.dart';

class SearchDepartmentCodeState {
  const SearchDepartmentCodeState({
    this.isLoading = false,
    this.departmentCode,
    this.department,
  });

  final bool isLoading;
  final String? departmentCode;
  final dynamic department;

  SearchDepartmentCodeState copyWith({
    bool? isLoading,
    String? departmentCode,
    dynamic department,
  }) {
    return SearchDepartmentCodeState(
      isLoading: isLoading ?? this.isLoading,
      departmentCode: departmentCode ?? this.departmentCode,
      department: department ?? this.department,
    );
  }
}
