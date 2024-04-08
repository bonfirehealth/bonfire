// Flutter imports:
import 'package:flutter/material.dart';

void showSnackbarDialog(
  BuildContext context,
  String message, {
  bool showAction = false,
  String actionLabel = 'Settings',
  void Function()? onPressed,
  int seconds = 5,
}) {
  final snackBar = SnackBar(
    backgroundColor: Theme.of(context).primaryColor,
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium,
    ),
    action: showAction
        ? SnackBarAction(
            label: actionLabel,
            onPressed: onPressed ?? () {},
          )
        : null,
    duration: Duration(seconds: seconds),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
