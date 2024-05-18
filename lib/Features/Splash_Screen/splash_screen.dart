
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../onboarding_screen/presentaion/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/images/splash logo.svg')),
            // const Text('UPTodo',style: TextStyle(fontSize: 50,color: Colors.white,fontFamily: 'Dishcek'),)
          ],
        ),
        backgroundColor: const Color(0xff121212),
        duration: 5000,
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(seconds: 2) ,
        nextScreen: Onboarding());
  }
}
