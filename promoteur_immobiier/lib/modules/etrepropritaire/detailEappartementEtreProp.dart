import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/models/AppartmentModel.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class DetailApartementEtrePropritaire extends StatelessWidget {
  AppartementrModel model;
  DetailApartementEtrePropritaire({this.model});
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
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(model.photo),
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
                        child: Center(
                          child: Text(
                            model.surface,
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
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 35.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(model.typeAppartement,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "SourceSans",
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Text(model.prix,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "SourceSans",
                                  fontWeight: FontWeight.w700,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Icon(Icons.place, size: 15.0, color: kMainColor),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              model.nomDeProjet,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xFF343434),
                              ),
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
          buildseparaton("Description"),
          SizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Container(
              child: Text(
                model.description,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          buildseparaton("Plan de l'appartement "),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(model.plan),
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
