import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/view/WIdgets/bottombar.dart';
import 'package:promoteur_immobiier/view/WIdgets/inputWidget.dart';

import '../../constants.dart';

class ListeDesProjet extends StatelessWidget {
  String parking, titre, description;
  String image, nappartemnt, addresse, residence;
  ListeDesProjet(
      {this.titre,
      this.image,
      this.residence,
      this.description,
      this.nappartemnt,
      this.parking,
      this.addresse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        text: titre,
                        style: TextStyle(
                          fontSize: 22.0,
                          height: 1.3,
                          color: Color.fromRGBO(22, 27, 40, 70),
                        ),
                      ),
                      TextSpan(
                        text: "\n",
                        style: TextStyle(
                          fontSize: 22.0,
                          height: 1.3,
                          color: Color.fromRGBO(22, 27, 40, 70),
                        ),
                      ),
                      TextSpan(
                        text: " Allience groupe ",
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
                  itemCount: 1,
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
                                  borderRadius: BorderRadius.circular(18.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      image,
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(residence,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: "SourceSans",
                                              fontWeight: FontWeight.w700,
                                            )),
                                      ),
                                      Text(residence,
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
                                    description,
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
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(Icons.place,
                                                size: 15.0, color: kMainColor),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            Text(
                                              addresse,
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                color: Color(0xFF343434),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "Plus de details ",
                                          style: TextStyle(color: kMainColor),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.arrow_drop_down,
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
                )
              ],
            ),
          )),
        ));
  }
}
