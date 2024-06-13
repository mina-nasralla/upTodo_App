import 'package:flutter/material.dart';

import '../../Data/manger/auth_cubit.dart';

class Pass_textfield extends StatelessWidget {
  const Pass_textfield({
    super.key,
    required TextEditingController passcontroller, required this.onchange,
  }) : _passcontroller = passcontroller;

  final TextEditingController _passcontroller;
  final void Function(String)? onchange;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 85,
      child: TextFormField(
        onChanged: onchange,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This Field is required';
          }
          else{
            return null;
          }
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: AuthCubit.get(context).showpassword,
        controller: _passcontroller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
          errorStyle: const TextStyle(color: Colors.red),
          hintText: 'Enter your password',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
              const BorderSide(color: Colors.white70)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
              const BorderSide(color: Color(0xffCEBBFE))),
          suffixIcon: GestureDetector(
            child: Icon(AuthCubit.get(context).suffix),
            onTap: () {
              AuthCubit.get(context).changevisability();
            },
          ),
          prefixIcon:
          Icon(AuthCubit.get(context).prefix),
          prefixIconColor: Colors.white,
          suffixIconColor: Colors.white,
        ),
      ),
    );
  }
}
