import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/onboarding_screen/start_screen.dart';
import 'package:uptodo_list_app/Widgets/custom_button.dart';

class CheckButton extends StatelessWidget {
  const CheckButton({super.key, required this.showStart, required this.boardcontroller});

 final int showStart;
 final boardcontroller;
  @override
  Widget build(BuildContext context) {
    if (showStart == 2) {
      return custom_button(width: 150, hieght: 48, onpressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StartScreen()));
      },
        buttontext: 'get started', backgroundcolor: primcolor,);
    }
    else {
      return custom_button(width: 90, hieght: 48, onpressed: () {
        if (boardcontroller.page!.toInt() < 2) {
          boardcontroller.animateToPage(boardcontroller.page!.toInt() + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease);
        }
      },
        buttontext: 'Next', backgroundcolor: primcolor,);
    }
  }
}

