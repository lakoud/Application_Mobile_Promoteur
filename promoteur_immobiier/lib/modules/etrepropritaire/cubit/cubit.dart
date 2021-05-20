import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/models/AppartmentModel.dart';
import 'package:promoteur_immobiier/modules/etrepropritaire/cubit/states.dart';
import 'package:promoteur_immobiier/sheared/components/constants.dart';

class PropCubit extends Cubit<PropState> {
  PropCubit() : super(PropInitialState());

  static PropCubit get(context) => BlocProvider.of(context);

  void appartementcreate({
    @required String typeAppartement,
    @required String aVendre,
    @required String nomDeProjet,
    @required String surface,
    @required String prix,
    @required String description,
    @required String plan,
    @required String photo,
    @required String uIdProjet,
  }) {
    AppartementrModel modelAppartement = AppartementrModel(
      typeAppartement: typeAppartement,
      aVendre: aVendre,
      nomDeProjet: nomDeProjet,
      surface: surface,
      prix: prix,
      description: description,
      plan: plan,
      photo: photo,
      uIdProjet: uIdProjet,
    );
    FirebaseFirestore.instance
        .collection("appartement")
        .doc(uId)
        .set(modelAppartement.toMap())
        .then((value) {
      emit(CreatePropSuccessStates());
    }).catchError((error) {
      emit(CreatePropErrorStates(error.toString()));
    });
  }

  List<AppartementrModel> ap = [];

  void getPosts() {
    FirebaseFirestore.instance.collection("appartements").get().then((value) {
      value.docs.forEach((element) {
        ap.add(AppartementrModel.fromJson(element.data()));
      });

      emit(GetSuccessPropStates());
    }).catchError((onError) {
      emit(GetErrorPropStates(onError.toString()));
    });
  }
}
