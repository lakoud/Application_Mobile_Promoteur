import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/layout/applayaout.dart';
import 'package:promoteur_immobiier/modules/profile/profil2.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/network/local/cach_helper.dart';
import 'package:promoteur_immobiier/sheared/styles/LoginDesing/containerlogin.dart';
import 'package:promoteur_immobiier/modules/creeruncompte/creeUnCompte.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneCotroller = TextEditingController();
  var nomUtilisateurController = TextEditingController();

  bool isPassword = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is ApploginErrorState) {
          Fluttertoast.showToast(
              msg: "Mot de passe ou email incorrecte",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }

        if (state is ApploginSuccessState) {
          CacheHelper.saveData(
            key: 'uId',
            value: state.uId,
          ).then((value) {
            navigateTo(context, Applayout());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -MediaQuery.of(context).size.height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer(),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(height: height * .2),
                          title1(),
                          title2(),
                          SizedBox(
                            height: 50,
                          ),
                          Form(
                            key: _formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                defaultFormField(
                                  label: "Email",
                                  icon: Icons.email,
                                  isPassword: false,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Email non valider";
                                    }
                                    return null;
                                  },
                                  onSubmit: (String value) {
                                    print(value);
                                  },
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                defaultFormField(
                                    suffixPressed: () {
                                      AppCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    isPassword:
                                        AppCubit.get(context).isPasswordShown,
                                    controller: passwordController,
                                    label: "Mot de passe",
                                    icon: Icons.lock,
                                    suffix: AppCubit.get(context).suffix,
                                    type: TextInputType.visiblePassword,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return "Mot de passe non Valider";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                ConditionalBuilder(
                                  condition: state is! ApploginLodingState,
                                  builder: (context) => defaultButton(
                                      text: "Connecter",
                                      function: () {
                                        if (_formkey.currentState.validate()) {
                                          AppCubit.get(context)
                                            ..userLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                        }
                                      }),
                                  fallback: (context) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                SizedBox(height: 10),
                                divider(text: "OU"),
                                SizedBox(height: 10),
                                googlebottom(),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      "Vous n'avait pas un compte ?",
                                      style: TextStyle(
                                          color: kgmail2,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    defaultTextButton(
                                        text: "S'inscrire",
                                        function: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpPage()));
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 40, left: 0, child: backButton(function: () {})),
              ],
            ),
          ),
        );
      },
    );
  }
}
