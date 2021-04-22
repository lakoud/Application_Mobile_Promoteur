import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/Screen/PageAccuiel.dart';
import 'package:promoteur_immobiier/Screen/ProjetEncours.dart';

import 'Screen/login.dart';
import 'Screen/realise.dart';
import 'hoteltry.dart';

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
          '/PageAccuiel': (context) => PageAcceuil(),
          '/Realise': (context) => Realise(),
          '/ProjetEncours': (context) => ProjetEncours(),
          '/login': (context) => Hol(),
        });
  }
}
