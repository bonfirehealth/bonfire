// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';
import 'package:bonfirehealth/groups/groups.dart';

class PopupQuestionForm extends StatefulWidget {
  const PopupQuestionForm({
    super.key,
    this.group,
    required this.submitText,
    required this.onSubmit,
    required this.onTextChanged,
  });

  final Group? group;
  final String submitText;
  final void Function(String, String, String, String)? onSubmit;
  final void Function(String) onTextChanged;

  @override
  State<PopupQuestionForm> createState() => _PopupQuestionFormState();
}

class _PopupQuestionFormState extends State<PopupQuestionForm> {
  String selectedItemTitle = '';
  String selectedItemId = '';
  String name = '';
  String description = '';
  Group? selectedGroup;

  @override
  void initState() {
    super.initState();
    if (widget.group != null) {
      selectedGroup = widget.group;
      selectedItemId = widget.group!.id;
      selectedItemTitle = widget.group!.name!;
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
                  const SpacerVertical(16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          l10n.whatsOnYourMind,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColourConstant.black1E1F2B,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SpacerVertical(16),
                  GroupBubbleSelector(
                    onSelected: (Group? value) {
                      setState(() {
                        selectedGroup = value;
                        selectedItemId = selectedGroup!.id;
                        selectedItemTitle = selectedGroup!.name!;
                      });
                    },
                    selectedGroup: selectedGroup,
                  ),
                  const SpacerVertical(32),
                  RoundedTextField(
                    onChanged: (String value) {
                      setState(() {
                        name = value;
                      });
                      widget.onTextChanged(value);
                    },
                    hintText: '',
                    minLines: 8,
                    maxLines: 8,
                    inputFormatters: [LengthLimitingTextInputFormatter(1000)],
                    showCounter: true,
                    borderColor: AppColourConstant.greyE0E0E0,
                  ),
                  const SpacerVertical(32),
                  RoundedButton(
                    onPressed: () {
                      widget.onSubmit!(
                        selectedItemId,
                        selectedItemTitle,
                        name,
                        description,
                      );
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
