import 'package:flutter/material.dart';

import 'package:promoteur_immobiier/sheared/components/components.dart';

class AppartementEncours extends StatefulWidget {
  AppartementEncours({Key key}) : super(key: key);

  @override
  _AppartementEncoursState createState() => _AppartementEncoursState();
}

class _AppartementEncoursState extends State<AppartementEncours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title(title: "Etre propritaire")),
      body: SingleChildScrollView(
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
            listePropritaire(
                image:
                    "https://immoneuftunisie.com/wp-content/uploads/2017/01/lac_interieur_1.jpg",
                surface: "150 m",
                type: "Appartement S+1",
                prix: "1500",
                nomresidance: "Residance ain mariem "),
          ],
        ),
      ),
    );
  }
}
