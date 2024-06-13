// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/add_task_screen/data/add_task_cubit.dart';

import 'ChangeCategory.dart';

class CategoryPicker extends StatelessWidget {
  const CategoryPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.category_outlined),
            const SizedBox(width: 8),
            const Text(
              'Task Category: ',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                var cubit = AddTaskCubit.get(context);
                cubit.getfromdatabase(cubit.database);
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Choose Category',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: 3,
                            children: List.generate(cubit.categorioes.length,
                                (index) {
                              var category = cubit.categorioes[index];
                              IconData icon = IconData(category['cat_icon'],
                                  fontFamily: 'MaterialIcons');
                              int colorValue = category[
                                  'cat_color']; // Use 'cat_color' field here
                              Color color = Color(colorValue);
                              print(color);
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cubit.pickcategory(
                                          thepickedicon: category['cat_icon'],
                                          colorValue: category['cat_color'],
                                          catname: category['cat_name']);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: color,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      width: 65,
                                      height: 65,
                                      child: Icon(
                                        icon,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    category['cat_name']
                                        .toString()
                                        .toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        overflow: TextOverflow.ellipsis),
                                  )
                                ],
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const changing_category(),
            ),
          ],
        );
      },
    );
  }
}
