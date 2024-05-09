import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Widgets/custom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
              size: 30,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 42
          ),
          Center(
              child: Text(
            'Welcome to UpTodo'.toUpperCase(),
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 26
          ),
          const Center(
              child: Text(
            'Please login to your account or create\n new account to continue',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),textAlign: TextAlign.center,
          )),
          const Spacer(),
          custom_button(width: 327, hieght: 48, onpressed: (){}, buttontext: 'Login', backgroundcolor: primcolor,),
          const SizedBox(height: 28),
          custom_button(width: 327, hieght: 48, onpressed: (){}, buttontext: 'create account', backgroundcolor: bgcolor,),
          const SizedBox(height: 54),
        ],
      ),
    );
  }
}
