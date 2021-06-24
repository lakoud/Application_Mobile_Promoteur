import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/models/AppartmentModel.dart';
import 'package:promoteur_immobiier/models/adresse_projet_model.dart';
import 'package:promoteur_immobiier/models/avancementModel.dart';
import 'package:promoteur_immobiier/models/avantageEmplacement.dart';
import 'package:promoteur_immobiier/models/equipementmodel.dart';
import 'package:promoteur_immobiier/models/messageModel.dart';
import 'package:promoteur_immobiier/models/modelcordonnes.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';
import 'package:promoteur_immobiier/models/userModel.dart';
import 'package:promoteur_immobiier/modules/chat/chatDetails/chatdetails.dart';
import 'package:promoteur_immobiier/modules/favorites/favorite.dart';
import 'package:promoteur_immobiier/modules/home/pageAccueil.dart';
import 'package:promoteur_immobiier/modules/profile/profil.dart';
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
      label: "Favorite",
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
    Favorite(),
    ChatDetails()
    //EditProfil(),
  ];
  Widget widget;
  //bnsba lel mochkla mta3 tt7al wa7da ba3d lo5ra tajm t3ml deux listes t7ot fihom si non
  void chageBottomNavBar(int index) {
    if (index == 0) {
      getcoordonner();
    }
    if (index == 1 || index == 2 || index == 3) {
      getUserData();
    }

    currentIndex = index;
    emit(AppBottomNavState());
  }

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
    String photo =
        'https://image.freepik.com/photos-gratuite/bouchent-portrait-jolie-jeune-femme-isolee_273609-36523.jpg',
  }) {
    var splitKey = name.split(" ");
    List<String> keys = [];
    for (int i = 0; i < splitKey.length; i++) {
      for (int j = 1; j < splitKey[i].length + 1; j++) {
        keys.add(splitKey[i].substring(0, j));
      }
    }
    UserModel model = UserModel(
        key: keys,
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        image: photo,
        isEmailVerified: false);

    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(AppCreateUserSuccessState(uId));
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

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

  void loginGoogle() async {
    //emit(loding)
    emit(ApploginGoogleLodingState());

    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    print(googleUser);
    userCreate(
      email: googleUser.email,
      name: googleUser.displayName,
      phone: ' ',
      uId: googleUser.id,
      photo: googleUser.photoUrl.toString(),
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    emit(ApploginSuccessState(googleUser.id));
//emit(login suscce)
  }

  void userLogin({@required String email, @required String password}) {
    emit(ApploginLodingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // honi ynavi
      emit(ApploginSuccessState(value.user.uid));
    }).catchError((error) {
      emit(ApploginErrorState(error.toString()));
    });
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

  void updateUser({
    @required String name,
    @required String phone,
    bool verif,
    String image,
  }) {
    UserModel model = UserModel(
        name: name,
        email: usermodel.email,
        mptDePasse: usermodel.mptDePasse,
        phone: phone,
        uId: usermodel.uId,
        image: image ?? usermodel.image,
        isEmailVerified: verif);

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
    print(dateTime);
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

  Future<void> userLogout() async {
    await auth.signOut().then((value) {
      emit(ApplogoutSuccessState());
    }).catchError((onError) {
      emit(ApplogoutErrorState(onError.toString()));
    });
    await googleSignIn.signOut().then((value) {
      emit(ApplogoutSuccessState());
    }).catchError((onError) {
      emit(ApplogoutErrorState(onError.toString()));
    });
  }

  var auth = FirebaseAuth.instance;
  var verId = '';
  verifyPhone(String phone) async {
    // isLoading.value = true;
    emit(ApploginLodingState());

    await auth.verifyPhoneNumber(
        timeout: Duration(seconds: 50),
        phoneNumber: phone,
        verificationCompleted: (AuthCredential authCredential) {
          if (auth.currentUser != null) {
            emit(AppPhoneSuccesState());
            /*           isLoading.value = false;
            authStatus.value = "login successfully";*/
          } else {
            emit(AppRegisterPHoneerroeState());
          }
        },
        verificationFailed: (authException) {
          emit(ErreurEnvoiState());
          //      Get.snackbar("sms code info", "otp code hasn't been sent!!");
        },
        codeSent: (String id, [int forceResent]) {
          emit(AppPhoneSuccesState());

          this.verId = id;
        },
        codeAutoRetrievalTimeout: (String id) {
          //  this.verId = id;
        });
  }

  otpVerify(String otp) async {
    emit(ApploginLodingState());
    try {
      UserCredential userCredential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: this.verId, smsCode: otp));
      if (userCredential.user != null) {
//       Get.to(HomeScreen());
        emit(AppCodeexactestate());

        UserModel model = UserModel(
            name: usermodel.name,
            email: usermodel.email,
            mptDePasse: usermodel.mptDePasse,
            phone: usermodel.phone,
            uId: usermodel.uId,
            image: usermodel.image ?? usermodel.image,
            isEmailVerified: true);

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
    } on Exception catch (e) {
      emit(AppCodeechec());
    }
  }

//GET PAGE ACCUEIL DATA

  CordonnerModel cordonner;
  void getcoordonner() {
    emit(AppGetCordonnerLoadingState());
    FirebaseFirestore.instance
        .collection('Cordonnees')
        .doc('RxnsCBdeT9OHKoyXKkUw')
        .get()
        .then((value) {
      emit(AppGetCordonnerSuccessState());

      cordonner = CordonnerModel.fromJson(value.data());
    }).catchError((onError) {
      emit(AppGetCordonnerErrorState());
    });
  }

  /// projet lisete
  List<ProjetModel> projtenREALISER = [];
  void projetListsEnRealiser() {
    emit(GetPCLodingState());
    FirebaseFirestore.instance
      ..collection("Projet")
          .where('Etat', isEqualTo: 'Realiser')
          .snapshots()
          .listen((event) {
        projtenREALISER = [];
        event.docs.forEach((element) {
          projtenREALISER.add(ProjetModel.fromJson(element.data()));
        });
        emit(GetPCSuccessState());
      });
  }

  List<ProjetModel> projtenEncours = [];
  void projetprojtenEncours() {
    emit(GetPenCoursLodingState());
    FirebaseFirestore.instance
      ..collection("Projet")
          .where('Etat', isEqualTo: 'En cours')
          .snapshots()
          .listen((event) {
        projtenEncours = [];
        event.docs.forEach((element) {
          projtenEncours.add(ProjetModel.fromJson(element.data()));
        });
        emit(GetPenCoursSuccessState());
      });
  }

  ModelAdressProjet adresse;
  ProjetModel projet;
  List<Avancement> avancement = [];
  List<AvantageEmplacementModel> avantage = [];
  List<EqipementModel> equipement = [];
  List<AppartementrModel> appartement = [];
  void getprojerEncours({
    @required String uId,
  }) {
    // id = FirebaseFirestore.instance.collection('Projet').doc().id;

    emit(GetProjetlodingState());
    FirebaseFirestore.instance
        .collection('Projet')
        .doc(uId)
        .get()
        .then((value) {
      projet = ProjetModel.fromJson(value.data());
      emit(GetAllProjetSuccessState());
    }).catchError((onError) {
      emit(GetAllProjeterrorState(onError.toString()));
    });
    emit(AppLodinggetAddress());
    FirebaseFirestore.instance
        .collection('Projet')
        .doc(uId)
        .collection('Adresse')
        .doc(uId)
        .get()
        .then((value) {
      adresse = ModelAdressProjet.fromJson(value.data());

      emit(GetAllAdresseSuccessState());
    }).catchError((onError) {
      emit(AppErrorgetAddress());
    });
    FirebaseFirestore.instance
        .collection('Projet')
        .doc(uId)
        .collection('Avantage')
        .snapshots()
        .listen((event) {
      avantage = [];
      event.docs.forEach((element) {
        avantage.add(AvantageEmplacementModel.fromJson(element.data()));
      });
    });
    FirebaseFirestore.instance
        .collection('Projet')
        .doc(uId)
        .collection('equipement')
        .snapshots()
        .listen((event) {
      equipement = [];
      event.docs.forEach((element) {
        equipement.add(EqipementModel.fromJson(element.data()));
      });
    });

    FirebaseFirestore.instance
        .collection('Projet')
        .doc(uId)
        .collection('Appartement')
        .snapshots()
        .listen((event) {
      appartement = [];
      event.docs.forEach((element) {
        appartement.add(AppartementrModel.fromJson(element.data()));
      });
    });
    FirebaseFirestore.instance
        .collection('Projet')
        .doc(uId)
        .collection('avancement')
        .snapshots()
        .listen((event) {
      avancement = [];
      event.docs.forEach((element) {
        avancement.add(Avancement.fromJson(element.data()));
      });
    });
  }

  //appartment a vendre
  List<AppartementrModel> appartemntavendre = [];
  void appartemntAvendre() {
    emit(GetappartmentAvendreloding());
    FirebaseFirestore.instance
      ..collection("Appartement")
          .where('aVendre', isEqualTo: 'Oui')
          .snapshots()
          .listen((event) {
        appartemntavendre = [];
        event.docs.forEach((element) {
          appartemntavendre.add(AppartementrModel.fromJson(element.data()));
        });
        emit(GetappartmentAvendresuccuss());
      });
  }

  List<AppartementrModel> appartemntavendreResultat = [];

  void getresultat(
      {@required String ville,
      @required String type,
      @required bool prix,
      @required String surface1,
      @required String currentprix,
      @required String currentprix2,
      surface2}) {
    FirebaseFirestore.instance
      ..collection("Appartement")
          .where('aVendre', isEqualTo: 'Oui')
          .where('typeAppartement', isEqualTo: type)
          .where('ville', isEqualTo: ville)
          .where('surface', isLessThanOrEqualTo: surface1)
          .where('surface', isGreaterThanOrEqualTo: surface2)
          .where('prix', isLessThanOrEqualTo: currentprix2)
          .where('prix', isGreaterThanOrEqualTo: currentprix)
          .snapshots()
          .listen((event) {
        appartemntavendreResultat = [];
        event.docs.forEach((element) {
          appartemntavendreResultat
              .add(AppartementrModel.fromJson(element.data()));
        });
        emit(GetappartmentAvendresuccuss());
      });
  }

  void ajouterappartmentAuFavorite({
    @required String nomProjet,
    @required String typeAppartement,
    @required String idAppartment,
    @required String surface,
    @required String prix,
    @required String photo,
    @required String description,
    @required String idprojet,
    @required String etage,
    @required String ville,
  }) {
    AppartementrModel model = AppartementrModel(
        ville: ville,
        numeroEtage: etage,
        typeAppartement: typeAppartement,
        idAppartment: idAppartment,
        nomDeProjet: nomProjet,
        surface: surface,
        prix: prix,
        photo: photo,
        description: description,
        uIdProjet: idprojet);
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .collection('Favorites')
        .doc(idAppartment)
        .set(model.toMap())
        .then((value) {});
  }

  List<AppartementrModel> favoriteappartemntavendre = [];
  void favoriteappartemntAvendre() {
    getUserData();
    appartemntAvendre();
    emit(GetappartmentAvendrefavoriteloding());
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .collection('Favorites')
        .snapshots()
        .listen((event) {
      favoriteappartemntavendre = [];
      event.docs.forEach((element) {
        favoriteappartemntavendre
            .add(AppartementrModel.fromJson(element.data()));
      });
      emit(GetappartmentAvendrefavsuccuss());
    });
  }

  List<AppartementrModel> favoriteappartemntavendre2 = [];
  void favoriteappartemntAvendre2() {
    emit(GetappartmentAvendreloding());
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .collection('Favorites')
        .snapshots()
        .listen((event) {
      favoriteappartemntavendre2 = [];
      event.docs.forEach((element) {
        favoriteappartemntavendre2
            .add(AppartementrModel.fromJson(element.data()));
      });
      emit(GetappartmentAvendresuccuss());
    });
  }

  void supprimerappartmentAuFavorite({
    @required String idAppartment,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel.uId)
        .collection('Favorites')
        .doc(idAppartment)
        .delete()
        .then((value) {});
  }
}
