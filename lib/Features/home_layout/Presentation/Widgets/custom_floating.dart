import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/task_screen.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 35, // Adjust the position as needed
      left: MediaQuery.of(context).size.width / 2 -
          28, // Adjust for centering
      child: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: primcolor,
        // Replace with your color variable
        shape: const CircleBorder(),
        child: const Icon(
          CupertinoIcons.add,
          size: 22,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  AddTaskScreen()));
        },
      ),
    );
  }
}
