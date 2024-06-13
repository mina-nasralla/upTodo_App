import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key, required this.alerttitle, required this.alerttext,
  });

 final String alerttitle;
 final String alerttext;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(alerttitle),
      content:  SizedBox(
        width: double.maxFinite,
        child: Text(alerttext),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
