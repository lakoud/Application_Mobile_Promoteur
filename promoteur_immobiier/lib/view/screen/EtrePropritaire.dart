import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promoteur_immobiier/constants.dart';
import 'package:promoteur_immobiier/viewmodel/AppartementViewModel.dart';
import 'DetailEappartementEtreProp.dart';

class EtrePropritaire extends StatefulWidget {
  EtrePropritaire({Key key}) : super(key: key);

  @override
  _EtrePropritaireState createState() => _EtrePropritaireState();
}

class _EtrePropritaireState extends State<EtrePropritaire> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppartementViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: kMainColor,
              ),
              body: _listViewAppartement(),
            ),
    );
  }

  Widget _listViewAppartement() {
    return GetBuilder<AppartementViewModel>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            itemCount: controller.appartementModel.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => DetailApartementEtrePropritaire(
                          model: controller.appartementModel[index],
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.network(
                                controller.appartementModel[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            width: 205,
                            height: 150,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Positioned(
                                  top: 15,
                                  child: Text(
                                    controller.appartementModel[index].type,
                                    style: TextStyle(
                                        color: kMainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Positioned(
                                  top: 60,
                                  child: Text(
                                    controller
                                        .appartementModel[index].residence,
                                    style: TextStyle(
                                      color: kSecondaryColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Positioned(
                                  bottom: 10,
                                  child: Row(
                                    children: [
                                      Text(
                                        controller
                                            .appartementModel[index].surface,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        controller.appartementModel[index].prix,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }
}
