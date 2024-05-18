import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height, // Corrected spelling
    required this.onPressed,
    required this.buttonText, // Corrected spelling and capitalization
    required this.backgroundColor,
    this.icon, // Using a more descriptive name
  });

  final double width;
  final double height;
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Widget? icon; // Optional icon widget

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          foregroundColor: Colors.white,
          backgroundColor: backgroundColor,
          side: const BorderSide(
            color: primcolor,
            width: 1.0,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) // Conditionally add icon to avoid null errors
              Row(
                children: [
                  icon!,
                  const SizedBox(width: 10),

                ],
              ),

            Text(
              buttonText.toUpperCase(),
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
