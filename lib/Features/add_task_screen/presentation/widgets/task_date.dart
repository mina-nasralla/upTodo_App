// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uptodo_list_app/Core/constants.dart';

class Date_widget extends StatefulWidget {
  const Date_widget({
    super.key,
  });

  @override
  State<Date_widget> createState() => _Date_widgetState();
}

class _Date_widgetState extends State<Date_widget> {
  var startdatecontroller = TextEditingController();
  var enddatecontroller = TextEditingController();

  String startdate = 'Task date';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.date_range),
            const SizedBox(width: 8),
            const Column(
              children: [
                 Text(
                  'Task Date: ',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () async {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('4000-08-21'))
                    .then((value) {
                  startdatecontroller.text = DateFormat.yMMMd().format(value!);
                  setState(() {
                    startdate = DateFormat.yMMMd().format(value);
                  });
                });
              },
              child: Container(
                width: 115,
                height: 37,
                decoration: BoxDecoration(
                  color: seccolor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    startdate,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            )
          ],
        ),
        const Row(
          children: [
            Icon(Icons.info_outline,color: Colors.yellow,size: 15,),
            SizedBox(width: 5,),
            Text(
              'If you want to be notified ',
              style: TextStyle(fontSize: 10),
            )
          ],
        )

      ],
    );
  }
}
