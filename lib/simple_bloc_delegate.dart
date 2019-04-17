import 'package:bloc/bloc.dart';

///Simple bloc delegate to print events transitions
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition);
  }
}
