// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../../Core/data/model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  static AddTaskCubit get(context) => BlocProvider.of(context);

  late Database database;

  // String taskName = '';
  // String taskDescr = '';
  String taskDate = 'taskDate';
  String taskTime = 'taskTime';
  Color defaulticoncolor = Colors.blueAccent;
  String categoryname = 'default';
  IconData pickedicon = Icons.category_outlined;

  void setTaskDate(String date) {
    taskDate = date;
    emit(TaskDateChanged());
  }


  void setTaskTime(String time) {
    taskTime = time;
    emit(TaskTimeChanged());
  }

  void pickcategory({
    required int thepickedicon,
    required var colorValue,
    required String catname,
  }) {
    IconData icon = IconData(thepickedicon, fontFamily: 'MaterialIcons');
    Color color = Color(colorValue);
    defaulticoncolor = color;
    pickedicon = icon;
    categoryname = catname;
    emit(ChangePickedCategory());
  }

  List<Map> categorioes = [];


  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      print('data created');
      database.execute('''
      CREATE TABLE tasks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        taskDate TEXT,
        taskTime TEXT,
        taskIcon INTEGER,
        iconColor INTEGER,
        iconName TEXT,
        state TEXT
      )
    ''').then((value) {
        print('Task table created');
      }).catchError((error) {
        print('error on creating ${error.toString()}');
      });
    }, onOpen: (database) {
      print('data opened');
    }).then((value) {
      database = value;
      emit(Appcreatdatabase());
    });
  }

  void getfromdatabase(database) {
    categorioes = [];
    emit(GetCategories());
    database.rawQuery('select * from categories').then((value) {
      print(value);
      value.forEach((element) {
        categorioes.add(element);
        print(categorioes);
      });
      emit(GetCategories());
    });
  }

  late Task task;

  Future<int> insertTask(Task task) async {
    Database db = database;
    return await db.insert('tasks', task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void addTask({
   required String title,
   required String description,
   required String taskDate,
   required String taskTime,
   required IconData taskIcon,
   required Color iconColor,
   required String iconName,
  }) async {
    Task newTask = Task(
      title: title,
      description: description,
      taskDate: taskDate,
      taskTime: taskTime,
      taskIcon: taskIcon,
      iconColor: iconColor,
      iconName: iconName,
      state: 'new',
    );
    await insertTask(newTask);
    print('Task added to database');
    emit(Task_added());
  }
// insertintodatabase({
//   // required String title,
//   // required String description,
//   // required String taskDate,
//   // required String taskTime,
//   // required IconData taskIcon,
//   // required Color iconColor,
//   // required String iconName,
//   // required String state,
// }) async {
//   await database.transaction((txn) => txn
//           .rawInsert(
//               'insert into tasks (title, date, time, status) values("$title","$taskDate","$taskTime","new")')
//           .then((value) {
//         print('row added successfully');
//         emit(Task_added());
//         getfromdatabase(database);
//       }).catchError((error) {
//         print('error on record ${error.toString()}');
//       }));
// }
}
