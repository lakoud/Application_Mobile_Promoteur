import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';

class RechercheScrean extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: defaultFormField(
          controller: searchController,
          type: TextInputType.text,
          validate: (String value) {
            if (value.isEmpty) {
              return ' Recherche vide';
            }
            return null;
          },
          icon: Icons.search,
          label: 'Recherche'),
    );
  }
}
