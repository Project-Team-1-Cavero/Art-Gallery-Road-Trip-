import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class galleryHeader extends StatefulWidget {
  galleryHeader({Key? key}) : super(key: key);

  @override
  _galleryHeaderState createState() => _galleryHeaderState();
}

class _galleryHeaderState extends State<galleryHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: HexColor("#385051")),
        width: MediaQuery.of(context).size.width,

        // Collum beschikt over de header van de gallerij pagina
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 17,
            ),
            Text(
              "Galerij",
              style: TextStyle(
                  color: HexColor("#AD9F80"),
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(width: MediaQuery.of(context).size.width / 15),
                  Text(
                    "Alle resulten",
                    style: TextStyle(color: HexColor("#AD9F80")),
                  ),
                  Container(width: MediaQuery.of(context).size.width / 35),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 400,
                    decoration: BoxDecoration(color: HexColor("#AD9F80")),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
