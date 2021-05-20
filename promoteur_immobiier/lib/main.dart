import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/modules/projetencours/cubit.dart/cubit.dart';
import 'package:promoteur_immobiier/sheared/network/local/cach_helper.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';
import 'layout/applayaout.dart';
import 'modules/etrepropritaire/cubit/cubit.dart';
import 'modules/projetrealiser/cubit.dart/cubit.dart';
import 'sheared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
/*
  Widget widget;
  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = HomePage(); // honi tbadal ed5ol
  } else {
    widget = LoginPage();
  }*/

  runApp(MyApp(/*statrtWidget: widget*/));
}

class MyApp extends StatelessWidget {
  final Widget statrtWidget;
  MyApp({this.statrtWidget});
  String idProjet;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PRCubit()
              ..getPosts()
              ..getAdresse()
              ..getAvantage()
              ..getEquipement()
              ..getAppartement(idProjet)),
        BlocProvider(
            create: (context) => PCCubit()
              ..getPosts()
              ..getAdresse()
              ..getAvantage()
              ..getEquipement()),
        BlocProvider(create: (context) => PropCubit()..getPosts()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Applayout(),
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: kMainColor,
                    statusBarBrightness: Brightness.dark),
                backgroundColor: Colors.white,
                elevation: 0.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.blue,
                  elevation: 0.0))),
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
