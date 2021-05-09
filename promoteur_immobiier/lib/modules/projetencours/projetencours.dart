import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:promoteur_immobiier/sheared/styles/Custom_Text.dart';
import 'package:promoteur_immobiier/sheared/styles/colors.dart';

import 'package:url_launcher/url_launcher.dart';

import 'Appratementencours.dart';
import 'Avencementdeprojet.dart';

class ProjetEnCours extends StatelessWidget {
  List imageList = [
    'assets/s.jpg',
    'assets/s2.jpg',
    'assets/s3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Nouveaux projet  \n",
                          style: TextStyle(
                            fontSize: 22.0,
                            height: 1.3,
                            color: Color.fromRGBO(22, 27, 40, 70),
                          ),
                        ),
                        TextSpan(
                          text: "Residance Ain Marim \n",
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w800,
                            color: blackColor,
                          ),
                        ),
                        TextSpan(
                          text: "Bizerte Ain Mariam  rue omar mokthar  \n",
                          style: TextStyle(
                            fontSize: 19.0,
                            height: 1.2,
                            color: Color.fromRGBO(22, 27, 40, 70),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launch(
                          "https://l.facebook.com/l.php?u=https%3A%2F%2Fmaps.app.goo.gl%2F3J9AWxH8DRHtnWtr5%3Ffbclid%3DIwAR0KLBeei9XLdaw7c-mMjOKVaPSTlhvGq0Z-9zDvLDLU0NU4eCqItY46ehQ&h=AT0yfxlWGwt0x4KOaUURNbKu79cGQgZB5tEyuZS1UlJnuisfxASRJi5iOASIgupOyhhifuYaRi53A0D7K75dyayPZkBsnIVt6Bs2KQKCCHhEDeeKZAZ6JGpAh8iaUrgBGPO_sA");
                    },
                    child: Container(
                        width: 25,
                        child: Image.asset("assets/google-maps.png")),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppartementEncours()),
                        );
                      },
                      child: Container(
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://jojo-app.fr/wp-content/uploads/2018/09/espace-optimise-appartement-meuble-paris.jpg"),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 22,
                                width: MediaQuery.of(context).size.width / 2,
                                color: Colors.white.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(" Appartement",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "SourceSans",
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AvancementDeProjet()),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  "https://www.constructioncayola.com/e-docs/00/01/EB/8C/batiment-des-previsions-revues-hausse_620x350.jpg",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 22,
                              width: MediaQuery.of(context).size.width / 2,
                              color: Colors.white.withOpacity(0.5),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(" Avancement du travail",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "SourceSans",
                                      fontWeight: FontWeight.w700,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
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
                    Text('Description'),
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
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text(
                  "Come home to this Green Gold Corridor, with 4 parks and grounds in the vicinity /n and close proximity to workplaces, educational institutes, shopping destinations and healthcare facilities. Live a 24-carat life in an address that truly complements your junction of life.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              buildseparaton("Plus D'infomrmations"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.flip_to_front_rounded,
                          color: kMainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "10 Etage",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.house_outlined,
                          color: kMainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "50 AP ",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.elevator_outlined,
                          color: kMainColor,
                        ),
                        Container(
                          child: Text(
                            "Acensseur  ",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_parking_outlined,
                          color: kMainColor,
                        ),
                        Text(
                          "Parking",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              buildseparaton("A coté"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.shopping_basket,
                          color: kMainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Retail  ",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Shoppers Stop: ",
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Container(
                              child: Text(
                                "650m",
                                style: TextStyle(fontSize: 11),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.school,
                          color: kMainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          //    mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Education",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "The Universal School",
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              "820km",
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  " Plan du Projet ",
                  style: TextStyle(
                    fontSize: 18,
                    color: kMainColor,
                    fontFamily: "SourceSans",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Image.network(
                    "https://i.pinimg.com/originals/06/37/2c/06372cef20d89b57c58bdfc140710c70.png",
                    fit: BoxFit.fill),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Container buildseparaton(String text) {
    return Container(
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
          Text(text),
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
  }
}

class ListeDesApartement extends StatelessWidget {
  const ListeDesApartement({
    Key key,
    @required this.imageList,
  }) : super(key: key);

  final List imageList;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 280,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 3),
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.all(10.0),
                width: 210.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    //bloc de text au dessus de photo

                    Positioned(
                      bottom: 15,
                      child: Container(
                        height: 120.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText("Surface: ", Colors.black, 18.0, 1.2),
                              CustomText("100", Colors.grey, 9.0, 1.2),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ]),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 180.0,
                              image: AssetImage('assets/s.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            bottom: 10.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText("S+1", Colors.white, 24.0, 1.2),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )

                //mm

                );
          },
        ));
  }
}
