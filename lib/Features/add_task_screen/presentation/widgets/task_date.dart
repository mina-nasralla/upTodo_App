// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/add_task_screen/data/add_task_cubit.dart';

class Date_widget extends StatelessWidget {
  const Date_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit =AddTaskCubit.get(context);
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.date_range),
                const SizedBox(width: 8),
                const Column(
                  children: [
                    Text(
                      'Task Date: ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('4000-08-21'))
                        .then((value) {
                     cubit.setTaskDate(DateFormat.yMMMd().format(value!));

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
                        cubit.taskDate,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Row(
              children: [
                Icon(Icons.info_outline, color: Colors.yellow, size: 15,),
                SizedBox(width: 5,),
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
