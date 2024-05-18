import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/onboarding_screen/presentaion/start_screen.dart';
import 'package:uptodo_list_app/Widgets/custom_button.dart';

class CheckButton extends StatelessWidget {
  const CheckButton({super.key, required this.showStart, required this.boardcontroller});

 final int showStart;
 final boardcontroller;
  @override
  Widget build(BuildContext context) {
    if (showStart == 2) {
      return CustomButton(width: 150, height: 48, onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StartScreen()));
      },
        buttonText: 'get started', backgroundColor: primcolor,);
    }
    else {
      return CustomButton(width: 90, height: 48, onPressed: () {
        if (boardcontroller.page!.toInt() < 2) {
          boardcontroller.animateToPage(boardcontroller.page!.toInt() + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease);
        }
      },
        buttonText: 'Next', backgroundColor: primcolor,);
    }
  }
}

