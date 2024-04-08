// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:dropdown_button2/dropdown_button2.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/l10n/l10n.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class PopupAssessmentForm extends StatelessWidget {
  const PopupAssessmentForm({
    super.key,
    this.assessmentId,
    required this.submitText,
    required this.onSubmit,
    required this.onHeartRateTextChanged,
    required this.onHeartRateSourceTextChanged,
  });

  final String? assessmentId;
  final String submitText;
  final void Function()? onSubmit;
  final void Function(String)? onHeartRateTextChanged;
  final void Function(String?)? onHeartRateSourceTextChanged;

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
                  if (assessmentId != null) ...[
                    Text(
                      'Assessment ID: $assessmentId',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColourConstant.grey50535A,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.left,
                    ),
                    const SpacerVertical(8),
                  ],
                  Text(
                    l10n.heartRateReading,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColourConstant.grey50535A,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  const SpacerVertical(8),
                  RoundedTextField(
                    onChanged: onHeartRateTextChanged,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 16),
                      child: Text(
                        l10n.heartRateSymbol,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColourConstant.grey50535A,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                  const SpacerVertical(16),
                  Text(
                    l10n.heartRateReadingSource,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColourConstant.grey50535A,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.left,
                  ),
                  const SpacerVertical(8),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: _CustomBorder(AppColourConstant.blue8DA2CD),
                      enabledBorder:
                          _CustomBorder(AppColourConstant.blue8DA2CD),
                      focusedBorder:
                          _CustomBorder(AppColourConstant.blue8DA2CD),
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    isExpanded: true,
                    hint: Text(
                      l10n.heartRateReadingSource,
                      style: const TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColourConstant.black1E1F2B,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: TextConstant.getVitalReadingSources()
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select reading source.';
                      }
                      return null;
                    },
                    onChanged: onHeartRateSourceTextChanged,
                    onSaved: (value) {},
                  ),
                  const SpacerVertical(16),
                  RoundedButton(
                    onPressed: onSubmit,
                    title: submitText,
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

class _CustomBorder extends OutlineInputBorder {
  _CustomBorder(Color whiteEFF3FB)
      : super(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: whiteEFF3FB, width: 2),
        );
}
