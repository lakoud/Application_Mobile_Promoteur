import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promoteur_immobiier/constants.dart';
import 'package:promoteur_immobiier/view/WIdgets/bottombar.dart';
import 'package:promoteur_immobiier/viewmodel/AppartementViewModel.dart';

class AvancementDeProjet extends StatefulWidget {
  AvancementDeProjet({Key key}) : super(key: key);

  @override
  _AvancementDeProjetState createState() => _AvancementDeProjetState();
}

class _AvancementDeProjetState extends State<AvancementDeProjet> {
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
                              text: "Avancement du projet  \n",
                              style: TextStyle(
                                fontSize: 22.0,
                                height: 1.3,
                                color: Color.fromRGBO(22, 27, 40, 70),
                              ),
                            ),
                            TextSpan(
                              text: "Residence ain  mariem ",
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
                      SizedBox(
                        height: 25.0,
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 15.0,
                          );
                        },
                        itemCount: 5,
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
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLG9DQ_w_D0CdLXX56_l_NiJyyGN8eR__-iQ&usqp=CAU"),
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
                                              "27/10/2000",
                                              style: TextStyle(
                                                fontSize: 17.0,
                                              ),
                                            ),
                                          ),
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
