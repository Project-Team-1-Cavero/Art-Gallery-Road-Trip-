import 'package:artgallery/screens/home/navigationwidget.dart';
import 'package:artgallery/screens/home/upperhome.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: HexColor("#385051")),

        //De home page bestaat uit twee groter wisgts
        child: Column(
          children: [upperHome(), homePageBare()],
        ),
      ),
    );
  }
}
