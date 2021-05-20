import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/cubit/state.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/modules/profile/edit_profile/edit_profile.dart';

class ProfilUser extends StatelessWidget {
  const ProfilUser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = AppCubit.get(context).usermodel;

        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_ios_outlined),
            title: Text("Profile"),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
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
                              "https://img.freepik.com/photos-gratuite/portrait-jeune-homme-souriant-lunettes_171337-4842.jpg?size=338&ext=jpg"),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "${userModel.name} ",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Construire ensemble ",
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      navigateTo(context, EditProfil());
                    },
                    child: Icon(
                      Icons.edit, // badlo
                      size: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email :",
                          style: TextStyle(fontSize: 20),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                userModel.email,
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                        SizedBox(height: 20),
                        Text(
                          "Numero de téléphone :",
                          style: TextStyle(fontSize: 20),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                userModel.phone,
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
