import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print(change);
  }
}