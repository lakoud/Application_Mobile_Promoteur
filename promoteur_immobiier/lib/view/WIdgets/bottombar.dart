import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/constants.dart';
import 'package:promoteur_immobiier/view/screen/TestPageAccueil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      onTap: _handleIndexChanged,
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: GestureDetector(
              onTap: () {
                launch("tel:27895765");
              },
              child: Icon(Icons.phone)),
          title: Text("27856858"),
          selectedColor: kMainColor,
        ),

        /// Likes

        SalomonBottomBarItem(
          icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Icon(Icons.home)),
          title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text("Home")),
          selectedColor: kMainColor,
        ),

        /// Search

        /// Profile
        SalomonBottomBarItem(
          icon: Icon(Icons.message),
          title: Text("message"),
          selectedColor: kMainColor,
        ),
      ],
    );
  }
}

enum _SelectedTab { phone, home, message }
