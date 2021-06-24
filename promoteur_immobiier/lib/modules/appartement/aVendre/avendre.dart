import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/modules/appartement/aVendre/filtre.dart';
import 'package:promoteur_immobiier/modules/appartement/detailEappartementEtreProp.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/components/constants.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class ListeAppartementAVendre extends StatefulWidget {
  @override
  _ListeAppartementAVendreState createState() =>
      _ListeAppartementAVendreState();
}

class _ListeAppartementAVendreState extends State<ListeAppartementAVendre> {
  IconData icon = FontAwesomeIcons.heart;
  IconData icon2 = FontAwesomeIcons.solidHeart;
  bool _pressed = false;
  int n;
  List<dynamic> _lBool = [];
  @override
  void initState() {
    super.initState();
    AppCubit.get(context).appartemntAvendre();
    AppCubit.get(context).favoriteappartemntAvendre();
    n = AppCubit.get(context).appartemntavendre.length;
    int n2 = AppCubit.get(context).favoriteappartemntavendre.length;
    _lBool = new List(n);
    for (int i = 0; i < n; i++) {
      _lBool[i] = false;
      //Aamel declaration ll list de favorit o nsamouha l par exemple
      for (var x in AppCubit.get(context).favoriteappartemntavendre) {
        print(x.idAppartment ==
            AppCubit.get(context).appartemntavendre[i].idAppartment);
        if (x.idAppartment ==
            AppCubit.get(context).appartemntavendre[i].idAppartment)
          _lBool[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: title(title: "Être propriétaire ")),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        //  height: ScreenUtil().setHeight(44.0),

                        onPressed: () {
                          navigat(context, ToggleButtons1());
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
                    itemCount: AppCubit.get(context).appartemntavendre.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
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
                                      AppCubit.get(context)
                                          .appartemntavendre[index]
                                          .photo,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "Appartement ${AppCubit.get(context).appartemntavendre[index].typeAppartement}"),
                                        Text(
                                            "${AppCubit.get(context).appartemntavendre[index].prix} TND")
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.placeOfWorship,
                                          size: 15,
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
                                                '${AppCubit.get(context).appartemntavendre[index].nomDeProjet}-${AppCubit.get(context).appartemntavendre[index].ville}', //  "Rue ${PRCubit.get(context).ad[index].rue}- ${PRCubit.get(context).ad[index].ville}- ${PRCubit.get(context).ad[index].pays}",
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.6)),
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
                                                .appartemntavendre[index]
                                                .numeroEtage !=
                                            '1')
                                          Expanded(
                                            child: Text(
                                                "${AppCubit.get(context).appartemntavendre[index].numeroEtage} éme étage"),
                                          ),
                                        if (AppCubit.get(context)
                                                .appartemntavendre[index]
                                                .numeroEtage ==
                                            '1')
                                          Expanded(
                                            child: Text(
                                                "${AppCubit.get(context).appartemntavendre[index].numeroEtage} ère étage"),
                                          )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16.0),
                                    child: Text(
                                      AppCubit.get(context)
                                          .appartemntavendre[index]
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
                                                  appartement: AppCubit.get(
                                                              context)
                                                          .appartemntavendre[
                                                      index]));
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
                                  radius: 17,
                                  backgroundColor: Colors.white,
                                  child: GestureDetector(
                                    child: _lBool.length != 0
                                        ? _lBool[index]
                                            ? FaIcon(
                                                icon2,
                                                size: 20,
                                                color: Colors.red,
                                              )
                                            : FaIcon(
                                                icon,
                                                size: 20,
                                                color: Colors.red,
                                              )
                                        : FaIcon(
                                            icon,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                    onTap: () {
                                      _pressed = !_pressed;
                                      if (_pressed) {
                                        //Ajouter le a la list de favorit en friebase
                                        setState(() {
                                          _lBool[index] = true;
                                          AppCubit.get(context)
                                              .ajouterappartmentAuFavorite(
                                                  ville: AppCubit.get(context)
                                                      .appartemntavendre[index]
                                                      .ville,
                                                  etage: AppCubit.get(context)
                                                      .appartemntavendre[index]
                                                      .numeroEtage,
                                                  nomProjet: AppCubit.get(context)
                                                      .appartemntavendre[index]
                                                      .nomDeProjet,
                                                  typeAppartement: AppCubit.get(
                                                          context)
                                                      .appartemntavendre[index]
                                                      .typeAppartement,
                                                  idAppartment: AppCubit.get(
                                                          context)
                                                      .appartemntavendre[index]
                                                      .idAppartment,
                                                  surface: AppCubit.get(context)
                                                      .appartemntavendre[index]
                                                      .surface,
                                                  prix: AppCubit.get(context)
                                                      .appartemntavendre[index]
                                                      .prix,
                                                  photo: AppCubit.get(context)
                                                      .appartemntavendre[index]
                                                      .photo,
                                                  description: AppCubit.get(
                                                          context)
                                                      .appartemntavendre[index]
                                                      .description,
                                                  idprojet: AppCubit.get(
                                                          context)
                                                      .appartemntavendre[index]
                                                      .uIdProjet);
                                        });
                                      } else {
                                        setState(() {
                                          _lBool[index] = false;
                                          // supprime le de la list en firebase
                                          AppCubit.get(context)
                                              .supprimerappartmentAuFavorite(
                                                  idAppartment: AppCubit.get(
                                                          context)
                                                      .appartemntavendre[index]
                                                      .idAppartment);
                                        });
                                      }
                                    },
                                  )),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            );
          },
        )));
  }
}
