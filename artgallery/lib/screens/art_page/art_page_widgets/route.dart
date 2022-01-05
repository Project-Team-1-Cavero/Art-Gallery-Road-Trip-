import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Route extends StatelessWidget {
  String gebouw = "";
  int etage = 0;
  String kamer = "";

  Route(artpiece) {
    gebouw = artpiece[2];
    etage = artpiece[1];
    kamer = artpiece[0];
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            "Hier kunt u dit kunstwerk vinden:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Spacer(),
          Text(
            "Gebouw: ${gebouw}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Etage: ${etage}",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "Kamer: ${kamer}",
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            height: MediaQuery.of(context).size.height / 17,
            decoration: BoxDecoration(color: HexColor("#D5CEBF")),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "OK",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    ));
  }
}
