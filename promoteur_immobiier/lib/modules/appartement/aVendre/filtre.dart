import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/modules/appartement/aVendre/resultat.dart';
import 'package:promoteur_immobiier/sheared/components/components.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

class ToggleButtons1 extends StatefulWidget {
  @override
  _ToggleButtons1State createState() => _ToggleButtons1State();
}

class _ToggleButtons1State extends State<ToggleButtons1> {
  List<DropdownMenuItem<String>> _dropDownMenuintprix2;
  String _currentprix2;
  List<DropdownMenuItem<String>> getDropDownMenuintprix2() {
    List<DropdownMenuItem<String>> items = new List();
    for (String numero in addtolistprix()) {
      items.add(new DropdownMenuItem(
          value: numero, child: new Text("${numero} TND")));
    }
    return items;
  }

  void changedDropDownItemprix2(String selectedCity) {
    setState(() {
      _currentprix2 = selectedCity;
    });
  }

  List<DropdownMenuItem<String>> _dropDownMenuintprix;
  String _currentprix;
  List<DropdownMenuItem<String>> getDropDownMenuintprix() {
    List<DropdownMenuItem<String>> items = new List();
    for (String numero in addtolistprix()) {
      items.add(new DropdownMenuItem(
          value: numero, child: new Text("${numero} TND")));
    }
    return items;
  }

  void changedDropDownItemprix(String selectedCity) {
    setState(() {
      _currentprix = selectedCity;
    });
  }

  //
  List<DropdownMenuItem<String>> _dropDownMenuintNbEtage;
  String _currentSurface;
  List<DropdownMenuItem<String>> getDropDownMenuintNbEtage() {
    List<DropdownMenuItem<String>> items = new List();
    for (String numero in addtolistnumber()) {
      items.add(
          new DropdownMenuItem(value: numero, child: new Text("${numero} m²")));
    }
    return items;
  }

  void changedDropDownItemNbetage(String selectedCity) {
    setState(() {
      _currentSurface = selectedCity;
    });
  }

//2

  List<DropdownMenuItem<String>> _dropDownMenuintNbEtage2;
  String _currentSurface2;
  List<DropdownMenuItem<String>> getDropDownMenuintNbEtage2() {
    List<DropdownMenuItem<String>> items = new List();
    for (String numero in addtolistnumber()) {
      items.add(
          new DropdownMenuItem(value: numero, child: new Text("${numero} m²")));
    }
    return items;
  }

  void changedDropDownItemNbetage2(String selectedCity) {
    setState(() {
      _currentSurface2 = selectedCity;
    });
  }

  List _avantageTypes = [
    "Tunis",
    "Sfax",
    "Sousse",
    "Kairouan",
    "Bizerte",
    "Gabés",
    "Hammamet",
    "Nabeul",
    "Ariana",
    "Tozeur",
    "Monastir",
    "Mahdia",
    "Tataouine",
    "Gafsa",
    "Tbarka",
    "Béja",
    'Jendouba'
  ];

  List<DropdownMenuItem<String>> _dropDownMenuintville;
  String _ville;
  List<DropdownMenuItem<String>> getDropDownMenuintville() {
    List<DropdownMenuItem<String>> items = new List();
    for (String numero in _avantageTypes) {
      items.add(new DropdownMenuItem(value: numero, child: new Text(numero)));
    }
    return items;
  }

  void changedDropDownItemville(String selectedCity) {
    setState(() {
      _ville = selectedCity;
    });
  }

  List<dynamic> addtolistprix() {
    List _intTypes = [];
    int i = 40000;
    do {
      i = i + 20000;
      _intTypes.add(i.toString());

      //statements
    } while (i < 666000);

    return _intTypes;
  }

  List<dynamic> addtolistnumber() {
    List _intTypes = [];
    for (int i = 19; i < 701; i++) {
      i = i + 20;
      _intTypes.add(i.toString());

      //statements
    }

    return _intTypes;
  }

  @override
  void initState() {
    //ville
    _dropDownMenuintville = getDropDownMenuintville();
    _ville = null;
    //Etage
    _dropDownMenuintNbEtage = getDropDownMenuintNbEtage();
    _currentSurface = null;
    _dropDownMenuintNbEtage2 = getDropDownMenuintNbEtage();
    _currentSurface2 = null;

    _dropDownMenuintprix = getDropDownMenuintprix();
    _currentprix = null;
    _dropDownMenuintprix2 = getDropDownMenuintprix2();
    _currentprix2 = null;
    // nb appartmet

    super.initState();
  }

  List<bool> isSelected = [false, false, false, false, false];
  List<bool> isSelectedprix = [false, false];
  String p;
  bool prix = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: title(title: "Filters")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    //  height: ScreenUtil().setHeight(44.0),

                    onPressed: () {
                      navigat(
                          context,
                          ListeAppartementAVendre(
                            ville: _ville,
                            prix: prix,
                            type: p,
                            surface1: _currentSurface2,
                            surface2: _currentSurface,
                            currentprix: _currentprix,
                            currentprix2: _currentprix2,
                          ));
                    },

                    color: kMainColor,

                    child: Row(
                      children: [
                        Icon(
                          Icons.subject_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Filtrer",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        "Minimum de chambres",
                        style: GoogleFonts.merriweather(
                          textStyle: Theme.of(context).textTheme.bodyText1,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 20),
                    child: Container(
                      color: Colors.white,
                      child: ToggleButtons(
                        isSelected: isSelected,
                        selectedColor: Colors.white,
                        color: Colors.black,
                        fillColor: Colors.lightBlue.shade900,
                        renderBorder: false,
                        //splashColor: Colors.red,
                        highlightColor: Colors.orange,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text('1P', style: TextStyle(fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text('2P', style: TextStyle(fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text('3P', style: TextStyle(fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text('4P', style: TextStyle(fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text('5P', style: TextStyle(fontSize: 18)),
                          ),
                        ],
                        onPressed: (int newIndex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected.length;
                                index++) {
                              if (index == newIndex) {
                                isSelected[index] = true;
                              } else {
                                isSelected[index] = false;
                              }
                              if (newIndex == 0) {
                                p = "1P";
                              } else if (newIndex == 1) {
                                p = "2P";
                              } else if (newIndex == 2) {
                                p = "3P";
                              } else if (newIndex == 3) {
                                p = "4P";
                              } else if (newIndex == 4) {
                                p = "5P";
                              }
                              print(p);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        child: Text(
                      "Budget",
                      style: GoogleFonts.merriweather(
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: new DropdownButton(
                            hint: Text("Sélectionner"),
                            icon: FaIcon(
                              FontAwesomeIcons.solidArrowAltCircleDown,
                              color: kMainColor,
                              size: 15,
                            ),
                            value: _currentprix,
                            items: _dropDownMenuintprix,
                            onChanged: changedDropDownItemprix,
                          ),
                        ),
                        Container(
                          child: new DropdownButton(
                            hint: Text("Sélectionner"),
                            icon: FaIcon(
                              FontAwesomeIcons.solidArrowAltCircleDown,
                              color: kMainColor,
                              size: 15,
                            ),
                            value: _currentprix2,
                            items: _dropDownMenuintprix2,
                            onChanged: changedDropDownItemprix2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        "Surface ",
                        style: GoogleFonts.merriweather(
                          textStyle: Theme.of(context).textTheme.bodyText1,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: new DropdownButton(
                            hint: Text("Sélectionner"),
                            icon: FaIcon(
                              FontAwesomeIcons.solidArrowAltCircleDown,
                              color: kMainColor,
                              size: 15,
                            ),
                            value: _currentSurface,
                            items: _dropDownMenuintNbEtage,
                            onChanged: changedDropDownItemNbetage,
                          ),
                        ),
                        Container(
                          child: new DropdownButton(
                            hint: Text("Sélectionner"),
                            icon: FaIcon(
                              FontAwesomeIcons.solidArrowAltCircleDown,
                              color: kMainColor,
                              size: 15,
                            ),
                            value: _currentSurface2,
                            items: _dropDownMenuintNbEtage2,
                            onChanged: changedDropDownItemNbetage2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        "Ville",
                        style: GoogleFonts.merriweather(
                          textStyle: Theme.of(context).textTheme.bodyText1,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: SizedBox()),
                        Container(
                          child: new DropdownButton(
                            hint: Text("Sélectionner"),
                            icon: FaIcon(
                              FontAwesomeIcons.solidArrowAltCircleDown,
                              color: kMainColor,
                              size: 15,
                            ),
                            value: _ville,
                            items: _dropDownMenuintville,
                            onChanged: changedDropDownItemville,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
