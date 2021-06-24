import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:promoteur_immobiier/sheared/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/modules/appartement/aVendre/filtre.dart';
import 'package:promoteur_immobiier/modules/appartement/detailEappartementEtreProp.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getUserData();

    print("fghjkl");
    AppCubit.get(context).favoriteappartemntAvendre2();
    print(AppCubit.get(context).favoriteappartemntavendre2.length);
    return Scaffold(
      appBar: AppBar(title: title(title: "Favorite")),
      body: BlocConsumer<AppCubit, AppState>(listener: (context, state) {
        // TODO: implement listener
      }, builder: (context, state) {
        return ConditionalBuilder(
          condition: uId != null,
          builder: (context) => SingleChildScrollView(
              child: BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  /*  if (state is GetappartmentAvendreloding)
                  Center(child: CircularProgressIndicator()),*/

                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 15.0,
                          ),
                      itemCount: AppCubit.get(context)
                          .favoriteappartemntavendre2
                          .length,
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
                                            .favoriteappartemntavendre2[index]
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
                                              "Appartement ${AppCubit.get(context).favoriteappartemntavendre2[index].typeAppartement}"),
                                          Text(
                                              "${AppCubit.get(context).favoriteappartemntavendre2[index].prix} TND")
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${AppCubit.get(context).favoriteappartemntavendre2[index].nomDeProjet}-${AppCubit.get(context).favoriteappartemntavendre2[index].ville}', //  "Rue ${PRCubit.get(context).ad[index].rue}- ${PRCubit.get(context).ad[index].ville}- ${PRCubit.get(context).ad[index].pays}",
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
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        children: [
                                          Expanded(child: SizedBox()),
                                          Expanded(child: SizedBox()),
                                          Expanded(child: SizedBox()),
                                          Expanded(
                                            child: Text(
                                                "${AppCubit.get(context).favoriteappartemntavendre2[index].numeroEtage} éme étage"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16.0),
                                      child: Text(
                                        AppCubit.get(context)
                                            .favoriteappartemntavendre2[index]
                                            .description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ),
                                    ),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.end,
                                      children: [
                                        FlatButton(
                                          textColor: kMainColor,
                                          onPressed: () {},
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
                                        child: FaIcon(
                                          FontAwesomeIcons.solidHeart,
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                        onTap: () {
                                          AppCubit.get(context)
                                              .supprimerappartmentAuFavorite(
                                                  idAppartment: AppCubit.get(
                                                          context)
                                                      .favoriteappartemntavendre2[
                                                          index]
                                                      .idAppartment);
                                        })),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              );
            },
          )),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}
