// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/add_task_screen/data/add_task_cubit.dart';

import '../../../../Core/constants.dart';

class changing_category extends StatelessWidget {
  const changing_category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = AddTaskCubit.get(context);
    print(cubit.pickedicon);
    print(cubit.defaulticoncolor);
    print(cubit.categoryname);
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: seccolor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    cubit.pickedicon,
                    size: 30,
                    color: cubit.defaulticoncolor,
                  ),
                  const SizedBox(width: 5),
                  Expanded(child: Text(cubit.categoryname,style:const TextStyle(overflow:TextOverflow.ellipsis ),)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
