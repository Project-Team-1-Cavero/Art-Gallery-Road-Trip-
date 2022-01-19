import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class upperHome extends StatefulWidget {
  upperHome({Key? key}) : super(key: key);

  @override
  _upperHomeState createState() => _upperHomeState();
}

class _upperHomeState extends State<upperHome> {

  //De functie gebruikt de launcher package, om de website op te starten
  DeLoodsWebsite() async {
    try {
      await launch("https://cavero.nl/de-loods/");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.142857142857143,
      width: MediaQuery.of(context).size.width,

      // Deze column beschikt over de afbeelding, link knop en tekst.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 5,

            // De abeelding komt van de assets map
            child: Image(
              image: AssetImage("assets/loodslogo.png"),
            ),
          ),
          Container(
            child: Text(
              "Art Gallery Road Trip",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: HexColor("#AD9F80")),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 30,
          ),

          // De knop runt de deloodswebsite functie, de functie bevindt zich aan het begin.
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 11,
            decoration: BoxDecoration(
                color: HexColor("#A1813D"),
                borderRadius: BorderRadius.circular(40)),
            child: MaterialButton(
              onPressed: () {
                DeLoodsWebsite();
              },
              child: Text(
                "Naar de loods\nWebsite",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
