part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class BottomNavBar extends HomeState {}
final class Appgetdatabase extends HomeState {}
final class getdatabasedone extends HomeState {}
