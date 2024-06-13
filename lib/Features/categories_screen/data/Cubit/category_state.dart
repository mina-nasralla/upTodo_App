part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class ChooseIcon extends CategoryState {}

class AppCreateDatabase extends CategoryState {}

class AppInsertDatabase extends CategoryState {}

class AppGetDatabase extends CategoryState {}

class AppUpdateDatabase extends CategoryState {}

class AppDeleteDatabase extends CategoryState {}

class CreateCategoryError extends CategoryState {
  final String errorMsg;
  final String errorTitle;

  CreateCategoryError({required this.errorMsg, required this.errorTitle});
}

class CreateCategorySuccess extends CategoryState {
  final String successMsg;
  final String successTitle;

  CreateCategorySuccess({required this.successMsg, required this.successTitle});
}
