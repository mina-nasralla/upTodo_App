import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_list_app/Core/constants.dart';
import 'package:uptodo_list_app/Features/authtication/Data/manger/auth_cubit.dart';
import 'package:uptodo_list_app/Features/authtication/Presentaion/login_screen.dart';
import 'package:uptodo_list_app/Features/authtication/Presentaion/widget/pass_field.dart';
import 'package:uptodo_list_app/Widgets/custom_button.dart';
import 'package:uptodo_list_app/Widgets/custom_textarea.dart';

import '../../../Core/messages.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _globalKey = GlobalKey();
  final TextEditingController _passcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  // final TextEditingController _confirmpasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is CreateUserSuccessState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            ToastMsg(text: 'Registration Successfully, sign in now', color: Colors.green);
          }else if (state is SignInUserErrorState){
            ToastMsg(text: state.ERROR.toString(), color: Colors.red);
          }

        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
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
              child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
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
                              preicon: CupertinoIcons.person_alt,
                              keyboardtype: TextInputType.text,
                              obsecure: false,
                              tag: 'Name',
                              hint: 'Enter Your Name',
                              textEditingController: _namecontroller,
                            ),
                            const SizedBox(height: 10,),
                            CustomTextField(
                              preicon: CupertinoIcons.mail,
                              keyboardtype: TextInputType.text,
                              obsecure: false,
                              tag: 'Email',
                              hint: 'Enter Your Email',
                              textEditingController: _emailcontroller,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Pass_textfield(
                                  passcontroller: _passcontroller,
                                  onchange: (s) {},
                                ),
                              ],
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
                              onPressed: () {
                                _globalKey.currentState!.validate();
                                // cubit.RegisterNewUser(
                                //     email: _emailcontroller.text,
                                //     password: _passcontroller.text,
                                //     name: _namecontroller.text);
                              },
                              buttonText: 'Register',
                              backgroundColor: primcolor),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child:
                          Image(image: AssetImage('assets/images/Divider.png')),
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
                            height: 8,
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
                                      builder: (context) => LoginScreen()));
                            },
                            child: const Text(
                              'Login now',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
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
