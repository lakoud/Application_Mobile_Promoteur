import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/models/userModel.dart';
import 'package:promoteur_immobiier/modules/creeruncompte/cubit/states.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppRegisterInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {@required String name,
      @required String phone,
      @required String email,
      @required String password}) {
    emit(AppRegisterLodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
        name: name,
        uId: value.user.uid,
        phone: phone,
        email: email,
      );
      emit(AppRegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppRegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    @required String name,
    @required String phone,
    @required String email,
    @required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
    );

    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(AppCreateUserSuccessState());
    }).catchError((error) {
      emit(AppCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShown = true;

  void changePasswordVisibility() {
    isPasswordShown = !isPasswordShown;
    suffix = isPasswordShown
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(AppchangePasswordVisibilityState());
  }
}
