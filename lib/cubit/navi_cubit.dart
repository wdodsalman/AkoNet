import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class NaviCubit extends Cubit<int> {
  NaviCubit() : super(0);
  var currentindex = 0;
  void chamgenavi(int index) => emit(index);
}
