// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';

class Time_widget extends StatefulWidget {
  Time_widget({
    super.key,
  });

  @override
  State<Time_widget> createState() => _Time_widgetState();
}

class _Time_widgetState extends State<Time_widget> {
  var starttimecontroller = TextEditingController();
  var endtimecontroller = TextEditingController();

  String starttime = 'Task time';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(CupertinoIcons.stopwatch),
            const SizedBox(width: 8),
            const Text(
              'Task time: ',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            InkWell(
              onTap: () async {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((value) {
                  starttimecontroller.text = value!.format(context);
                  setState(() {
                    starttime = value.format(context);
                  });
                  // print(time);
                  // print(value.format(context));
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
                    starttime,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
            )
          ],
        ),
        const Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Colors.yellow,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
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
