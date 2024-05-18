import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/task_screen.dart';
import 'package:uptodo_list_app/Features/home_layout/data/home_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return Stack(
          clipBehavior: Clip.none,
          children: [
            BottomNavigationBar(
              currentIndex: cubit.currentindex,
              iconSize: 30,
              unselectedFontSize: 12,
              selectedFontSize: 14,
              selectedItemColor: Colors.white,
              elevation: 30,
              type: BottomNavigationBarType.fixed,
              backgroundColor: seccolor,
              onTap: (index) {
                cubit.ChangeBottomNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.calendar_today),
                    label: 'Calendar'),
                BottomNavigationBarItem(
                    icon: SizedBox(width: 20), label: ''), // Dummy item
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.time), label: 'Focus'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.profile_circled),
                    label: 'Profile'),
              ],
            ),
            Positioned(
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
                      MaterialPageRoute(builder: (context) => AddTaskScreen()));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
