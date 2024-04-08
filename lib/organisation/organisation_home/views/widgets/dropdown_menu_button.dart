part of '../organisation_home_page.dart';

class DropdownMenuButton<T> extends StatelessWidget {
  const DropdownMenuButton({
    super.key,
    required this.hintText,
    required this.items,
    this.selectedValue,
    this.onChanged,
  });

  final String hintText;
  final List<Tuple2<String, T>> items;
  final Tuple2<String, T>? selectedValue;
  final void Function(Tuple2<String, T>?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<Tuple2<String, T>>(
        isExpanded: true,
        hint: AutoSizeText(
          hintText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        icon: const Icon(
          FontAwesomeIcons.caretDown,
        ),
        iconSize: 14,
        iconEnabledColor: AppColourConstant.whiteFFFFFF,
        iconDisabledColor: AppColourConstant.grey50535A,
        buttonHeight: 60,
        buttonWidth: 160,
        buttonPadding: const EdgeInsets.only(left: 16, right: 16),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColourConstant.blue1A56CF,
        ),
        buttonElevation: 2,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownMaxHeight: 200,
        dropdownWidth: 200,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColourConstant.blue1A56CF,
        ),
        dropdownElevation: 2,
        scrollbarAlwaysShow: false,
        offset: const Offset(-20, -2),
      ),
    );
  }
}
