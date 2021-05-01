import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:promoteur_immobiier/view/screen/TestPageAccueil.dart';
import 'package:promoteur_immobiier/view/screen/UserPage.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password, name;
  Rxn<User> _user = Rxn<User>();
  Future<bool> _loginUser(String phone) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);

          User user = result.user;
          if (user != null) {
            // Get.to(UserPage());
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verifaction, [int forceResendingToken]) {
          print("null");
        },
        codeAutoRetrievalTimeout: null);
  }

  String get user => _user.value?.email; //ken heya mech null raj3lna email
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController, passwordController, nameController;
  var email1 = "";
  var passowrd1 = "";
  @override
  void onInit() {
    //_user.bindStream(_auth.authStateChanges());
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String validatEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Verifiez votre email";
    }
    return null;
  }

  String validatPassword(String value) {
    if (value.length < 6) {
      return "Mot de passe doit étre plus que 6";
    }
    return null;
  }

  String validatName(String value) {
    if (value.length < 5) {
      return "Nom invalid";
    }
    return null;
  }

  /*void checkLogin() async {
    final isValid = loginFormKey.currentState.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState.save();
    signUpWithEmailAndPassword();
  }*/

  void googleSingInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    //  await _auth.signInWithCredential(credential);
  }

  /*void signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "lakoud133@gmail.com", password: "abc123456789");
      print("helo");
      print(userCredential.user.emailVerified.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  UserCredential userCredential;
  void signUpWithEmailAndPassword() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("helo");
      print(userCredential.user.emailVerified.toString());
      User user = FirebaseAuth.instance.currentUser;

      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      print(userCredential.user.emailVerified.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }*/
}
