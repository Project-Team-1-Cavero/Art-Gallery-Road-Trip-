import 'package:artgallery/logic/authi.dart';
import 'package:artgallery/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class splashScreen extends StatefulWidget {
  splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: HexColor("#385051")),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      //De sign in page knop, rund de signIn functie, om die client te authercaten in firebase.
      child: Center(
        child: Container(
          decoration: BoxDecoration(color: HexColor("#A1813D")),
          child: MaterialButton(
            child: Text("Enter the world of art"),
            onPressed: () async {
              dynamic result = await firebaseAuthService().signIN();
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => homePage()));
              });
            },
          ),
        ),
      ),
    ));
  }
}
