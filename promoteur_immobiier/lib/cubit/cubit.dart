import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';
import 'package:promoteur_immobiier/models/userModel.dart';
import 'package:promoteur_immobiier/modules/profile/profil.dart';
import 'package:promoteur_immobiier/modules/home/pageAccueil.dart';
import 'package:promoteur_immobiier/sheared/components/constants.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Profile",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
      ),
      label: "favorite",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.message,
      ),
      label: "Message",
    )
  ];
  List<Widget> scrrens = [
    HomePage(),
    ProfilePage(),
  ];
  void chageBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  List<ProjetRealiserModel> projetR = [];

  void getProjetRealiser() {
    FirebaseFirestore.instance.collection(KprojetRealiser).get().then((value) {
      value.docs.forEach((element) {
        projetR.add(ProjetRealiserModel.fromJson(element.data()));
      });

      emit(GetSuccessProjetEnCours());
    }).catchError((error) {
      emit(GetErrorProjetEnCours(error.toString()));
    });
  }

  UserModel model;
  void getUserData() {
    emit(AppMessageLoadingState());

    FirebaseFirestore.instance.collection('Users').doc(uId).get().then((value) {
      print(value.data);

      model = UserModel.fromJson(value.data());

      emit(AppMessageGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppMessageGetUserErrorState(error.toString()));
    });
  }
}
