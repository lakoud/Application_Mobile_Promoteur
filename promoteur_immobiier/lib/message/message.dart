import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Message'),
          ),
          body: ConditionalBuilder(
            condition: AppCubit.get(context).usermodel != null,
            builder: (context) {
              var model = AppCubit.get(context).usermodel;

              return Column(
                children: [
                  /*
                  if (!FirebaseAuth.instance.currentUser.emailVerified)
                    Container(
                      color: Colors.amber.withOpacity(.6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Icon(Icons.info_outline),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(child: Text("Verifez votre email")),
                            Spacer(),
                            SizedBox(
                              width: 15.0,
                            ),
                            defaultTextButton(
                                text: "Envoyer ",
                                function: () {
                                  FirebaseAuth.instance.currentUser
                                      .sendEmailVerification()
                                      .then((value) {
                                    Fluttertoast.showToast(
                                        msg: "Verifier votre mail",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }).catchError((error) {});
                                })
                          ],
                        ),
                      ),
                    ),
             
             */
                ],
              );
            },
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
