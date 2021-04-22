import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:promoteur_immobiier/Screen/constants.dart';

import 'WIdgets/bok.dart';

class Hol extends StatefulWidget {
  @override
  _HolState createState() => _HolState();
}

class _HolState extends State<Hol> {
  List imageList = [
    'assets/s.jpg',
    'assets/s2.jpg',
    'assets/s3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
                height: 300.0,
                child: Stack(
                  children: <Widget>[
                    Carousel(
                      images: [
                        AssetImage('assets/s.jpg'),
                        // Photo from https://unsplash.com/photos/wHUFmZRMpLc
                        AssetImage('assets/s.jpg'),
                        // Photo from https://unsplash.com/photos/DE9MM2voqKc
                        AssetImage('assets/s2.jpg'),
                        // Photo from https://unsplash.com/photos/6TY_WrJTwSI
                        AssetImage('assets/s3.jpg'),
                        // Photo from https://unsplash.com/photos/kVKz9qnJC-k
                      ],
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      autoplay: false,
                      dotColor: Colors.white,
                      indicatorBgPadding: 50.0,
                      dotBgColor: Colors.transparent,
                      borderRadius: false,
                      moveIndicatorFromBottom: 200.0,
                      noRadiusForIndicator: true,
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 270, left: 20, right: 20),
              child: Container(
                  height: 100.0,
                  width: MediaQuery.of(context).size.width - 24.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: kMainColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2.0)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'appartement lakoud rania ',
                          style: TextStyle(
                              fontFamily: 'ConcertOne-Regular',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 60, bottom: 20, left: 14),
          child: Text(
            'Description',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'ConcertOne-Regular'),
          ),
        ),
        about_hotel(
            'A renovated, cozy "Barn" with modern kitchen and bath, fireplace, an sleeping alcove and a loft. Perfect for a couple or a small family.'),
        about_hotel(
            'Nice courtyard with two more houses! Walking distance to downtown and ski trails.'),
        Padding(
          padding: EdgeInsets.only(top: 60, bottom: 20, left: 14),
          child: Text(
            'Amenities',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'ConcertOne-Regular'),
          ),
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
              }),
        ),
      ],
    ));
  }

  Widget amenities(
    String url1,
    String url2,
    String url3,
    String features1,
    String features2,
    String features3,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url1,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features1)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url2,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features2)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url3,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features3)
              ],
            )),
      ],
    );
  }

  Widget about_hotel(
    String description,
  ) {
    return Padding(
        padding: EdgeInsets.only(left: 14, top: 6, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ],
        ));
  }
}
