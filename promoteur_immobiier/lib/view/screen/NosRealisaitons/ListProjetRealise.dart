import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:promoteur_immobiier/constants.dart';

import 'package:promoteur_immobiier/view/WIdgets/bottombar.dart';
import 'package:promoteur_immobiier/view/WIdgets/inputWidget.dart';
import 'package:promoteur_immobiier/view/screen/ListeDesProjet.dart';
import 'package:promoteur_immobiier/viewmodel/AppartementViewModel.dart';

class ListProjetRealise extends StatefulWidget {
  ListProjetRealise({Key key}) : super(key: key);

  @override
  _ListProjetRealiseState createState() => _ListProjetRealiseState();
}

class _ListProjetRealiseState extends State<ListProjetRealise> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppartementViewModel>(
        init: Get.find(),
        builder: (controller) => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : ListeDesProjet(
                titre: "Nos projets réalisés",
                image:
                    "https://immoneuftunisie.com/wp-content/uploads/2017/01/lac_interieur_1.jpg",
                description: "Notre nouveus residence ain marime",
                residence: "Residence",
                nappartemnt: "45",
                parking: "inclut",
                addresse: "Rue omar lmktahr"));
  }
}
