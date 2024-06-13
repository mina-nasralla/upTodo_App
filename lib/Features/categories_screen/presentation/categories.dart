import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/categories_screen/data/Cubit/category_cubit.dart';

import 'category_view_body.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  // var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..createDatabase(),
      child: Scaffold(
        // key: formkey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Create new category',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: CategoryViewBody(),
      ),
    );
  }
}



