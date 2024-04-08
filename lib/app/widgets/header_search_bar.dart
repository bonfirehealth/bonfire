// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class HeaderSearchBar extends StatefulWidget {
  const HeaderSearchBar({
    super.key,
    required this.searchList,
    required this.onBackPressed,
    required this.onSearchTextChanged,
  });

  final List<String> searchList;
  final void Function()? onBackPressed;
  final void Function(String) onSearchTextChanged;
  @override
  HeaderSearchBarState createState() => HeaderSearchBarState();
}

class HeaderSearchBarState extends State<HeaderSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                width: 50,
                alignment: Alignment.center,
                child: InkWell(
                  child: const SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(
                      FontAwesomeIcons.x,
                      color: AppColourConstant.greyCDD5E0,
                    ),
                  ),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    widget.onBackPressed!();
                  },
                ),
              ),
              Expanded(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColourConstant.greyE6EFFF,
                    boxShadow: [
                      BoxShadow(
                        color: AppColourConstant.greyCDD5E0,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    autofocus: true,
                    controller: _controller,
                    onChanged: widget.onSearchTextChanged,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColourConstant.grey50535A),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: InkWell(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: AppImage.asset(
                              ImageConstant.clear,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          onTap: () {
                            widget.onSearchTextChanged(_controller.text);
                            _controller.clear();
                          },
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColourConstant.greyE6EFFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: AppColourConstant.greyE6EFFF.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SpacerHorizontal(16),
            ],
          ),
        ),
        Container(
          child: widget.searchList.isNotEmpty
              ? Container(
                  height: 20,
                  margin: const EdgeInsets.only(top: 4, bottom: 20),
                  alignment: Alignment.center,
                  child: Text(
                    l10n.setFoundMatches(widget.searchList.length.toString()),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColourConstant.blue8DA2CD),
                  ),
                )
              : Container(height: 0),
        ),
      ],
    );
  }
}
