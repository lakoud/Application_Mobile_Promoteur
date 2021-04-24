import 'package:flutter/material.dart';

import 'package:promoteur_immobiier/Screen/ProjetEncours.dart';
import 'package:promoteur_immobiier/Screen/login.dart';

import 'Screen/Projetrealise.dart';
import 'Screen/TestPageAccueil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Named Routes Demo',
        initialRoute: '/PageAccuiel',
        routes: {
          '/PageAccuiel': (context) => HomePage(),
          '/Realise': (context) => Realise(),
          '/ProjetEncours': (context) => ProjetEnCours(),
          '/login': (context) => LoginPage(),
        });
  }
}
