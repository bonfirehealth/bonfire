// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/onboarding/enter_organisation_code/blocs/enter_organisation_code_bloc.dart';

class SearchDepartmentView extends StatefulWidget {
  const SearchDepartmentView({super.key, required this.organisationCode});
  final String organisationCode;

  @override
  State<SearchDepartmentView> createState() => SearchDepartmentViewState();
}

class SearchDepartmentViewState extends State<SearchDepartmentView>
    with AfterLayoutMixin<SearchDepartmentView> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    context.read<EnterOrganisationCodeBloc>().add(
          EnterOrganisationCodeDepartmentTap(widget.organisationCode),
        );
    context.read<EnterOrganisationCodeBloc>().add(
          EnterOrganisationCodeOrganisationCodeSet(widget.organisationCode),
        );

    _controller = TextEditingController();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<EnterOrganisationCodeBloc>();

    final column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: LanguageSelector(buttonHeight: 30, fontSize: 12),
        ),
        BlocBuilder<EnterOrganisationCodeBloc, EnterOrganisationCodeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppImage.asset(
                            ImageConstant.alissaAvatar,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                    const SpacerVertical(32),
                    Text(
                      l10n.helloAlissa,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColourConstant.grey50535A,
                          ),
                    ),
                    const SpacerVertical(32),
                    Text(
                      l10n.helloAlissaSubtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColourConstant.grey50535A,
                          ),
                    ),
                  ],
                ),
                const SpacerVertical(32),
                RoundedDropDown(
                  controller: _controller,
                  departmentList: state.departmentList ?? [],
                ),
                const SpacerVertical(16),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: RoundedButton(
                    onPressed: () {
                      // bloc.add(EnterOrganisationCodeDepartmentSubmit(context));
                      bloc.add(EnterOrganisationCodeFormSubmit(context));
                    },
                    title: 'Select',
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            );
          },
        ),
        TextFooter(
          text2OnTap: () => onTermsOfServiceHTMLSelected(context),
          text1: '${l10n.bySigning1} ',
          text2: l10n.bySigning2,
          isText2Underlined: true,
        ),
      ],
    );
    return column;
  }
}

class RoundedDropDown extends StatefulWidget {
  const RoundedDropDown({
    super.key,
    required TextEditingController controller,
    required this.departmentList,
  }) : _controller = controller;

  final TextEditingController _controller;
  final List<OrgDepartment> departmentList;

  @override
  State<RoundedDropDown> createState() => _RoundedDropDownState();
}

class _RoundedDropDownState extends State<RoundedDropDown> {
  final facultyUnits = <DropdownMenuEntry<OrgDepartment>>[];
  final filteredFacultyUnits = <DropdownMenuEntry<OrgDepartment>>[];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EnterOrganisationCodeBloc>();

    for (final faculty in widget.departmentList) {
      facultyUnits.add(
        DropdownMenuEntry<OrgDepartment>(
          value: faculty,
          label: faculty.displayDepartment,
          style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Color(0xFFF2F2F2))),
        ),
      );
    }

    widget._controller.addListener(() {
      filteredFacultyUnits.clear();

      for (final faculty in facultyUnits) {
        if (faculty.value.displayDepartment
            .toLowerCase()
            .contains(widget._controller.text.toLowerCase())) {
          filteredFacultyUnits.add(faculty);
        }
      }
    });
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return DropdownMenu<OrgDepartment>(
          width: constraints.maxWidth,
          menuHeight: 250,
          hintText: 'Select Department',
          controller: widget._controller,
          textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColourConstant.black1E1F2B),
            border: _CustomBorder(AppColourConstant.blue1A56CF),
            enabledBorder: _CustomBorder(AppColourConstant.blue1A56CF),
            focusedBorder: _CustomBorder(AppColourConstant.blue1A56CF),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          dropdownMenuEntries: filteredFacultyUnits,
          menuStyle: const MenuStyle(
            surfaceTintColor: MaterialStatePropertyAll(Colors.white),
            visualDensity: VisualDensity.compact,
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            ),
            shadowColor: MaterialStatePropertyAll(Colors.grey),
          ),
          onSelected: (OrgDepartment? faculty) {
            bloc.add(EnterOrganisationCodeDepartmentSet(faculty!));
          },
        );
      },
    );
  }
}

class _CustomBorder extends OutlineInputBorder {
  _CustomBorder(Color borderColor)
      : super(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor, width: 3),
        );
}
