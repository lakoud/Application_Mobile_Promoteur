import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/message/message.dart';
import 'package:promoteur_immobiier/models/messageModel.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';
import 'package:promoteur_immobiier/models/userModel.dart';
import 'package:promoteur_immobiier/modules/chat/chatDetails/chatdetails.dart';
import 'package:promoteur_immobiier/modules/favorites/favorite.dart';
import 'package:promoteur_immobiier/modules/login/login.dart';
import 'package:promoteur_immobiier/modules/home/pageAccueil.dart';
import 'package:promoteur_immobiier/modules/profile/profil2.dart';
import 'package:promoteur_immobiier/sheared/components/constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:promoteur_immobiier/sheared/network/local/cach_helper.dart';

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
    ProfilUser(),
    //EditProfil(),
  ];
  Widget widget;
  //bnsba lel mochkla mta3 tt7al wa7da ba3d lo5ra tajm t3ml deux listes t7ot fihom si non
  void chageBottomNavBar(int index) async {
    if (index == 1) {
      emit(AppusergetLoadingState());
      await getUserData();
    }
    if (index == 2) {
      uId = CacheHelper.getData(key: 'uId');

      if (uId != null) {
        scrrens.insert(2, Favorite());
        // honi tbadal ed5ol
      } else {
        scrrens.insert(2, LoginPage());
      }

      getUserData();
    }

    if (index == 3) {
      uId = CacheHelper.getData(key: 'uId');

      if (uId != null) {
        scrrens.insert(3, ChatDetails());
        // honi tbadal ed5ol
      } else {
        scrrens.insert(3, LoginPage());
      }

      getUserData();
    }

    currentIndex = index;
    emit(AppBottomNavState());
  }

  var id;
  void userLogin({@required String email, @required String password}) {
    emit(ApploginLodingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      id = value.user.uid;
      print(value.user.email);
      // honi ynavi
      emit(ApploginSuccessState(value.user.uid));
    }).catchError((error) {
      emit(ApploginErrorState(error.toString()));
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

  File profilimage;
  var picker = ImagePicker();

  Future<void> getProfilImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profilimage = File(pickedFile.path);
      emit(AppProfilImagePickedSuccssState());
    } else {
      print('No image selected.');
      emit(AppProfilImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    @required String name,
    @required String phone,
    String image,
  }) {
    emit(AppuserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profilimage.path).pathSegments.last}')
        .putFile(profilimage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //  emit(AppUploadImageSuccssState());
        print(value);
        updateUser(name: name, phone: phone, image: value);
      }).catchError((error) {
        emit(AppUploadImageErrorState());
      });
    }).catchError((error) {
      emit(AppUploadImageErrorState());
    });
  }

  UserModel usermodel;
  void getUserData() {
    emit(AppusergetLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      usermodel = UserModel.fromJson(value.data());

      emit(AppMessageGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppMessageGetUserErrorState(error.toString()));
    });
  }
/*
  void updateUserImage({
    @required String name,
    @required String phone,
  }) {
    if (profilimage != null) {
      uploadProfileImage();
    } else {
      updateUser(name: name, phone: phone);
    }
  }*/

  void updateUser({
    @required String name,
    @required String phone,
    String image,
  }) {
    UserModel model = UserModel(
        name: name,
        email: usermodel.email,
        mptDePasse: usermodel.mptDePasse,
        phone: phone,
        uId: usermodel.uId,
        image: image ?? usermodel.image,
        isEmailVerified: false);

    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError(() {
      emit(AppuserUpdateErrorState());
    });
  }

  void sendMessage({
    @required String reciverId,
    @required String dateTime,
    @required String text,
  }) {
    MessageModel model = MessageModel(
      text: text,
      senderId: usermodel.uId,
      receiverId: reciverId,
      dateTime: dateTime,
    );
    //set my chat
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .collection('chats')
        .doc(reciverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(AppSendMessageSuccessStates());
    }).catchError((onError) {
      emit(AppSendMessageErrorStates());
    });

    // set reciv chat
    FirebaseFirestore.instance
        .collection('users')
        .doc(reciverId)
        .collection('chats')
        .doc(usermodel.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(AppSendMessageSuccessStates());
    }).catchError((onError) {
      emit(AppSendMessageErrorStates());
    });
    print(usermodel.uId);
    print(reciverId);
  }

  List<MessageModel> messages = [];

  void getMessage({
    @required String reciverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .collection('chats')
        .doc(reciverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(AppGetMessageSucessStates());
    });
    print(usermodel.uId);
  }
}
