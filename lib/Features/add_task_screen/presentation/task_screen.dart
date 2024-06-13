import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/add_task_screen/data/add_task_cubit.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/add_task_view_body.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = AddTaskCubit();
        cubit.createDatabase();  // Explicitly call the createDatabase method here
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add New Task',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: AddTaskViewBody(),
      ),
    );
  }
}
