import 'package:artgallery/screens/art_page/art_page_navigation.dart';
import 'package:artgallery/screens/art_page/upper_art_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class artPage extends StatefulWidget {
  artPage({Key? key}) : super(key: key);

  @override
  _artPageState createState() => _artPageState();
}

class _artPageState extends State<artPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: HexColor("#385051")),
        child: Column(
          children: [upperArtPage(),artPageNavigation()],
        ),
      ),
    );;
  }
}