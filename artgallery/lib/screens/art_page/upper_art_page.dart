import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class upperArtPage extends StatefulWidget {

  final QueryDocumentSnapshot<Object?> artpice;
  upperArtPage(this.artpice);

  @override
  _upperArtPageState createState() => _upperArtPageState();
}

class _upperArtPageState extends State<upperArtPage> {
  videoLink() async {
    try {
      await launch("https://" + widget.artpice["VideoLink"]);
    } catch (e) {
      print(e.toString());
    }
  }

  Buylink() async {
    try {
      await launch("https://" + widget.artpice["BuyLink"]);
    } catch (e) {
      print(e.toString());
    }
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.25,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [

          //Upper padding
          Container(
            height: MediaQuery.of(context).size.height / 25,
          ),

          //Picture container
          Container(
            padding: EdgeInsets.only(top: 100),
            height: MediaQuery.of(context).size.height / 3.7,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(color: Colors.black),
          ),

          //between picture and like padding
          Container(
            height: MediaQuery.of(context).size.height / 50,
          ),

          //Row whith like, dislike and share
          Row(
            children: 
            [

              //Left padding
              Container(
                  width: MediaQuery.of(context).size.width / 9,
                  height: MediaQuery.of(context).size.height / 15,
              ),

              //column for like
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Text("${widget.artpice["Likes"].toString()}", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),)
                ],
              ),

              //left second padding
              Container(
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.height / 15,
              ),

              //column for dislike
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Text("${widget.artpice["Dislikes"].toString()}", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),)
                ],
              ),

              //right padding
              Container(
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.height / 15,
              ),

              //column for Share
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    height: MediaQuery.of(context).size.height / 15,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  Text("Share", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),)
                ],
              ),
              
            ],
          ),


          //between like and line padding
          Container(
            height: MediaQuery.of(context).size.height / 150,
          ),

          //between like and line padding
          Container(
            height: MediaQuery.of(context).size.height / 1000,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(color: HexColor("#A1813D")),
          ),

          //between line and name padding
          Container(
            height: MediaQuery.of(context).size.height / 150,
          ),

          //info 
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 30,
              ),

              //Data
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                Text(widget.artpice["Name"], style: TextStyle(fontSize: 40,color: HexColor("#A1813D")),),
                Text(
                  widget.artpice["Info"], 
                  style: TextStyle(
                    fontSize: 20, 
                    color: HexColor("#A1813D"),
                    fontWeight: FontWeight.w100
                  ),
                ),

                //Between spread
                Container(
                  height: MediaQuery.of(context).size.height / 100,
                ),


                Row(
                  children: [

                    //Left padding
                    Container(
                      width: MediaQuery.of(context).size.width / 22,
                      height: MediaQuery.of(context).size.height / 15,
                    ),

                    //Artiest info
                    Column(
                      children: [
                        Text("ARTIEST", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),),
                        Text(widget.artpice["Artiest"], style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                      ],
                    ),

                    //Left seconde padding
                    Container(
                      width: MediaQuery.of(context).size.width / 40,
                      height: MediaQuery.of(context).size.height / 15,
                    ),


                    //Golden spliter
                    Container(
                      width: MediaQuery.of(context).size.width / 400,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(color: HexColor("#A1813D")),
                    ),

                    //therd seconde padding
                    Container(
                      width: MediaQuery.of(context).size.width / 40,
                      height: MediaQuery.of(context).size.height / 15,
                    ),

                    //Jaar info
                    Column(
                      children: [
                        Text("JAAR", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),),
                        Text(widget.artpice["Year"], style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                      ],
                    ),

                    //Right seconde padding
                    Container(
                      width: MediaQuery.of(context).size.width / 40,
                      height: MediaQuery.of(context).size.height / 15,
                    ),


                    //Golden spliter
                    Container(
                      width: MediaQuery.of(context).size.width / 400,
                      height: MediaQuery.of(context).size.height / 15,
                      decoration: BoxDecoration(color: HexColor("#A1813D")),
                    ),

                    //therd Rigt padding
                    Container(
                      width: MediaQuery.of(context).size.width / 40,
                      height: MediaQuery.of(context).size.height / 15,
                    ),

                    //Ruimte info
                    Column(
                      children: [
                        Text("RUIMTE", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),),
                        Text(widget.artpice["Room"], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                      ],
                    ),

                  ],
                ),

                //Between spread
                Container(
                  height: MediaQuery.of(context).size.height / 50,
                ),

                Row(
                  children: [
                    //Left padding
                    Container(
                      width: MediaQuery.of(context).size.width / 70,
                      height: MediaQuery.of(context).size.height / 15,
                    ),

                    //Route buttom
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.height / 17,
                      decoration: BoxDecoration(color: HexColor("#D5CEBF")),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text("Route", style: TextStyle(fontSize: 20),),
                      ),
                    ),


                    //Left seconde padding
                    Container(
                      width: MediaQuery.of(context).size.width / 40,
                      height: MediaQuery.of(context).size.height / 15,
                    ),

                    //Video buttom
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.height / 17,
                      decoration: BoxDecoration(color: HexColor("#D5CEBF")),
                      child: MaterialButton(
                        onPressed: () {videoLink();},
                        child: Text("Video", style: TextStyle(fontSize: 20),),
                      ),
                    ),

                    //Left padding
                    Container(
                      width: MediaQuery.of(context).size.width / 40,
                      height: MediaQuery.of(context).size.height / 15,
                    ),

                    //By buttom
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.height / 17,
                      decoration: BoxDecoration(color: HexColor("#D5CEBF")),
                      child: MaterialButton(
                        onPressed: () {Buylink();},
                        child: Text("Kopen", style: TextStyle(fontSize: 20),),
                      ),
                    ),

                  ],
                )

              ],)
            ],

          )
        ],
      ),
    );
  }
}