
import 'package:flutter/material.dart';
import 'package:flutter_application_6/bloc/isp_bloc.dart';
import 'package:flutter_application_6/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IspBloc()..add(IspLoaded()),
      child: const HomeView(),
    );
  }
}
