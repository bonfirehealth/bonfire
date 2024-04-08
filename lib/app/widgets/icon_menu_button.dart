// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tuple/tuple.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/app_colour_constant.dart';

class IconMenuButton<T> extends StatelessWidget {
  const IconMenuButton({
    super.key,
    required this.text,
    required this.items,
    this.buttonHeight = 20,
    this.fontSize = 9,
    this.selectedValue,
    this.onChanged,
  });

  final String text;
  final double buttonHeight;
  final double fontSize;
  final List<Tuple2<String, T>> items;
  final Tuple2<String, T>? selectedValue;
  final void Function(Tuple2<String, T>?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<Tuple2<String, T>>(
        hint: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: fontSize,
                color: AppColourConstant.whiteFFFFFF,
                fontWeight: FontWeight.bold,
              ),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<Tuple2<String, T>>(
                value: item,
                child: Text(
                  item.item1,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: fontSize,
                        color: AppColourConstant.whiteFFFFFF,
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        iconSize: 14,
        iconEnabledColor: AppColourConstant.whiteFFFFFF,
        iconDisabledColor: AppColourConstant.grey50535A,
        buttonHeight: buttonHeight,
        buttonPadding: const EdgeInsets.only(left: 16, right: 16),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColourConstant.blue1A56CF,
        ),
        buttonElevation: 2,
        itemHeight: buttonHeight,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 150,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColourConstant.blue1A56CF,
        ),
        dropdownElevation: 2,
        scrollbarAlwaysShow: false,
        offset: const Offset(0, -2),
      ),
    );
  }
}
