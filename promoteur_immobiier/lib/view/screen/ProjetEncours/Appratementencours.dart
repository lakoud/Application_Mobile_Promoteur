import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:promoteur_immobiier/constants.dart';

import 'package:promoteur_immobiier/view/WIdgets/bottombar.dart';
import 'package:promoteur_immobiier/view/WIdgets/inputWidget.dart';
import 'package:promoteur_immobiier/view/screen/DevenezPropritaire/DetailEappartementEtreProp.dart';
import 'package:promoteur_immobiier/viewmodel/AppartementViewModel.dart';

class AppartementEncours extends StatefulWidget {
  AppartementEncours({Key key}) : super(key: key);

  @override
  _AppartementEncoursState createState() => _AppartementEncoursState();
}

class _AppartementEncoursState extends State<AppartementEncours> {
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
                            color: kMainColor,
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
                                        width: 60.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
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
                                                colors: [
                                                  kSecondaryColor,
                                                  kMainColor
                                                ])),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
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
                                    ),
                                  ],
                                )),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  controller
                                                      .appartementModel[index]
                                                      .type,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontFamily: "SourceSans",
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ),
                                            Text(
                                                controller
                                                    .appartementModel[index]
                                                    .prix,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: "SourceSans",
                                                  fontWeight: FontWeight.w700,
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
                                            color: Color(0xFF343434),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.place,
                                                size: 15.0, color: kMainColor),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              controller.appartementModel[index]
                                                  .residence,
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                color: Color(0xFF343434),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailApartementEtrePropritaire()),
                                                  );
                                                },
                                                child: Column(
                                                  children: [
                                                    Text("Plus de details "),
                                                    Icon(Icons.arrow_drop_down)
                                                  ],
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
                      )
                    ],
                  ),
                )),
              )),
    );
  }
}
