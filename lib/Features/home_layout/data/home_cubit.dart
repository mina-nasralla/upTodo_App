import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/categories_screen/presentation/categories.dart';
import 'package:uptodo_list_app/Features/home_index/presentaion/home.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/calendar.dart';
import 'package:uptodo_list_app/Features/Profile_screen/presentation/profile.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
 static HomeCubit get(context) => BlocProvider.of(context);


  int currentindex = 0;

  List<Widget> Screens = [
    const Home(),
    const Calendar(),
    const SizedBox.shrink(),  // This makes the element at index 2 empty
    const CategoriesScreen(),
    const Profile(),
  ];

  void ChangeBottomNavBar(int index) {
    if (index!=2){
      currentindex = index;
      emit(BottomNavBar());}
  }

}
