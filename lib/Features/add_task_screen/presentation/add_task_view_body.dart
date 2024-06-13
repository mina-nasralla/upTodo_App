import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/add_task_screen/data/add_task_cubit.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/widgets/category.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/widgets/task_date.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/widgets/task_periorty.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/widgets/task_time.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/home_layout.dart';
import 'package:uptodo_list_app/Widgets/custom_button.dart';

class AddTaskViewBody extends StatelessWidget {
  AddTaskViewBody({
    super.key,
  });

  var titlecontroller = TextEditingController();
  var desccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if(state is Task_added){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeView()));
        }
        
      },
      builder: (context, state) {
        var cubit =AddTaskCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height,
                  maxWidth: MediaQuery.sizeOf(context).width),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: titlecontroller,
                        decoration: const InputDecoration(
                          labelText: 'Task Name ',
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: 'Enter Task Name ',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    TextField(
                      controller: desccontroller,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Enter description here',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Time_widget(),
                    const SizedBox(height: 20),
                    const Date_widget(),
                    const SizedBox(height: 20),
                    const CategoryPicker(),
                    const SizedBox(height: 20),
                    const TaskPeriorty(),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .05),
                    CustomButton(
                      width: double.infinity,
                      height: 48,
                      onPressed: () {},
                      buttonText: 'Clear',
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      width: double.infinity,
                      height: 48,
                      onPressed: () {
                        cubit.addTask(
                          title: titlecontroller.text,
                            description: desccontroller.text,
                            taskDate: cubit.taskDate,
                            taskTime: cubit.taskTime,
                            taskIcon: cubit.pickedicon,
                            iconColor: cubit.defaulticoncolor,
                            iconName: cubit.categoryname,
                            );
                      },
                      buttonText: 'Add Task',
                      backgroundColor: primcolor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
