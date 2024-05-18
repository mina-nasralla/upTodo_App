import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/add_task_screen/presentation/task_screen.dart';
import 'package:uptodo_list_app/Features/home_index/presentaion/home.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/calendar.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/focus.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/profile.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
 static HomeCubit get(context) => BlocProvider.of(context);


  int currentindex = 0;

  List<Widget> Screens = [
    const Home(),
    const Calendar(),
    const AddTaskScreen(),
    const Focusscreen(),
    const Profile(),
  ];

  void ChangeBottomNavBar(int index) {
    currentindex = index;
    emit(BottomNavBar());
  }

}
