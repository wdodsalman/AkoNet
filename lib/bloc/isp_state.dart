part of 'isp_bloc.dart';

@immutable
abstract class IspState {}

class IspInitial extends IspState {}

class IspLoading extends IspState {}

class IspSucsses extends IspState {
  final Akonet data;
  IspSucsses({
    required this.data,
  });
}

class IspError extends IspState {}
