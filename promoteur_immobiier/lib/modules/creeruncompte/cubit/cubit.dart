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
      userCreate(email: email, name: name, phone: phone, uId: value.user.uid);
    }).catchError((error) {
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
        image:
            'https://image.freepik.com/photos-gratuite/bouchent-portrait-jolie-jeune-femme-isolee_273609-36523.jpg',
        isEmailVerified: false);

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
