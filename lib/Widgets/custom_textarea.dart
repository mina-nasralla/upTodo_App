import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
        this.preicon,
      required this.keyboardtype,
      required this.obsecure,
        this.hint,
        this.suffix,
      required this.tag});

  String? hint;
  final String tag;
  IconData? preicon;
  IconData? suffix;
  final TextInputType keyboardtype;
  final bool obsecure;
  TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tag,
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: TextField(
              controller: textEditingController,
              obscureText: obsecure,
              keyboardType: keyboardtype,
              decoration: InputDecoration(
                prefixIcon: Icon(preicon),
                suffixIcon: Icon(suffix),
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
