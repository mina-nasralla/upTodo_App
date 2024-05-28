import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Features/Profile_screen/presentation/profile_view_body.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:const Text(
          'Profile',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: ProfileViewBody(),
    );
  }
}
