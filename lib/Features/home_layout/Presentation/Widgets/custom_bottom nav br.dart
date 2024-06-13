
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/Widgets/custom_floating.dart';
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
              backgroundColor:seccolor,
              selectedItemColor: Colors.white,
              elevation: 30,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.ChangeBottomNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.file_download_done),
                    label: 'Done'),
                BottomNavigationBarItem(
                    icon: SizedBox.shrink(), label: ''), // Dummy item
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archive'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    label: 'Categories'),
              ],
            ),
            const FloatButton(),
          ],
        );
      },
    );
  }
}

