// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uptodo_list_app/Features/categories_screen/presentation/categories.dart';
import 'package:uptodo_list_app/Features/home_index/presentaion/home.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/calendar.dart';
import 'package:uptodo_list_app/Features/Profile_screen/presentation/profile.dart';
import 'package:path/path.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
 static HomeCubit get(context) => BlocProvider.of(context);


  int currentindex = 0;

  List<Widget> Screens = [
    const Home(),
    const Calendar(),
    const SizedBox.shrink(),  // This makes the element at index 2 empty
    const Profile(),
    CategoriesScreen(),

  ];



  void ChangeBottomNavBar(int index) {
    if (index!=2){
      currentindex = index;
      emit(BottomNavBar());}
  }

  Database? database;

  void createDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'todo.db');

    openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        print('Database created');
        try {
          await database.execute(
              'CREATE TABLE categories (id INTEGER PRIMARY KEY, cat_name TEXT, cat_icon INTEGER, cat_color INTEGER)'
          );
          print('Categories table created');
        } catch (error) {
          print('Error on creating categories table: ${error.toString()}');
        }

        try {
          await database.execute(
              '''CREATE TABLE tasks(
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT,
                description TEXT,
                taskDate TEXT,
                taskTime TEXT,
                taskIcon INTEGER,
                iconColor INTEGER,
                iconName TEXT,
                state TEXT
              )'''
          );
          print('Tasks table created');
        } catch (error) {
          print('Error on creating tasks table: ${error.toString()}');
        }
      },
      onOpen: (database) {
        print('Database opened');
        getFromDatabase(database);
      },
    ).then((db) {
      database = db;
    });
  }

  void getFromDatabase(Database) async {
    try {
      List<Map> result = await Database.rawQuery('SELECT * FROM tasks');
      print('Tasks: $result');
    } catch (error) {
      print('Error on fetching tasks: ${error.toString()}');
    }
  }
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];

}
