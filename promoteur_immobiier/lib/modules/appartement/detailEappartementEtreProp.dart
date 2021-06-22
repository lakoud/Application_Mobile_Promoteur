import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/models/AppartmentModel.dart';
import 'package:promoteur_immobiier/modules/appartement/planScreen.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class DetailApartementEtrePropritaire extends StatelessWidget {
  AppartementrModel appartement;

  DetailApartementEtrePropritaire({this.appartement});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: [
                Expanded(
                    child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(100, 100.0),
                          bottomLeft: Radius.lerp(Radius.elliptical(100, 50.0),
                              Radius.elliptical(40, 200.0), 50),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(appartement.photo),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -15.0,
                      left: 10.0,
                      child: Container(
                        width: 70.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [kMainColor, kMainColor])),
                        child: Center(
                          child: Text(
                            appartement.surface,
                            style: GoogleFonts.merriweather(
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 35.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Appartement ${appartement.typeAppartement}",
                                style: GoogleFonts.merriweather(
                                  textStyle:
                                      Theme.of(context).textTheme.subtitle1,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              " ${appartement.prix} TND",
                              style: GoogleFonts.merriweather(
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            FaIcon(FontAwesomeIcons.placeOfWorship,
                                size: 15.0, color: kMainColor),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "${appartement.nomDeProjet}",
                              style: GoogleFonts.merriweather(
                                textStyle:
                                    Theme.of(context).textTheme.subtitle1,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              " ${appartement.numeroEtage} éme étage",
                              style: GoogleFonts.merriweather(
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          buildseparaton("Description"),
          SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              child: Text(
                appartement.description,
                style: GoogleFonts.adamina(
                  textStyle: Theme.of(context).textTheme.bodyText2,
                  fontSize: 17,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          buildseparaton("Plan de l'appartement "),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              navigat(context, PlanScreen(image: appartement.plan));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(appartement.plan),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Container buildseparaton(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: kMainColor,
                thickness: 1,
              ),
            ),
          ),
          Text(text),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: kMainColor,
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
