import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/modules/appartement/aVendre/filtre.dart';
import 'package:promoteur_immobiier/modules/appartement/detailEappartementEtreProp.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class ListeAppartementAVendre extends StatelessWidget {
  ListeAppartementAVendre(
      {this.type,
      this.prix,
      this.surface1,
      this.surface2,
      this.currentprix,
      this.currentprix2});
  String type;
  String surface1;
  String surface2;
  String currentprix;
  String currentprix2;
  bool prix;
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getresultat(
        type: type,
        prix: prix,
        surface1: surface1,
        surface2: surface2,
        currentprix2: currentprix2,
        currentprix: currentprix);

    return Scaffold(
        appBar: AppBar(title: title(title: "Nos Logements ")),
        body: SingleChildScrollView(
            child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                if (state is GetappartmentAvendreloding)
                  Center(child: CircularProgressIndicator()),
                Row(
                  children: [
                    Expanded(child: SizedBox()),
                    FlatButton(
                      //  height: ScreenUtil().setHeight(44.0),

                      onPressed: () {
                        navigateTo(context, ToggleButtons1());
                      },

                      color: kMainColor,

                      child: Row(
                        children: [
                          Icon(
                            Icons.subject_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Filters",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15.0,
                  ),
                  itemCount:
                      AppCubit.get(context).appartemntavendreResultat.length,
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
                              AppCubit.get(context)
                                  .appartemntavendreResultat[index]
                                  .photo,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Appartement ${AppCubit.get(context).appartemntavendreResultat[index].typeAppartement}"),
                                Text(AppCubit.get(context)
                                    .appartemntavendreResultat[index]
                                    .prix)
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.placeOfWorship,
                                  size: 17,
                                  color: kMainColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppCubit.get(context)
                                            .appartemntavendreResultat[index]
                                            .nomDeProjet, //  "Rue ${PRCubit.get(context).ad[index].rue}- ${PRCubit.get(context).ad[index].ville}- ${PRCubit.get(context).ad[index].pays}",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    3 +
                                                15,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Expanded(child: SizedBox()),
                                Expanded(child: SizedBox()),
                                Expanded(child: SizedBox()),
                                if (AppCubit.get(context)
                                        .appartemntavendreResultat[index]
                                        .numeroEtage !=
                                    '1')
                                  Expanded(
                                    child: Text(
                                        "${AppCubit.get(context).appartemntavendreResultat[index].numeroEtage} éme étage"),
                                  ),
                                if (AppCubit.get(context)
                                        .appartemntavendreResultat[index]
                                        .numeroEtage ==
                                    '1')
                                  Expanded(
                                    child: Text(
                                        "${AppCubit.get(context).appartemntavendreResultat[index].numeroEtage} ère étage"),
                                  )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Text(
                              AppCubit.get(context)
                                  .appartemntavendreResultat[index]
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
                                  navigat(
                                      context,
                                      DetailApartementEtrePropritaire(
                                          appartement: AppCubit.get(context)
                                                  .appartemntavendreResultat[
                                              index]));
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
            );
          },
        )));
  }
}
