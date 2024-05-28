import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/widgets/category.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/widgets/task_date.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/widgets/task_periorty.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/widgets/task_time.dart';
import 'package:uptodo_list_app/Widgets/custom_button.dart';

class AddTaskViewBody extends StatelessWidget {
  AddTaskViewBody({
    super.key,
  });

  var titlecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height,
            maxWidth:  MediaQuery.sizeOf(context).width
          ),
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
                const SizedBox(height: 20),
                Time_widget(),
                const SizedBox(height: 20),
                const Date_widget(),
                const SizedBox(height: 20),
                CategoryPicker(),
                const SizedBox(height: 20),
                const TaskPeriorty(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .25,
                ),
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
                  onPressed: () {},
                  buttonText: 'Add Task',
                  backgroundColor: primcolor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
