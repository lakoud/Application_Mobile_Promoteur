import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/modules/Projet_en_cours/liste_projet_en_cours.dart';
import 'package:promoteur_immobiier/modules/Projet_realiser/liste_projet_realiser.dart';
import 'package:promoteur_immobiier/modules/appartement/aVendre/avendre.dart';
import 'package:promoteur_immobiier/modules/login/login.dart';
import 'package:promoteur_immobiier/sheared/components/constants.dart';
import 'package:promoteur_immobiier/sheared/network/local/cach_helper.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';

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
    return Builder(builder: (context) {
      AppCubit.get(context).getcoordonner();
      return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) async {
          if (state is ApplogoutErrorState) {
            Fluttertoast.showToast(
                msg: "Erreur",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER_LEFT,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 90.0);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: ConditionalBuilder(
                builder: (context) => ListView(
                  physics: NeverScrollableScrollPhysics(),
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .6,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.elliptical(250, 250.0),
                                  bottomLeft: Radius.lerp(
                                      Radius.elliptical(500, 50.0),
                                      Radius.elliptical(50, 500.0),
                                      100),
                                ),
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
                          ),
                          AppBar(
                            backgroundColor: Colors.transparent,
                            actions: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                    onPressed: () {
                                      AppCubit.get(context).userLogout();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.logout_outlined,
                                            color: Colors.white),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "Déconnexion",
                                          style: GoogleFonts.merriweather(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            fontSize: 11,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )),
                              )
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
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                            bottomStart: Radius.circular(10.0),
                                            topEnd: Radius.circular(10.0),
                                            topStart: Radius.circular(10.0),
                                          )),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: customText(
                                              text: "Construire ensemble ",
                                              color: Colors.white,
                                              fontSize: 15,
                                              letterSpacing: 1.2),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      launch(AppCubit.get(context)
                                          .cordonner
                                          .lienmap);
                                    },
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          Icons.place,
                                          color: Colors.white,
                                          size: 13,
                                        ),
                                        Text(
                                          "${AppCubit.get(context).cordonner.residence} ${AppCubit.get(context).cordonner.rue}, ${AppCubit.get(context).cordonner.ville}, ${AppCubit.get(context).cordonner.pays}",
                                          style: GoogleFonts.merriweather(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          iconSize: 20,
                                          visualDensity:
                                              VisualDensity.comfortable,
                                          icon: Icon(
                                            FontAwesomeIcons.phoneAlt,
                                          ),
                                          onPressed: () {
                                            launch(
                                                "tel:${AppCubit.get(context).cordonner.numphone}");
                                          },
                                          color: Colors.white),
                                      IconButton(
                                          iconSize: 20,
                                          icon: Icon(
                                            FontAwesomeIcons.facebookF,
                                          ),
                                          onPressed: () {
                                            launch(AppCubit.get(context)
                                                .cordonner
                                                .llienfb);
                                          },
                                          color: Colors.white),
                                      IconButton(
                                          iconSize: 20,
                                          icon: Icon(
                                            FontAwesomeIcons.instagram,
                                          ),
                                          onPressed: () {
                                            launch(AppCubit.get(context)
                                                .cordonner
                                                .lieninstgrame);
                                          },
                                          color: Colors.white),
                                      IconButton(
                                        iconSize: 20,
                                        color: Colors.white,
                                        icon: Icon(
                                          FontAwesomeIcons.youtube,
                                        ),
                                        onPressed: () {
                                          launch(AppCubit.get(context)
                                              .cordonner
                                              .lienyoutube);
                                        },
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
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.lerp(Radius.elliptical(500, 50.0),
                                Radius.elliptical(50, 500.0), 100),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [kSecondaryColor, kMainColor])),
                      height: MediaQuery.of(context).size.height - 5,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100),
                            ),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(50.0),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListeAppartementAVendre()));
                                  },
                                  child: listeMenu(titre: "Être propriétaire")),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListProjetEnCours()));
                                  },
                                  child:
                                      listeMenu(titre: "Nos projet en cours")),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ListProjetRealiser()));
                                  },
                                  child: listeMenu(titre: "Nos réalisations")),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
                condition: state is AppGetCordonnerSuccessState,
              ),
            ),
          );
        },
      );
    });
  }
}
