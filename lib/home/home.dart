import 'package:flutter/material.dart';
import 'package:flutter_application_6/bloc/isp_bloc.dart';
import 'package:flutter_application_6/home/charts.dart';
import 'package:flutter_application_6/home/home_view.dart';
import 'package:flutter_application_6/model/isp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocBuilder<IspBloc, IspState>(
        builder: (context, state) {
          if (state is IspLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is IspSucsses) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => IspCard(
                model: state.data.isp[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: state.data.isp.length,
            );
          }
          return IspCard();
        },
      ),
    );
  }
}

class IspCard extends StatelessWidget {
  final Isp? model;
  const IspCard({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.brown,
                  height: 60,
                  width: 60,
                  child: Material(
                    child: Ink.image(
                      image: NetworkImage(
                        model?.image ?? '',
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(model: model),
                              ));
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      model?.status ?? '',
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    const Text(
                      'Pings',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      model?.pings ?? '',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(children: const [
                  Text(
                    'PACKET LOSS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '0%',
                    style: TextStyle(color: Colors.grey),
                  )
                ])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
