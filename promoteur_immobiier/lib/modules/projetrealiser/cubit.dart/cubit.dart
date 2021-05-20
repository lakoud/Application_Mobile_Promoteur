import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/models/AppartmentModel.dart';
import 'package:promoteur_immobiier/models/adresseAppartement.dart';
import 'package:promoteur_immobiier/models/avantageEmplacement.dart';
import 'package:promoteur_immobiier/models/equipementAppartement.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/cubit.dart/states.dart';

class PRCubit extends Cubit<PRState> {
  PRCubit() : super(PRInitialState());
  static PRCubit get(context) => BlocProvider.of(context);
  List<ProjetModel> PR = [];
  String idProjet;
  String getPosts() {
    FirebaseFirestore.instance
        .collection("Projet")
        .where("Etat", isEqualTo: "Realisé")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        PR.add(ProjetModel.fromJson(element.data()));
      });

      emit(GetPRSuccessState());
    }).catchError((onError) {
      emit(GetPRErrorState(onError.toString()));
    });
    return idProjet;
  }

  List<AdressseAppartementrModel> ad = [];
  void getAdresse() {
    FirebaseFirestore.instance.collection("AdressProjet").get().then((value) {
      value.docs.forEach((element) {
        ad.add(AdressseAppartementrModel.fromJson(element.data()));
      });

      emit(GetPRSuccessState());
    }).catchError((onError) {
      emit(GetPRErrorState(onError.toString()));
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

      emit(GetPRSuccessState());
    }).catchError((onError) {
      emit(GetPRErrorState(onError.toString()));
    });
  }

  List<EquipementModel> eq = [];
  void getEquipement() {
    FirebaseFirestore.instance.collection("Equipement").get().then((value) {
      value.docs.forEach((element) {
        eq.add(EquipementModel.fromJson(element.data()));
      });

      emit(GetPRSuccessState());
    }).catchError((onError) {
      emit(GetPRErrorState(onError.toString()));
    });
  }

  List<AppartementrModel> appartement = [];
  void getAppartement(String idProjet) {
    FirebaseFirestore.instance
        .collection("Appartement")
        .where("IdProjet", isEqualTo: idProjet)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        appartement.add(AppartementrModel.fromJson(element.data()));
      });

      emit(GetPRSuccessState());
    }).catchError((onError) {
      emit(GetPRErrorState(onError.toString()));
    });
  }
}
