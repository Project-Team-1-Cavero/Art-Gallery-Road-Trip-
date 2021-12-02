import 'package:artgallery/screens/camerapage/camerapage.dart';
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
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Container(height: MediaQuery.of(context).size.height / 28,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 11,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(color: HexColor("#A1813D")),
                          child: MaterialButton(
                            onPressed: () async {
                              await availableCameras().then(
                                (value) => Navigator.push(
                                  context, MaterialPageRoute(
                                    builder: (context) => cameraPage(value)
                                  )
                                )
                              );
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
                        Container(
                          height: MediaQuery.of(context).size.height / 11,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(color: HexColor("#A1813D")),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Gallery",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Powered by Cavero"),
                    )
                  ],
                ),
              );
  }
}