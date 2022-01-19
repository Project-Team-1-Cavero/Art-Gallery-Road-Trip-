import 'package:artgallery/screens/camerapage/camerapage.dart';
import 'package:artgallery/screens/camerapage/scanqr.dart';
import 'package:artgallery/screens/gallery_page/main_gallery_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class homePageBare extends StatefulWidget {
  homePageBare({Key? key}) : super(key: key);

  @override
  _homePageBareState createState() => _homePageBareState();
}

class _homePageBareState extends State<homePageBare> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Knop die jouw verwijst naar de scan pagina
              Container(
                height: MediaQuery.of(context).size.height / 11,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(color: HexColor("#A1813D")),
                child: MaterialButton(
                  onPressed: () async {
                    await availableCameras().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrScannerPage())));
                  },
                  child: Text(
                    "Scan",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 6,
              ),

              //Knop die je verwijst naar de gallerij pagina
              Container(
                height: MediaQuery.of(context).size.height / 11,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(color: HexColor("#A1813D")),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => galleryPage()));
                  },
                  child: Text(
                    "Galerij",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
