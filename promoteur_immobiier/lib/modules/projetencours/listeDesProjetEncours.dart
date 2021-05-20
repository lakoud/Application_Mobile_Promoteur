import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/modules/projetencours/cubit.dart/cubit.dart';
import 'package:promoteur_immobiier/modules/projetencours/cubit.dart/states.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class ListProjetEnCours extends StatelessWidget {
  ListProjetEnCours({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title(title: "Nos projet en cours")),
      body: BlocConsumer<PCCubit, PCState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: PCCubit.get(context).projtencours.length > 0,
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
                    itemCount: PCCubit.get(context).projtencours.length,
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
                                PCCubit.get(context).projtencours[index].photo,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ListTile(
                              title: Text(PCCubit.get(context)
                                  .projtencours[index]
                                  .nomProjet),
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
                                      "Rue ${PCCubit.get(context).adresse[index].rue}- ${PCCubit.get(context).adresse[index].ville}- ${PCCubit.get(context).adresse[index].pays}",
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
                                PCCubit.get(context)
                                    .projtencours[index]
                                    .description,
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
