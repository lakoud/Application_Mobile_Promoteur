import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/models/AppartmentModel.dart';
import 'package:promoteur_immobiier/modules/etrepropritaire/detailEappartementEtreProp.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/cubit.dart/cubit.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/cubit.dart/states.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class PRAppartement extends StatelessWidget {
  AppartementrModel modelAppartements;
  String id;

  PRAppartement({this.modelAppartements, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: title(title: "Etre propritaire")),
        body: BlocProvider(
          create: (context) => PRCubit()..getAppartement(id),
          child: BlocConsumer<PRCubit, PRState>(
              listener: (context, state) {},
              builder: (context, state) {
                return ConditionalBuilder(
                  condition: PRCubit.get(context).PR.length > 0,
                  builder: (context) => SingleChildScrollView(
                    child: Column(
                      children: [
                        titreDesPages(titre: "Appartement Allince Groupe "),
                        SizedBox(
                          height: 20,
                        ),
                        rechercheEtFiltre(),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                            condition:
                                PRCubit.get(context).appartement.length > 0,
                            builder: (context) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 15.0,
                                      );
                                    },
                                    itemCount:
                                        PRCubit.get(context).appartement.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        child: Column(
                                          children: [
                                            Expanded(
                                                child: Stack(
                                              overflow: Overflow.visible,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          PRCubit.get(context)
                                                              .appartement[
                                                                  index]
                                                              .photo),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 10.0,
                                                  right: 10.0,
                                                  child: InkWell(
                                                    child: Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                      ),
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
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                              color: Colors.grey
                                                                  .shade200,
                                                              offset:
                                                                  Offset(2, 4),
                                                              blurRadius: 5,
                                                              spreadRadius: 2)
                                                        ],
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                            colors: [
                                                              kSecondaryColor,
                                                              kMainColor
                                                            ])),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          ".surface,",
                                                          style: TextStyle(
                                                            fontSize: 15.0,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0),
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                              " .typeAppartement",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    "SourceSans",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              )),
                                                        ),
                                                        Text(".prix",
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                              fontFamily:
                                                                  "SourceSans",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ))
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      "Description resumé",
                                                      style: TextStyle(
                                                        fontSize: 13.0,
                                                        color:
                                                            Color(0xFF343434),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.place,
                                                                  size: 15.0,
                                                                  color:
                                                                      kMainColor),
                                                              SizedBox(
                                                                width: 5.0,
                                                              ),
                                                              Text(
                                                                " nomDeProjet",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      13.0,
                                                                  color: Color(
                                                                      0xFF343434),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          DetailApartementEtrePropritaire()),
                                                            );
                                                          },
                                                          child: Text(
                                                            "Plus de details ",
                                                            style: TextStyle(
                                                                color:
                                                                    kMainColor),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            DetailApartementEtrePropritaire()),
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .arrow_drop_down,
                                                              color: kMainColor,
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            fallback: (context) => Center(
                                  child: CircularProgressIndicator(),
                                )),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
