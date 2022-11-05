import 'package:flutter/material.dart';
import 'package:whatsapp_shop/core/constants/colors.dart';
// import 'package:mobile_pos/core/constant/text.dart';

class KAlertDialog extends StatelessWidget {
  const KAlertDialog({
    this.title,
    this.content,
    this.actions,
    this.submitText,
    this.submitAction,
    this.submitColor,
    Key? key,
  }) : super(key: key);

  final Widget? title, content;
  final String? submitText;
  final List<Widget>? actions;
  final Function()? submitAction;
  final Color? submitColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions ??
          [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: submitAction,
              child: Text(
                submitText ?? 'Yes',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryTextColor,
                ),
              ),
            ),
          ],
    );
  }
}
