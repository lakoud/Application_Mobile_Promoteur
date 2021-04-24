import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/WIdgets/BotoomNavBarAnimation.dart';
import 'package:promoteur_immobiier/WIdgets/Custom_Text.dart';

import '../constants.dart';

class ProjetEnCours extends StatefulWidget {
  const ProjetEnCours({Key key}) : super(key: key);

  @override
  _ProjetEnCoursState createState() => _ProjetEnCoursState();
}

class _ProjetEnCoursState extends State<ProjetEnCours> {
  List imageList = [
    'assets/s.jpg',
    'assets/s2.jpg',
    'assets/s3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // final Carousel carousel = ;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 330,
                child: Stack(
                  children: [
                    Banner(),
                    MyCarousel(),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ],
                ),
              ),
              MyDescription(),
              BoutonAvancementdeTravaill(),
              ListeDesApartement(imageList: imageList),
            ],
          ),
          ExhibitionBottomSheet(),
        ],
      ),
    );
  }
}

class ListeDesApartement extends StatelessWidget {
  const ListeDesApartement({
    Key key,
    @required this.imageList,
  }) : super(key: key);

  final List imageList;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 3),
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.all(10.0),
                width: 210.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    //bloc de text au dessus de photo

                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 120.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText("Surface: ", Colors.black, 18.0, 1.2),
                              CustomText("100", Colors.grey, 9.0, 1.2),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ]),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 180.0,
                              image: AssetImage('assets/s.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            bottom: 10.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText("S+1", Colors.white, 24.0, 1.2),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )

                //mm

                );
          },
        ));
  }
}

class BoutonAvancementdeTravaill extends StatelessWidget {
  const BoutonAvancementdeTravaill({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 5),
            child: CustomText('Avancement du travaille', kMainColor, 15, 1.2),
          ),
        ),
        Container(
            child: Icon(
          Icons.arrow_forward_ios,
          color: kMainColor,
        )),
      ],
    );
  }
}

class MyDescription extends StatelessWidget {
  const MyDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 9, right: 9),
      child: Container(
        padding: EdgeInsets.only(left: 8),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ]),
        child: CustomText(
            'The Baya Park has become a landmark residentia project in Dadar West South Mumbai. Conveniently located the project features ultra-spacious apartments and luxurious lifestyle. This includeGames Room, Children’s Play Area and a Gymnasium to name a few ',
            kMainColor,
            13,
            1.2),
      ),
    );
  }
}

class MyCarousel extends StatelessWidget {
  const MyCarousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Carousel(
            boxFit: BoxFit.cover,
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
            dotIncreasedColor: Colors.red[800],
            dotSize: 5,
            dotIncreaseSize: 2,
            dotBgColor: kMainColor.withOpacity(0),
            indicatorBgPadding: 13,
            animationCurve: Curves.fastOutSlowIn,
            overlayShadow: true,
            overlayShadowSize: 0.1,
            animationDuration: Duration(milliseconds: 2000),
          ),
        ),
      ),
    );
  }
}

class Banner extends StatefulWidget {
  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<Banner> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    animation = Tween(
      begin: 0.0,
      end: 18.0,
    ).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 66,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.only(
            //topLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
        ),
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 22),
        child: CustomText(
            "Résidance Ain Mariam", Colors.white, animation.value, 1.2),

        //fontFamily: 'fira',
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
