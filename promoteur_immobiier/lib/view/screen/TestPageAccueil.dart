import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/view/WIdgets/Custom_Text.dart';
import 'package:promoteur_immobiier/view/WIdgets/bottombar.dart';
import 'package:promoteur_immobiier/view/auth/profil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import 'DevenezPropritaire/EtrePropritaire.dart';
import 'NosRealisaitons/ListProjetRealise.dart';
import 'ProjetEncours/ListeDesProjetEncours.dart';
import 'ProjetEncours/projetencours.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imageList = [
    'assets/s.jpg',
    'assets/s2.jpg',
    'assets/s3.jpg',
  ];
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'A',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'll',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            TextSpan(
              text: 'ian',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            TextSpan(
              text: 'ce',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ]),
    );
  }

  Widget _title2() {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
          text: 'g',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'r',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextSpan(
              text: 'upe',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 500,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/Trac1.png"),
                    )),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.person),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      },
                    ),
                  ],
                ),
                Positioned(
                  top: 190,
                  left: 20,
                  child: Center(
                    child: Column(
                      children: [
                        _title(),
                        Row(
                          children: [
                            SizedBox(
                              width: 50,
                            ),
                            _title2(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            color: Colors.grey,
                            child: CustomText(
                                "Construire ensemble ", Colors.white, 20, 1.2)),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            launch(
                                "https://l.facebook.com/l.php?u=https%3A%2F%2Fmaps.app.goo.gl%2F3J9AWxH8DRHtnWtr5%3Ffbclid%3DIwAR0KLBeei9XLdaw7c-mMjOKVaPSTlhvGq0Z-9zDvLDLU0NU4eCqItY46ehQ&h=AT0yfxlWGwt0x4KOaUURNbKu79cGQgZB5tEyuZS1UlJnuisfxASRJi5iOASIgupOyhhifuYaRi53A0D7K75dyayPZkBsnIVt6Bs2KQKCCHhEDeeKZAZ6JGpAh8iaUrgBGPO_sA");
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.place,
                                color: Colors.white,
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Résidence Lac Médical Center 7 ème étage LAC 2, Tunis, Tunisie",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  launch("https://www.facebook.com/AllianceI/");
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/facebokicon.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  launch(
                                      "https://www.instagram.com/groupeallianceimmobilier/");
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/insta.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  launch(
                                      "https://www.youtube.com/channel/UCbXojON6WrX5_aNeK3wfUJA");
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/youtubeIcon.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => EtrePropritaire());
                    },
                    child: Container(
                      width: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                  colors: [kSecondaryColor, kMainColor])),
                          child: const ListTile(
                            title: Center(
                                child: Text('Devenez propritaire ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "SourceSans",
                                      fontWeight: FontWeight.w700,
                                    ))),
                            //  subtitle: Text('TWICE'),
                          ),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => ListProjetEnCours());
                    },
                    child: Container(
                      width: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                  colors: [kSecondaryColor, kMainColor])),
                          child: const ListTile(
                            title: Center(
                                child: Text('Projet En cours  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "SourceSans",
                                      fontWeight: FontWeight.w700,
                                    ))),
                            //  subtitle: Text('TWICE'),
                          ),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => ListProjetRealise());
                    },
                    child: Container(
                      width: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
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
                                  colors: [kSecondaryColor, kMainColor])),
                          child: const ListTile(
                            title: Center(
                                child: Text('Nos Réalisations  ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "SourceSans",
                                      fontWeight: FontWeight.w700,
                                    ))),
                            //  subtitle: Text('TWICE'),
                          ),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
