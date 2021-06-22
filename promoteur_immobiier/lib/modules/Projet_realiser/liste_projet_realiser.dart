import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';
import 'package:promoteur_immobiier/modules/Projet_en_cours/projet_en_cours.dart';
import 'package:promoteur_immobiier/modules/Projet_realiser/projetRealiser.dart';

import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/components/constants.dart';

import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class ListProjetRealiser extends StatefulWidget {
  ListProjetRealiser({Key key}) : super(key: key);

  @override
  _ListProjetRealiserState createState() => _ListProjetRealiserState();
}

class _ListProjetRealiserState extends State<ListProjetRealiser> {
  Color color = Colors.red;

  Widget build(BuildContext context) {
    AppCubit.get(context).projetListsEnRealiser();
    return Scaffold(
      appBar: AppBar(title: title(title: "Nos projet realiser")),
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                if (state is GetPCLodingState) CircularProgressIndicator(),
                ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15.0,
                        ),
                    itemCount: AppCubit.get(context).projtenREALISER.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buildChatItem(
                        AppCubit.get(context).projtenREALISER[index])),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildChatItem(ProjetModel model2) {
    return Container(
        // height: MediaQuery.of(context).size.height / 3,
        child: Stack(
      children: [
        Card(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: Image.network(
                  model2.photo,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(model2.nomProjet),
                subtitle: Builder(builder: (context) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                model2.nbAppartement,
                                style: GoogleFonts.merriweather(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Appartements",
                                style: GoogleFonts.alata(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  fontSize: 13,
                                  color: kMainColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                model2.nbEtage,
                                style: GoogleFonts.merriweather(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Etage",
                                style: GoogleFonts.alata(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  fontSize: 13,
                                  color: kMainColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Text(
                  model2.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    textColor: kMainColor,
                    onPressed: () {
                      navigateTo(context, Projetrealiser(projet: model2));
                      // Perform some action
                    },
                    child: const Text('Plus de details'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {}, icon: FaIcon(FontAwesomeIcons.heart))),
        ),
      ],
    ));
  }
}
