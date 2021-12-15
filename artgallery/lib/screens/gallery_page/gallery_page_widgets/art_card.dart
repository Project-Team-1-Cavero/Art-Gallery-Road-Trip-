import 'package:artgallery/screens/art_page/main_art_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class artCard extends StatefulWidget {

  final QueryDocumentSnapshot<Object?> artpice;

  artCard(this.artpice);

  @override
  _artCardState createState() => _artCardState();
}

class _artCardState extends State<artCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width / 1.25,
        child: Row(
          children: [
            
            //Picture container
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              height: MediaQuery.of(context).size.height / 7.5,
              width: MediaQuery.of(context).size.width / 3.125,
            ),

            // Info container
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              height: MediaQuery.of(context).size.height / 7.5,
              width: MediaQuery.of(context).size.width / 1.938,
              child: Row(
                children: [

                  //Left space
                  Container(
                    width: MediaQuery.of(context).size.width / 75,
                  ),

                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //Upper information
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                           height: MediaQuery.of(context).size.height / 1000,
                        ),
                        Text(
                          widget.artpice["Name"],
                          style: TextStyle(
                            color: HexColor("#4C6A7F"),
                            fontSize: 30
                          ),
                        ),
                        Text("Beschrijving over de kunstwerk", style: TextStyle(fontSize: 10),)
                      ],
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height / 300,
                    ),

                    //Lower information
                    Row(
                      children: [

                        //Artiest info
                        Column(
                          children: [
                            const Text(
                              "ARTIEST",
                              style: TextStyle(
                                fontSize: 12
                              ),
                            ),
                            Text(widget.artpice["Artiest"], style: TextStyle(fontSize: 10,color: HexColor("#4C6A7F"),),)
                          ],
                        ),

                        //Gold between
                        Container(
                          width: MediaQuery.of(context).size.width / 50,
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 125,
                          height: MediaQuery.of(context).size.height / 30,
                          decoration: BoxDecoration(color: HexColor("#A1813D")),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 50,
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        
                        //jaar info
                        Column(
                          children: [
                            const Text(
                              "JAAR",
                              style: TextStyle(
                                fontSize: 12
                              ),
                            ),
                            Text(widget.artpice["Year"], style: TextStyle(fontSize: 10,color: HexColor("#4C6A7F"),),)
                          ],
                        ),

                        //Gold between
                        Container(
                          width: MediaQuery.of(context).size.width / 50,
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 125,
                          height: MediaQuery.of(context).size.height / 30,
                          decoration: BoxDecoration(color: HexColor("#A1813D")),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 50,
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        
                        //Ruimte info
                        Column(
                          children: [
                            const Text(
                              "RUIMTE",
                              style: TextStyle(
                                fontSize: 12
                              ),
                            ),
                            Text(widget.artpice["Room"], style: TextStyle(fontSize: 10,color: HexColor("#4C6A7F"),),)
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                ]
              ),
            ),

            // More buttom container
            Container(
              decoration: BoxDecoration(color: HexColor("#D5CEBF")),
              height: MediaQuery.of(context).size.height / 7.5,
              width: MediaQuery.of(context).size.width / 7,
              child: MaterialButton(
                child: const RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    "MORE",
                    style: TextStyle(fontSize: 25),
                  )
                  ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => artPage(widget.artpice)));
                }, 
              ),
            ),

           ],
          ),
       ),
    );
  }
}