import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/Splash_Screen/Splash_Screen.dart';
import 'package:uptodo_list_app/Features/onboarding_screen/presentaion/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UpTodo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:bgcolor,
          textTheme: GoogleFonts.latoTextTheme(
            ThemeData.dark().textTheme
          ),),
      home: const SplashScreen(),
    );
  }
}

