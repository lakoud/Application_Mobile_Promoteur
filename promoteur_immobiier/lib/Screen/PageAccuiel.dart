import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/WIdgets/navbar.dart';

import '../constants.dart';

class PageAcceuil extends StatefulWidget {
  PageAcceuil({Key key}) : super(key: key);

  @override
  _PageAcceuilState createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  List imageList = [
    'assets/s.jpg',
    'assets/s2.jpg',
    'assets/s3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text("Groupe alliance "),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 30),
            ContainerPhoto(
              imageList: imageList,
              text: "Réalisations",
              route: '/Realise',
            ),
            SizedBox(height: 30),
            ContainerPhoto(
              imageList: imageList,
              text: "Projets en cours",
              route: "/ProjetEncours",
            ),
            SizedBox(height: 30),
            ContainerPhoto(
              imageList: imageList,
              text: "Etre propritaire",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Nav(),
    );
  }
}

class ContainerPhoto extends StatelessWidget {
  const ContainerPhoto({
    Key key,
    this.imageList,
    this.text = '',
    this.route,
  }) : super(key: key);

  final List imageList;
  final String text;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          route,
        ),
        child: Stack(children: [
          Center(
            child: Container(
              child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext context, int index, _) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        imageList[index],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  options: CarouselOptions(
                      scrollDirection: Axis.vertical,
                      autoPlayInterval: const Duration(seconds: 10),
                      viewportFraction: 1,
                      height: 190,
                      initialPage: 0,
                      autoPlay: true)),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 8.5,
            width: MediaQuery.of(context).size.width - 19,
            child: Opacity(
              opacity: 0.8,
              child: Container(
                height: 40,
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
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
