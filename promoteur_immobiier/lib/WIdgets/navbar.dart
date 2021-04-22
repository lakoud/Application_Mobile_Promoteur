import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/Screen/constants.dart';

class Nav extends StatefulWidget {
  Nav({Key key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Nous applons'),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Contacter  ',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kMainColor,
      onTap: _onItemTapped,
    ); // Choose the nav bar style with this property.
  }
}
