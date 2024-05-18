import 'package:flutter/material.dart';

class Onboarding_content extends StatelessWidget {
  const Onboarding_content({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.boardcontroller,
  });

  final String image, title, text;
  final boardcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4,
              child: Image.asset(
                image,
              ),
            ),
          ),
          Text(title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Dishcek',
              ),
              textAlign: TextAlign.center),
          const SizedBox(
            height: 42,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> data = [
  {
    'image': 'assets/images/1.png',
    'title': 'Manage your tasks',
    'text': 'You can easily manage all of your daily tasks in DoMe for free',
  },
  {
    'image': 'assets/images/2.png',
    'title': 'Create daily routine',
    'text':
    'In Uptodo you can create your personalized routine to stay productive',
  },
  {
    'image': 'assets/images/3.png',
    'title': 'Orgonaize your tasks',
    'text':
    'You can organize your daily tasks by adding your tasks into separate categories',
  }
];