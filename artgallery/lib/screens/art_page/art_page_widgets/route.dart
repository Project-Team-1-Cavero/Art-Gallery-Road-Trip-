import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Route extends StatelessWidget {
  String gebouw = "";
  String etage = "";
  String kamer = "";

  Route(artpiece) {
    //Info van kunstwerk wordt ingeladen
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
            "Hier kunt u dit kunstwerk vinden:", //Pop-up waarin info wordt weergegeven
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
            //Ok knop om de pop-up te sluiten
            width: MediaQuery.of(context).size.width / 3.5,
            height: MediaQuery.of(context).size.height / 17,
            decoration: BoxDecoration(color: HexColor("#D5CEBF")),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); //Sluit de pop-up wanneer de gebruiker op "ok" klikt
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
