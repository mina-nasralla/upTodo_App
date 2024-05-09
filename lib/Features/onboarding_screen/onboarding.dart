import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uptodo_list_app/Features/onboarding_screen/button_check.dart';
import 'package:uptodo_list_app/Features/onboarding_screen/onboarding_item.dart';
import 'package:uptodo_list_app/Features/onboarding_screen/start_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController boardcontroller = PageController();
  int showstart = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 55),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const StartScreen()));
                    },
                    child: Text(
                      'Skip'.toUpperCase(),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery
                  .sizeOf(context)
                  .height * .65,
              child: PageView.builder(
                  onPageChanged: (int index) {
                    setState(() {
                      showstart = index;
                    });
                  },
                  controller: boardcontroller,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) =>
                      Onboarding_content(
                        image: data[index]['image'],
                        title: data[index]['title'],
                        text: data[index]['text'],
                        boardcontroller: boardcontroller,
                      )),
            ),
            SmoothPageIndicator(
              controller: boardcontroller, // PageController
              count: data.length,
              effect: const ExpandingDotsEffect(
                  offset: 20,
                  dotWidth: 12,
                  dotHeight: 8,
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey), // your preferred effect
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        if (boardcontroller.page!.toInt() > 0) {
                          boardcontroller.animateToPage(
                              boardcontroller.page!.toInt() - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        }
                      },
                      child: Text(
                        'Back'.toUpperCase(),
                        style:
                        const TextStyle(color: Colors.grey, fontSize: 16),
                      )),
                  const Spacer(),
                  CheckButton(showStart: showstart,boardcontroller: boardcontroller,)                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


