import 'package:flutter/material.dart';
import 'package:flutter_application_6/bloc/isp_bloc.dart';
import 'package:flutter_application_6/model/isp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


import 'charts.dart';

class HomeVieewr extends StatefulWidget {
  final Isp? model;
  HomeVieewr({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  State<HomeVieewr> createState() => _HomeVieewrState();
}

class _HomeVieewrState extends State<HomeVieewr> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IspBloc(),
      child: BlocBuilder<IspBloc, IspState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              elevation: 0.0,
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 00.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                   
                    const SizedBox(
                      height: 10,
                    ),
                    MyHomePage(),
                   
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
