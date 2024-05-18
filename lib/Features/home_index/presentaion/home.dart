import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Features/home_index/presentaion/empty_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: EmptyTasksScreen(),
    );
  }
}

