// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uptodo_list_app/Core/constants.dart';

import '../../../../Core/data/local/sharedpreferance.dart';
import '../model/user_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);


  IconData suffix = Icons.visibility_off;
  IconData prefix = Icons.lock;
  bool showpassword = true;

  void changevisability() {
    showpassword = !showpassword;
    if (showpassword) {
      suffix = Icons.visibility_off;
      prefix = Icons.lock;
    } else {
      suffix = Icons.visibility;
      prefix = Icons.lock_open_outlined;
    }
    emit(ChangepasswordState());
  }


  //============================================================================== Create user with email & pass and fill the user model
//
//   Future<void> RegisterNewUser({
//     required email,
//     required password,
//     required name,
//   }) async {
//     //check if the user uploaded image
//     emit(RegisterUserLoadingState());
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(email: email, password: password)
//         .then((value) {
//       print(value.user?.email);
//       CreateNewUser(
//         name: name,
//         email: email,
//         uid: value.user?.uid,
//         password: password,
//       );
//       print('شغال يسطا');
//     }).catchError((err) {
//       emit(RegisterUserErrorState(error: err));
//       print(err.toString());
//     });
//   }
//
//   void CreateNewUser({
//     required name,
//     required email,
//     required uid,
//     required password,
//     image,
//   }) {
//     emit(CreateUserLoadingState());
//     UserModel model = UserModel(
//         name: name,
//         uid: uid,
//         email: email,
//         image: UserAvatar,
//        );
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .set(model.toMap() as Map<String, dynamic>)
//         .then((value) {
//       emit(CreateUserSuccessState());
//       print('user Created');
//     }).catchError((err) {
//       emit(CreateUserErrorState(error: err));
//       print(err.toString());
//     });
//   }
//
//   //============================================================================== Signin
//
//   void UserSignIn({
//     required email,
//     required password,
//   }) {
//     emit(SignIUserLoadingState());
//     FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password)
//         .then((value) {
//       CasheHelper.savedata(key: 'Uid', value: value.user!.uid);
//       emit(SignInUserSuccessState(uid: value.user!.uid));
//       print(' شغال');
//     }).catchError((err) {
//       emit(SignInUserErrorState(ERROR: err));
//       print(err);
//       print('مش شغال');
//     });
//   }
 }
