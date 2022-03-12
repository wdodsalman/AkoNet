import 'package:bloc/bloc.dart';
import 'package:flutter_application_6/model/arti.dart';
import 'package:flutter_application_6/model/artimodel.dart';


import 'package:flutter_application_6/network/arti_dio.dart';
import 'package:meta/meta.dart';

part 'arti_event.dart';
part 'arti_state.dart';

class ArtiBloc extends Bloc<ArtiEvent, ArtiState> {
  ArtiBloc() : super(ArtiInitial()) {
    on<ArtiEvent>((event, emit) async {
      emit(ArtiLoading());
      final res = await Artidio().artidata(url: 'Atri.json');
      final data = ArtiModel.fromJson(res.data);
      if (res.statusCode == 200) {
        emit(ArtiSucces(data:data ));
      } else {
        emit(ArtiError());
      }
    });
  }
}
