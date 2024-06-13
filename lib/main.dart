// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/authtication/Presentaion/login_screen.dart';
import 'package:uptodo_list_app/Features/authtication/Presentaion/register_screen.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/home_layout.dart';

import 'Core/BlocObserver.dart';
import 'Core/data/local/sharedpreferance.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   Widget widget;
  Bloc.observer = SimpleBlocObserver();
  // if (uId != null) {
  //   widget = const HomeView();
  //   print('uid here');
  // } else {
  //   widget = LoginScreen();
  //   print('uid is not here');
  // }

  runApp( MyApp(
    // theStart: widget,

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,
    // required this.theStart
  });

  // This widget is the root of your application.
  // final Widget theStart;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UpTodo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgcolor,
        textTheme: GoogleFonts.latoTextTheme(ThemeData.dark().textTheme),
      ),
      home: HomeView(),
    );
  }
}
