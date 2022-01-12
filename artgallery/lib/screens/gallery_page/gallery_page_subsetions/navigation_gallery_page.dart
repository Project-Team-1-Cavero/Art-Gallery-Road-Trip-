import 'package:artgallery/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class galleryNavigation extends StatefulWidget {
  galleryNavigation({Key? key}) : super(key: key);

  @override
  _galleryNavigationState createState() => _galleryNavigationState();
}

class _galleryNavigationState extends State<galleryNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height /8,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.width / 25,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.width / 5,
            decoration: BoxDecoration(color: HexColor("A1813D")),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()));
              },
              child: Text("<", style: TextStyle(fontSize: 60),),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 11,
            width: MediaQuery.of(context).size.width / 10,
          ),
          Text(
            "Tik op more voor\nmeer Informatie",
            style: TextStyle(
              fontSize: 20
            ),
            textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}