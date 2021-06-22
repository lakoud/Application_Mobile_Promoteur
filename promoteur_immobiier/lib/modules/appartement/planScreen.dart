import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class PlanScreen extends StatefulWidget {
  String image;
  PlanScreen({this.image});

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  double _scale = 1.0;

  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onScaleStart: (ScaleStartDetails details) {
            print(details);
            _previousScale = _scale;
            setState(() {});
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            print(details);
            _scale = _previousScale * details.scale;
            setState(() {});
          },
          onScaleEnd: (ScaleEndDetails details) {
            print(details);

            _previousScale = 1.0;
            setState(() {});
          },
          child: RotatedBox(
            quarterTurns: 1,
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
              child: Image(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                image: NetworkImage(widget.image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
