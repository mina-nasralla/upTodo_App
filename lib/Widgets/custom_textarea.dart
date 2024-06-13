import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
        this.preicon,
        required this.keyboardtype,
        required this.obsecure,
        this.hint,
        this.suffix,
        required this.tag,
        required this.textEditingController});

  String? hint;
  final String tag;
  IconData? preicon;
  IconData? suffix;
  final TextInputType keyboardtype;
  final bool obsecure;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: MediaQuery.sizeOf(context).height*.16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tag,
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          const SizedBox(height: 15),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'This Field is required';
              } else {
                return null;
              }
            },
            controller: textEditingController,
            obscureText: obsecure,
            keyboardType: keyboardtype,
            decoration: InputDecoration(
              isDense: true,
              errorStyle: const TextStyle(color: Colors.red),
              prefixIcon: Icon(preicon, color: Colors.white,),
              suffixIcon: Icon(suffix),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.white70)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xffCEBBFE))),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
