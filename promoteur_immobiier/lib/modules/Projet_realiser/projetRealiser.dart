import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';
import 'package:promoteur_immobiier/modules/appartement/liste_des_appartements.dart';
import 'package:promoteur_immobiier/modules/appartement/planScreen.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Projetrealiser extends StatelessWidget {
  ProjetModel projet;
  Projetrealiser({this.projet});
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getprojerEncours(uId: projet.id);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(projet.nomProjet),
        ),
        body: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (AppCubit.get(context).adresse == null)
              return Container(child: Text("Vide"));
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              Align(
                                child: Container(
                                  height: 250.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                        bottomLeft: Radius.circular(4.0),
                                        bottomRight: Radius.circular(4.0),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(projet.photo),
                                          fit: BoxFit.cover)),
                                ),
                                alignment: Alignment.topCenter,
                              ),
                              GestureDetector(
                                onTap: () {
                                  navigateTo(
                                      context,
                                      ListeAppartement(
                                        projet: projet,
                                      ));
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration:
                                      BoxDecoration(color: Colors.black12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Nos Logements",
                                          style: GoogleFonts.habibi(
                                            fontWeight: FontWeight.bold,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height / 10,
                              width: 250,
                              child: Card(
                                child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: GridView.builder(
                                        itemCount: AppCubit.get(context)
                                            .equipement
                                            .length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                childAspectRatio: 5,
                                                crossAxisCount: 2),
                                        itemBuilder: (context, index) =>
                                            Container(
                                                child: Row(
                                              children: [
                                                if (AppCubit.get(context)
                                                        .equipement[index]
                                                        .type ==
                                                    "Piscine")
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .swimmingPool,
                                                    size: 15,
                                                    color: kMainColor,
                                                  ),
                                                if (AppCubit.get(context)
                                                        .equipement[index]
                                                        .type ==
                                                    "Parking")
                                                  FaIcon(
                                                    FontAwesomeIcons.parking,
                                                    size: 15,
                                                    color: kMainColor,
                                                  ),
                                                if (AppCubit.get(context)
                                                        .equipement[index]
                                                        .type ==
                                                    "Gym")
                                                  FaIcon(
                                                    FontAwesomeIcons.running,
                                                    size: 15,
                                                    color: kMainColor,
                                                  ),
                                                if (AppCubit.get(context)
                                                        .equipement[index]
                                                        .type ==
                                                    "Assenceur")
                                                  FaIcon(
                                                    FontAwesomeIcons.elementor,
                                                    size: 15,
                                                    color: kMainColor,
                                                  ),
                                                SizedBox(
                                                  width: 1,
                                                ),
                                                Text(
                                                  AppCubit.get(context)
                                                      .equipement[index]
                                                      .type,
                                                  style:
                                                      GoogleFonts.merriweather(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            )))),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.mapMarkerAlt,
                                size: 18,
                                color: kMainColor,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Container(
                                child: TextButton(
                                  onPressed: () => launch(
                                      AppCubit.get(context).adresse.lienMap),
                                  child: Text(
                                    "${AppCubit.get(context).adresse.rue} ${AppCubit.get(context).adresse.ville} ${AppCubit.get(context).adresse.pays}",
                                    style: GoogleFonts.merriweather(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(
                                      thickness: 1,
                                    ),
                                  ),
                                ),
                                Text('Description'),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(
                                      thickness: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Container(
                                child: Text(projet.description,
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          buildseparaton("A coté"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .1,
                              child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      AppCubit.get(context).avantage.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3),
                                  itemBuilder: (context, index) => Container(
                                          child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              if (AppCubit.get(context)
                                                      .avantage[index]
                                                      .type ==
                                                  "Hôpitaux")
                                                FaIcon(
                                                  FontAwesomeIcons.hospital,
                                                  color: kMainColor,
                                                ),
                                              if (AppCubit.get(context)
                                                      .avantage[index]
                                                      .type ==
                                                  "Écoles")
                                                FaIcon(
                                                    FontAwesomeIcons.university,
                                                    color: kMainColor),
                                              if (AppCubit.get(context)
                                                      .avantage[index]
                                                      .type ==
                                                  "Commerces")
                                                FaIcon(
                                                  FontAwesomeIcons.shoppingBag,
                                                  color: kMainColor,
                                                ),
                                              if (AppCubit.get(context)
                                                      .avantage[index]
                                                      .type ==
                                                  "Transport")
                                                FaIcon(FontAwesomeIcons.bus,
                                                    color: kMainColor),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                AppCubit.get(context)
                                                    .avantage[index]
                                                    .type,
                                                style: GoogleFonts.merriweather(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            AppCubit.get(context)
                                                .avantage[index]
                                                .nom,
                                            style: GoogleFonts.habibi(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            AppCubit.get(context)
                                                .avantage[index]
                                                .distance,
                                            style: GoogleFonts.habibi(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          buildseparaton("Plan du Projet"),
                          GestureDetector(
                            onTap: () {
                              navigat(context, PlanScreen(image: projet.plan));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              child:
                                  Image.network(projet.plan, fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
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
                thickness: 1,
              ),
            ),
          ),
          Text("${text}"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
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
/*
class ListeDesApartement extends StatelessWidget {
  const ListeDesApartement({
    Key key,
    @required this.imageList,
  }) : super(key: key);

  final List imageList;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 3),
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.all(10.0),
                width: 210.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    //bloc de text au dessus de photo

                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 120.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText("Surface: ", Colors.black, 18.0, 1.2),
                              CustomText("100", Colors.grey, 9.0, 1.2),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ]),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 180.0,
                              image: AssetImage('assets/s.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            bottom: 10.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText("S+1", Colors.white, 24.0, 1.2),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )

                //mm

                );
          },
        ));
  }*/
