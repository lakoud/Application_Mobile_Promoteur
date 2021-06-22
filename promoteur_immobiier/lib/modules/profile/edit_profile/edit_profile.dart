import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';

class EditProfil extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getUserData();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleSpacing: 5.0,
          title: Text(
            "Edit Profil",
            style: GoogleFonts.merriweather(
              textStyle: Theme.of(context).textTheme.button,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          actions: [
            defaultTextButton(
              context: context,
              function: () {
                AppCubit.get(context).updateUser(
                    name: nameController.text, phone: phoneController.text);
              },
              text: 'MODIFIER',
            ),
            SizedBox(
              width: 15.0,
            )
          ],
        ),
        body: BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ConditionalBuilder(
                condition: state is AppMessageGetUserSuccessState,
                builder: (context) {
                  var userModel = AppCubit.get(context).usermodel;
                  var profileImage = AppCubit.get(context).profilimage;
                  nameController.text = userModel.name;
                  phoneController.text = userModel.phone;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        if (state is AppuserUpdateLoadingState)
                          LinearProgressIndicator(),
                        //  if (state is AppuserUpdateLoadingState)
                        if (state is AppuserUpdateLoadingState)
                          SizedBox(
                            height: 10,
                          ),
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
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  CircleAvatar(
                                    radius: 92.0,
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    child: CircleAvatar(
                                        radius: 90.0,
                                        backgroundImage: profileImage == null
                                            ? NetworkImage("${userModel.image}")
                                            : FileImage(profileImage)),
                                  ),
                                  IconButton(
                                      icon: CircleAvatar(
                                          radius: 20.0,
                                          child: Icon(
                                            Icons.camera, //badalhas
                                            size: 16.0,
                                          )),
                                      onPressed: () {
                                        AppCubit.get(context).getProfilImage();
                                      })
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (AppCubit.get(context).profilimage != null)
                          Column(
                            children: [
                              defaultButton(
                                  text: "Modifier image",
                                  function: () {
                                    AppCubit.get(context).uploadProfileImage(
                                        name: nameController.text,
                                        phone: phoneController.text);
                                  }),
                              if (state is AppuserUpdateLoadingState)
                                SizedBox(
                                  height: 5.0,
                                ),
                              if (state is AppuserUpdateLoadingState)
                                LinearProgressIndicator()
                            ],
                          ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Nom non valide';
                              }
                              return null;
                            },
                            isPassword: false,
                            label: 'Nom',
                            icon: Icons.person // badelh user

                            ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Nom non valide';
                            }
                            return null;
                          },
                          isPassword: false,
                          label: 'Numéro de téléphone ',
                          icon: Icons.phone_iphone, // badelh user
                        ),
                      ]),
                    ),
                  );
                },
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              );
            }));
  }
}
