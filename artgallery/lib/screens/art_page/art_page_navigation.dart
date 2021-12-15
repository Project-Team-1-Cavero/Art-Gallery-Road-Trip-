import 'package:artgallery/screens/gallery_page/gallery_page_subsetions/middel_gallery_page.dart';
import 'package:artgallery/screens/gallery_page/main_gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class artPageNavigation extends StatefulWidget {
  artPageNavigation({Key? key}) : super(key: key);

  @override
  _artPageNavigationState createState() => _artPageNavigationState();
}

class _artPageNavigationState extends State<artPageNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
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
                            onPressed: () {
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context) => galleryPage()
                                )
                              );
                            },
                            child: const Text(
                              "Back",
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
                            onPressed: () {

                            },
                            child: const Text(
                              "Next",
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