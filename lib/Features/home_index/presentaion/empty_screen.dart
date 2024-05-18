import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/Widgets/custom_appbar.dart';

class EmptyTasksScreen extends StatelessWidget {
  const EmptyTasksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppbar(),
        SizedBox(height: 75),
        Image(image: AssetImage('assets/images/Checklist.png')),
        Text('What do you want to do today?',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        SizedBox(height: 10),
        Text('Tap + to add your tasks',
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ],
    );
  }
}
