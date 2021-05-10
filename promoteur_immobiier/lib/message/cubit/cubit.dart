import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/message/cubit/states.dart';
import 'package:promoteur_immobiier/models/userModel.dart';
import 'package:promoteur_immobiier/sheared/components/constants.dart';

class AppMessageCubit extends Cubit<AppMessageState> {
  AppMessageCubit() : super(AppMessageInitialState());

  static AppMessageCubit get(context) => BlocProvider.of(context);

  UserModel model;
  void getUserData() {
    emit(AppMessageLoadingState());

    FirebaseFirestore.instance.collection('Users').doc(uId).get().then((value) {
      print(value.data);
      emit(AppMessageGetUserSuccessState());
    }).catchError((error) {
      emit(AppMessageGetUserErrorState(error.toString()));
    });
  }
}
