import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ProjetEncours extends StatelessWidget {
  List imageList = [
    'assets/s.jpg',
    'assets/s2.jpg',
    'assets/s3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                Carousel(
                  images: [
                    AssetImage(
                      'assets/s3.jpg',
                    ),
                    AssetImage(
                      'assets/s2.jpg',
                    ),
                    AssetImage(
                      "assets/s.jpg",
                    ),
                  ],
                  dotSize: 5,
                  dotIncreaseSize: 2,
                  dotBgColor: kMainColor.withOpacity(0),
                  indicatorBgPadding: 13,
                  dotPosition: DotPosition.topRight,
                  //  boxFit: BoxFit.cover,
                  // overlayShadow: true,
                  // overlayShadowSize: 0.2,
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Opacity(
                    opacity: 0.8,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kMainColor.withOpacity(0.9),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(2, 4),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [kMainColor, ktherdColor]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          "My Awesome Border",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 14),
            child: Text(
              'Description',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ConcertOne-Regular'),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              'The Baya Park has become a landmark residentia project in Dadar West South Mumbai. Conveniently located the project features ultra-spacious apartments and luxurious lifestyle. This includeGames Room, Children’s Play Area and a Gymnasium to name a few ',
            ),
          ),
          Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.all(5.0),
            child: Text("Les appartements"),
          ),
          Container(
            height: 150,
            child: ListView.builder(
              itemCount: imageList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset('assets/s3.jpg')),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
