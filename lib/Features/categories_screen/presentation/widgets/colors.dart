import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Features/categories_screen/data/Cubit/category_cubit.dart';

class ColorList extends StatefulWidget {
  const ColorList({super.key});

  @override
  _ColorListState createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.cyan,
    Colors.lime,
    Colors.indigo,
    Colors.teal,
    Colors.grey,
    Colors.amber,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.pink,
    Colors.black,
    Colors.white,
    Colors.blueGrey,
    Colors.indigoAccent,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.brown,
    Colors.cyanAccent,
    Colors.limeAccent,
    Colors.tealAccent,
    Colors.greenAccent,
    Colors.amberAccent,
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  CategoryCubit.get(context).choosedcolor = colors[selectedIndex!];
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: colors[index],
                      ),
                    ),
                    if (selectedIndex == index)
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
