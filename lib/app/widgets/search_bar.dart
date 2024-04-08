// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
    this.focusNode,
    this.onSearchTextChanged,
    this.onMenuPressed,
  });

  final FocusNode? focusNode;
  final void Function(String)? onSearchTextChanged;
  final void Function()? onMenuPressed;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: const BoxDecoration(
                color: AppColourConstant.greyE6EFFF,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                        focusNode: widget.focusNode,
                        controller: _controller,
                        onChanged: widget.onSearchTextChanged,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColourConstant.grey50535A,
                            ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 7,
                            horizontal: 14,
                          ),
                          hintText: l10n.search,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color:
                                    AppColourConstant.blue8DA2CD.withOpacity(0),
                              ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    height: 24,
                    width: 24,
                    alignment: Alignment.center,
                    child: AppImage.asset(
                      ImageConstant.search,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // InkWell(
          //   onTap: widget.onMenuPressed,
          //   child: Container(
          //     height: 50,
          //     width: 57,
          //     alignment: Alignment.center,
          //     child: Container(
          //       alignment: Alignment.center,
          //       height: 20,
          //       width: 20,
          //       child: AppImage.asset(
          //         ImageConstant.hamburgerMenu,
          //         height: 20,
          //         width: 20,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
