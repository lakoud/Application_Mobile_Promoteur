import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';

class ListProjetRealise extends StatelessWidget {
  ListProjetRealise({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).projetR.length > 0,
          builder: (context) => Scaffold(
            appBar: AppBar(title: title(title: "Nos réalisations")),
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
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
