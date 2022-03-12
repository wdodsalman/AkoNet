import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Stack(
                clipBehavior: Clip.none, fit: StackFit.passthrough,
                alignment: AlignmentDirectional.center,
                children: const [
                  Positioned(
                    top: 200,
                    right: 120,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-vector/teamwork-concept-landing-page_52683-20164.jpg?w=740'),
                    ),
                  )
                ]),
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(150, 255, 153, 0),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(75))),
          ),
          const SizedBox(height: 80),
          const Text(
              'Akonet service provides 24/7 monitoring for major ISPs in Iraq. The idea came when we saw many clients calling us complaining about their bad internet experience and we thought it would be better for us and them if they can see whats going on by themselves.',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              textWidthBasis: TextWidthBasis.parent),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 75),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Instagram-Icon.png/769px-Instagram-Icon.png'))),
                ),
                Container(
                  
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://pnggrid.com/wp-content/uploads/2021/07/Facebook-Logo-Square-768x768.png'))),
                ),
                Container(
                  
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://pnggrid.com/wp-content/uploads/2021/07/Twitter-Logo-Square.png'))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
