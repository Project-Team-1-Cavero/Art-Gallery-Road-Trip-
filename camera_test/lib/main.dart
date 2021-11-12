import 'package:flutter/material.dart';
import 'buttonscreen.dart';

void main() {
  runApp( welkom_screen());                     //We worden hier door gestuurd naar de Welcome screen widget
}

class welkom_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: burronscreen(),                    //We laaten als eerst de scherm zien met de widget van een knop
    );
  }
}