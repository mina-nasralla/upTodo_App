import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';

class custom_button extends StatelessWidget {
   custom_button({
    super.key,
     required this.width,
     required this.hieght,
     required this.onpressed,
     required this.buttontext,
     required this.backgroundcolor,
  });

  final double width;
  final double hieght;
  final String buttontext;
  VoidCallback onpressed;
   final Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: hieght,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          foregroundColor: Colors.white,
          backgroundColor: backgroundcolor,
          side:const BorderSide( // Added for border
            color: primcolor, // Matches background color
            width: 1.0, // Adjust border width as needed
          ),
        ),
        child: Text(
          buttontext.toUpperCase(), style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
