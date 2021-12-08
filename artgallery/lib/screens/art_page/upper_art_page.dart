import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class upperArtPage extends StatefulWidget {
  upperArtPage({Key? key}) : super(key: key);

  @override
  _upperArtPageState createState() => _upperArtPageState();
}

class _upperArtPageState extends State<upperArtPage> {
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
                  Text("10", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),)
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
                  Text("9", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),)
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
                Text("Name", style: TextStyle(fontSize: 40,color: HexColor("#A1813D")),),
                Text(
                  "Informatie over de stukje,\nKunstwerk, zoals over het\nGeschidenis", 
                  style: TextStyle(
                    fontSize: 20, 
                    color: HexColor("#A1813D"),
                    fontWeight: FontWeight.w100
                  ),
                ),


                Row(
                  children: [

                    //Artiest info
                    Column(
                      children: [
                        Text("ARTIEST", style: TextStyle(fontSize: 25),),
                        Text("Achraf Faress", style: TextStyle(fontSize: 15),)
                      ],
                    ),

                    //Jaar info
                    Column(
                      children: [
                        Text("JAAR", style: TextStyle(fontSize: 25),),
                        Text("2021", style: TextStyle(fontSize: 15),)
                      ],
                    ),

                    //Ruimte info
                    Column(
                      children: [
                        Text("RUIMTE", style: TextStyle(fontSize: 25),),
                        Text("B12", style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ],
                ),

              ],)
            ],

          )
        ],
      ),
    );
  }
}