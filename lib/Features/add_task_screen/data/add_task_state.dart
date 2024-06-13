part of 'add_task_cubit.dart';

sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class GetCategories extends AddTaskState {}

final class Appcreatdatabase extends AddTaskState {}

final class ChangePickedCategory extends AddTaskState {}

final class Task_added extends AddTaskState {}

final class TaskDateChanged extends AddTaskState {}

final class TaskTimeChanged extends AddTaskState {}
