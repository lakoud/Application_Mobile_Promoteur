import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/modules/etrepropritaire/detailEappartementEtreProp.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';
import '../inputWidget.dart';

Widget defaultButton({
  double width = double.infinity,
  Color color1 = kMainColor,
  color2 = kSecondaryColor,
  @required String text,
  @required Function function,
}) =>
    Container(
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [color1, color2])),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChanged, // si on a un recherche
  @required Function validate,
  @required bool isPassword,
  @required String label,
  IconData suffix,
  IconData icon,
  Function suffixPressed,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        onSaved: (value) {},
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
          /*
            fillColor: Color(0xfff3f3f4),
            filled: true)*/
        ));

Widget createAccountLabel({
  @required String text1,
  @required String text2,
  @required Function function,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text1,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: function,
          child: Text(
            text2,
            style: TextStyle(
                color: kgmail2, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );

Widget title1() => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'a',
          style: GoogleFonts.portLligatSans(
            //  textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: kMainColor,
          ),
          children: [
            TextSpan(
              text: 'll',
              style: TextStyle(color: kSecondaryColor, fontSize: 30),
            ),
            TextSpan(
              text: 'ian',
              style: TextStyle(color: kMainColor, fontSize: 30),
            ),
            TextSpan(
              text: 'ce',
              style: TextStyle(color: kSecondaryColor, fontSize: 30),
            ),
          ]),
    );

Widget title2() => RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
          text: 'g',
          style: GoogleFonts.portLligatSans(
            //  textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: kMainColor,
          ),
          children: [
            TextSpan(
              text: 'r',
              style: TextStyle(color: kSecondaryColor, fontSize: 30),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(color: ktherdColor, fontSize: 30),
            ),
            TextSpan(
              text: 'upe',
              style: TextStyle(color: kMainColor, fontSize: 30),
            ),
          ]),
    );

Widget backButton({
  @required Function function,
}) =>
    TextButton(
      onPressed: function,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Retour',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );

Widget titreDesPages({
  @required String titre,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        titre,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w800,
          color: blackColor,
        ),
      ),
    );

Widget rechercheEtFiltre() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: InputWidget(
                  height: 44.0,
                  hintText: "Recherche",
                  prefixIcon: Icons.search)),
          SizedBox(
            width: 10.0,
          ),
          FlatButton(
            //  height: ScreenUtil().setHeight(44.0),

            onPressed: () {
              //     Helper.nextScreen(context, Filters());
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
                  "Filters",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          )
        ],
      ),
    );

// ************************** Les listes ****************************************//

Widget listDesProjet(
        {@required String image,
        @required String residence,
        @required String description,
        @required String nappartemnt,
        @required bool parking,
        @required String addresse}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 15.0,
        ),
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image,
                    ),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(residence,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "SourceSans",
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Icon(
                              Icons.house,
                              size: 20,
                            ),
                            Text("${nappartemnt}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "SourceSans",
                                  fontWeight: FontWeight.w700,
                                )),
                            if (parking == true)
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_parking,
                                    size: 20,
                                  ),
                                ],
                              ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Color(0xFF343434),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.place,
                                      size: 15.0, color: kMainColor),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    addresse,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color(0xFF343434),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Plus de details ",
                                style: TextStyle(color: kMainColor),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: kMainColor,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget title({@required title}) => Text(
      title,
      style: TextStyle(color: Colors.black),
    );

Widget listePropritaire({
  @required String image,
  @required String surface,
  @required String type,
  @required String prix,
  @required String nomresidance,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 15.0,
          );
        },
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                Expanded(
                    child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(image),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: InkWell(
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -15.0,
                      left: 10.0,
                      child: Container(
                        width: 70.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: Offset(2, 4),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [kSecondaryColor, kMainColor])),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              surface,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(type,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "SourceSans",
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Text(prix,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "SourceSans",
                                  fontWeight: FontWeight.w700,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Description resumé",
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Color(0xFF343434),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(Icons.place,
                                      size: 15.0, color: kMainColor),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    nomresidance,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color(0xFF343434),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailApartementEtrePropritaire()),
                                );
                              },
                              child: Text(
                                "Plus de details ",
                                style: TextStyle(color: kMainColor),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailApartementEtrePropritaire()),
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: kMainColor,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );

Widget listeMenu({
  @required String titre,
}) =>
    Container(
      height: 60,
      width: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [kSecondaryColor, kMainColor])),
            child: Center(
              child: Text(titre,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "SourceSans",
                    fontWeight: FontWeight.w700,
                  )),
            )),
        //  subtitle: Text('TWICE'),
        elevation: 5,
      ),
    );

void navigateTo(context, widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => widget));
Widget googlebottom() => GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: kgmail2,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('G',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [kMainColor, kSecondaryColor]),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Connecter avec google',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );

Widget divider({@required text}) => Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('OU'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
