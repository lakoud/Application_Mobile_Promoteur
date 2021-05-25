import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:promoteur_immobiier/modules/projetrealiser/recherche/bloc/search_bloc.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/recherche/bloc/search_event.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/recherche/bloc/search_states.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/recherche/ui/search_screen.dart';

class Insert extends StatefulWidget {
  @override
  InsertState createState() => InsertState();
}

class InsertState extends State<Insert> {
  var name = TextEditingController();
  var details = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SearchBloc, SearchStates>(
      listener: (context, state) {
        if (state is AddState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchUi()));
        }
      },
      child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(top: 50, right: 10, left: 10),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "name",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(top: 50, right: 10, left: 10),
              child: TextField(
                controller: details,
                decoration: InputDecoration(
                  hintText: "details",
                ),
              ),
            ),
            Container(
                child: RaisedButton(
              child: Text("Insert"),
              onPressed: () {
                BlocProvider.of<SearchBloc>(context)
                    .add(AddEvent(name: name.text, details: details.text));
              },
            )),
          ],
        ),
      ),
    ));
  }
}
