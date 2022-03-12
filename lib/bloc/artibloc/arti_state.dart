part of 'arti_bloc.dart';

@immutable
abstract class ArtiState {}

class ArtiInitial extends ArtiState {}

class ArtiLoading extends ArtiState {}

class ArtiSucces extends ArtiState {
  final ArtiModel data;
  ArtiSucces({
    required this.data,
  });
}

class ArtiError extends ArtiState {}
