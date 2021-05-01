import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/viewmodel/AppartementViewModel.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final double height;
  InputWidget({this.hintText, this.prefixIcon, this.height = 53.0});

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
