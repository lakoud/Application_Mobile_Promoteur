import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/modules/profile/otpScreen.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/modules/profile/edit_profile/edit_profile.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class ProfilUser extends StatefulWidget {
  int i = 0;
  ProfilUser({this.i});

  @override
  _ProfilUserState createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
  Widget container;
  final otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getUserData();

    return BlocConsumer<AppCubit, AppState>(
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
        return Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            title: Text(
              "Profile",
              style: GoogleFonts.merriweather(
                textStyle: Theme.of(context).textTheme.button,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: ConditionalBuilder(
            builder: (context) => Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
              child: Column(
                children: [
                  Container(
                    height: 350,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Container(
                            height: 300.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.entreprises-magazine.com/wp-content/uploads/2020/04/Groupe-Alliance.png"),
                                    fit: BoxFit.cover)),
                          ),
                          alignment: Alignment.topCenter,
                        ),
                        CircleAvatar(
                          radius: 92.0,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 90.0,
                            backgroundImage: NetworkImage(
                                AppCubit.get(context).usermodel.image),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "${AppCubit.get(context).usermodel.name} ",
                    style: GoogleFonts.merriweather(
                      textStyle: Theme.of(context).textTheme.bodyText1,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Construire ensemble ",
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Vos Informations :",
                          style: GoogleFonts.merriweather(
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfil()));
                          },
                          child: Icon(
                            Icons.edit, // badlo
                            size: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: SizedBox()),
                            Expanded(child: SizedBox()),
                            Icon(Icons.email_outlined),
                            Expanded(child: SizedBox()),
                            Text(
                              AppCubit.get(context).usermodel.email,
                              style: GoogleFonts.merriweather(
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                        SizedBox(height: 20),
                        if (AppCubit.get(context).usermodel.phone != ' ')
                          Row(
                            children: [
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.phone_iphone,
                              ),
                              Expanded(child: SizedBox()),
                              Text(
                                AppCubit.get(context).usermodel.phone,
                                style: GoogleFonts.merriweather(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
            condition: state is AppMessageGetUserSuccessState,
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
