import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/layout/applayaout.dart';
import 'package:promoteur_immobiier/modules/profile/profil.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/LoginDesing/containerlogin.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';
import 'package:quiver/async.dart';

class veryfy extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<veryfy> {
  //final loginController = Get.put(LoginController());

  final otp = TextEditingController();

  Duration i;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
          child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is AppPhoneSuccesState) {
            Fluttertoast.showToast(
                msg: "Code Envoyer",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: kgmail1,
                textColor: kgmail2,
                fontSize: 16.0);
          }
          if (state is AppCodeexactestate) {
            navigateTo(context, ProfilUser(i: 1));
          } else if (state is AppCodeechec) {
            Fluttertoast.showToast(
                msg: "Code incorrecte",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 29,
                backgroundColor: kgmail1,
                textColor: kgmail2,
                fontSize: 16.0);
          } else if (state is ErreurEnvoiState) {
            Fluttertoast.showToast(
                msg: "Code Non envoyer",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 20,
                backgroundColor: kgmail1,
                textColor: kgmail2,
                fontSize: 16.0);
          }
        },
        builder: (context, state) {
          return Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -MediaQuery.of(context).size.height * .18,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer(),
                ),
                Center(
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          title1(),
                          title2(),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  TextFormField(
                                      controller: otp,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        labelText:
                                            "Entrer le code de verification",
                                        border: OutlineInputBorder(),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  defaultButton(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 40,
                                      text: "VERIFIER",
                                      function: () {
                                        AppCubit.get(context)
                                            .otpVerify(otp.text);
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 40,
                    left: 0,
                    child: backButton(function: () {
                      navigateTo(context, Applayout());
                    })),
              ],
            ),
          );
        },
      )),
    );
  }
}
