import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:promoteur_immobiier/view/screen/TestPageAccueil.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password, name;
  Rxn<User> _user = Rxn<User>();

  String get user => _user.value?.email; //ken heya mech null raj3lna email
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSingInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential);
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomePage());
    } catch (e) {
      print(e.message);
      Get.snackbar(
        "Erreur ",
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
      );
    }
    ;
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(HomePage());
    } catch (e) {
      print(e.message);
      Get.snackbar(
        "Erreur ",
        e.message,
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
      );
    }
    ;
  }
}
