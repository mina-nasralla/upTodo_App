import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Widgets/custom_button.dart';
import 'package:uptodo_list_app/Widgets/custom_textarea.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.back,
                size: 35,
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Register',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  CustomTextField(
                    preicon: CupertinoIcons.person,
                    keyboardtype: TextInputType.text,
                    obsecure: false,
                    tag: 'Username',
                    hint: 'Enter Your Name',
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    preicon: CupertinoIcons.lock,
                    keyboardtype: TextInputType.text,
                    obsecure: true,
                    tag: 'Password',
                    hint: '***************',
                    suffix: CupertinoIcons.eye_slash,
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    preicon: CupertinoIcons.lock,
                    keyboardtype: TextInputType.text,
                    obsecure: true,
                    tag: 'Confirm Password',
                    hint: '***************',
                    suffix: CupertinoIcons.eye_slash,
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomButton(
                    width: 327,
                    height: 48,
                    onPressed: () {},
                    buttonText: 'Register',
                    backgroundColor: primcolor),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: Image(image: AssetImage('assets/images/Divider.png')),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  width: 327,
                  height: 48,
                  onPressed: () {},
                  buttonText: 'Login With Google',
                  backgroundColor: bgcolor,
                  icon: Image.asset('assets/images/google.png'),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomButton(
                  width: 327,
                  height: 48,
                  onPressed: () {},
                  buttonText: 'Login With Apple',
                  backgroundColor: bgcolor,
                  icon: Image.asset('assets/images/apple.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: const Text(
                    'Login now',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
