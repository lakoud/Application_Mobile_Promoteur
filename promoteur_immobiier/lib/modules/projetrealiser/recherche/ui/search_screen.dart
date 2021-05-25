import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/recherche/bloc/search_bloc.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/recherche/bloc/search_event.dart';
import 'package:promoteur_immobiier/modules/projetrealiser/recherche/bloc/search_states.dart';

class SearchUi extends StatefulWidget {
  @override
  _SearchUiState createState() => _SearchUiState();
}

class _SearchUiState extends State<SearchUi> {
  @override
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(GetAllEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(top: 50, right: 10, left: 10),
          child: TextField(
            onChanged: (value) {
              BlocProvider.of<SearchBloc>(context).add(FindEvent(
                key: value,
              ));
              // honi badlat
            },
            decoration: InputDecoration(
              hintText: "search ...",
              suffixIcon: IconButton(
                icon: Icon(Icons.search, size: 34, color: Colors.blue[700]),
                onPressed: () {},
              ),
            ),
          ),
        ),
        Expanded(child: BlocBuilder<SearchBloc, SearchStates>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetState) {
              return ListView.builder(
                itemCount: state.emps.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(state.emps[i].name),
                    subtitle: Text(state.emps[i].details),
                  );
                },
              );
            } else if (state is SearchState) {
              return ListView.builder(
                itemCount: state.emps.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(state.emps[i].name),
                    subtitle: Text(state.emps[i].details),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ))
      ],
    ));
  }
}
