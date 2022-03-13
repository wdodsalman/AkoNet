import 'package:flutter/material.dart';
import 'package:flutter_application_6/bloc/artibloc/arti_bloc.dart';
import 'package:flutter_application_6/model/arti.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArtiBloc()..add(ArtiLoaded()),
      child: BlocBuilder<ArtiBloc, ArtiState>(
        builder: (context, state) {
          if (state is ArtiLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ArtiSucces) {
            return ListView.separated(
                separatorBuilder: (context, index) => Container(
                      height: 5,
                    ),
                itemBuilder: (context, index) => ArtiCard(
                      art: state.data.arti[index],
                    ),
                padding: EdgeInsets.all(25),
                itemCount: state.data.arti.length);
          }
          return ArtiCard();
        },
      ),
    );
  }
}

class ArtiCard extends StatelessWidget {
  ArtiCard({Key? key, this.art}) : super(key: key);
  Arti? art;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.black12),
        height: 150,
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 150,
              width: 60,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: NetworkImage(art?.image ?? ''))),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    art?.title ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                 const SizedBox(height: 15,),
                  Expanded(
                      child:  Container(child: Text(art?.description ?? ''))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
