// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';
import 'package:bonfirehealth/groups/widgets/widgets.dart';

class PopupGroupForm extends StatefulWidget {
  const PopupGroupForm({
    super.key,
    required this.submitText,
    required this.items,
    required this.itemIds,
    required this.onSubmit,
    required this.onDropownItemSelected,
    required this.onTextChanged,
  });

  final String submitText;
  final List<String> items;
  final List<String> itemIds;
  final void Function(String, String, String)? onSubmit;
  final void Function(String) onDropownItemSelected;
  final void Function(String) onTextChanged;

  @override
  State<PopupGroupForm> createState() => _PopupGroupFormState();
}

class _PopupGroupFormState extends State<PopupGroupForm> {
  String selectedItemTitle = '';
  String selectedItemId = '';
  String text = '';

  @override
  void initState() {
    super.initState();
    if (widget.items.isNotEmpty) {
      selectedItemTitle = widget.items[0];
      selectedItemId = widget.itemIds[0];
      widget.onTextChanged(selectedItemId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColourConstant.black1E1F2B.withOpacity(0),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.zero,
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      InkWell(
                        child: SizedBox(
                          width: 18,
                          height: 18,
                          child: AppImage.asset(
                            ImageConstant.closeCross,
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SpacerVertical(18),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: l10n.suggestNewSupportGroupSubtitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColourConstant.grey50535A,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    height: 1.4,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SpacerVertical(18),
                  RoundedTextField(
                    onChanged: (String value) {
                      setState(() {
                        text = value;
                      });
                      widget.onTextChanged(value);
                    },
                    hintText: l10n.enterTitleHere,
                  ),
                  const SpacerVertical(8),
                  DropdownPopupField(
                    onTap: () {
                      showDialog<void>(
                        useSafeArea: false,
                        context: context,
                        builder: (BuildContext context) {
                          return PopupListMenu(
                            onSelected: (String id, String value) {
                              setState(() {
                                selectedItemId = id;
                                selectedItemTitle = value;
                              });
                              widget.onDropownItemSelected(selectedItemId);
                            },
                            itemIds: widget.itemIds,
                            items: widget.items,
                          );
                        },
                      );
                    },
                    title: selectedItemTitle,
                  ),
                  const SpacerVertical(18),
                  RoundedButton(
                    onPressed: () {
                      widget.onSubmit!(selectedItemId, selectedItemTitle, text);
                    },
                    title: widget.submitText,
                  ),
                  const SpacerVertical(32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
