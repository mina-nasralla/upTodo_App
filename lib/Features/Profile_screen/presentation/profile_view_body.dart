import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Features/Profile_screen/presentation/widgets/profile_section_items.dart';

import '../../../Core/constants.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 85,
              height: 85,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: const Image(
                      image: AssetImage('assets/images/user.jpg'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            const Text('Mina Magdy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                      color: seccolor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        '10 Task left',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 154,
                    height: 58,
                    decoration: BoxDecoration(
                      color: seccolor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        '5 Task done',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileSection(
                  icon: CupertinoIcons.person,
                  title: 'Account Setting',
                  ontap: () {}, iconcolor: Colors.white, iconsuf: CupertinoIcons.forward,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About Developer',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset('assets/images/linkedin.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'LinkedIn',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(CupertinoIcons.forward, size: 30)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset('assets/images/github (1).png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'GitHub',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(CupertinoIcons.forward, size: 30)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset('assets/images/cv.png')),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Download my resume',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(CupertinoIcons.forward, size: 30)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            ProfileSection(
              icon:Icons.output,
              title: 'Log Out',
              ontap: () {}, iconcolor: Colors.red,
            ),
      
          ],
        ),
      ),
    );
  }
}
