// Flutter imports:
// ignore_for_file: use_build_context_synchronously

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

part 'search_department_code_event.dart';
part 'search_department_code_state.dart';

class SearchDepartmentCodeBloc extends Bloc<SearchDepartmentCodeEvent, SearchDepartmentCodeState> {
  SearchDepartmentCodeBloc() : super(const SearchDepartmentCodeState()) {
    on<SearchDepartmentCodeInitSet>(_onSearchDepartmentCodeInitSet);
    on<SearchDepartmentCodeIsLoadingSet>(_onSearchDepartmentCodeIsLoadingSet);
    on<SearchDepartmentCodeDepartmentCodeSet>(
      _onSearchDepartmentCodeDepartmentCodeSet,
    );
    on<SearchYourDepartmentFormFormSubmit>(_onSearchDepartmentCodeFormSubmit);
  }

  Future<void> _onSearchDepartmentCodeInitSet(
    SearchDepartmentCodeInitSet event,
    Emitter<SearchDepartmentCodeState> emit,
  ) async {}

  void _onSearchDepartmentCodeIsLoadingSet(
    SearchDepartmentCodeIsLoadingSet event,
    Emitter<SearchDepartmentCodeState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: event.isLoading,
      ),
    );
  }

  Future<void> _onSearchDepartmentCodeDepartmentCodeSet(
    SearchDepartmentCodeDepartmentCodeSet event,
    Emitter<SearchDepartmentCodeState> emit,
  ) async {
    emit(state.copyWith(departmentCode: event.departmentCode));
  }

  Future<void> _onSearchDepartmentCodeFormSubmit(
    SearchYourDepartmentFormFormSubmit event,
    Emitter<SearchDepartmentCodeState> emit,
  ) async {
    final context = event.context;
    final appBloc = context.read<AppBloc>();
    if (state.departmentCode == null || state.departmentCode!.isEmpty) {
      appBloc.add(AppErrorMessageSet(context, 'Error', 'Error'));
    } else {
      // TODO: implement
    }
  }
}
