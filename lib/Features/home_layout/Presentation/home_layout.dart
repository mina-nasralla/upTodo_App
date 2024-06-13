import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/Widgets/custom_bottom%20nav%20br.dart';
import 'package:uptodo_list_app/Features/home_layout/data/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getFromDatabase..createDatabase(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: cubit.Screens[cubit.currentindex],
            bottomNavigationBar: const CustomNavBar(),
          );
        },
      ),
    );
  }
}
