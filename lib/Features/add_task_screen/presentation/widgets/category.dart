import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';

class CategoryPicker extends StatelessWidget {
  CategoryPicker({
    super.key,
  });

  late IconData icon;
  late String title1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.category_outlined),
        const SizedBox(width: 8),
        const Text(
          'Task Category: ',
          style: TextStyle(fontSize: 16),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) =>  Dialog(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text('Choose Category', style: TextStyle(fontSize: 20, color: Colors.white),),
                    // SizedBox(
                    //   width: 64,
                    //   height: 64,
                    //    child: GridView.builder(
                    //   shrinkWrap: true, // Wrap content vertically
                    //   itemCount: 8, // Adjust based on your data source
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 3, // Number of columns
                    //     mainAxisSpacing: 10.0, // Spacing between rows
                    //     crossAxisSpacing: 10.0, // Spacing between columns
                    //   ),
                    //   itemBuilder: (context, index) {
                    //     return Column(
                    //       children: [
                    //         Icon(category.icon), // Use icon from your data source
                    //         Text(category.title), // Use title from your data source
                    //       ],
                    //     );
                    //   },
                    // ),
                    // )
                  ],
                ),
              ),
            );

          },
          child: Container(
            width: 120,
            height: 50,
            decoration: BoxDecoration(
              color: seccolor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text('University'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
