// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  var choosedicon = 0;
  var choosedcolor;

  void choose({required choosed}) {
    choosedicon = choosed;
    print(choosed.toString());
    emit(ChooseIcon());
  }

  List<Map> categories = [];

  late Database database;

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      print('Database created');
      database
          .execute(
          'CREATE TABLE categories (id INTEGER PRIMARY KEY, cat_name TEXT, cat_icon INTEGER, cat_color INTEGER)')
          .then((value) {
        print('Category table created');
      }).catchError((error) {
        print('Error creating table: ${error.toString()}');
      });
    }, onOpen: (database) {
      print('Database opened');
      getFromDatabase(database);
    }).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }

  void createCategory({
    required String? catName,
    required Color? catColor,
    required int? catIcon,
  }) {
    if (catName == null) {
      emit(CreateCategoryError(
          errorMsg: 'Category name is empty', errorTitle: 'Write Category'));
    } else if (catColor == null) {
      emit(CreateCategoryError(
          errorMsg: 'Category color is empty', errorTitle: 'Choose Color'));
    } else if (catIcon == null) {
      emit(CreateCategoryError(
          errorMsg: 'Category Icon is empty', errorTitle: 'Choose Icon'));
    } else {
      print(catName);
      print(catIcon);
      insertIntoDatabase(
          catName: catName, catColor: catColor, catIcon: catIcon);
      emit(CreateCategorySuccess(
          successMsg: 'Category Created Successfully',
          successTitle: 'Successful'));
    }
  }

  Future<void> insertIntoDatabase({
    required String catName,
    required Color catColor,
    required int catIcon,
  }) async {
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO categories (cat_name, cat_icon, cat_color) VALUES(?, ?, ?)',
          [catName, catIcon, catColor.value]).then((value) {
        print('Row added successfully');
        print(value);
        emit(AppInsertDatabase());
        getFromDatabase(database);
      }).catchError((error) {
        print('Error inserting record: ${error.toString()}');
      });
    });
  }

  void getFromDatabase(Database db) {
    categories = [];
    emit(AppGetDatabase());
    db.rawQuery('SELECT * FROM categories').then((value) {
      value.forEach((element) {
        final category = {
          'id': element['id'],
          'cat_name': element['cat_name'],
          'cat_icon': element['cat_icon'],
          'cat_color': Color(element['cat_color'] as int),
        };
        categories.add(category);
      });
      emit(AppGetDatabase());
    });
  }

  void updateData({
    required String status,
    required int id,
  }) async {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?', [status, id]).then((value) {
      getFromDatabase(database);
      emit(AppUpdateDatabase());
    });
  }

  void deleteData({
    required int id,
  }) async {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getFromDatabase(database);
      emit(AppDeleteDatabase());
    });
  }
}
