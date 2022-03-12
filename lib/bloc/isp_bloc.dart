import 'package:flutter_application_6/model/akonet_model.dart';
import 'package:flutter_application_6/network/isp_dio.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'isp_event.dart';
part 'isp_state.dart';

class IspBloc extends Bloc<IspEvent, IspState> {
  IspBloc() : super(IspInitial()) {
    on<IspEvent>(
      (event, emit) async {
        emit(IspLoading());
        final res = await IspDio().getispdata(url: 'akonet.json');
        final data = Akonet.fromJson(res.data);

        if (res.statusCode == 200) {
          emit(IspSucsses(data: data));
        } else {
          emit(IspError());
        }
      },
    );
  }
}
