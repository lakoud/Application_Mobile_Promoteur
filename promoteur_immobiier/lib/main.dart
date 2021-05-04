import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promoteur_immobiier/view/auth/login.dart';
import 'package:promoteur_immobiier/view/auth/profil.dart';
import 'package:promoteur_immobiier/view/screen/ProjetEncours/projetencours.dart';
import 'package:promoteur_immobiier/view/screen/TestPageAccueil.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
      theme: ThemeData(fontFamily: 'SourceSans'),
    );
  }
}
/*   initialRoute: '/PageAccuiel',
        routes: {
          '/PageAccuiel': (context) => HomePage(),
          '/Realise': (context) => Realise(),
          '/ProjetEncours': (context) => ProjetEnCours(),
          '/login': (context) => LoginPage(),
        }*/
