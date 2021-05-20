import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/models/AppartmentModel.dart';
import 'package:promoteur_immobiier/modules/etrepropritaire/cubit/states.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

import 'cubit/cubit.dart';
import 'detailEappartementEtreProp.dart';

class ListePropritaire extends StatefulWidget {
  ListePropritaire({Key key}) : super(key: key);

  @override
  _ListePropritaireState createState() => _ListePropritaireState();
}

class _ListePropritaireState extends State<ListePropritaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title(title: "Nos réalisations")),
      body: BlocConsumer<PropCubit, PropState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                rechercheEtFiltre(function: () {}),
                SizedBox(
                  height: 20,
                ),
                ConditionalBuilder(
                  condition: PropCubit.get(context).ap.length > 0,
                  builder: (context) => ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 15.0,
                    ),
                    itemCount: PropCubit.get(context).ap.length,
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
                                PropCubit.get(context).ap[index].photo,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ListTile(
                              title: Text(PropCubit.get(context)
                                  .ap[index]
                                  .typeAppartement),
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
                                      PropCubit.get(context)
                                          .ap[index]
                                          .nomDeProjet, //  "Rue ${PRCubit.get(context).ad[index].rue}- ${PRCubit.get(context).ad[index].ville}- ${PRCubit.get(context).ad[index].pays}",
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
                                PropCubit.get(context).ap[index].description,
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
                                    navigateTo(
                                        context,
                                        DetailApartementEtrePropritaire(
                                          model:
                                              PropCubit.get(context).ap[index],
                                        ));
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
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
