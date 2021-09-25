import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

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

Widget defaultButton({
  double width = double.infinity,
  Color color1 = kMainColor,
  color2 = kSecondaryColor,
  @required String text,
  @required Function function,
  @required double height = 60.0,
}) =>
    Container(
      height: height,
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
  bool isPassword,
  @required String label,
  IconData suffix,
  @required IconData icon,
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

Widget defaultTextButton({
  @required String text,
  @required Function function,
  @required context,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style: GoogleFonts.habibi(
          textStyle: Theme.of(context).textTheme.bodyText1,
          fontSize: 15,
          color: kgmail2,
        ),
      ),
    );

Widget title1() => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'W',
          style: GoogleFonts.portLligatSans(
            //  textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: kMainColor,
          ),
          children: [
            TextSpan(
              text: 'C',
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

Widget rechercheEtFiltre(
        {@required Function function, @required Function functionr}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: InputWidget(
                  function: functionr,
                  height: 44.0,
                  hintText: "Recherche",
                  prefixIcon: Icons.search)),
          SizedBox(
            width: 10.0,
          ),
          FlatButton(
            //  height: ScreenUtil().setHeight(44.0),

            onPressed: function,

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
Widget listDesProjet2(
        {@required String image,
        @required String residence,
        @required String description,
        @required String nappartemnt,
        @required bool parking,
        @required String addresse}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Image.network(
              "https://img.freepik.com/photos-gratuite/belle-vue-lac-bleu-capture-interieur-villa_181624-10734.jpg?size=338&ext=jpg",
              fit: BoxFit.cover,
              width: 390,
            ),
            ListTile(
              title: Text('Residance saada'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " Residance sada beif fikeror qzesgpzefosdf azeodfazj azdiqsdjqzd Residance sada beif fikeror qzesgpzefosdf azeodfazj azdiqsdjqzd",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Row(children: [
              Text("Plus de details"),
              Icon(Icons.arrow_circle_down),
            ]),
          ],
        ),
      ),
    );

Widget title({@required title}) => Text(
      title,
      style: TextStyle(color: Colors.black),
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
void navigat(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
Widget googlebottom({
  @required Function function,
}) =>
    GestureDetector(
      onTap: function,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                  ),
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.google,
                    color: kgmail2,
                  )),
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
Widget defaultAppBar({
  @required BuildContext context,
  String title,
  List<Widget> actions,
  @required Function fonction,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: fonction,
        icon: Icon(Icons.arrow_left),
      ),
      titleSpacing: 5.0,
      title: Text(title),
      actions: actions,
    );

Widget customText({
  @required String text,
  @required double fontSize,
  @required Color color,
  @required double letterSpacing,
}) =>
    Container(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
        ),
      ),
    );

class InputWidget extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final double height;
  @required
  Function function;
  InputWidget(
      {this.hintText, this.prefixIcon, this.height = 53.0, this.function});

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: ScreenUtil().setHeight(height),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.only(
        right: 16.0,
        left: this.widget.prefixIcon == null ? 16.0 : 0.0,
      ),
      child: TextFormField(
        onChanged: widget.function,
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: this.widget.prefixIcon == null
              ? null
              : Icon(
                  this.widget.prefixIcon,
                  color: Color.fromRGBO(105, 108, 121, 1),
                ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: this.widget.hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(105, 108, 121, 1),
          ),
        ),
      ),
    );
  }
}
