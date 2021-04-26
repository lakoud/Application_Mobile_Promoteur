import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/model/AppartementModel.dart';

class DetailApartementEtrePropritaire extends StatelessWidget {
  AppartementModel model;

  DetailApartementEtrePropritaire({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Image.network(model.image, fit: BoxFit.fill),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(18),
              child: Text(
                model.type,
                style: TextStyle(fontSize: 26),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Text("Description"),
            ),
            Container(
              child: Text(
                  "hzdmkjd gbsdg fghrth dfmkjsdf egoejkrfùpzeof zmojzefozef pozjrfzpeofkpaokfapzofkazpfokazpfokazpfkakzfopazkfapzfkazpk"),
            ),
          ],
        ),
      )),
    );
  }
}
