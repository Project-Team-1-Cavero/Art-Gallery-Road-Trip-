import 'package:flutter/material.dart';

class Route extends StatelessWidget {
  final String gebouw = "Loods";
  final int etage = 2;
  final String kamer = "B3";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Gebouw: ${gebouw}"),
          Text("Etage: ${etage}"),
          Text("Kamer: ${kamer}"),
        ],
      ),
    );
  }
}
