import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/models/AppartmentModel.dart';
import 'package:promoteur_immobiier/models/avantageEmplacement.dart';
import 'package:promoteur_immobiier/models/equipementAppartement.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/cubit.dart/cubit.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/cubit.dart/states.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/pr_apartement.dart';

class ProjetRealiser extends StatelessWidget {
  ProjetModel model;
  AvantageEmplacementModel modelAv;
  EquipementModel modelEquip;

  ProjetRealiser({
    this.model,
    this.modelAv,
    this.modelEquip,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(model.nomProjet),
      ),
      body: BlocProvider(
          create: (context) => PRCubit()..getPosts(),
          child: BlocConsumer<PRCubit, PRState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ConditionalBuilder(
                condition: PRCubit.get(context).PR.length > 0,
                builder: (context) => SingleChildScrollView(
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
                                              image: NetworkImage(model.photo),
                                              fit: BoxFit.cover)),
                                    ),
                                    alignment: Alignment.topCenter,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PRAppartement()),
                                      );
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
                                              "Appartements",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                      color: Colors.white),
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
                                height: 100,
                                width: 250,
                                child: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.flip_to_front_rounded,
                                                ),
                                                Text(
                                                  "10 Etage",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.house_outlined,
                                                ),
                                                Text(
                                                  "50 AP ",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.elevator_outlined,
                                                ),
                                                Container(
                                                  child: Text(
                                                    modelEquip.nom,
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.local_parking_outlined,
                                                ),
                                                Text(
                                                  "Parking",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                              )
                            ],
                          ),
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                              ),
                              Text('Description'),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Container(
                              child: Text(model.description,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        buildseparaton("A coté"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 150,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.shopping_basket,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Retail  ",
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "Shoppers Stop: ",
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "650m",
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 150,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.school,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,

                                    //    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        modelAv.type,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      Text(
                                        modelAv.nom,
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                        modelAv.distance,
                                        style: TextStyle(fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        buildseparaton("Plan du Projet"),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: Image.network(
                              "https://i.pinimg.com/originals/06/37/2c/06372cef20d89b57c58bdfc140710c70.png",
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
                thickness: 1,
              ),
            ),
          ),
          Text(text),
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
