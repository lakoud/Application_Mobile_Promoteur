import 'package:flutter/material.dart';

import 'constants.dart';

class Monappbar extends StatelessWidget {
  const Monappbar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kMainColor,
      title: Text("Groupe alliance "),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
      ],
    );
  }
}
