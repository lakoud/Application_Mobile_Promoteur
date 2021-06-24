import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';
import 'detailEappartementEtreProp.dart';

class ListeAppartement extends StatelessWidget {
  ListeAppartement({this.projet});
  ProjetModel projet;
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getprojerEncours(uId: projet.id);

    return Scaffold(
        appBar: AppBar(title: title(title: "Nos Logements ")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.0,
                ),
                itemCount: AppCubit.get(context).appartement.length,
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
                            AppCubit.get(context).appartement[index].photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Appartement ${AppCubit.get(context).appartement[index].typeAppartement}"),
                              if (AppCubit.get(context)
                                      .appartement[index]
                                      .prix !=
                                  'Prix à consulter')
                                Text(
                                    "${AppCubit.get(context).appartement[index].prix}TND"),
                              if (AppCubit.get(context)
                                      .appartement[index]
                                      .prix ==
                                  'Prix à consulter')
                                Text(
                                    "${AppCubit.get(context).appartement[index].prix}")
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.placeOfWorship,
                                      size: 17,
                                      color: kMainColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${projet.nomProjet}-${AppCubit.get(context).adresse.ville}-${AppCubit.get(context).adresse.pays}", //  "Rue ${PRCubit.get(context).ad[index].rue}- ${PRCubit.get(context).ad[index].ville}- ${PRCubit.get(context).ad[index].pays}",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Text(
                            AppCubit.get(context)
                                .appartement[index]
                                .description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              textColor: kMainColor,
                              onPressed: () {
                                navigat(
                                    context,
                                    DetailApartementEtrePropritaire(
                                        appartement: AppCubit.get(context)
                                            .appartement[index]));
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
        ));
  }
}
