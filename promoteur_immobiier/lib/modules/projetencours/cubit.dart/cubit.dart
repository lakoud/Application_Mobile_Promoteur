import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/models/adresseAppartement.dart';
import 'package:promoteur_immobiier/models/avantageEmplacement.dart';
import 'package:promoteur_immobiier/models/equipementAppartement.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';

import 'package:promoteur_immobiier/modules/projetencours/cubit.dart/states.dart';

class PCCubit extends Cubit<PCState> {
  PCCubit() : super(PCInitialState());
  static PCCubit get(context) => BlocProvider.of(context);
  List<ProjetModel> projtencours = [];
  void getPosts() {
    FirebaseFirestore.instance
      ..collection("Projet")
          .where("Etat", isEqualTo: "en cours")
          .get()
          .then((value) {
        value.docs.forEach((element) {
          projtencours.add(ProjetModel.fromJson(element.data()));
        });

        emit(GetPCSuccessState());
      }).catchError((onError) {
        emit(GetPCErrorState(onError.toString()));
      });
  }

  List<AdressseAppartementrModel> adresse = [];
  void getAdresse() {
    FirebaseFirestore.instance
        .collection("AdressProjet")
        .where("IdProjet", isEqualTo: "t5jlVtANON33tWp7Y0Fk")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        adresse.add(AdressseAppartementrModel.fromJson(element.data()));
      });

      emit(GetPCSuccessState());
    }).catchError((onError) {
      emit(GetPCErrorState(onError.toString()));
    });
  }

  List<AvantageEmplacementModel> av = [];
  void getAvantage() {
    FirebaseFirestore.instance
        .collection("AvantageEmplacement")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        av.add(AvantageEmplacementModel.fromJson(element.data()));
      });

      emit(GetPCSuccessState());
    }).catchError((onError) {
      emit(GetPCErrorState(onError.toString()));
    });
  }

  List<EquipementModel> eq = [];
  void getEquipement() {
    FirebaseFirestore.instance.collection("Equipement").get().then((value) {
      value.docs.forEach((element) {
        eq.add(EquipementModel.fromJson(element.data()));
      });

      emit(GetPCSuccessState());
    }).catchError((onError) {
      emit(GetPCErrorState(onError.toString()));
    });
  }
}
