import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class DetailApartementEtrePropritaire extends StatelessWidget {
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
                          image: NetworkImage(
                              "https://d1qfj231ug7wdu.cloudfront.net/pictures/estate/4628/4627638/9312662665fc95e72bfdb85.61873926_1280.jpg"),
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
                            "5000 m",
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
                              child: Text("Appartement S+1",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "SourceSans",
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Text("5000 DT",
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
                              "Residence Ain Mariam",
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
                "A vendre un bien à la soukra, limitrophe à une clinique de chirurgie esthétique, idéal pour cabinet médical ou pour habitation, composé de deux niveaux. Un RDC de 74 m2, est composé d’un salon spacieux, une cuisine équipée et une salle d’eau.",
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
            child: Image.network(
                "https://i.pinimg.com/originals/06/37/2c/06372cef20d89b57c58bdfc140710c70.png",
                fit: BoxFit.fill),
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
