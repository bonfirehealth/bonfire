// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:bonfirehealth/app/constants/constants.dart';
import 'package:bonfirehealth/app/widgets/widgets.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({
    super.key,
    this.hintText,
    this.onImagePressed,
    this.onSubmit,
  });

  final String? hintText;
  final void Function()? onImagePressed;
  final void Function(String)? onSubmit;

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: IconButton(
            onPressed: widget.onImagePressed,
            padding: const EdgeInsets.all(16),
            iconSize: 28,
            icon: const Icon(FontAwesomeIcons.paperclip),
          ),
        ),
        const SpacerHorizontal(4),
        Expanded(
          child: RoundedTextField(
            controller: _controller,
            borderColor: AppColourConstant.greyE6EFFF,
            fillColor: AppColourConstant.whiteF8F8F8,
            hintText: widget.hintText,
            suffixIcon: IconButton(
              onPressed: () {
                widget.onSubmit!(_controller.text);
                _controller.clear();
              },
              icon: AppImage.asset(ImageConstant.send),
            ),
          ),
        ),
      ],
    );
  }
}
