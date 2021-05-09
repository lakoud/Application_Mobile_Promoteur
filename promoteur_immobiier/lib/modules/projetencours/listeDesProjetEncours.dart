import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';

class ListProjetEnCours extends StatefulWidget {
  ListProjetEnCours({Key key}) : super(key: key);

  @override
  _ListProjetEnCoursState createState() => _ListProjetEnCoursState();
}

class _ListProjetEnCoursState extends State<ListProjetEnCours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: title(title: "Nos  projets en cours de réalisation")),
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
            listDesProjet(
                addresse: "Ain marim",
                residence: "Residence lakoud",
                description: "lmkdjrgspodifjq^zif",
                nappartemnt: "50",
                parking: true,
                image:
                    "https://immoneuftunisie.com/wp-content/uploads/2017/01/lac_interieur_1.jpg")
          ],
        ),
      ),
    );
  }
}
