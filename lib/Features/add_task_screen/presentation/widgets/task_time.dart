// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/add_task_screen/data/add_task_cubit.dart';

class Time_widget extends StatelessWidget {
  Time_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(CupertinoIcons.stopwatch),
                const SizedBox(width: 8),
                const Text(
                  'Task time: ',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    showTimePicker(
                        context: context, initialTime: TimeOfDay.now())
                        .then((value) {
                      AddTaskCubit.get(context).setTaskTime(value!.format(context));

                    });
                  },
                  child: Container(
                    width: 115,
                    height: 37,
                    decoration: BoxDecoration(
                      color: seccolor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        AddTaskCubit.get(context).taskTime,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.yellow,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'If you want to be notified ',
                  style: TextStyle(fontSize: 10),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
