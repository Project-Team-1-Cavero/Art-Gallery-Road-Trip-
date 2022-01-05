import 'package:artgallery/logic/firebase_storage.dart';
import 'package:artgallery/screens/art_page/art_page_widgets/dialoghelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class upperArtPage extends StatefulWidget {

  QueryDocumentSnapshot<Object?> artpice;
  upperArtPage(this.artpice);

  @override
  _upperArtPageState createState() => _upperArtPageState();
}

class _upperArtPageState extends State<upperArtPage> {
  
  //Like and dislike data on device
  bool isliked = false;
  bool isDisliked = false;
  int likeplus = 0;
  int dislikeplus = 0;

  //Staring up get data
  @override
  @override
  void initState() {
    super.initState();
    getData();
    
  }

  //Functions for using the links
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

  //Getting the data from the device
  getData() async {
    SharedPreferences deviceData = await SharedPreferences.getInstance();
    var islikedRaw = deviceData.getBool(widget.artpice["Name"] + "IsLiked");
    var isDislikedRaw = deviceData.getBool(widget.artpice["Name"] + "IsDisliked");

    if (islikedRaw == null)
    {
      isliked = false;
    }
    else if (islikedRaw == false)
    {
      isliked = false;
    }
    else{
      isliked = true;
    }

    if (isDislikedRaw == null)
    {
      isDisliked = false;
    }
    else if (isDislikedRaw == false)
    {
      isDisliked = false;
    }
    else{
      isDisliked = true;
    }
  }

  //Store the data from the device
  storeData(String type) async{
    SharedPreferences deviceData = await SharedPreferences.getInstance();

    if (type == "Like")
    {
      deviceData.setBool(widget.artpice["Name"] + "IsLiked", isliked);
    }
    else
    {
      deviceData.setBool(widget.artpice["Name"] + "IsDisliked", isDisliked);
    }
  }

  likePiece(String type) async {
    if (type == "Like")
    {
      if (isliked == false && isDisliked == false) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("ArtPieces")
        .where("Name" , isEqualTo: widget.artpice["Name"])
        .where("Year", isEqualTo: widget.artpice["Year"])
        .get();
                            

        print(snapshot.docs.length);
        if (snapshot.docs.isNotEmpty)
        {
          snapshot.docs.forEach((element) {
          element.reference.update({"Likes": FieldValue.increment(1)});
          isliked = true;
          storeData("Like");
        });
        }
        else{
          print("Did not work");
        }
        setState(() {
          likeplus++;
        });
      }
      else if (isliked == true && isDisliked == false)
      {
        QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("ArtPieces")
        .where("Name" , isEqualTo: widget.artpice["Name"])
        .where("Year", isEqualTo: widget.artpice["Year"])
        .get();
                            

        print(snapshot.docs.length);
        if (snapshot.docs.isNotEmpty)
        {
          snapshot.docs.forEach((element) {
          element.reference.update({"Likes": FieldValue.increment(-1)});
          isliked = false;
          storeData("Like");
        });
        }
        else{
          print("Did not work");
        }
        setState(() {
          likeplus--;
        });

      }

    }

    else if (type == "Dislike")
    {
      if (isliked == false && isDisliked == false) {
        QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("ArtPieces")
        .where("Name" , isEqualTo: widget.artpice["Name"])
        .where("Year", isEqualTo: widget.artpice["Year"])
        .get();
                            

        print(snapshot.docs.length);
        if (snapshot.docs.isNotEmpty)
        {
          snapshot.docs.forEach((element) {
          element.reference.update({"Dislikes": FieldValue.increment(1)});
          isDisliked = true;
          storeData("Dislike");
        });
        }
        else{
          print("Did not work");
        }
        setState(() {
          dislikeplus++;
        });
      }
      else if (isliked == false && isDisliked == true)
      {
        QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("ArtPieces")
        .where("Name" , isEqualTo: widget.artpice["Name"])
        .where("Year", isEqualTo: widget.artpice["Year"])
        .get();
                            

        print(snapshot.docs.length);
        if (snapshot.docs.isNotEmpty)
        {
          snapshot.docs.forEach((element) {
          element.reference.update({"Dislikes": FieldValue.increment(-1)});
          isDisliked = false;
          storeData("Dislike");
        });
        }
        else{
          print("Did not work");
        }
        setState(() {
          dislikeplus--;
        });

      }

    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 1.25,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Upper padding
              Container(
                height: MediaQuery.of(context).size.height / 25,
              ),

              //column for like
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    height: MediaQuery.of(context).size.height / 15,
                    
                    child: IconButton(
                      onPressed: () async {
                          likePiece("Like");
                        },
                      icon: Icon(Icons.thumb_up, size: 45, color: HexColor("#A1813D"),),
                    ),
                  ),
                  Text("${(widget.artpice["Likes"] + likeplus).toString()}", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),)
                ],
              ),

              //left second padding
              Container(
                child: FutureBuilder(
                  future: FirebaseStorageService.getImage(context,
                      widget.artpice["Artiest"] + widget.artpice["Name"]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: snapshot.data as Widget,
                      );
                    }

              //column for dislike
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 7,
                    height: MediaQuery.of(context).size.height / 15,
                    child: IconButton(
                      onPressed: () {
                          likePiece("Dislike");
                        },
                      icon: Icon(Icons.thumb_down,size: 45, color: HexColor("#A1813D"),),
                    ),
                  ),
                  Text("${(widget.artpice["Dislikes"] + dislikeplus ).toString()}", style: TextStyle(fontSize: 25, color: HexColor("#A1813D")),)
                ],
              ),

              //between picture and like padding
              Container(
                height: MediaQuery.of(context).size.height / 50,
              ),

              //Row whith like, dislike and share
              Row(
                children: [
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
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.thumb_up,
                            size: 45,
                            color: HexColor("#A1813D"),
                          ),
                        ),
                      ),
                      Text(
                        "${widget.artpice["Likes"].toString()}",
                        style:
                            TextStyle(fontSize: 25, color: HexColor("#A1813D")),
                      )
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
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.thumb_down,
                            size: 45,
                            color: HexColor("#A1813D"),
                          ),
                        ),
                      ),
                      Text(
                        "${widget.artpice["Dislikes"].toString()}",
                        style:
                            TextStyle(fontSize: 25, color: HexColor("#A1813D")),
                      )
                    ],
                  ),

                  //right padding
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.height / 15,
                  ),

                  //column for Share
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.height / 15,
                        child: IconButton(
                          onPressed: () async {
                            await Share.share(
                                'check out my website https://example.com');
                          },
                          icon: Icon(
                            Icons.share,
                            size: 45,
                            color: HexColor("#A1813D"),
                          ),
                        ),
                      ),
                      Text(
                        "Share",
                        style:
                            TextStyle(fontSize: 25, color: HexColor("#A1813D")),
                      )
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.artpice["Name"],
                          style: TextStyle(
                              fontSize: 40, color: HexColor("#A1813D")),
                        ),
                        Text(
                          widget.artpice["Info"],
                          style: TextStyle(
                              fontSize: 20,
                              color: HexColor("#A1813D"),
                              fontWeight: FontWeight.w100),
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
                                Text(
                                  "ARTIEST",
                                  style: TextStyle(
                                      fontSize: 25, color: HexColor("#A1813D")),
                                ),
                                Text(
                                  widget.artpice["Artiest"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
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
                              decoration:
                                  BoxDecoration(color: HexColor("#A1813D")),
                            ),

                            //therd seconde padding
                            Container(
                              width: MediaQuery.of(context).size.width / 40,
                              height: MediaQuery.of(context).size.height / 15,
                            ),

                            //Jaar info
                            Column(
                              children: [
                                Text(
                                  "JAAR",
                                  style: TextStyle(
                                      fontSize: 25, color: HexColor("#A1813D")),
                                ),
                                Text(
                                  widget.artpice["Year"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
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
                              decoration:
                                  BoxDecoration(color: HexColor("#A1813D")),
                            ),

                            //therd Rigt padding
                            Container(
                              width: MediaQuery.of(context).size.width / 40,
                              height: MediaQuery.of(context).size.height / 15,
                            ),

                            //Ruimte info
                            Column(
                              children: [
                                Text(
                                  "RUIMTE",
                                  style: TextStyle(
                                      fontSize: 25, color: HexColor("#A1813D")),
                                ),
                                Text(
                                  widget.artpice["Room"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
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
                              decoration:
                                  BoxDecoration(color: HexColor("#D5CEBF")),
                              child: MaterialButton(
                                onPressed: () {
                                  DialogHelper.routeMessage(context, [
                                    widget.artpice["Room"],
                                    widget.artpice["Floor"],
                                    widget.artpice["Building"]
                                  ]);
                                },
                                child: Text(
                                  "Route",
                                  style: TextStyle(fontSize: 20),
                                ),
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
                              decoration:
                                  BoxDecoration(color: HexColor("#D5CEBF")),
                              child: MaterialButton(
                                onPressed: () {
                                  videoLink();
                                },
                                child: Text(
                                  "Video",
                                  style: TextStyle(fontSize: 20),
                                ),
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
                              decoration:
                                  BoxDecoration(color: HexColor("#D5CEBF")),
                              child: MaterialButton(
                                onPressed: () {
                                  Buylink();
                                },
                                child: Text(
                                  "Kopen",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
