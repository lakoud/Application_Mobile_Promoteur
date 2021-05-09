import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/modules/home/pageAccueil.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';
import 'modules/login/login.dart';
import 'sheared/bloc_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getProjetRealiser(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
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
              ))),
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
