import 'package:flutter/material.dart';
import 'package:flutter_application_6/contact.dart';
import 'package:flutter_application_6/cubit/navi_cubit.dart';
import 'package:flutter_application_6/home/home_screen.dart';
import 'package:flutter_application_6/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Navi extends StatelessWidget {
  const Navi({Key? key}) : super(key: key);
  final Index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NaviCubit(),
      child: BlocBuilder<NaviCubit, int>(
        builder: (context, state) {
          return Scaffold(
            
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              showSelectedLabels: true,
              enableFeedback: true,
              unselectedItemColor: Colors.black,
              iconSize: 25,
              landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
              
              mouseCursor: SystemMouseCursors.allScroll,
           unselectedFontSize: 15,   
              currentIndex: Index,
              selectedFontSize: 15,
              showUnselectedLabels: true,
           selectedIconTheme: IconThemeData(color: Colors.black),
              onTap: (index) {
                context.read<NaviCubit>().chamgenavi(index);
              },
              selectedItemColor: Colors.amber,
              selectedLabelStyle: TextStyle(color: Color.fromRGBO(244, 67, 54, 1)),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.newspaper,
                      color: Colors.black,
                    ),
                    label: 'News'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.contact_page,
                      color: Colors.black,
                    ),
                    label: 'About us'),
              ],
            ),
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: const Text(
                  'AkoNet',
                  style: TextStyle(color: Colors.black),
                )),
            body: IndexedStack(
              index: state,
              children: [
                HomeScreen(),
                NewsView(),
                ContactUs(),
              ],
            ),
          );
        },
      ),
    );
  }
}
