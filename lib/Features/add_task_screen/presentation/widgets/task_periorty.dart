import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';

class TaskPeriorty extends StatelessWidget {
  const TaskPeriorty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Icon(Icons.flag_outlined),
        const SizedBox(width: 8),
        const Text(
          'Task Priority: ',
          style: TextStyle(fontSize: 16),
        ),
        const Spacer(),
        Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: seccolor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flag_circle_outlined,
                  color: Colors.blue,
                ),
                SizedBox(width: 5),
                Text('Default'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
