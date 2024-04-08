// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:bonfirehealth/app/app.dart';

class BorderlessTextField extends StatefulWidget {
  const BorderlessTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.initialValue = '',
    this.fillColor = AppColourConstant.textFieldGreyFillF4F4F8,
    this.hintText,
    this.controller,
    this.focusNode,
    this.isEnabled = true,
    this.readOnly = false,
    this.textColor,
    this.verticalPadding = 18,
    this.inputFormatters,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength = 1000,
    this.maxLengthEnforcement = MaxLengthEnforcement.enforced,
    this.suffixIcon,
    this.obscureText = false,
    this.showCounter = false,
    this.keyboardType = TextInputType.text,
  });

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String initialValue;
  final Color? fillColor;
  final String? hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final FocusNode? focusNode;
  final bool isEnabled;
  final double verticalPadding;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool showCounter;
  final TextInputType? keyboardType;

  @override
  BorderlessTextFieldState createState() => BorderlessTextFieldState();
}

class BorderlessTextFieldState extends State<BorderlessTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController(text: widget.initialValue);
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
    return TextField(
      enabled: widget.isEnabled,
      controller: _controller,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      readOnly: widget.readOnly,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      enableSuggestions: false,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: widget.textColor ?? AppColourConstant.black1E1F2B,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
      cursorColor: Theme.of(context).primaryColor,
      inputFormatters: widget.inputFormatters,
      buildCounter: (
        _, {
        required currentLength,
        required isFocused,
        maxLength,
      }) =>
          widget.showCounter
              ? Text(
                  '$currentLength/$maxLength ${l10n.characters}',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              : const SizedBox.shrink(),
      decoration: InputDecoration(
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: widget.textColor ?? AppColourConstant.textFieldTextColorA0B2C6,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
        border: _CustomBorder(),
        enabledBorder: _CustomBorder(),
        focusedBorder: _CustomBorder(),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: widget.verticalPadding,
        ),
        isDense: true,
        suffixIcon: widget.suffixIcon,
      ),
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
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
