import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promoteur_immobiier/cubit/cubit.dart';
import 'package:promoteur_immobiier/models/projetrealisermodel.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

import 'circular_progress.dart';

class AvancementDesTravaux extends StatefulWidget {
  ProjetModel projet;
  AvancementDesTravaux({this.projet});
  @override
  _AvancementDesTravauxState createState() => _AvancementDesTravauxState();
}

class _AvancementDesTravauxState extends State<AvancementDesTravaux>
    with SingleTickerProviderStateMixin {
  // final String title;
  double x = 0;
  String porcentag;

  AnimationController progressController;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progressController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween<double>(
            begin: double.parse(widget.projet.porcentage),
            end: double.parse(widget.projet.porcentage))
        .animate(progressController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getprojerEncours(uId: widget.projet.id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Avancement des travaux"),
      ),
      body: Column(
        children: [
          Center(
            child: CustomPaint(
              foregroundPainter: CircleProgress(
                  animation.value), // this will add custom painter after child
              child: Container(
                width: 200,
                height: 200,
                child: Center(
                    child: Text(
                  "${animation.value.toInt()} %",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Text(
              "LIVRAISON ",
              style: GoogleFonts.merriweather(
                textStyle: Theme.of(context).textTheme.bodyText1,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              widget.projet.livreson,
              style: GoogleFonts.merriweather(
                textStyle: Theme.of(context).textTheme.bodyText1,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(
                                  AppCubit.get(context).avancement[index].date,
                                  style: GoogleFonts.alata(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyText1,
                                    fontSize: 13,
                                  ),
                                ),
                              ))),
                          Expanded(
                            flex: 7,
                            child: Row(
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Container(
                                    color: Colors.white,
                                    width: 40,
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: CustomPaint(
                                        painter: TrianglePainter(),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: kSecondaryColor),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        AppCubit.get(context)
                                            .avancement[index]
                                            .description,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 5,
                      ),
                  itemCount: AppCubit.get(context).avancement.length)),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = kSecondaryColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 1 / 2, size.height * 1 / 6);
    path.lineTo(size.width * 1 / 6, size.height * 3 / 4);
    path.lineTo(size.width * 5 / 6, size.height * 3 / 4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
