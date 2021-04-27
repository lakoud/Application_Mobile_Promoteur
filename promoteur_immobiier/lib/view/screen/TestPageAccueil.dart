import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/view/WIdgets/Custom_Text.dart';
import 'package:promoteur_immobiier/view/WIdgets/navbar.dart';
import 'package:promoteur_immobiier/view/auth/login.dart';
import 'package:promoteur_immobiier/view/screen/projetencours.dart';

import 'EtrePropritaire.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
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
                      onPressed: () {},
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/facebook.gif'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/instagram.gif'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/youtube.gif'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  FlatButton(
                      child: Text("logout"),
                      onPressed: () {
                        _auth.signOut();
                        Get.offAll(LoginPage());
                      }),
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
                        child: const ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundImage: AssetImage(
                                "assets/c.png"), // no matter how big it is, it won't overflow
                          ),
                          title: Text('Devenez propriétaire '),
                          //subtitle: Text('TWICE'),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => ProjetEnCours());
                    },
                    child: Container(
                      width: 250,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundImage: AssetImage(
                                "assets/ff.png"), // no matter how big it is, it won't overflow
                          ),
                          title: Text('Projet En cours  '),
                          //  subtitle: Text('TWICE'),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const ListTile(
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(
                              "assets/bb.png"), // no matter how big it is, it won't overflow
                        ),
                        title: Text('RÉALISATION '),
                        //subtitle: Text(''),
                      ),
                      elevation: 5,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Nav(),
    );
  }
}
