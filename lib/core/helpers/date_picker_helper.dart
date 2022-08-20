import 'package:flutter/cupertino.dart';

showCupertinoDatePicker(BuildContext context,
    {required Widget child,
    required String text,
    required VoidCallback onClicked}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
            actions: [child],
            cancelButton: CupertinoActionSheetAction(
              onPressed: onClicked,
              child: Text(text),
            ),
          ));
}
