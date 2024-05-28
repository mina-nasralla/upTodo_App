import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: const Text('Choose Category')),
      content: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height*.7,
      ),
    );
  }
}
