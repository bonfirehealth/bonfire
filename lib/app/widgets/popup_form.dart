// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class PopupForm extends StatefulWidget {
  const PopupForm({
    super.key,
    this.header,
    required this.submitText,
    required this.onSubmit,
    required this.onTitleTextChanged,
    required this.onDescriptionTextChanged,
  });

  final String? header;
  final String submitText;
  final void Function(String, String) onSubmit;
  final void Function(String) onTitleTextChanged;
  final void Function(String) onDescriptionTextChanged;

  @override
  State<PopupForm> createState() => _PopupFormState();
}

class _PopupFormState extends State<PopupForm> {
  String title = '';
  String description = '';

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
                  if (widget.header != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.header!,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColourConstant.grey50535A,
                                    fontWeight: FontWeight.w600,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        const SpacerVertical(18),
                      ],
                    ),
                  ],
                  Text(
                    l10n.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColourConstant.grey50535A,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  const SpacerVertical(8),
                  RoundedTextField(
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                      widget.onTitleTextChanged(value);
                    },
                  ),
                  const SpacerVertical(16),
                  Text(
                    l10n.description,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColourConstant.grey50535A,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  const SpacerVertical(8),
                  RoundedTextField(
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                      widget.onDescriptionTextChanged(value);
                    },
                    minLines: 12,
                    maxLines: 12,
                  ),
                  const SpacerVertical(16),
                  RoundedButton(
                    onPressed: () {
                      widget.onSubmit(title, description);
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
