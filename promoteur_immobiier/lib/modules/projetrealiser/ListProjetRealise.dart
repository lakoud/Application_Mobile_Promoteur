import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/models/AppartmentModel.dart';
import 'package:promoteur_immobiier/models/adresseAppartement.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/cubit.dart/states.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/pr_apartement.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/projetRealiser.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'cubit.dart/cubit.dart';

class ListProjetRealise extends StatelessWidget {
  ListProjetRealise({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title(title: "Nos réalisations")),
      body: BlocConsumer<PRCubit, PRState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: PRCubit.get(context).PR.length > 0,
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  rechercheEtFiltre(function: () {}),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15.0,
                    ),
                    itemCount: PRCubit.get(context).PR.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      // height: MediaQuery.of(context).size.height / 3,
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 250,
                              child: Image.network(
                                PRCubit.get(context).PR[index].photo,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                  PRCubit.get(context).PR[index].nomProjet),
                              subtitle: Row(
                                children: [
                                  Icon(
                                    Icons.place,
                                    size: 20,
                                    color: kMainColor,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "helo",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              child: Text(
                                PRCubit.get(context).PR[index].description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  textColor: kMainColor,
                                  onPressed: () {
                                    PRAppartement();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProjetRealiser(
                                                model: PRCubit.get(context)
                                                    .PR[index],
                                                modelAv: PRCubit.get(context)
                                                    .av[index],
                                                modelEquip: PRCubit.get(context)
                                                    .eq[index],
                                              )),
                                    );
                                    // Perform some action
                                  },
                                  child: const Text('Plus de details'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
