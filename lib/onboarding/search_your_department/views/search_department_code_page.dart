// Dart imports:
import 'dart:async';
import 'dart:math';

// Flutter imports:
import 'package:bonfirehealth/gen/assets.gen.dart';
import 'package:bonfirehealth/onboarding/enter_organisation_code/blocs/enter_organisation_code_bloc.dart';
import 'package:bonfirehealth/onboarding/search_your_department/search_department_code.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:after_layout/after_layout.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:searchfield/searchfield.dart';

class SearchDepartmentCodePage extends StatelessWidget {
  const SearchDepartmentCodePage({
    super.key,
    @QueryParam('oc') this.organisationCode,
  });

  final String? organisationCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchDepartmentCodeBloc>(
      create: (_) => SearchDepartmentCodeBloc(),
      child: Scaffold(
        backgroundColor: AppColourConstant.whiteFFFFFF,
        body: SafeArea(
          minimum: const EdgeInsets.all(20),
          child: EnterDepartmentCodeBody(organisationCode: organisationCode),
        ),
      ),
    );
  }
}

class EnterDepartmentCodeBody extends StatefulWidget {
  const EnterDepartmentCodeBody({super.key, this.organisationCode});

  final String? organisationCode;

  @override
  State<EnterDepartmentCodeBody> createState() =>
      EnterDepartmentCodeBodyState();
}

class EnterDepartmentCodeBodyState extends State<EnterDepartmentCodeBody>
    with AfterLayoutMixin<EnterDepartmentCodeBody> {
  late TextEditingController _controller;

  bool _showDropDown = false;
  void _onFocusRemoved() {
    setState(() {
      _showDropDown = false;
    });
  }

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
    context.read<EnterOrganisationCodeBloc>().add(
          EnterOrganisationCodeDepartmentTap(widget.organisationCode!),
        );
    context.read<EnterOrganisationCodeBloc>().add(
          EnterOrganisationCodeOrganisationCodeSet(widget.organisationCode!),
        );

    _controller = TextEditingController();
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.organisationCode != null) {
      context.read<SearchDepartmentCodeBloc>().add(
            SearchDepartmentCodeDepartmentCodeSet(widget.organisationCode!),
          );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final double bannerHeight = min(
      MediaQuery.of(context).size.height / 2,
      350,
    );
    return BlocBuilder<EnterOrganisationCodeBloc, EnterOrganisationCodeState>(
      builder: (context, state) {
        if (!_showDropDown) {
          return ListView(
            children: [
              const SpacerVertical(32),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: bannerHeight,
                    child: Assets.images.searchDepartmentCodeBanner.image(
                      width: bannerHeight,
                      height: bannerHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SpacerVertical(32),
                  Text(
                    l10n.getStarted,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColourConstant.grey6C798B,
                        ),
                  ),
                  const SpacerVertical(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.scanYourFaceTitle,
                        textAlign: TextAlign.start,
                        style:
                            Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SpacerVertical(30),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColourConstant.textFieldGreyFillF4F4F8,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: _controller,
                      focusNode: FocusNode(),
                      onTap: () {
                        setState(() {
                          _showDropDown = true;
                        });
                      },
                      decoration: InputDecoration(
                        fillColor: AppColourConstant.textFieldGreyFillF4F4F8,
                        hintText: l10n.searchYourDepartment,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(
                              color: AppColourConstant.textFieldTextColorA0B2C6,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                        border: _CustomBorder(),
                        enabledBorder: _CustomBorder(),
                        focusedBorder: _CustomBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        isDense: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            final searchQuery = _controller.text.trim();

                            if (searchQuery.isEmpty) {
                              showSnackbarDialog(
                                context,
                                'Department cannot be empty.',
                                onPressed: () {},
                              );
                            } else {
                              final bloc =
                                  context.read<EnterOrganisationCodeBloc>();
                              bloc.add(
                                EnterOrganisationCodeFormSubmit(context),
                              );
                            }
                          },
                          icon: const Icon(
                            FeatherIcons.send,
                            size: 32,
                            color: AppColourConstant.grey9A9A9A,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SpacerVertical(50),
                ],
              ),
              TextFooter(
                text2OnTap: () => onTermsOfServiceHTMLSelected(context),
                text1: '${l10n.bySigning1} ',
                text2: '\n${l10n.termsOfUse}',
                text3: ' and ',
                text4: 'PDPA notice',
                isText2Underlined: true,
                isText4Underlined: true,
                text4OnTap: () => onPDPANoticeHTMLSelected(context),
              ),
            ],
          );
        }

        return DepartmentDropDown(
            controller: _controller,
            departmentList: state.departmentList ?? [],
            onFocusRemoved: () {
              _onFocusRemoved();
            });
      },
    );
  }
}

class _CustomBorder extends OutlineInputBorder {
  _CustomBorder()
      : super(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        );
}

class DepartmentDropDown extends StatefulWidget {
  const DepartmentDropDown({
    super.key,
    required TextEditingController controller,
    required this.departmentList,
    required this.onFocusRemoved,
  }) : _controller = controller;

  final TextEditingController _controller;
  final List<OrgDepartment> departmentList;
  final VoidCallback onFocusRemoved;

  @override
  State<DepartmentDropDown> createState() => _DepartmentDropDownState();
}

class _DepartmentDropDownState extends State<DepartmentDropDown> {
  late FocusNode dropdownFocus;
  @override
  void initState() {
    super.initState();
    dropdownFocus = FocusNode();
    dropdownFocus
      ..requestFocus()
      ..addListener(() {
        if (!dropdownFocus.hasFocus) {
          widget.onFocusRemoved();
        }
      });
  }

  @override
  void dispose() {
    dropdownFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<EnterOrganisationCodeBloc>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColourConstant.textFieldGreyFillF4F4F8,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SearchField(
        controller: widget._controller,
        focusNode: dropdownFocus,
        searchStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColourConstant.black1E1F2B,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
        searchInputDecoration: InputDecoration(
          fillColor: AppColourConstant.textFieldGreyFillF4F4F8,
          hintText: l10n.searchYourDepartment,
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColourConstant.textFieldTextColorA0B2C6,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
          border: _CustomBorder(),
          enabledBorder: _CustomBorder(),
          focusedBorder: _CustomBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          isDense: true,
          suffixIcon: IconButton(
            onPressed: () {
              dropdownFocus.unfocus();

              final searchQuery = widget._controller.text.trim();

              if (searchQuery.isEmpty) {
                showSnackbarDialog(
                  context,
                  'Department cannot be empty.',
                  onPressed: () {},
                );
              } else {
                bloc.add(EnterOrganisationCodeFormSubmit(context));
              }
            },
            icon: const Icon(
              FeatherIcons.send,
              size: 32,
              color: AppColourConstant.grey9A9A9A,
            ),
          ),
        ),
        itemHeight: 50,
        inputType: TextInputType.text,
        suggestionsDecoration: SuggestionDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        suggestions: widget.departmentList
            .map(
              (department) => SearchFieldListItem(
                department.displayDepartment,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    child: Text(
                      department.displayDepartment,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColourConstant.black000000,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis),
                    ),
                    onTap: () {
                      dropdownFocus.unfocus();

                      bloc.add(
                        EnterOrganisationCodeDepartmentSet(department),
                      );
                      setState(() {
                        widget._controller.text = department.displayDepartment;
                      });
                    },
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
