part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ChangepasswordState extends AuthState {}

final class RegisterUserLoadingState extends AuthState {}

final class RegisterUserErrorState extends AuthState {
  final String error;

  RegisterUserErrorState({required this.error});
}

final class CreateUserLoadingState extends AuthState {}

final class CreateUserSuccessState extends AuthState {}

final class CreateUserErrorState extends AuthState {
  final String error;

  CreateUserErrorState({required this.error});
}

final class SignIUserLoadingState extends AuthState {}

final class SignInUserErrorState extends AuthState {
  final String ERROR;

  SignInUserErrorState({required this.ERROR});
}

final class SignInUserSuccessState extends AuthState {
  final String uid;

  SignInUserSuccessState({required this.uid});
}
