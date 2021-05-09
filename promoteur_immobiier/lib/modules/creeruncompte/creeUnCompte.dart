import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promoteur_immobiier/modules/home/pageAccueil.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/LoginDesing/containerlogin.dart';
import 'package:promoteur_immobiier/modules/creeruncompte/cubit/cubit.dart';
import 'package:promoteur_immobiier/modules/creeruncompte/cubit/states.dart';
import 'package:promoteur_immobiier/modules/login/login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var phoneCotroller = TextEditingController();
  var nomUtilisateurController = TextEditingController();
  bool isPassword = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String email, password, name;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (context) => AppRegisterCubit(),
        child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
          listener: (context, state) {
            if (state is AppCreateUserSuccessState) {
              navigateTo(context, HomePage());
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Container(
                  height: 845,
                  child: Column(
                    children: [
                      Container(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          defaultFormField(
                                            label: "Nom utilisateur",
                                            icon: Icons.person,
                                            isPassword: false,
                                            validate: (value) {
                                              if (value.isEmpty) {
                                                return "Nom utilisateur  non valider";
                                              }
                                              return null;
                                            },
                                            onSubmit: (String value) {
                                              print(value);
                                            },
                                            controller:
                                                nomUtilisateurController,
                                            type: TextInputType.name,
                                          ),
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
                                            label: "mot de passse",
                                            icon: Icons.lock,
                                            isPassword: false,
                                            validate: (value) {
                                              if (value.isEmpty) {
                                                return "mot de passe non valider";
                                              }
                                              return null;
                                            },
                                            onSubmit: (String value) {
                                              print(value);
                                            },
                                            controller: passwordController,
                                            type: TextInputType.visiblePassword,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          defaultFormField(
                                            label: "Numero télephone",
                                            icon: Icons.phone,
                                            isPassword: false,
                                            validate: (value) {
                                              if (value.isEmpty) {
                                                return "Numero téléphone non valider";
                                              }
                                              return null;
                                            },
                                            onSubmit: (String value) {
                                              print(value);
                                            },
                                            controller: phoneCotroller,
                                            type: TextInputType.phone,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          defaultButton(
                                              text: "S\'inscrire maintenant",
                                              function: () {
                                                if (_formkey.currentState
                                                    .validate()) {
                                                  AppRegisterCubit.get(context)
                                                      .userRegister(
                                                          phone:
                                                              nomUtilisateurController
                                                                  .text,
                                                          name:
                                                              nomUtilisateurController
                                                                  .text,
                                                          email: emailController
                                                              .value.text,
                                                          password:
                                                              passwordController
                                                                  .value.text);
                                                  print(emailController.text);
                                                  print(
                                                      passwordController.text);
                                                }
                                              }),
                                          SizedBox(height: 10),
                                          createAccountLabel(
                                              text1:
                                                  "Vous avez déja un compte ?",
                                              text2: "Connecter",
                                              function: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginPage()));
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: 40,
                                left: 0,
                                child: backButton(function: () {})),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
