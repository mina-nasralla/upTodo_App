import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/authtication/Data/manger/auth_cubit.dart';
import 'package:uptodo_list_app/Features/authtication/Presentaion/widget/pass_field.dart';
import 'package:uptodo_list_app/Features/authtication/Presentaion/register_screen.dart';
import 'package:uptodo_list_app/Features/home_layout/Presentation/home_layout.dart';
import 'package:uptodo_list_app/Widgets/custom_button.dart';
import 'package:uptodo_list_app/Widgets/custom_textarea.dart';

import '../../../Core/messages.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _globalKey = GlobalKey();
  final TextEditingController _passcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is SignInUserSuccessState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeView()));
            ToastMsg(text: 'Login Successfully', color: Colors.green);
          }else if (state is SignInUserErrorState){
            ToastMsg(text: state.ERROR.toString(), color: Colors.red);
          }
        },
        builder: (context, state) {
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
              CustomScrollView(
                  physics: const BouncingScrollPhysics(), slivers: [
                const SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
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
                          tag: 'Email',
                          hint: 'Enter Your Email',
                          textEditingController: _emailcontroller,
                        ),
                        const SizedBox(height: 25),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Confirm Password',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Pass_textfield(passcontroller: _passcontroller,
                              onchange: (s) {},),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
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
                          onPressed: () {
                            _globalKey.currentState!.validate();
                            // AuthCubit.get(context).UserSignIn(
                            //     email: _emailcontroller.text,
                            //     password: _passcontroller.text);
                          },
                          buttonText: 'Login',
                          backgroundColor: primcolor),
                      const SizedBox(
                        height: 20,
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
                        height: 20,
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
                        height: 10,
                      ),
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
                        'Don\'t have an account?',
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
                          'Register now',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}

