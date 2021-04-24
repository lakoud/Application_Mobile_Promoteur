import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/WIdgets/navbar.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Positioned(
                  top: 220,
                  left: 50,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Nav(),
    );
  }
}
