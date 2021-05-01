import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:promoteur_immobiier/constants.dart';

import 'package:promoteur_immobiier/view/WIdgets/bottombar.dart';
import 'package:promoteur_immobiier/view/WIdgets/inputWidget.dart';
import 'package:promoteur_immobiier/viewmodel/AppartementViewModel.dart';
import 'DetailEappartementEtreProp.dart';

class EtrePropritaire extends StatefulWidget {
  EtrePropritaire({Key key}) : super(key: key);

  @override
  _EtrePropritaireState createState() => _EtrePropritaireState();
}

class _EtrePropritaireState extends State<EtrePropritaire> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    resultsLoaded = getAppartement();
  }

  Future resultsLoaded;
  List _allResult = [];
  final CollectionReference _appartementCollectionRef =
      FirebaseFirestore.instance.collection('Appartement');

  getAppartement() async {
    var value = await _appartementCollectionRef.get();

    setState(() {
      _allResult = value.docs;
    });

    return "completd";
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppartementViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              bottomNavigationBar: BottomBar(),
              body: SingleChildScrollView(
                child: SafeArea(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Etre Propritaire  \n",
                              style: TextStyle(
                                fontSize: 22.0,
                                height: 1.3,
                                color: Color.fromRGBO(22, 27, 40, 70),
                              ),
                            ),
                            TextSpan(
                              text: "Appartement Allience groupe ",
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w800,
                                color: blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: InputWidget(
                                  height: 44.0,
                                  hintText: "Recherche",
                                  prefixIcon: Icons.search)),
                          SizedBox(
                            width: 10.0,
                          ),
                          FlatButton(
                            //  height: ScreenUtil().setHeight(44.0),
                            onPressed: () {
                              //     Helper.nextScreen(context, Filters());
                            },
                            color: primaryColor,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.subject_sharp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Filters",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 15.0,
                          );
                        },
                        itemCount: controller.appartementModel.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 3,
                            child: Column(
                              children: [
                                Expanded(
                                    child: Stack(
                                  overflow: Overflow.visible,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            controller
                                                .appartementModel[index].image,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10.0,
                                      right: 10.0,
                                      child: InkWell(
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
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
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.amber,
                                        ),
                                        child: Center(
                                          child: Text(
                                            controller.appartementModel[index]
                                                .surface,
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              controller
                                                  .appartementModel[index].type,
                                              style: TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            controller
                                                .appartementModel[index].prix,
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              color: primaryColor,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "Description resumé",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Color(0xFF343434),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.place,
                                            size: 15.0,
                                            color:
                                                Color.fromRGBO(255, 136, 0, 1),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                controller
                                                    .appartementModel[index]
                                                    .residence,
                                                style: TextStyle(
                                                  fontSize: 13.0,
                                                  color: Color(0xFF343434),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 166,
                                              ),
                                              Icon(
                                                Icons.phone,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons.message,
                                                color: primaryColor,
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )),
              )),
    );
  }
}
