import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class upperHome extends StatefulWidget {
  upperHome({Key? key}) : super(key: key);

  @override
  _upperHomeState createState() => _upperHomeState();
}

class _upperHomeState extends State<upperHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.25,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 5,
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
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 11,
            decoration: BoxDecoration(
                color: HexColor("#A1813D"),
                borderRadius: BorderRadius.circular(40)),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Naar de loods\nWepsite",
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
